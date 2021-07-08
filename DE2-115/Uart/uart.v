module uart(input wire [7:0] din,
	    input wire wr_en,
	    input wire clk_5m,
	    output wire tx,
	    output wire tx_busy,
	    input wire rx,
	    output wire rdy,
	    input wire rdy_clr,
	    output wire [7:0] dout);

wire rxclk_en, txclk_en;

baud_rate_gen uart_baud(.clk_5m(clk_5m),
			.rxclk_en(rxclk_en),
			.txclk_en(txclk_en));
transmitter uart_tx(.din(din),
		    .wr_en(wr_en),
		    .clk_5m(clk_5m),
		    .clken(txclk_en),
		    .tx(tx),
		    .tx_busy(tx_busy));
receiver uart_rx(.rx(rx),
		 .rdy(rdy),
		 .rdy_clr(rdy_clr),
		 .clk_5m(clk_5m),
		 .clken(rxclk_en),
		 .data(dout));

endmodule