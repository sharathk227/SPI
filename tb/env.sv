class env extends uvm_env;
`uvm_component_utils(env)

env_cfg cfg;

v_seqr v_seqr_h;
spi_scoreboard sb_h;
master_agent_top m_agt_top_h;
slave_agent_top s_agt_top_h;

function new(string name ="env",uvm_component parent);
    super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
    if(!uvm_config_db#(env_cfg)::get(this,"","env_cfg",cfg))
        `uvm_fatal("ENV","couldn't  get the env config")
    if(cfg.has_master)
    begin
        m_agt_top_h=master_agent_top::type_id::create("m_agt_top_h",this);
        uvm_config_db#(master_agent_cfg)::set(this,"m_agt_top_h*","master_agent_cfg",cfg.m_cfg) ;
    end

    if(cfg.has_slave)
    begin
        s_agt_top_h=slave_agent_top::type_id::create("s_agt_top_h",this);
        uvm_config_db#(slave_agent_cfg)::set(this,"s_agt_top_h*","slave_agent_cfg",cfg.s_cfg);
    end

    if(cfg.has_scoreboard)
        sb_h=spi_scoreboard::type_id::create("sb_h",this);
    
    if(cfg.has_virtual_seqr)
        v_seqr_h=v_seqr::type_id::create("v_seqr_h",this);
    
    super.build_phase(phase);

 endfunction

function void connect_phase(uvm_phase phase);
    if(cfg.has_scoreboard)
    begin
        m_agt_top_h.m_agt_h.mon_h.monitor_port.connect(sb_h.m_fifo.analysis_export);
        s_agt_top_h.s_agt_h.mon_h.monitor_port.connect(sb_h.s_fifo.analysis_export);
    end
    if(cfg.has_virtual_seqr)
    begin
        v_seqr_h.m_seqr_h=m_agt_top_h.m_agt_h.seqr_h;
        v_seqr_h.s_seqr_h=s_agt_top_h.s_agt_h.seqr_h;
    end
endfunction

endclass

