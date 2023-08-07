
class master_seq extends uvm_sequence #(master_xtn);
`uvm_object_utils(master_seq)

bit[31:0] cntrl_reg;

function new(string name ="master_seq");
	super.new(name);
endfunction

task body();

begin
	req=master_xtn::type_id::create("req");
	start_item(req);
	assert(req.randomize() with { wb_addr_i ==5'h00;
					wb_we_i==1'b1;})
	//	`uvm_info("MASTER SEQ",$sformatf(" printing the master seq %s",req.sprint()),UVM_LOW)
		$display("data_in for tx0");
	finish_item(req);
//end

//begin
	req=master_xtn::type_id::create("req");
	start_item(req);
	assert(req.randomize() with {wb_addr_i==5'h04;
					wb_we_i==1'b1;})
	//	`uvm_info("MASTER SEQ",$sformatf("printing the master seq %s",req.sprint()),UVM_LOW)
			$display("data_in for tx1");

	finish_item(req);
//end

//begin
	req=master_xtn::type_id::create("req");
	start_item(req);
	assert(req.randomize() with {wb_addr_i==5'h14;
					wb_data_i==1;
					wb_we_i==1'b1;})
				$display("data_in for divider");

		//`uvm_info("MASTER SEQ",$sformatf("printing the master seq %s",req.sprint()),UVM_LOW)
	finish_item(req);
//end

//begin
	req=master_xtn::type_id::create("req");
	start_item(req);
	assert(req.randomize() with {wb_addr_i==5'h18;
			                wb_data_i inside{8'b0000_0010,8'b0000_0100,8'b0000_1000,8'b0001_0000,8'b0010_0000,8'b0100_0000,8'b1000_0000};
			        	wb_we_i==1'b1;})
				$display("data_in for ss");

	//	`uvm_info("MASTER SEQ",$sformatf("printing the master seq %s",req.sprint()),UVM_LOW)
	finish_item(req);
//end
	if(!uvm_config_db#(bit[31:0])::get(null,get_full_name,"bit[31:0]",cntrl_reg))
		`uvm_fatal(get_type_name,"couldn't get the cntrl_reg config ")

//begin
	req=master_xtn::type_id::create("req");
	start_item(req);
	assert(req.randomize() with {wb_addr_i==5'h10;
					wb_data_i==cntrl_reg;
					wb_we_i==1'b1;})
				$display("data_in for cntrl");

	//	`uvm_info("MASTER SEQ",$sformatf("printing the master seq %s",req.sprint()),UVM_LOW)
	finish_item(req);
end

endtask

endclass

/////////////////////////////////////////////////////////////////////////////////

class master_seq1 extends uvm_sequence #(master_xtn);
`uvm_object_utils(master_seq1)

bit[31:0] cntrl_reg;

function new(string name ="master_seq1");
	super.new(name);
endfunction

task body();

begin
	req=master_xtn::type_id::create("req");
	start_item(req);
	assert(req.randomize() with { wb_addr_i==5'h00;
					wb_we_i==1'b1;})
	//	`uvm_info("MASTER SEQ",$sformatf(" printing the master seq %s",req.sprint()),UVM_LOW)
		$display("data_in for tx0");
	finish_item(req);
//end

//begin
	req=master_xtn::type_id::create("req");
	start_item(req);
	assert(req.randomize() with {wb_addr_i==5'h04;
					wb_we_i==1'b1;})
	//	`uvm_info("MASTER SEQ",$sformatf("printing the master seq %s",req.sprint()),UVM_LOW)
			$display("data_in for tx1");

	finish_item(req);
//end
	req=master_xtn::type_id::create("req");
	start_item(req);
	assert(req.randomize() with {wb_addr_i==5'h08;
					wb_we_i==1'b1;})
	//	`uvm_info("MASTER SEQ",$sformatf("printing the master seq %s",req.sprint()),UVM_LOW)
			$display("data_in for tx1");

	finish_item(req);

//begin
	req=master_xtn::type_id::create("req");
	start_item(req);
	assert(req.randomize() with {wb_addr_i==5'h14;
					wb_data_i==1;
					wb_we_i==1'b1;})
				$display("data_in for divider");

		//`uvm_info("MASTER SEQ",$sformatf("printing the master seq %s",req.sprint()),UVM_LOW)
	finish_item(req);
//end

//begin
	req=master_xtn::type_id::create("req");
	start_item(req);
	assert(req.randomize() with {wb_addr_i==5'h18;
			                wb_data_i inside{8'b0000_0010,8'b0000_0100,8'b0000_1000,8'b0001_0000,8'b0010_0000,8'b0100_0000,8'b1000_0000};
			        	wb_we_i==1'b1;})
				$display("data_in for ss");

	//	`uvm_info("MASTER SEQ",$sformatf("printing the master seq %s",req.sprint()),UVM_LOW)
	finish_item(req);
//end
	if(!uvm_config_db#(bit[31:0])::get(null,get_full_name,"bit[31:0]",cntrl_reg))
		`uvm_fatal(get_type_name,"couldn't get the cntrl_reg config ")

//begin
	req=master_xtn::type_id::create("req");
	start_item(req);
	assert(req.randomize() with {wb_addr_i==5'h10;
					wb_data_i==cntrl_reg;
					wb_we_i==1'b1;})
				$display("data_in for cntrl");

	//	`uvm_info("MASTER SEQ",$sformatf("printing the master seq %s",req.sprint()),UVM_LOW)
	finish_item(req);
end

endtask

endclass

//////////////////////////////////////////////////////////////////////////////


class master_seq2 extends uvm_sequence #(master_xtn);
`uvm_object_utils(master_seq2)

bit[31:0] cntrl_reg;

function new(string name ="master_seq2");
	super.new(name);
endfunction

task body();

begin
	req=master_xtn::type_id::create("req");
	start_item(req);
	assert(req.randomize() with { wb_addr_i==5'h00;
					wb_we_i==1'b1;})
	//	`uvm_info("MASTER SEQ",$sformatf(" printing the master seq %s",req.sprint()),UVM_LOW)
		$display("data_in for tx0");
	finish_item(req);

//begin
	req=master_xtn::type_id::create("req");
	start_item(req);
	assert(req.randomize() with {wb_addr_i==5'h14;
					wb_data_i==1;
					wb_we_i==1'b1;})
				$display("data_in for divider");

		//`uvm_info("MASTER SEQ",$sformatf("printing the master seq %s",req.sprint()),UVM_LOW)
	finish_item(req);
//end

//begin
	req=master_xtn::type_id::create("req");
	start_item(req);
	assert(req.randomize() with {wb_addr_i==5'h18;
			                wb_data_i inside{8'b0000_0010,8'b0000_0100,8'b0000_1000,8'b0001_0000,8'b0010_0000,8'b0100_0000,8'b1000_0000};
			        	wb_we_i==1'b1;})
				$display("data_in for ss");

	//	`uvm_info("MASTER SEQ",$sformatf("printing the master seq %s",req.sprint()),UVM_LOW)
	finish_item(req);
//end
	if(!uvm_config_db#(bit[31:0])::get(null,get_full_name,"bit[31:0]",cntrl_reg))
		`uvm_fatal(get_type_name,"couldn't get the cntrl_reg config ")

//begin
	req=master_xtn::type_id::create("req");
	start_item(req);
	assert(req.randomize() with {wb_addr_i==5'h10;
					wb_data_i==cntrl_reg;
					wb_we_i==1'b1;})
				$display("data_in for cntrl");

	//	`uvm_info("MASTER SEQ",$sformatf("printing the master seq %s",req.sprint()),UVM_LOW)
	finish_item(req);
end

endtask

endclass
//////////////////////////////////////////////////////////////////////////////



class master_seq3 extends uvm_sequence #(master_xtn);
`uvm_object_utils(master_seq3)

bit[31:0] cntrl_reg;

function new(string name ="master_seq3");
	super.new(name);
endfunction


task body();

begin
	req=master_xtn::type_id::create("req");
	start_item(req);
	assert(req.randomize() with { wb_addr_i==5'h00;
					wb_we_i==1'b1;})
	//	`uvm_info("MASTER SEQ",$sformatf(" printing the master seq %s",req.sprint()),UVM_LOW)
		$display("data_in for tx0");
	finish_item(req);
//end

//begin
	req=master_xtn::type_id::create("req");
	start_item(req);
	assert(req.randomize() with {wb_addr_i==5'h04;
					wb_we_i==1'b1;})
	//	`uvm_info("MASTER SEQ",$sformatf("printing the master seq %s",req.sprint()),UVM_LOW)
			$display("data_in for tx1");

	finish_item(req);
//end
	req=master_xtn::type_id::create("req");
	start_item(req);
	assert(req.randomize() with {wb_addr_i==5'h08;
					wb_we_i==1'b1;})
	//	`uvm_info("MASTER SEQ",$sformatf("printing the master seq %s",req.sprint()),UVM_LOW)
			$display("data_in for tx1");

	finish_item(req);

	req=master_xtn::type_id::create("req");
	start_item(req);
	assert(req.randomize() with {wb_addr_i==5'h0c;
					wb_we_i==1'b1;})
	//	`uvm_info("MASTER SEQ",$sformatf("printing the master seq %s",req.sprint()),UVM_LOW)
			$display("data_in for tx1");

	finish_item(req);


//begin
	req=master_xtn::type_id::create("req");
	start_item(req);
	assert(req.randomize() with {wb_addr_i==5'h14;
					wb_data_i==1;
					wb_we_i==1'b1;})
				$display("data_in for divider");

		//`uvm_info("MASTER SEQ",$sformatf("printing the master seq %s",req.sprint()),UVM_LOW)
	finish_item(req);
//end

//begin
	req=master_xtn::type_id::create("req");
	start_item(req);
	assert(req.randomize() with {wb_addr_i==5'h18;
			                wb_data_i inside{8'b0000_0010,8'b0000_0100,8'b0000_1000,8'b0001_0000,8'b0010_0000,8'b0100_0000,8'b1000_0000};
			        	wb_we_i==1'b1;})
				$display("data_in for ss");

	//	`uvm_info("MASTER SEQ",$sformatf("printing the master seq %s",req.sprint()),UVM_LOW)
	finish_item(req);
//end
	if(!uvm_config_db#(bit[31:0])::get(null,get_full_name,"bit[31:0]",cntrl_reg))
		`uvm_fatal(get_type_name,"couldn't get the cntrl_reg config ")

//begin
	req=master_xtn::type_id::create("req");
	start_item(req);
	assert(req.randomize() with {wb_addr_i==5'h10;
					wb_data_i==cntrl_reg;
					wb_we_i==1'b1;})
				$display("data_in for cntrl");

	//	`uvm_info("MASTER SEQ",$sformatf("printing the master seq %s",req.sprint()),UVM_LOW)
	finish_item(req);
end

endtask

endclass


//////////////////////////////////////////////////////////////////////////////

class master_seq_data_o extends master_seq;
`uvm_object_utils(master_seq_data_o)

function new(string name ="master_seq_data_o");
	super.new(name);
endfunction

task body();
	req=master_xtn::type_id::create("req");
	start_item(req);
	assert(req.randomize() with { wb_addr_i==5'h0;
					wb_we_i==0;})
	finish_item(req);
endtask
endclass

