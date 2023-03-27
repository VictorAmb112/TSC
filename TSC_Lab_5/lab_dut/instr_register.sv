/***********************************************************************
 * A SystemVerilog RTL model of an instruction regisgter
 *
 * An error can be injected into the design by invoking compilation with
 * the option:  +define+FORCE_LOAD_ERROR
 *
 **********************************************************************/

module instr_register(tb_ifc.DUT tbintf);
 // user-defined types are defined in instr_register_pkg.sv
/*(input  logic          clk,
 input  logic          load_en,
 input  logic          reset_n,
 input  operand_t      operand_a,
 input  operand_t      operand_b,
 input  opcode_t       opcode,
 input  address_t      write_pointer,
 input  address_t      read_pointer,
 output instruction_t  instruction_word
);*/
  timeunit 1ns/1ns;
  import instr_register_pkg::*; 
  result_t       result;
  instruction_t  iw_reg [0:31];  // an array of instruction_word structures

  // write to the register
  always@(posedge tbintf.dut_cb, negedge tbintf.dut_cb.reset_n)   // write into register
    if (!tbintf.dut_cb.reset_n) begin
      foreach (iw_reg[i])
        iw_reg[i] = '{opc:ZERO,default:0};  // reset to all zeros
    end
    else if (tbintf.dut_cb.load_en) begin
	//TODO result 
      case(tbintf.dut_cb.opcode) 
	  	  ZERO  : result = 'b0;
        PASSA : result = tbintf.dut_cb.operand_a;
        PASSB : result = tbintf.dut_cb.operand_b;
        ADD   : result = tbintf.dut_cb.operand_a+tbintf.dut_cb.operand_b;
        SUB   : result = tbintf.dut_cb.operand_a-tbintf.dut_cb.operand_b;
        MULT  : result = tbintf.dut_cb.operand_a*tbintf.dut_cb.operand_b;
        DIV   : result = tbintf.dut_cb.operand_a/tbintf.dut_cb.operand_b;
        MOD   : result = tbintf.dut_cb.operand_a%tbintf.dut_cb.operand_b;
	  endcase
      iw_reg[tbintf.dut_cb.write_pointer] = '{tbintf.dut_cb.opcode,tbintf.dut_cb.operand_a,tbintf.dut_cb.operand_b,result};
	 
    end

    // read from the register
     always@(posedge tbintf.dut_cb, negedge tbintf.dut_cb.reset_n)   
   	   tbintf.dut_cb.instruction_word <= iw_reg[tbintf.dut_cb.read_pointer];
  // assign tbintf.dut_cb.instruction_word = iw_reg[tbintf.dut_cb.read_pointer];  // continuously read from register

// compile with +define+FORCE_LOAD_ERROR to inject a functional bug for verification to catch
`ifdef FORCE_LOAD_ERROR
initial begin
  force tbintf.dut_cb.operand_b = tbintf.dut_cb.operand_a; // cause wrong value to be loaded into operand_b
end
`endif

endmodule: instr_register
