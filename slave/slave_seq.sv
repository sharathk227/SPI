class slave_seq extends uvm_sequence #(slave_xtn);
`uvm_object_utils(slave_seq)

bit [31:0]cntrl_reg;
function new(string name="slave_seq");
    super.new(name);
endfunction

task body();
	req=slave_xtn::type_id::create("req");
	start_item(req);
	assert(req.randomize())
	finish_item(req);
//	$display("the randomized MISO is %0b",req.miso);
endtask
	
endclass

