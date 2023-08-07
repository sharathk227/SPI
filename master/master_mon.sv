class master_mon extends uvm_monitor ;
`uvm_component_utils(master_mon)

virtual master_if.M_MON_MP m_if ; // have to declare modport

master_agent_cfg m_cfg;

uvm_analysis_port#(master_xtn)monitor_port;

master_xtn xtn;

function new(string name="master_mon",uvm_component parent);
    super.new(name,parent);
    monitor_port=new("monitor_port",this);
endfunction

function void build_phase(uvm_phase phase);	
    	if(!uvm_config_db#(master_agent_cfg)::get(this,"","master_agent_cfg",m_cfg))
    		`uvm_fatal("MASTER MON","couldn't get the master agent config")
	super.build_phase(phase);     
endfunction

function void connect_phase(uvm_phase phase);
    m_if=m_cfg.m_if;
endfunction

task run_phase(uvm_phase phase);	
	master_xtn xtn;
	xtn=master_xtn::type_id::create("xtn");
	forever
	begin
		collect_from_duv(xtn);
	end
endtask

task collect_from_duv(master_xtn xtn);
//	$display("created the xtn and going to wait for ack and we @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
	wait(m_if.m_mon_cb.wb_ack_o )	
	@(m_if.m_mon_cb);

//	$display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ ");
	xtn.wb_we_i=m_if.m_mon_cb.wb_we_i;
begin
//	$display("*************************************************%0h",m_if.m_mon_cb.wb_addr_i);
	if(m_if.m_mon_cb.wb_addr_i == 5'h00 && m_if.m_mon_cb.wb_we_i)
	begin
		xtn.tx0=m_if.m_mon_cb.wb_data_i;
	end
	else if(m_if.m_mon_cb.wb_addr_i==5'h04&& m_if.m_mon_cb.wb_we_i)
		xtn.tx1=m_if.m_mon_cb.wb_data_i;
	else if(m_if.m_mon_cb.wb_addr_i==5'h08 && m_if.m_mon_cb.wb_we_i)
	begin
		xtn.tx2=m_if.m_mon_cb.wb_data_i;
	end
	else if(m_if.m_mon_cb.wb_addr_i==5'h0c &&  m_if.m_mon_cb.wb_we_i)
		xtn.tx3=m_if.m_mon_cb.wb_data_i;
	else if(m_if.m_mon_cb.wb_addr_i==5'h18&& m_if.m_mon_cb.wb_we_i)
		xtn.ss=m_if.m_mon_cb.wb_data_i;
	
	else if(m_if.m_mon_cb.wb_addr_i==5'h14&& m_if.m_mon_cb.wb_we_i )
		xtn.dvd=m_if.m_mon_cb.wb_data_i;
	else if(m_if.m_mon_cb.wb_addr_i==5'h10 &&  m_if.m_mon_cb.wb_we_i)
	begin	
		xtn.cntrl=m_if.m_mon_cb.wb_data_i;
	end
	else if(m_if.m_mon_cb.wb_addr_i==5'h00 && !m_if.m_mon_cb.wb_we_i)
		xtn.rx0=m_if.m_mon_cb.wb_data_o;
	else if(m_if.m_mon_cb.wb_addr_i==5'h04 && !m_if.m_mon_cb.wb_we_i)
		xtn.rx1=m_if.m_mon_cb.wb_data_o;
	else if(m_if.m_mon_cb.wb_addr_i==5'h08 && !m_if.m_mon_cb.wb_we_i)
		xtn.rx2=m_if.m_mon_cb.wb_data_o;
	else if(m_if.m_mon_cb.wb_addr_i==5'h0c && !m_if.m_mon_cb.wb_we_i)
		xtn.rx3=m_if.m_mon_cb.wb_data_o;
	`uvm_info("MASTER MON",$sformatf("printing from  the master xtn from mon %s",xtn.sprint()),UVM_LOW)
		monitor_port.write(xtn);

	m_cfg.mon_count++;
	
end

endtask
	

function void report_phase(uvm_phase phase);
    `uvm_info(get_type_name,$sformatf("the number of master mon count =%0d",m_cfg.mon_count),UVM_LOW);
endfunction
    
endclass
