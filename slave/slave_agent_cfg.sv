class slave_agent_cfg extends uvm_object;
`uvm_object_utils(slave_agent_cfg)

virtual slave_if s_if;

uvm_active_passive_enum is_active=UVM_ACTIVE;

static int drv_count;
static int mon_count;

function new(string name="slave_agent_cfg");
    super.new(name);
endfunction

endclass

