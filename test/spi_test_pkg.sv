package spi_test_pkg;

import uvm_pkg::*;

`include "uvm_macros.svh"
`include "master_xtn.sv"
`include "slave_agent_cfg.sv"
`include "master_agent_cfg.sv"
`include "env_cfg.sv"

`include "master_drv.sv"
`include "master_mon.sv"
`include "master_seqr.sv"
`include "master_agent.sv"
`include "master_agent_top.sv"
`include "master_seq.sv"

`include "slave_xtn.sv"
`include "slave_drv.sv"
`include "slave_mon.sv"
`include "slave_seqr.sv"
`include "slave_agent.sv"
`include "slave_agent_top.sv"
`include "slave_seq.sv"

`include "spi_scoreboard.sv"
`include "v_seqr.sv"
`include "v_seq.sv"
`include "env.sv"
`include "test.sv"
endpackage
