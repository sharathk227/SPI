class slave_xtn extends uvm_sequence_item;
`uvm_object_utils(slave_xtn)

rand bit[127:0] miso;
bit [127:0] mosi;
bit sclk_pad_o;
bit [7:0] ss_pad_o;
bit[127:0] rx;

function new(string name ="slave_xtn");
    super.new(name);
endfunction 

function void do_print(uvm_printer printer);
	printer.print_field("miso",this.miso,127,UVM_BIN);
	printer.print_field("mosi",this.mosi,127,UVM_BIN);
endfunction

endclass

