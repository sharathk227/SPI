class master_agent_cfg extends uvm_object;
`uvm_object_utils(master_agent_cfg)

virtual master_if m_if;

uvm_active_passive_enum is_active=UVM_ACTIVE;

static int drv_count=0;
static int mon_count=0;

function new(string name="master_agent_cfg");
    super.new(name);
endfunction

endclass

