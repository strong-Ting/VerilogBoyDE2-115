`timescale 1ns / 1ns
module test;

reg clk;
reg PB;

wire clk_4M;
wire clk_25M;
wire clk_1M;

wire VGA_CLK,VGA_VSYNC,VGA_HSYNC,VGA_BLANK_B;
wire [7:0] VGA_R,VGA_G,VGA_B;

top dutGB(
    .clkGlb(clk),
    .PB(PB),
    .LED_RED(clk_4M),
    .LED_BLUE(clk_1M),
    .LED_GREEN(clk_25M),
    .VGA_CLK(VGA_CLK),
    .VGA_VSYNC(VGA_VSYNC),
    .VGA_HSYNC(VGA_HSYNC),
    .VGA_BLANK_B(VGA_BLANK_B),
    .VGA_R(VGA_R),
    .VGA_G(VGA_G),
    .VGA_B(VGA_B)
);

initial begin
    //$fsdbDumpfile("test.fsdb");
    //$fsdbDumpvars();
    //$fsdbDumpMDA;
end

initial begin
    /*
    $dumpfile ("GB.vcd");
    $dumpvars (0, test);
    */
end

initial begin
    PB = 1;
   // #400 PB = 1;
end

initial begin
    // Initialize Inputs
    clk = 0;

    #1000000 $finish;
end

always begin
    #10 clk = !clk;
end

endmodule
