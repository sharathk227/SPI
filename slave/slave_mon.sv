class slave_mon extends uvm_monitor;
`uvm_component_utils(slave_mon)

virtual slave_if.S_MON_MP s_if; 
slave_agent_cfg s_cfg;

uvm_analysis_port#(slave_xtn)  monitor_port;

bit[31:0] cntrl_reg;

int local_char_len;

function new(string name="slave_mon",uvm_component parent);
    super.new(name,parent);
    monitor_port=new("monitor_port",this);
endfunction

function void build_phase(uvm_phase phase);
    if(!uvm_config_db#(bit[31:0])::get(this,"","bit[31:0]",cntrl_reg))
	`uvm_fatal("SLAVE MON","couldn't get the cntrl reg")
	begin
		if(cntrl_reg[6:0]==0)
			local_char_len=128;
		else
			local_char_len=cntrl_reg[6:0];
	end
    if(!uvm_config_db#(slave_agent_cfg)::get(this,"","slave_agent_cfg",s_cfg))
        `uvm_fatal("SLAVE MON","could get the slave config")
    
    super.build_phase(phase);
endfunction

function void connect_phase(uvm_phase phase);
    s_if=s_cfg.s_if;
endfunction

task run_phase(uvm_phase phase);	
    slave_xtn xtn;
    xtn=slave_xtn::type_id::create("xtn");
    forever 
    begin
	collect_dut(xtn);
    end
endtask

task collect_dut(slave_xtn xtn);
	@(s_if.s_mon_cb);
	@(s_if.s_mon_cb);
	@(s_if.s_mon_cb);
	if(cntrl_reg[9])
	begin
		if(cntrl_reg[11])
		begin
			for(int i=0;i<local_char_len;i++)
			begin
				@(negedge s_if.s_mon_cb.sclk_pad_o);
				xtn.miso[i]=s_if.s_mon_cb.miso_pad_i;
				xtn.mosi[i]=s_if.s_mon_cb.mosi_pad_o;
			end
		end
		else 
		begin
			for(int i=local_char_len-1;i>=0;i--)
			begin
				@(negedge  s_if.s_mon_cb.sclk_pad_o)
				xtn.miso[i]=s_if.s_mon_cb.miso_pad_i;
				xtn.mosi[i]=s_if.s_mon_cb.mosi_pad_o;
			end
		end
	
	end
	if(cntrl_reg[10])
	begin
		if(cntrl_reg[11])
		begin
			for(int i=0;i<local_char_len;i++)
			begin
				@(posedge s_if.s_mon_cb.sclk_pad_o)
				xtn.miso[i]=s_if.s_mon_cb.miso_pad_i;
				xtn.mosi[i]=s_if.s_mon_cb.mosi_pad_o;
			end
		end
		else
		begin
			for(int i=local_char_len-1;i>=0;i--)
			begin
				@(posedge s_if.s_mon_cb.sclk_pad_o)
				xtn.miso[i]=s_if.s_mon_cb.miso_pad_i;
				xtn.mosi[i]=s_if.s_mon_cb.mosi_pad_o;
			end
		end
	end
	`uvm_info("SLAVE MONITOR",$sformatf("the xtn monitor by slave monitor %s",xtn.sprint()),UVM_LOW)
	monitor_port.write(xtn);
	s_cfg.mon_count++;
endtask	

function void report_phase(uvm_phase phase);
    `uvm_info("SLAVE MONITOR",$sformatf("the number of slave xtn monitored %d",s_cfg.mon_count),UVM_LOW)
endfunction

endclass

