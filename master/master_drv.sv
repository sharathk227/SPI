class master_drv extends uvm_driver #(master_xtn);
`uvm_component_utils(master_drv)

virtual master_if.M_DRV_MP m_if;

master_agent_cfg m_cfg;

function new(string name="master_drv",uvm_component parent);
    super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
    if(!uvm_config_db#(master_agent_cfg)::get(this,"","master_agent_cfg",m_cfg))
        `uvm_fatal("MASTER DRV","couldn't get the master agent config")
    super.build_phase(phase);
endfunction

function void connect_phase(uvm_phase phase);
    m_if=m_cfg.m_if;

endfunction

task run_phase(uvm_phase phase);
	$display("inside run -phase of driver");
    @(m_if.m_drv_cb);
    m_if.m_drv_cb.wb_rst_i<=1'b1;
    @(m_if.m_drv_cb);
    @(m_if.m_drv_cb);
    m_if.m_drv_cb.wb_rst_i<=1'b0;
    m_if.m_drv_cb.wb_we_i<=1'b0;
    m_if.m_drv_cb.wb_stb_i<=1'b0;
    m_if.m_drv_cb.wb_cyc_i<=1'b0;
        forever
        begin
            seq_item_port.get_next_item(req);
            send_to_dut(req);
            seq_item_port.item_done;
        end
endtask

task send_to_dut(master_xtn xtn);
    @(m_if.m_drv_cb);
    m_if.m_drv_cb.wb_data_i<=xtn.wb_data_i;
    m_if.m_drv_cb.wb_addr_i<=xtn.wb_addr_i;
    m_if.m_drv_cb.wb_we_i<=xtn.wb_we_i;
    m_if.m_drv_cb.wb_sel_i<=4'b1111;
    m_if.m_drv_cb.wb_stb_i<=1'b1;
    m_if.m_drv_cb.wb_cyc_i<=1'b1;
    wait(m_if.m_drv_cb.wb_ack_o)
 //   @(m_if.m_drv_cb);
    m_if.m_drv_cb.wb_cyc_i<=1'b0; // how to print from interface;
    m_if.m_drv_cb.wb_stb_i<=1'b0;
    m_cfg.drv_count++;
        `uvm_info("MASTER DRIVER",$sformatf("the data send from driver is %s",xtn.sprint()),UVM_LOW)
	@(m_if.m_drv_cb);
	@(m_if.m_drv_cb);
//	@(m_if.m_drv_cb);
    
endtask

function void report_phase(uvm_phase phase);
    `uvm_info(get_type_name,$sformatf("the number of master drv count =%0d",m_cfg.drv_count),UVM_LOW)
endfunction

endclass
