// reset.v

// Generated using ACDS version 20.1 711

`timescale 1 ps / 1 ps
module reset (
		input  wire  clk,   //   clk.clk
		output wire  reset  // reset.reset
	);

	altera_avalon_reset_source #(
		.ASSERT_HIGH_RESET    (1),
		.INITIAL_RESET_CYCLES (3)
	) reset_source_0 (
		.reset (reset), // reset.reset
		.clk   (clk)    //   clk.clk
	);

endmodule
