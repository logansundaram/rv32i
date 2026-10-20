module cnt (
    input clk,
    input rst,
    output [63:0] q_o
);
logic[63:0] counter;


always_ff @(posedge clk ) begin
    if (rst) begin
        counter <= 0;
    end else begin
        counter <= counter + 1;
    end
end

assign q_o = counter;

endmodule
