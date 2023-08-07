class slave_drv extends uvm_driver #(slave_xtn);
`uvm_component_utils(slave_drv)

virtual slave_if s_if; // have define interface

int local_char_len;
bit[31:0] cntrl_reg;
slave_agent_cfg s_cfg;

function new(string name="slave_drv",uvm_component parent);
    super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
    	if(!uvm_config_db#(bit[31:0])::get(this,"","bit[31:0]",cntrl_reg)) 	
		`uvm_fatal("SLAVE DRV","couldn't  get the cntrl_reg")
	begin
		if(cntrl_reg[6:0]==0)
			local_char_len=128;
		else 
			local_char_len=cntrl_reg[6:0];
	end
	if(!uvm_config_db#(slave_agent_cfg)::get(this,"","slave_agent_cfg",s_cfg))
        	`uvm_fatal("SLAVE DRV","couldn't  get the slave agent config")
    super.build_phase(phase);
endfunction

function void connect_phase(uvm_phase phase);
    s_if=s_cfg.s_if;
endfunction

task run_phase(uvm_phase phase);
    forever
	begin	
		seq_item_port.get_next_item(req);
		$display("local_char_len %d",local_char_len);
	//	$display("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		send_to_dut(req);
		seq_item_port.item_done();
	end
endtask

task send_to_dut(slave_xtn xtn);
	if(s_if.s_drv_cb.ss_pad_o!='hffff)
	begin
	if(cntrl_reg[9])
	begin
		if(cntrl_reg[11])
		begin
			for(int i=0;i<local_char_len;i++)
			begin
				@(posedge s_if.s_drv_cb.sclk_pad_o);
				s_if.s_drv_cb.miso_pad_i<=xtn.miso[i];
	
			end
			`uvm_info("DRIVER",$sformatf("the slave driven  is %s ",xtn.sprint()),UVM_LOW)
		end
		
		else
		begin
			for(int i=local_char_len-1;i>=0;i--)
			begin	$display("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@***************************");
				@(posedge s_if.s_drv_cb.sclk_pad_o);
				s_if.s_drv_cb.miso_pad_i<=xtn.miso[i];
			end
			`uvm_info("DRIVER",$sformatf("the slave driven  is %s ",xtn.sprint()),UVM_LOW)	
		end
	end
	
	else
	begin
		if(cntrl_reg[11])
		begin
			for(int i=0;i<local_char_len-1;i++)
			begin
				@(negedge s_if.s_drv_cb.sclk_pad_o);
				s_if.s_drv_cb.miso_pad_i<=xtn.miso[i];
			end
			`uvm_info("SLAVE DRIVER",$sformatf("the slave driven is %s ",xtn.sprint()),UVM_LOW)
			
		end

		else
		begin
			for(int i= local_char_len;i>=0;i--)
			begin
				@(negedge s_if.s_drv_cb.sclk_pad_o);
				s_if.s_drv_cb.miso_pad_i<=xtn.miso[i];
			end
			`uvm_info("DRIVER",$sformatf("the slave driven is %s ",xtn.sprint()),UVM_LOW)
			
		end
	end
	end
	@(s_if.s_drv_cb);				
	@(s_if.s_drv_cb);
	s_cfg.drv_count++;				
endtask

function void report_phase(uvm_phase phase);
    `uvm_info(get_type_name,$sformatf("the number of slave xtn driven = %0d",s_cfg.drv_count),UVM_LOW)
endfunction

endclass
