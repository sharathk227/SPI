class master_seqr extends uvm_sequencer #(master_xtn);
`uvm_component_utils(master_seqr)

function new(string name= "master_seqr",uvm_component parent);
    super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
endfunction

endclass
