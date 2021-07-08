`default_nettype wire
module brom_comb(
    input wire [7:0] a,
    output [7:0] d
    );
    
    reg [7:0] brom_array [0:255]; // 256 Bytes BROM array
   
    initial begin
        $readmemh("./bootRom/bootrom_game.mif", brom_array, 0, 255);

    end
    
    assign d = brom_array[a];

endmodule