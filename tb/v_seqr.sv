class v_seqr extends uvm_sequencer ;
`uvm_component_utils(v_seqr)
    
slave_seqr s_seqr_h;
master_seqr m_seqr_h;

function new(string name ="v_seqr",uvm_component parent);
    super.new(name,parent);
endfunction 

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
endfunction
endclass
