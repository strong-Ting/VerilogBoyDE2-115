module top(
	// Global Clock Input
	input wire clkGlb,
	
   //PS2
	input wire PS2_CLK,
   input wire PS2_DAT,
	
   //uart rx
   input wire ur_rx,
   output wire ur_tx,

	// VGA
   output wire VGA_CLK,
   output wire VGA_VSYNC,
   output wire VGA_HSYNC,
   output wire VGA_BLANK_B,
   inout  wire VGA_SCL,
   inout  wire VGA_SDA,
   output wire [7:0] VGA_R,
   output wire [7:0] VGA_G,
   output wire [7:0] VGA_B,
   
   // WM8750 Codec
   output wire AUDIO_MCLK,
   output wire AUDIO_BCLK,
   output wire AUDIO_DACDATA,
   output wire AUDIO_DACLRCK,
   //input  wire AUDIO_ADCDATA,
   //output wire AUDIO_ADCLRCK,
   output wire AUDIO_SCL,
   inout  wire AUDIO_SDA,
	
	// Power LED
   output wire LED_RED,
   output wire LED_GREEN,
   output wire LED_BLUE,

   //SEG7
   output reg [6:0]	HEX0,
   output reg [6:0]	HEX1,
   output reg [6:0]	HEX2,
   output reg [6:0]	HEX3,    
   output reg [6:0]	HEX4,
   output reg [6:0]	HEX5,  
   // Push Button
   input wire PB,
   //SW
   input wire [7:0] SW
);


wire clk_4;
wire clk_25M;
wire clk_1M;
wire clk_400M;
wire clk_15;

wire PLL_rst,PLL_locked;

resetGen pll(
   .clk(clkGlb),
   .rst(PLL_rst)
);

PLL_0	PLL_0_inst (
	.areset ( PLL_rst ),
	.inclk0 ( clkGlb ),
	.c0 ( clk_4 ),
	.c1 ( clk_25M ),
	.c2 ( clk_15 ),
	.locked ( PLL_locked )
);

reg PB_syn_t,PB_syn;
always @(posedge clk_4 or negedge PB) begin
   if(!PB) begin
      PB_syn <= 1'd1;
      PB_syn_t <= 1'd1;
   end
   else begin
      PB_syn_t <= 1'd0;
      PB_syn <= PB_syn_t;
   end
end

wire vb_rst,rst;
assign vb_rst = rst || PB_syn;


resetGen rst_0(
   .clk(clk_4),
   .rst(rst)
);

wire        vb_phi;
wire [15:0] vb_a;
wire [7:0]  vb_dout;
wire [7:0]  vb_din;
wire        vb_wr;
wire        vb_rd;
wire        vb_cs;
reg  [7:0]  vb_key;
wire        vb_hs;
wire        vb_vs;
wire        vb_cpl;
wire [1:0]  vb_pixel;
wire        vb_valid;
wire [15:0] vb_left;
wire [15:0] vb_right;
wire        vb_fault;
reg joyInterrupt;

boy boy(
   .rst(vb_rst),
   .clk(clk_4),
   .phi(vb_phi),
   .a(vb_a),
   .dout(vb_dout),
   .din(vb_din),
   .wr(vb_wr),
   .rd(vb_rd),
   .key(vb_key),
   .hs(vb_hs),
   .vs(vb_vs),
   .cpl(vb_cpl),
   .pixel(vb_pixel),
   .valid(vb_valid),
   .left(vb_left),
   .right(vb_right),
   .done(),
   .fault(vb_fault)
);

// ----------------------------------------------------------------------
// MBC5

wire [22:0] vb_rom_a;
wire [16:0] vb_ram_a;
wire vb_ram_cs_n;
wire [7:0] vb_crom_dout;

mbc5 mbc5(
   .vb_clk(clk_4),
   .vb_a(vb_a[15:12]),
   .vb_d(vb_dout),
   .vb_wr(vb_wr),
   .vb_rd(vb_rd),
   .vb_rst(vb_rst),
   .rom_a(vb_rom_a[22:14]),
   .ram_a(vb_ram_a[16:13]),
   .rom_cs_n(),
   .ram_cs_n(vb_ram_cs_n)
);
assign vb_rom_a[13:0] = vb_a[13:0];
assign vb_ram_a[12:0] = vb_a[12:0];

// ----------------------------------------------------------------------

// ----------------------------------------------------------------------
// Cartridge RAM
// Work RAM

