/*
• Arithmetic & Logic (Register-Register, R-type):
	• add (Add)
	• sub (Subtract)
	• sll (Shift left logical)
	• slt (Set less than, signed)
	• sltu (Set less than, unsigned)
	• xor (XOR)
	• srl (Shift right logical)
	• sra (Shift right arithmetic)
	• or (OR)
	• and (AND)
*/

module alu(
    input [31:0] rs1,
    input [31:0] rs2,
    input clk,
    input rst,
    input valid,
    input [2:0] funct_3,
    input [6:0] funct_7,
    output [31:0] result
);
// double check if signed vs unsigned operations are handled properly 
// may need to add a port for immediate value but it should be ok

always_comb begin
    case (funct_3)
        3'b000: begin
            //add or sub
            if (funct_7 == 7'b0000000) begin
                result = rs1 + rs2;
            end
            else begin
                result = rs1 - rs2;
            end
        end
        3'b001: begin
            //sll shift left logical
            result = rs1 << [4:0]rs2;
        end
        3'b010: begin
            //slt
            if ($signed(rs1) < $signed(rs2)) begin
                result = 1'b1;
            end else begin
                result = 1'b0;
            end
        end
        3'b011: begin
            //sltu
            if (rs1 < rs2) begin
                result = 1'b1;
            end else begin
                result = 1'b0;
            end
        end
        3'b100: begin
            //xor bitwise
            result = rs1 ^ rs2;
        end
        3'b101: begin
            //srl or sra
            if (funct_7 == 7'b0000000) begin
                //srl
                result = rs1 >> [4:0]rs2;
            end
            else begin
                //sra
                result = rs1 >>> [4:0]rs2;
            end
        end
        3'b110: begin
            //or bitwise
            result = rs1 | rs2;
        end
        3'b111: begin
            //and bitwise
            result = rs1 & rs2
        end
        default: begin
            result = 'd0
        end
    endcase
    
end

endmodule