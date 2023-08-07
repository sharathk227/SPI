class master_agent extends uvm_agent ;
`uvm_component_utils(master_agent)

master_mon mon_h;
master_drv drv_h;
master_seqr seqr_h;

master_agent_cfg m_cfg;

function new(string name="master_agent",uvm_component parent);
    super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
    if(!uvm_config_db#(master_agent_cfg)::get(this,"","master_agent_cfg",m_cfg))
        `uvm_fatal("MASTER AGENT","couldn't get the master config ")
    mon_h=master_mon::type_id::create("mon_h",this);
    if(m_cfg.is_active)
    begin
        drv_h=master_drv::type_id::create("drv_h",this);
        seqr_h=master_seqr::type_id::create("seqr_h",this);
    end
    super.build_phase(phase);
endfunction

function void connect_phase(uvm_phase phase);
	if(m_cfg.is_active)
 	   drv_h.seq_item_port.connect(seqr_h.seq_item_export);
endfunction

endclass