wire [7:0] vb_cram_dout;
wire vb_cram_wr = !vb_ram_cs_n & vb_wr;

Cart_ram	Cart_ram_inst (
	.address ( vb_ram_a ),
	.clock ( clk_4 ),
	.data ( vb_dout ),
	.wren ( vb_cram_wr ),
	.q ( vb_cram_dout )
);

//tobu girl
wire [7:0] tobuRomOut;
CartTobu tobu(
   .address(vb_rom_a[17:0]),
   .clk(clk_4),
   .q(tobuRomOut)
);

//mario
wire [7:0] marioRomOut;
CartMario	CartMario_inst (
	.address(vb_rom_a[15:0]),
	.clock(clk_4),
	.q (marioRomOut)
);

//Tetris
wire [7:0] tetrisRomOut;
Cart	Cart_rom (
	.address (vb_rom_a[15:0]),
	.clock(clk_4),
	.q(tetrisRomOut)
);

assign vb_crom_dout = (SW[2] == 1'd1) ? tobuRomOut : ((SW[1] == 1'd1) ? tetrisRomOut : marioRomOut);
assign vb_din = (vb_ram_cs_n) ? (vb_crom_dout) : (vb_cram_dout);
//assign vb_din = vb_crom_dout;

// PS2 Keyboard
wire [7:0] keycode;
reg rdn = 1'd1;
reg clrn = 1'd1;
wire rdy,overflow;
reg [7:0] keycode_0 = 8'h00;
reg [7:0] keycode_1 = 8'h00;

always @(posedge clk_4)
begin
   if (rdy) begin
      rdn <= 1'd0;
   end
   else rdn <= 1'd1;

   if(!rdn && rdy) begin
      keycode_0 <= keycode;
      keycode_1 <= keycode_0;
   end
   else if(!clrn) begin
      keycode_0 <= 8'd0;
      keycode_1 <= 8'd0;
   end

   if(overflow) clrn <= 1'd0;
   else clrn <= 1'd1;
end

ps2_keyboard ps2_inst( .clk(clk_4),
					.clrn(clrn), //active low
				   .ps2_clk(PS2_CLK), // ps2 clock
					.ps2_data(PS2_DAT),  // ps2 data
					.rdn(rdn), // read, active low
					.data(keycode), // 8-bit code
					.ready(rdy), // code ready
					.overflow(overflow) // fifo overflow
               ); 

//uart
wire ur_rdy;
reg ur_rdy_clr;
wire [7:0] ur_dout;

