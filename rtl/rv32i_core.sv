`default_nettype none

module rv32i_core #(
  parameter logic [31:0] BOOT_ADDR = 32'h8000_0000
) (
  input  logic        clk_i,
  input  logic        rst_ni,

  output logic [31:0] imem_addr_o,
  input  logic [31:0] imem_rdata_i,

  output logic        dmem_req_o,
  output logic        dmem_we_o,
  output logic [3:0]  dmem_be_o,
  output logic [31:0] dmem_addr_o,
  output logic [31:0] dmem_wdata_o,
  input  logic [31:0] dmem_rdata_i,

  output logic        rvfi_valid_o,
  output logic [63:0] rvfi_order_o,
  output logic [31:0] rvfi_pc_rdata_o,
  output logic [31:0] rvfi_pc_wdata_o,
  output logic [31:0] rvfi_insn_o,
  output logic [4:0]  rvfi_rd_addr_o,
  output logic [31:0] rvfi_rd_wdata_o,
  output logic [31:0] rvfi_mem_addr_o,
  output logic [3:0]  rvfi_mem_rmask_o,
  output logic [3:0]  rvfi_mem_wmask_o,
  output logic [31:0] rvfi_mem_wdata_o,
  output logic        rvfi_trap_o
);

  assign imem_addr_o      = BOOT_ADDR;
  assign dmem_req_o       = 1'b0;
  assign dmem_we_o        = 1'b0;
  assign dmem_be_o        = 4'h0;
  assign dmem_addr_o      = 32'h0;
  assign dmem_wdata_o     = 32'h0;
  assign rvfi_valid_o     = 1'b0;
  assign rvfi_order_o     = 64'h0;
  assign rvfi_pc_rdata_o  = 32'h0;
  assign rvfi_pc_wdata_o  = 32'h0;
  assign rvfi_insn_o      = 32'h0;
  assign rvfi_rd_addr_o   = 5'h0;
  assign rvfi_rd_wdata_o  = 32'h0;
  assign rvfi_mem_addr_o  = 32'h0;
  assign rvfi_mem_rmask_o = 4'h0;
  assign rvfi_mem_wmask_o = 4'h0;
  assign rvfi_mem_wdata_o = 32'h0;
  assign rvfi_trap_o      = 1'b0;

  logic unused_ok;
  assign unused_ok = &{1'b0, clk_i, rst_ni, imem_rdata_i, dmem_rdata_i};

endmodule
