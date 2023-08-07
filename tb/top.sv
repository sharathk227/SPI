`timescale 1ns/10ps
module top;
import spi_test_pkg::*;
import uvm_pkg::*;

bit clock;

always
#10 clock=~clock;

slave_if s_if(clock);
master_if m_if(clock);

spi_top DUV
	(
  // Wishbone signals
.wb_clk_i(clock), .wb_rst_i(m_if.wb_rst_i),.wb_adr_i(m_if.wb_addr_i),.wb_dat_i(m_if.wb_data_i),.wb_dat_o(m_if.wb_data_o),.wb_sel_i(m_if.wb_sel_i),
  .wb_we_i(m_if.wb_we_i), .wb_stb_i(m_if.wb_stb_i), .wb_cyc_i(m_if.wb_cyc_i), .wb_ack_o(m_if.wb_ack_o), .wb_err_o(m_if.wb_err_o), .wb_int_o(m_if.wb_int_o),

  // SPI signals
  .ss_pad_o(s_if.ss_pad_o), .sclk_pad_o(s_if.sclk_pad_o), .miso_pad_i(s_if.miso_pad_i), .mosi_pad_o(s_if.mosi_pad_o)
);


initial
begin
    uvm_config_db#(virtual slave_if)::set(null,"*","slave_if_1",s_if);
    uvm_config_db#(virtual master_if)::set(null,"*","master_if_1",m_if);
    run_test();
end
endmodule