uart uart_inst( .din(8'h00),
	   .wr_en(1'b0),
	   .clk_5m(clkGlb),
	   .tx(ur_tx),
	   .tx_busy(),
	   .rx(ur_rx),
	   .rdy(ur_rdy),
	   .rdy_clr(1'd0),
	   .dout(ur_dout));

always @(posedge clk_4) begin
	if(vb_rst) vb_key <= 8'd0;
   else if(SW[0] == 1'd1) begin
      if(ur_rdy) begin
         vb_key <= ur_dout;
      end   
   end
   else begin
      if({keycode_1,keycode_0} == 16'hF01D) vb_key[6] <= 1'd0;
      else if(keycode_0 == 8'h1D) vb_key[6] <= 1'd1; //up W

      if({keycode_1,keycode_0} == 16'hF01B) vb_key[7] <= 1'd0;
      else if(keycode_0 == 8'h1B) vb_key[7] <= 1'd1; //down  S
      
      if({keycode_1,keycode_0} == 16'hF01C) vb_key[5] <= 1'd0;
      else if(keycode_0 == 8'h1C) vb_key[5] <= 1'd1; //left  A 
      
      if({keycode_1,keycode_0} == 16'hF023) vb_key[4] <= 1'd0;
      else if(keycode_0 == 8'h23) vb_key[4] <= 1'd1; //right  D

      if({keycode_1,keycode_0} == 16'hF05A) vb_key[3] <= 1'd0;
      else if(keycode_0 == 8'h5A) vb_key[3] <= 1'd1; //start enter
      
      if({keycode_1,keycode_0} == 16'hF029) vb_key[2] <= 1'd0;
      else if(keycode_0 == 8'h29) vb_key[2] <= 1'd1; //select space

      if({keycode_1,keycode_0} == 16'hF04C) vb_key[1] <= 1'd0;
      else if(keycode_0 == 8'h4C) vb_key[1] <= 1'd1; //BTN_A ;

      if({keycode_1,keycode_0} == 16'hF052) vb_key[0] <= 1'd0;
      else if(keycode_0 == 8'h52) vb_key[0] <= 1'd1; //BTN_B '
   end
end

//debug ps2 keyboard
always @(*) begin
   HEX0 = CONV7SEG(keycode_0[3:0]);
   HEX1 = CONV7SEG(keycode_0[7:4]);
   HEX2 = CONV7SEG(keycode_1[3:0]);
   HEX3 = CONV7SEG(keycode_1[7:4]);
   HEX4 = CONV7SEG(vb_key[3:0]);
   HEX5 = CONV7SEG(vb_key[7:4]);
end

// Display
function [6:0] CONV7SEG (input wire [3:0] data);
begin
   case (data)
      4'h0:    CONV7SEG = 7'b1000000;
      4'h1:    CONV7SEG = 7'b1111001;
      4'h2:    CONV7SEG = 7'b0100100;
      4'h3:    CONV7SEG = 7'b0110000;
      4'h4:    CONV7SEG = 7'b0011001;
      4'h5:    CONV7SEG = 7'b0010010;
      4'h6:    CONV7SEG = 7'b0000010;
      4'h7:    CONV7SEG = 7'b1011000;
      4'h8:    CONV7SEG = 7'b0000000;
      4'h9:    CONV7SEG = 7'b0010000;
      4'ha:    CONV7SEG = 7'b0001000;
      4'hb:    CONV7SEG = 7'b0000011;
      4'hc:    CONV7SEG = 7'b1000110;
      4'hd:    CONV7SEG = 7'b0100001;
      4'he:    CONV7SEG = 7'b0000110;
      4'hf:    CONV7SEG = 7'b0001110;
      default: CONV7SEG = 7'b1111111;
   endcase
end
endfunction



// ----------------------------------------------------------------------
// Audio

// DSP mode B
reg [31:0] a_sr;
reg a_lrck;
wire a_dat;
reg a_bclk;
reg [1:0] a_state;
reg [5:0] a_bitcounter;

always @(posedge clk_15 or posedge vb_rst) begin
   if (vb_rst) begin
      a_state <= 2'b0;
      a_bitcounter <= 5'd0;
   end
   else begin
      a_state <= a_state + 2'd1;
      case (a_state)
      2'b00: begin
            a_bclk <= 1'b0;
            if (a_bitcounter == 5'd0) begin
               a_bitcounter <= 5'd31;
               a_lrck <= 1'b1;
               a_sr <= {vb_left, vb_right};
            end
            else begin
               a_bitcounter <= a_bitcounter - 1'd1;
               a_lrck <= 1'b0;
               a_sr <= {a_sr[30:0], 1'b0};
            end
      end
      2'b01: begin end
      2'b10: begin
            a_bclk <= 1'b1;
      end
      2'b11: begin end
      endcase
   end
end

assign a_dat = a_sr[31];

assign AUDIO_MCLK = clk_15;
assign AUDIO_BCLK = a_bclk;
assign AUDIO_DACDATA = a_dat;
assign AUDIO_DACLRCK = a_lrck;

// ----------------------------------------------------------------------


// ----------------------------------------------------------------------
// VGA Controller
wire vga_hs;
wire vga_vs;
wire [6:0] dbg_x;
wire [4:0] dbg_y;
wire [6:0] dbg_char;
wire dbg_clk;
    
vga_mixer vga_mixer_instant(
	.clk(clk_25M),
   .rst(vb_rst),
   // GameBoy Image Input
   .gb_hs(vb_hs),
   .gb_vs(vb_vs),
   .gb_pclk(vb_cpl),
   .gb_pdat(vb_pixel),
   .gb_valid(vb_valid),
   .gb_en(1'd1),
   // Debugger Char Input
   .dbg_x(dbg_x),
   .dbg_y(dbg_y),
   .dbg_char(dbg_char),
   .dbg_sync(dbg_clk),
   // VGA signal Output
   .vga_hs(vga_hs),
   .vga_vs(vga_vs),
   .vga_blank(VGA_BLANK_B),
   .vga_r(VGA_R),
   .vga_g(VGA_G),
   .vga_b(VGA_B),
   .hold(1'b0)
);
assign VGA_CLK = ~clk_25M;
assign VGA_VSYNC = vga_vs;
assign VGA_HSYNC = vga_hs;
    
assign VGA_SDA = 1'bz;
//assign VGA_SCL = 1'bz;


endmodule
