module sinegen #(
    parameter INCR_WIDTH = 8,
    parameter DATA_WIDTH = 8,
    parameter ADDRESS_WIDTH = 8
)(
    input logic [INCR_WIDTH-1:0] incr,    // input increment for counter
    input logic rst,                      // reset signal
    input logic en,                       // enable signal
    input logic clk,                      // clock signal
    output logic [DATA_WIDTH-1:0] dout    // output data from ROM
);

    logic [ADDRESS_WIDTH-1:0] address;    // internal address wire from counter to ROM

    // Instantiate the counter module
    counter #(
        .WIDTH(ADDRESS_WIDTH),
        .INCR_WIDTH(INCR_WIDTH)  // Added INCR_WIDTH parameter
    ) addrCounter (
        .clk(clk),
        .rst(rst),
        .en(en),
        .incr(incr),
        .count(address)
    );

    // Instantiate the ROM module
    rom #(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDRESS_WIDTH(ADDRESS_WIDTH)
    ) sineRom (
        .clk(clk),
        .addr(address),
        .dout(dout)
    );

endmodule
