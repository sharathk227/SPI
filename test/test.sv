class test extends uvm_test ;
`uvm_component_utils(test)

bit has_master=1;
bit has_slave=1;
bit has_scoreboard=1;
bit has_virtual_seqr=1;

bit[31:0] cntrl_reg;

env_cfg cfg;
slave_agent_cfg s_cfg;
master_agent_cfg m_cfg;

env env_h;

function new(string name="test",uvm_component parent);
    super.new(name,parent);
endfunction

function void spi_config();
    if(has_master)
    begin
        m_cfg=master_agent_cfg::type_id::create("m_cfg");
        if(!uvm_config_db#(virtual master_if)::get(this,"","master_if_1",m_cfg.m_if))
            `uvm_fatal("TEST","couldn't get  the master virtual interface to config")
        m_cfg.is_active=UVM_ACTIVE;
        cfg.m_cfg=m_cfg;
    end
    if(has_slave)
    begin
        s_cfg=slave_agent_cfg::type_id::create("s_cfg") ;
        if(!uvm_config_db#(virtual slave_if)::get(this,"","slave_if_1",s_cfg.s_if))
            `uvm_fatal("TEST","could get the slave virtual interface tp config")
        s_cfg.is_active=UVM_ACTIVE;
        cfg.s_cfg=s_cfg;
    end
    cfg.has_master=has_master;
    cfg.has_slave=has_slave;
    cfg.has_scoreboard=has_scoreboard;
    cfg.has_virtual_seqr=has_virtual_seqr;
endfunction

function void build_phase(uvm_phase phase);
    cfg=env_cfg::type_id::create("cfg");
    spi_config();
    uvm_config_db#(env_cfg)::set(this,"*","env_cfg",cfg);
    env_h=env::type_id::create("env_h",this);
    super.build_phase(phase);
endfunction

endclass

///////////////////////////////////////////////////////////////////////////////

class test_1 extends test;
`uvm_component_utils(test_1)

first_vseq f_vseq_h;

function new(string name ="test_1",uvm_component parent);
	super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
	cntrl_reg[6:0]=10;
	cntrl_reg[7]=0;
	cntrl_reg[8]=1;
	cntrl_reg[10:9]=2'b01;
	cntrl_reg[11]=1;
	cntrl_reg[12]=1;
	cntrl_reg[13]=1;
	cntrl_reg[31:14]=0;
	uvm_config_db#(bit[31:0])::set(this,"*","bit[31:0]",cntrl_reg);
	
	super.build_phase(phase);
endfunction

task run_phase(uvm_phase phase);
	f_vseq_h=first_vseq::type_id::create("f_vseq");
	phase.raise_objection(this);
	f_vseq_h.start(env_h.v_seqr_h);
	phase.drop_objection(this);
endtask

endclass

////////////////////////////////////////////////////////////////////////////////////


class test_2 extends test;
`uvm_component_utils(test_2)

second_vseq s_vseq_h;

function new(string name ="test_2",uvm_component parent);
	super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
	cntrl_reg[6:0]=37;
	cntrl_reg[7]=0;
	cntrl_reg[8]=1;
	cntrl_reg[10:9]=2'b10;
	cntrl_reg[11]=1;
	cntrl_reg[12]=1;
	cntrl_reg[13]=1;
	cntrl_reg[31:14]=0;
	uvm_config_db#(bit[31:0])::set(this,"*","bit[31:0]",cntrl_reg);
	
	super.build_phase(phase);
endfunction

task run_phase(uvm_phase phase);
	s_vseq_h=second_vseq::type_id::create("s_vseq");
	phase.raise_objection(this);
	s_vseq_h.start(env_h.v_seqr_h);
	phase.drop_objection(this);
endtask

endclass

////////////////////////////////////////////////////////////

class test_3 extends test;
`uvm_component_utils(test_3)

third_vseq t_vseq_h;

function new(string name ="test_3",uvm_component parent);
	super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
	cntrl_reg[6:0]=69;
	cntrl_reg[7]=0;
	cntrl_reg[8]=1;
	cntrl_reg[10:9]=2'b10;
	cntrl_reg[11]=1;
	cntrl_reg[12]=1;
	cntrl_reg[13]=1;
	cntrl_reg[31:14]=0;
	uvm_config_db#(bit[31:0])::set(this,"*","bit[31:0]",cntrl_reg);
	
	super.build_phase(phase);
endfunction

task run_phase(uvm_phase phase);
	t_vseq_h=third_vseq::type_id::create("t_vseq");
	phase.raise_objection(this);
	t_vseq_h.start(env_h.v_seqr_h);
	phase.drop_objection(this);
endtask

endclass
///////////////////////////////////////////////////////////


class test_4 extends test;
`uvm_component_utils(test_4)

fourth_vseq fourth_vseq_h;

function new(string name ="test_4",uvm_component parent);
	super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
	cntrl_reg[6:0]=110;
	cntrl_reg[7]=0;
	cntrl_reg[8]=1;
	cntrl_reg[10:9]=2'b10;
	cntrl_reg[11]=1;
	cntrl_reg[12]=1;
	cntrl_reg[13]=1;
	cntrl_reg[31:14]=0;
	uvm_config_db#(bit[31:0])::set(this,"*","bit[31:0]",cntrl_reg);
	
	super.build_phase(phase);
endfunction

task run_phase(uvm_phase phase);
	fourth_vseq_h=fourth_vseq::type_id::create("fourth_vseq");
	phase.raise_objection(this);
	fourth_vseq_h.start(env_h.v_seqr_h);
	phase.drop_objection(this);
endtask

endclass

////////////////////////////////////////////////////////////

class test_5 extends test;
`uvm_component_utils(test_5)

fifth_vseq fourth_vseq_h;

function new(string name ="test_4",uvm_component parent);
	super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
	cntrl_reg[6:0]=110;
	cntrl_reg[7]=0;
	cntrl_reg[8]=1;
	cntrl_reg[10:9]=2'b10;
	cntrl_reg[11]=1;
	cntrl_reg[12]=1;
	cntrl_reg[13]=1;
	cntrl_reg[31:14]=0;
	uvm_config_db#(bit[31:0])::set(this,"*","bit[31:0]",cntrl_reg);
	
	super.build_phase(phase);
endfunction

task run_phase(uvm_phase phase);
	fourth_vseq_h=fifth_vseq::type_id::create("fourth_vseq");
	phase.raise_objection(this);
	fourth_vseq_h.start(env_h.v_seqr_h);
	phase.drop_objection(this);
endtask

endclass

