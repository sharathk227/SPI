class master_xtn extends uvm_sequence_item ;
`uvm_object_utils(master_xtn)

bit wb_clk;
bit wb_rst_i;
rand bit[4:0] wb_addr_i;
rand bit[31:0] wb_data_i;
bit[31:0] wb_data_o;
bit[4:0] wb_sel_i;
rand bit wb_we_i;
bit wb_stb_i;
bit wb_cyc_i;
bit wb_ack_o;
bit wb_int_o;

bit[31:0] tx0,rx0,rx1,rx2,rx3,tx1,tx2,tx3,cntrl,ss,dvd;


function new(string name="master_xtn");
    super.new(name);
endfunction

function void do_print(uvm_printer printer);
	printer.print_field("WB_ADDR_I",this.wb_addr_i,5,UVM_HEX);
	printer.print_field("WB_DATA_I",this.wb_data_i,31,UVM_BIN);
	printer.print_field("WB_DATA_O",this.wb_data_o,32,UVM_BIN);
	printer.print_field("WB_SEL_I",this.wb_sel_i,4,UVM_BIN);
	printer.print_field("WB_WE_I",this.wb_we_i,1,UVM_BIN);
	printer.print_field("WB_STB_I",this.wb_stb_i,1,UVM_BIN);
	printer.print_field("WB_CYC_I",this.wb_cyc_i,1,UVM_BIN);
	printer.print_field("WB_ACK_O",this.wb_ack_o,1,UVM_BIN);
	printer.print_field("WB_INT_o",this.wb_int_o,1,UVM_BIN);
	printer.print_field("tx0",this.tx0,32,UVM_BIN);
	printer.print_field("tx1",this.tx1,32,UVM_BIN);
	printer.print_field("tx2",this.tx2,32,UVM_BIN);
	printer.print_field("tx3",this.tx3,32,UVM_BIN);
	printer.print_field("rx0",this.rx0,32,UVM_BIN);
	printer.print_field("rx1",this.rx1,32,UVM_BIN);
	printer.print_field("rx2",this.rx2,32,UVM_BIN);
	printer.print_field("rx3",this.rx3,32,UVM_BIN);
	printer.print_field("cntrl",this.cntrl,32,UVM_BIN);
	printer.print_field("ss",this.ss,32,UVM_BIN);
	printer.print_field("dvd",this.dvd,32,UVM_BIN);
endfunction

endclass
	
