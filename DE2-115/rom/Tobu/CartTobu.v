module CartTobu (
    input wire clk,
    input wire [17:0] address,
    output reg [7:0] q
);

/*
reg [7:0] rom_array [0:262143]; 
initial begin
        //$readmemh("/home/DICS/M10912039/VerilogBoy_DE2-115/boot.mif", brom_array, 0, 255);
    $readmemh("/home/DICS/M10912039/VerilogBoy_DE2-115/tools/tobuCmp", rom_array, 0, 262143);
end

always @(*) begin
    q = rom_array[address];
end
*/


wire [7:0] tobu_0_dout;
wire [7:0] tobu_1_dout;
wire [7:0] tobu_2_dout;
wire [7:0] tobu_3_dout;
/*
reg [7:0] rom_array_0 [0:65535]; 
reg [7:0] rom_array_1 [0:65535]; 
reg [7:0] rom_array_2 [0:65535]; 
reg [7:0] rom_array_3 [0:65535]; 

initial begin
    $readmemh("/home/DICS/M10912039/VerilogBoy_DE2-115/tools/tobu_0.mem", rom_array_0, 0, 65535);
	 $readmemh("/home/DICS/M10912039/VerilogBoy_DE2-115/tools/tobu_1.mem", rom_array_1, 0, 65535);
	 $readmemh("/home/DICS/M10912039/VerilogBoy_DE2-115/tools/tobu_2.mem", rom_array_2, 0, 65535);
	 $readmemh("/home/DICS/M10912039/VerilogBoy_DE2-115/tools/tobu_3.mem", rom_array_3, 0, 65535);
end

assign tobu_0_dout = rom_array_0[address[15:0]];
assign tobu_1_dout = rom_array_1[address[15:0]];
assign tobu_2_dout = rom_array_2[address[15:0]];
assign tobu_3_dout = rom_array_3[address[15:0]];
*/

tobu_0 tobu_0_inst(
	.clock(clk),
	.address(address[15:0]),
	.q(tobu_0_dout)
);

tobu_1 tobu_1_inst(
	.clock(clk),
	.address(address[15:0]),
	.q(tobu_1_dout)
);

tobu_2 tobu_2_inst(
	.clock(clk),
	.address(address[15:0]),
	.q(tobu_2_dout)
);

tobu_3 tobu_3_inst(
	.clock(clk),
	.address(address[15:0]),
	.q(tobu_3_dout)
);

always@(*) begin
	if(address[17:16] == 2'b00) q = tobu_0_dout;
	else if(address[17:16] == 2'b01) q = tobu_1_dout;
	else if(address[17:16] == 2'b10) q = tobu_2_dout;
	else if(address[17:16] == 2'b11) q = tobu_3_dout;
	else q = 8'hff;
end

endmodule