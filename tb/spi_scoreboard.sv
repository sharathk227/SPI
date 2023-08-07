class spi_scoreboard extends uvm_scoreboard ;
`uvm_component_utils(spi_scoreboard);

uvm_tlm_analysis_fifo#(master_xtn) m_fifo;
uvm_tlm_analysis_fifo#(slave_xtn) s_fifo;

master_xtn m_xtn;
slave_xtn s_xtn;

bit[127:0] tx,rx;
bit[31:0] cntrl_reg;
bit[6:0] local_char_len;

int mosi_count=0,miso_count=0;

covergroup fcov1;
	option.per_instance=1;
	
	CHAR:coverpoint m_xtn.cntrl[6:0]{
					bins zero={[1:31]};
					bins one={[32:63]};
					bins second={[64:95]};
					bins third={[96:128]};
					}
	CNTRL_8:coverpoint m_xtn.cntrl[8];

	TX_RX:coverpoint m_xtn.cntrl[10:9]{
					bins tx_rx_1={2'b01};
					bins tx_rx_2={2'b10};
					}
	LSB:coverpoint m_xtn.cntrl[11];
	
	IE:coverpoint m_xtn.cntrl[12];

	ASS:coverpoint m_xtn.cntrl[13];
	
	CROSS:cross CHAR,TX_RX,LSB;	
endgroup

function new(string name ="spi_scoreboard", uvm_component parent);
	super.new(name,parent);
	fcov1=new();
	m_fifo=new("m_fifo",this);
	s_fifo=new("s_fifo",this);
endfunction

function void build_phase(uvm_phase phase);
	if(!uvm_config_db#(bit[31:0])::get(this,"","bit[31:0]",cntrl_reg))
		`uvm_fatal("SCOREBOARD","couldn't get the cntrl_reg")
	if(cntrl_reg==0)
		local_char_len=128;
	else
		local_char_len=cntrl_reg[6:0];
	super.build_phase(phase);
endfunction

task run_phase(uvm_phase phase);
	fork
	begin
		forever
		begin
			m_fifo.get(m_xtn);
			$display("SCOREBOARD MASTER XTN ");
			m_xtn.print();	
			fcov1.sample();	
		end
	end
	
	begin
		forever
		begin
		s_fifo.get(s_xtn);
		$display("SCOREBOARD SLAVE XTN");
		s_xtn.print();
		end
	end

	join_any
endtask

function void check_phase(uvm_phase phase);
	tx={m_xtn.tx3,m_xtn.tx2,m_xtn.tx1,m_xtn.tx0};
	rx={m_xtn.rx3,m_xtn.rx2,m_xtn.rx1,m_xtn.rx0};
	for(int i=0;i<local_char_len;i++)
	begin
		if(tx[i]==s_xtn.mosi[i])
			mosi_count++;
		if(rx[i]==s_xtn.miso[i])
			miso_count++;
	end

	if(mosi_count==local_char_len)
		$display("mosi verified");
	else 
		$display("failed verification mosi");
	
	if(miso_count==local_char_len)
		$display("miso verified");
	else
		$display("failed verification of miso");

endfunction
endclass
