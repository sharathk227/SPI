class v_seq extends uvm_sequence #(master_xtn);
`uvm_object_utils(v_seq)

v_seqr v_seqr_h;
master_seqr m_seqr_h;
slave_seqr s_seqr_h;

master_seq_data_o m_seq_d_o; 
master_seq m_seq_h;
slave_seq s_seq_h;

function new(string name ="v_seq");
    super.new(name);
endfunction

task body();
    assert($cast(v_seqr_h,m_sequencer))
    else
        `uvm_fatal("VIRTUAL SEQURNCE"," $cast failed, not have the handle to point to virtual sequencer of env")
    m_seqr_h=v_seqr_h.m_seqr_h;
    s_seqr_h=v_seqr_h.s_seqr_h;
endtask

endclass

///////////////////////////////
class first_vseq extends v_seq ;
`uvm_object_utils(first_vseq)

function new(string name ="first_vseq");
	super.new(name);
endfunction

task body();
	super.body();
	m_seq_h=master_seq::type_id::create("m_seq_h");
	s_seq_h=slave_seq::type_id::create("s_seq_h");
	m_seq_d_o=master_seq_data_o::type_id::create("m_seq_d_o");
	
	m_seq_h.start(m_seqr_h);
	s_seq_h.start(s_seqr_h);
	m_seq_d_o.start(m_seqr_h);
endtask

endclass

/////////////////////////////////
class second_vseq extends v_seq ;
`uvm_object_utils(second_vseq)
master_seq1 m_seq1_h;

function new(string name ="second_vseq");
	super.new(name);
endfunction

task body();
	super.body();
	m_seq1_h=master_seq1::type_id::create("m_seq1_h");
	s_seq_h=slave_seq::type_id::create("s_seq_h");
	m_seq_d_o=master_seq_data_o::type_id::create("m_seq_d_o");
	
	m_seq1_h.start(m_seqr_h);
	s_seq_h.start(s_seqr_h);
	m_seq_d_o.start(m_seqr_h);
endtask

endclass
/////////////////////////////////////
class third_vseq extends v_seq ;
`uvm_object_utils(third_vseq)
master_seq2 m_seq2_h;

function new(string name ="third_vseq");
	super.new(name);
endfunction

task body();
	super.body();
	m_seq2_h=master_seq2::type_id::create("m_seq2_h");
	s_seq_h=slave_seq::type_id::create("s_seq_h");
	m_seq_d_o=master_seq_data_o::type_id::create("m_seq_d_o");
	
	m_seq2_h.start(m_seqr_h);
	s_seq_h.start(s_seqr_h);
	m_seq_d_o.start(m_seqr_h);
endtask

endclass
/////////////////////////////////////

class fourth_vseq extends v_seq ;
`uvm_object_utils(fourth_vseq)
master_seq3 m_seq3_h;

function new(string name ="fourth_vseq");
	super.new(name);
endfunction

task body();
	super.body();
	m_seq3_h=master_seq3::type_id::create("m_seq3_h");
	s_seq_h=slave_seq::type_id::create("s_seq_h");
	m_seq_d_o=master_seq_data_o::type_id::create("m_seq_d_o");
	
	m_seq3_h.start(m_seqr_h);
	s_seq_h.start(s_seqr_h);
	m_seq_d_o.start(m_seqr_h);
endtask

endclass
/////////////////////////////////////


class fifth_vseq extends v_seq ;
`uvm_object_utils(fifth_vseq)
master_seq2 m_seq3_h;

function new(string name ="fifth_vseq");
	super.new(name);
endfunction

task body();
	super.body();
	m_seq3_h=master_seq2::type_id::create("m_seq3_h");
	s_seq_h=slave_seq::type_id::create("s_seq_h");
	m_seq_d_o=master_seq_data_o::type_id::create("m_seq_d_o");
	
	m_seq3_h.start(m_seqr_h);
	s_seq_h.start(s_seqr_h);
	m_seq_d_o.start(m_seqr_h);
endtask

endclass

