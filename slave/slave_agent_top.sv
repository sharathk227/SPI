class slave_agent_top extends uvm_env ;
`uvm_component_utils(slave_agent_top)

slave_agent s_agt_h;

function new(string name="slave_agent_top",uvm_component parent);
    super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
    s_agt_h=slave_agent::type_id::create("s_agt_h",this);
    super.build_phase(phase);
endfunction  

task run_phase(uvm_phase phase);
    uvm_top.print_topology();
endtask

endclass
