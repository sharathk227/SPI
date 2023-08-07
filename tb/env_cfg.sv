class env_cfg extends uvm_object ;
`uvm_object_utils(env_cfg)

slave_agent_cfg s_cfg;
master_agent_cfg m_cfg;

bit has_scoreboard;
bit has_virtual_seqr;
bit has_slave;
bit has_master;

function new(string name= "env_cfg");
    super.new(name);
endfunction

endclass
