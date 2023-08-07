class slave_agent extends uvm_agent ;
`uvm_component_utils(slave_agent)

slave_mon mon_h;
slave_drv drv_h;
slave_seqr seqr_h;

slave_agent_cfg s_cfg;

function new(string name ="slave_agent",uvm_component parent);
    super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
    if(!uvm_config_db#(slave_agent_cfg)::get(this,"","slave_agent_cfg",s_cfg))
        `uvm_fatal("SLAVE_AGENT","couldn't get the slave_agent_config")
    mon_h=slave_mon::type_id::create("mon_h",this);
    if(s_cfg.is_active)
    begin
        drv_h=slave_drv::type_id::create("drv_h",this);
        seqr_h=slave_seqr::type_id::create("seqr_h",this	);
    end
    super.build_phase(phase);
endfunction

function void connect_phase(uvm_phase phase);
    if(s_cfg.is_active)
        drv_h.seq_item_port.connect(seqr_h.seq_item_export);
endfunction

endclass
