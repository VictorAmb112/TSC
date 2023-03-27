/***********************************************************************
 * A SystemVerilog testbench for an instruction register; This file
 * contains the interface to connect the testbench to the design
 **********************************************************************/
interface tb_ifc (input logic clk, input logic test_clk);
  //timeunit 1ns/1ns;

  // user-defined types are defined in instr_register_pkg.sv
  import instr_register_pkg::*;

  // ADD CODE TO DECLARE THE INTERFACE SIGNALS
    logic          load_en;
    logic          reset_n;
    operand_t      operand_a;
    operand_t      operand_b;
    opcode_t       opcode;
    address_t      write_pointer;
    address_t      read_pointer;
    instruction_t  instruction_word;

   clocking tb_cb @(test_clk);
    output   load_en;
    output   reset_n;
    output   operand_a;
    output   operand_b;
    output   opcode;
    output   write_pointer;
    output   read_pointer;
    input    instruction_word;
endclocking;

modport TEST(
  clocking tb_cb
);

 clocking dut_cb @(clk);
    input    load_en;
    input    reset_n;
    input    operand_a;
    input    operand_b;
    input    opcode;
    input    write_pointer;
    input    read_pointer;
    output   instruction_word;
endclocking;

modport DUT(
  clocking dut_cb
);

endinterface: tb_ifc

