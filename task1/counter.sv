module counter #(
    parameter WIDTH = 8,
    parameter INCR_WIDTH = 8  
)(
    input logic clk,
    input logic rst,
    input logic en,
    input logic [INCR_WIDTH-1:0] incr,  
    output logic [WIDTH-1:0] count
);

    // Sequential logic for the counter
    always_ff @(posedge clk) begin
        if (rst)
            count <= '0;  // Reset to 0
        else if (en)
            count <= count + incr;  // Increment by incr when enabled
    end

endmodule
