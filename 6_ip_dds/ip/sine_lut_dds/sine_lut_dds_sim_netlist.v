// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Sat Apr 18 02:10:45 2020
// Host        : DESKTOP-B3FLJGH running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top sine_lut_dds -prefix
//               sine_lut_dds_ dds_compiler_0_sim_netlist.v
// Design      : dds_compiler_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "dds_compiler_0,dds_compiler_v6_0_19,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "dds_compiler_v6_0_19,Vivado 2019.2" *) 
(* NotValidForBitStream *)
module sine_lut_dds
   (aclk,
    s_axis_phase_tvalid,
    s_axis_phase_tdata,
    m_axis_data_tvalid,
    m_axis_data_tdata);
  (* x_interface_info = "xilinx.com:signal:clock:1.0 aclk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME aclk_intf, ASSOCIATED_BUSIF M_AXIS_PHASE:S_AXIS_CONFIG:M_AXIS_DATA:S_AXIS_PHASE, ASSOCIATED_RESET aresetn, ASSOCIATED_CLKEN aclken, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input aclk;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_PHASE TVALID" *) (* x_interface_parameter = "XIL_INTERFACENAME S_AXIS_PHASE, TDATA_NUM_BYTES 1, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, LAYERED_METADATA undef, INSERT_VIP 0" *) input s_axis_phase_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 S_AXIS_PHASE TDATA" *) input [7:0]s_axis_phase_tdata;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_DATA TVALID" *) (* x_interface_parameter = "XIL_INTERFACENAME M_AXIS_DATA, TDATA_NUM_BYTES 2, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 0, HAS_TREADY 0, HAS_TSTRB 0, HAS_TKEEP 0, HAS_TLAST 0, FREQ_HZ 100000000, PHASE 0.000, LAYERED_METADATA undef, INSERT_VIP 0" *) output m_axis_data_tvalid;
  (* x_interface_info = "xilinx.com:interface:axis:1.0 M_AXIS_DATA TDATA" *) output [15:0]m_axis_data_tdata;

  wire aclk;
  wire [15:0]m_axis_data_tdata;
  wire m_axis_data_tvalid;
  wire [7:0]s_axis_phase_tdata;
  wire s_axis_phase_tvalid;
  wire NLW_U0_debug_axi_resync_in_UNCONNECTED;
  wire NLW_U0_debug_core_nd_UNCONNECTED;
  wire NLW_U0_debug_phase_nd_UNCONNECTED;
  wire NLW_U0_event_phase_in_invalid_UNCONNECTED;
  wire NLW_U0_event_pinc_invalid_UNCONNECTED;
  wire NLW_U0_event_poff_invalid_UNCONNECTED;
  wire NLW_U0_event_s_config_tlast_missing_UNCONNECTED;
  wire NLW_U0_event_s_config_tlast_unexpected_UNCONNECTED;
  wire NLW_U0_event_s_phase_chanid_incorrect_UNCONNECTED;
  wire NLW_U0_event_s_phase_tlast_missing_UNCONNECTED;
  wire NLW_U0_event_s_phase_tlast_unexpected_UNCONNECTED;
  wire NLW_U0_m_axis_data_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_phase_tlast_UNCONNECTED;
  wire NLW_U0_m_axis_phase_tvalid_UNCONNECTED;
  wire NLW_U0_s_axis_config_tready_UNCONNECTED;
  wire NLW_U0_s_axis_phase_tready_UNCONNECTED;
  wire [0:0]NLW_U0_debug_axi_chan_in_UNCONNECTED;
  wire [7:0]NLW_U0_debug_axi_pinc_in_UNCONNECTED;
  wire [7:0]NLW_U0_debug_axi_poff_in_UNCONNECTED;
  wire [7:0]NLW_U0_debug_phase_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_data_tuser_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_phase_tdata_UNCONNECTED;
  wire [0:0]NLW_U0_m_axis_phase_tuser_UNCONNECTED;

  (* C_ACCUMULATOR_WIDTH = "8" *) 
  (* C_AMPLITUDE = "0" *) 
  (* C_CHANNELS = "1" *) 
  (* C_CHAN_WIDTH = "1" *) 
  (* C_DEBUG_INTERFACE = "0" *) 
  (* C_HAS_ACLKEN = "0" *) 
  (* C_HAS_ARESETN = "0" *) 
  (* C_HAS_M_DATA = "1" *) 
  (* C_HAS_M_PHASE = "0" *) 
  (* C_HAS_PHASEGEN = "0" *) 
  (* C_HAS_PHASE_OUT = "0" *) 
  (* C_HAS_SINCOS = "1" *) 
  (* C_HAS_S_CONFIG = "0" *) 
  (* C_HAS_S_PHASE = "1" *) 
  (* C_HAS_TLAST = "0" *) 
  (* C_HAS_TREADY = "0" *) 
  (* C_LATENCY = "2" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MODE_OF_OPERATION = "0" *) 
  (* C_MODULUS = "9" *) 
  (* C_M_DATA_HAS_TUSER = "0" *) 
  (* C_M_DATA_TDATA_WIDTH = "16" *) 
  (* C_M_DATA_TUSER_WIDTH = "1" *) 
  (* C_M_PHASE_HAS_TUSER = "0" *) 
  (* C_M_PHASE_TDATA_WIDTH = "1" *) 
  (* C_M_PHASE_TUSER_WIDTH = "1" *) 
  (* C_NEGATIVE_COSINE = "0" *) 
  (* C_NEGATIVE_SINE = "0" *) 
  (* C_NOISE_SHAPING = "0" *) 
  (* C_OPTIMISE_GOAL = "0" *) 
  (* C_OUTPUTS_REQUIRED = "0" *) 
  (* C_OUTPUT_FORM = "0" *) 
  (* C_OUTPUT_WIDTH = "16" *) 
  (* C_PHASE_ANGLE_WIDTH = "8" *) 
  (* C_PHASE_INCREMENT = "2" *) 
  (* C_PHASE_INCREMENT_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
  (* C_PHASE_OFFSET = "0" *) 
  (* C_PHASE_OFFSET_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
  (* C_POR_MODE = "0" *) 
  (* C_RESYNC = "0" *) 
  (* C_S_CONFIG_SYNC_MODE = "0" *) 
  (* C_S_CONFIG_TDATA_WIDTH = "1" *) 
  (* C_S_PHASE_HAS_TUSER = "0" *) 
  (* C_S_PHASE_TDATA_WIDTH = "8" *) 
  (* C_S_PHASE_TUSER_WIDTH = "1" *) 
  (* C_USE_DSP48 = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  sine_lut_dds_dds_compiler_v6_0_19 U0
       (.aclk(aclk),
        .aclken(1'b1),
        .aresetn(1'b1),
        .debug_axi_chan_in(NLW_U0_debug_axi_chan_in_UNCONNECTED[0]),
        .debug_axi_pinc_in(NLW_U0_debug_axi_pinc_in_UNCONNECTED[7:0]),
        .debug_axi_poff_in(NLW_U0_debug_axi_poff_in_UNCONNECTED[7:0]),
        .debug_axi_resync_in(NLW_U0_debug_axi_resync_in_UNCONNECTED),
        .debug_core_nd(NLW_U0_debug_core_nd_UNCONNECTED),
        .debug_phase(NLW_U0_debug_phase_UNCONNECTED[7:0]),
        .debug_phase_nd(NLW_U0_debug_phase_nd_UNCONNECTED),
        .event_phase_in_invalid(NLW_U0_event_phase_in_invalid_UNCONNECTED),
        .event_pinc_invalid(NLW_U0_event_pinc_invalid_UNCONNECTED),
        .event_poff_invalid(NLW_U0_event_poff_invalid_UNCONNECTED),
        .event_s_config_tlast_missing(NLW_U0_event_s_config_tlast_missing_UNCONNECTED),
        .event_s_config_tlast_unexpected(NLW_U0_event_s_config_tlast_unexpected_UNCONNECTED),
        .event_s_phase_chanid_incorrect(NLW_U0_event_s_phase_chanid_incorrect_UNCONNECTED),
        .event_s_phase_tlast_missing(NLW_U0_event_s_phase_tlast_missing_UNCONNECTED),
        .event_s_phase_tlast_unexpected(NLW_U0_event_s_phase_tlast_unexpected_UNCONNECTED),
        .m_axis_data_tdata(m_axis_data_tdata),
        .m_axis_data_tlast(NLW_U0_m_axis_data_tlast_UNCONNECTED),
        .m_axis_data_tready(1'b0),
        .m_axis_data_tuser(NLW_U0_m_axis_data_tuser_UNCONNECTED[0]),
        .m_axis_data_tvalid(m_axis_data_tvalid),
        .m_axis_phase_tdata(NLW_U0_m_axis_phase_tdata_UNCONNECTED[0]),
        .m_axis_phase_tlast(NLW_U0_m_axis_phase_tlast_UNCONNECTED),
        .m_axis_phase_tready(1'b0),
        .m_axis_phase_tuser(NLW_U0_m_axis_phase_tuser_UNCONNECTED[0]),
        .m_axis_phase_tvalid(NLW_U0_m_axis_phase_tvalid_UNCONNECTED),
        .s_axis_config_tdata(1'b0),
        .s_axis_config_tlast(1'b0),
        .s_axis_config_tready(NLW_U0_s_axis_config_tready_UNCONNECTED),
        .s_axis_config_tvalid(1'b0),
        .s_axis_phase_tdata(s_axis_phase_tdata),
        .s_axis_phase_tlast(1'b0),
        .s_axis_phase_tready(NLW_U0_s_axis_phase_tready_UNCONNECTED),
        .s_axis_phase_tuser(1'b0),
        .s_axis_phase_tvalid(s_axis_phase_tvalid));
endmodule

(* C_ACCUMULATOR_WIDTH = "8" *) (* C_AMPLITUDE = "0" *) (* C_CHANNELS = "1" *) 
(* C_CHAN_WIDTH = "1" *) (* C_DEBUG_INTERFACE = "0" *) (* C_HAS_ACLKEN = "0" *) 
(* C_HAS_ARESETN = "0" *) (* C_HAS_M_DATA = "1" *) (* C_HAS_M_PHASE = "0" *) 
(* C_HAS_PHASEGEN = "0" *) (* C_HAS_PHASE_OUT = "0" *) (* C_HAS_SINCOS = "1" *) 
(* C_HAS_S_CONFIG = "0" *) (* C_HAS_S_PHASE = "1" *) (* C_HAS_TLAST = "0" *) 
(* C_HAS_TREADY = "0" *) (* C_LATENCY = "2" *) (* C_MEM_TYPE = "1" *) 
(* C_MODE_OF_OPERATION = "0" *) (* C_MODULUS = "9" *) (* C_M_DATA_HAS_TUSER = "0" *) 
(* C_M_DATA_TDATA_WIDTH = "16" *) (* C_M_DATA_TUSER_WIDTH = "1" *) (* C_M_PHASE_HAS_TUSER = "0" *) 
(* C_M_PHASE_TDATA_WIDTH = "1" *) (* C_M_PHASE_TUSER_WIDTH = "1" *) (* C_NEGATIVE_COSINE = "0" *) 
(* C_NEGATIVE_SINE = "0" *) (* C_NOISE_SHAPING = "0" *) (* C_OPTIMISE_GOAL = "0" *) 
(* C_OUTPUTS_REQUIRED = "0" *) (* C_OUTPUT_FORM = "0" *) (* C_OUTPUT_WIDTH = "16" *) 
(* C_PHASE_ANGLE_WIDTH = "8" *) (* C_PHASE_INCREMENT = "2" *) (* C_PHASE_INCREMENT_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
(* C_PHASE_OFFSET = "0" *) (* C_PHASE_OFFSET_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) (* C_POR_MODE = "0" *) 
(* C_RESYNC = "0" *) (* C_S_CONFIG_SYNC_MODE = "0" *) (* C_S_CONFIG_TDATA_WIDTH = "1" *) 
(* C_S_PHASE_HAS_TUSER = "0" *) (* C_S_PHASE_TDATA_WIDTH = "8" *) (* C_S_PHASE_TUSER_WIDTH = "1" *) 
(* C_USE_DSP48 = "0" *) (* C_XDEVICEFAMILY = "artix7" *) (* downgradeipidentifiedwarnings = "yes" *) 
module sine_lut_dds_dds_compiler_v6_0_19
   (aclk,
    aclken,
    aresetn,
    s_axis_phase_tvalid,
    s_axis_phase_tready,
    s_axis_phase_tdata,
    s_axis_phase_tlast,
    s_axis_phase_tuser,
    s_axis_config_tvalid,
    s_axis_config_tready,
    s_axis_config_tdata,
    s_axis_config_tlast,
    m_axis_data_tvalid,
    m_axis_data_tready,
    m_axis_data_tdata,
    m_axis_data_tlast,
    m_axis_data_tuser,
    m_axis_phase_tvalid,
    m_axis_phase_tready,
    m_axis_phase_tdata,
    m_axis_phase_tlast,
    m_axis_phase_tuser,
    event_pinc_invalid,
    event_poff_invalid,
    event_phase_in_invalid,
    event_s_phase_tlast_missing,
    event_s_phase_tlast_unexpected,
    event_s_phase_chanid_incorrect,
    event_s_config_tlast_missing,
    event_s_config_tlast_unexpected,
    debug_axi_pinc_in,
    debug_axi_poff_in,
    debug_axi_resync_in,
    debug_axi_chan_in,
    debug_core_nd,
    debug_phase,
    debug_phase_nd);
  input aclk;
  input aclken;
  input aresetn;
  input s_axis_phase_tvalid;
  output s_axis_phase_tready;
  input [7:0]s_axis_phase_tdata;
  input s_axis_phase_tlast;
  input [0:0]s_axis_phase_tuser;
  input s_axis_config_tvalid;
  output s_axis_config_tready;
  input [0:0]s_axis_config_tdata;
  input s_axis_config_tlast;
  output m_axis_data_tvalid;
  input m_axis_data_tready;
  output [15:0]m_axis_data_tdata;
  output m_axis_data_tlast;
  output [0:0]m_axis_data_tuser;
  output m_axis_phase_tvalid;
  input m_axis_phase_tready;
  output [0:0]m_axis_phase_tdata;
  output m_axis_phase_tlast;
  output [0:0]m_axis_phase_tuser;
  output event_pinc_invalid;
  output event_poff_invalid;
  output event_phase_in_invalid;
  output event_s_phase_tlast_missing;
  output event_s_phase_tlast_unexpected;
  output event_s_phase_chanid_incorrect;
  output event_s_config_tlast_missing;
  output event_s_config_tlast_unexpected;
  output [7:0]debug_axi_pinc_in;
  output [7:0]debug_axi_poff_in;
  output debug_axi_resync_in;
  output [0:0]debug_axi_chan_in;
  output debug_core_nd;
  output [7:0]debug_phase;
  output debug_phase_nd;

  wire \<const0> ;
  wire aclk;
  wire event_s_phase_tlast_missing;
  wire [15:0]m_axis_data_tdata;
  wire m_axis_data_tvalid;
  wire [7:0]s_axis_phase_tdata;
  wire s_axis_phase_tvalid;
  wire NLW_i_synth_debug_axi_resync_in_UNCONNECTED;
  wire NLW_i_synth_debug_core_nd_UNCONNECTED;
  wire NLW_i_synth_debug_phase_nd_UNCONNECTED;
  wire NLW_i_synth_event_phase_in_invalid_UNCONNECTED;
  wire NLW_i_synth_event_pinc_invalid_UNCONNECTED;
  wire NLW_i_synth_event_poff_invalid_UNCONNECTED;
  wire NLW_i_synth_event_s_config_tlast_missing_UNCONNECTED;
  wire NLW_i_synth_event_s_config_tlast_unexpected_UNCONNECTED;
  wire NLW_i_synth_event_s_phase_chanid_incorrect_UNCONNECTED;
  wire NLW_i_synth_event_s_phase_tlast_unexpected_UNCONNECTED;
  wire NLW_i_synth_m_axis_data_tlast_UNCONNECTED;
  wire NLW_i_synth_m_axis_phase_tlast_UNCONNECTED;
  wire NLW_i_synth_m_axis_phase_tvalid_UNCONNECTED;
  wire NLW_i_synth_s_axis_config_tready_UNCONNECTED;
  wire NLW_i_synth_s_axis_phase_tready_UNCONNECTED;
  wire [0:0]NLW_i_synth_debug_axi_chan_in_UNCONNECTED;
  wire [7:0]NLW_i_synth_debug_axi_pinc_in_UNCONNECTED;
  wire [7:0]NLW_i_synth_debug_axi_poff_in_UNCONNECTED;
  wire [7:0]NLW_i_synth_debug_phase_UNCONNECTED;
  wire [0:0]NLW_i_synth_m_axis_data_tuser_UNCONNECTED;
  wire [0:0]NLW_i_synth_m_axis_phase_tdata_UNCONNECTED;
  wire [0:0]NLW_i_synth_m_axis_phase_tuser_UNCONNECTED;

  assign debug_axi_chan_in[0] = \<const0> ;
  assign debug_axi_pinc_in[7] = \<const0> ;
  assign debug_axi_pinc_in[6] = \<const0> ;
  assign debug_axi_pinc_in[5] = \<const0> ;
  assign debug_axi_pinc_in[4] = \<const0> ;
  assign debug_axi_pinc_in[3] = \<const0> ;
  assign debug_axi_pinc_in[2] = \<const0> ;
  assign debug_axi_pinc_in[1] = \<const0> ;
  assign debug_axi_pinc_in[0] = \<const0> ;
  assign debug_axi_poff_in[7] = \<const0> ;
  assign debug_axi_poff_in[6] = \<const0> ;
  assign debug_axi_poff_in[5] = \<const0> ;
  assign debug_axi_poff_in[4] = \<const0> ;
  assign debug_axi_poff_in[3] = \<const0> ;
  assign debug_axi_poff_in[2] = \<const0> ;
  assign debug_axi_poff_in[1] = \<const0> ;
  assign debug_axi_poff_in[0] = \<const0> ;
  assign debug_axi_resync_in = \<const0> ;
  assign debug_core_nd = \<const0> ;
  assign debug_phase[7] = \<const0> ;
  assign debug_phase[6] = \<const0> ;
  assign debug_phase[5] = \<const0> ;
  assign debug_phase[4] = \<const0> ;
  assign debug_phase[3] = \<const0> ;
  assign debug_phase[2] = \<const0> ;
  assign debug_phase[1] = \<const0> ;
  assign debug_phase[0] = \<const0> ;
  assign debug_phase_nd = \<const0> ;
  assign event_phase_in_invalid = \<const0> ;
  assign event_pinc_invalid = \<const0> ;
  assign event_poff_invalid = \<const0> ;
  assign event_s_config_tlast_missing = \<const0> ;
  assign event_s_config_tlast_unexpected = \<const0> ;
  assign event_s_phase_chanid_incorrect = \<const0> ;
  assign event_s_phase_tlast_unexpected = \<const0> ;
  assign m_axis_data_tlast = \<const0> ;
  assign m_axis_data_tuser[0] = \<const0> ;
  assign m_axis_phase_tdata[0] = \<const0> ;
  assign m_axis_phase_tlast = \<const0> ;
  assign m_axis_phase_tuser[0] = \<const0> ;
  assign m_axis_phase_tvalid = \<const0> ;
  assign s_axis_config_tready = \<const0> ;
  assign s_axis_phase_tready = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_ACCUMULATOR_WIDTH = "8" *) 
  (* C_AMPLITUDE = "0" *) 
  (* C_CHANNELS = "1" *) 
  (* C_CHAN_WIDTH = "1" *) 
  (* C_DEBUG_INTERFACE = "0" *) 
  (* C_HAS_ACLKEN = "0" *) 
  (* C_HAS_ARESETN = "0" *) 
  (* C_HAS_M_DATA = "1" *) 
  (* C_HAS_M_PHASE = "0" *) 
  (* C_HAS_PHASEGEN = "0" *) 
  (* C_HAS_PHASE_OUT = "0" *) 
  (* C_HAS_SINCOS = "1" *) 
  (* C_HAS_S_CONFIG = "0" *) 
  (* C_HAS_S_PHASE = "1" *) 
  (* C_HAS_TLAST = "0" *) 
  (* C_HAS_TREADY = "0" *) 
  (* C_LATENCY = "2" *) 
  (* C_MEM_TYPE = "1" *) 
  (* C_MODE_OF_OPERATION = "0" *) 
  (* C_MODULUS = "9" *) 
  (* C_M_DATA_HAS_TUSER = "0" *) 
  (* C_M_DATA_TDATA_WIDTH = "16" *) 
  (* C_M_DATA_TUSER_WIDTH = "1" *) 
  (* C_M_PHASE_HAS_TUSER = "0" *) 
  (* C_M_PHASE_TDATA_WIDTH = "1" *) 
  (* C_M_PHASE_TUSER_WIDTH = "1" *) 
  (* C_NEGATIVE_COSINE = "0" *) 
  (* C_NEGATIVE_SINE = "0" *) 
  (* C_NOISE_SHAPING = "0" *) 
  (* C_OPTIMISE_GOAL = "0" *) 
  (* C_OUTPUTS_REQUIRED = "0" *) 
  (* C_OUTPUT_FORM = "0" *) 
  (* C_OUTPUT_WIDTH = "16" *) 
  (* C_PHASE_ANGLE_WIDTH = "8" *) 
  (* C_PHASE_INCREMENT = "2" *) 
  (* C_PHASE_INCREMENT_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
  (* C_PHASE_OFFSET = "0" *) 
  (* C_PHASE_OFFSET_VALUE = "0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0" *) 
  (* C_POR_MODE = "0" *) 
  (* C_RESYNC = "0" *) 
  (* C_S_CONFIG_SYNC_MODE = "0" *) 
  (* C_S_CONFIG_TDATA_WIDTH = "1" *) 
  (* C_S_PHASE_HAS_TUSER = "0" *) 
  (* C_S_PHASE_TDATA_WIDTH = "8" *) 
  (* C_S_PHASE_TUSER_WIDTH = "1" *) 
  (* C_USE_DSP48 = "0" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  sine_lut_dds_dds_compiler_v6_0_19_viv i_synth
       (.aclk(aclk),
        .aclken(1'b0),
        .aresetn(1'b0),
        .debug_axi_chan_in(NLW_i_synth_debug_axi_chan_in_UNCONNECTED[0]),
        .debug_axi_pinc_in(NLW_i_synth_debug_axi_pinc_in_UNCONNECTED[7:0]),
        .debug_axi_poff_in(NLW_i_synth_debug_axi_poff_in_UNCONNECTED[7:0]),
        .debug_axi_resync_in(NLW_i_synth_debug_axi_resync_in_UNCONNECTED),
        .debug_core_nd(NLW_i_synth_debug_core_nd_UNCONNECTED),
        .debug_phase(NLW_i_synth_debug_phase_UNCONNECTED[7:0]),
        .debug_phase_nd(NLW_i_synth_debug_phase_nd_UNCONNECTED),
        .event_phase_in_invalid(NLW_i_synth_event_phase_in_invalid_UNCONNECTED),
        .event_pinc_invalid(NLW_i_synth_event_pinc_invalid_UNCONNECTED),
        .event_poff_invalid(NLW_i_synth_event_poff_invalid_UNCONNECTED),
        .event_s_config_tlast_missing(NLW_i_synth_event_s_config_tlast_missing_UNCONNECTED),
        .event_s_config_tlast_unexpected(NLW_i_synth_event_s_config_tlast_unexpected_UNCONNECTED),
        .event_s_phase_chanid_incorrect(NLW_i_synth_event_s_phase_chanid_incorrect_UNCONNECTED),
        .event_s_phase_tlast_missing(event_s_phase_tlast_missing),
        .event_s_phase_tlast_unexpected(NLW_i_synth_event_s_phase_tlast_unexpected_UNCONNECTED),
        .m_axis_data_tdata(m_axis_data_tdata),
        .m_axis_data_tlast(NLW_i_synth_m_axis_data_tlast_UNCONNECTED),
        .m_axis_data_tready(1'b0),
        .m_axis_data_tuser(NLW_i_synth_m_axis_data_tuser_UNCONNECTED[0]),
        .m_axis_data_tvalid(m_axis_data_tvalid),
        .m_axis_phase_tdata(NLW_i_synth_m_axis_phase_tdata_UNCONNECTED[0]),
        .m_axis_phase_tlast(NLW_i_synth_m_axis_phase_tlast_UNCONNECTED),
        .m_axis_phase_tready(1'b0),
        .m_axis_phase_tuser(NLW_i_synth_m_axis_phase_tuser_UNCONNECTED[0]),
        .m_axis_phase_tvalid(NLW_i_synth_m_axis_phase_tvalid_UNCONNECTED),
        .s_axis_config_tdata(1'b0),
        .s_axis_config_tlast(1'b0),
        .s_axis_config_tready(NLW_i_synth_s_axis_config_tready_UNCONNECTED),
        .s_axis_config_tvalid(1'b0),
        .s_axis_phase_tdata(s_axis_phase_tdata),
        .s_axis_phase_tlast(1'b0),
        .s_axis_phase_tready(NLW_i_synth_s_axis_phase_tready_UNCONNECTED),
        .s_axis_phase_tuser(1'b0),
        .s_axis_phase_tvalid(s_axis_phase_tvalid));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2019.1"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
GChCViBDvBmAdEhOubfL25GMXfGxkXRdRqHGmAYIfuDlTr17bmWtS+GhikUinfgaTyxkmMH8CseP
gnd/2HW10g==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
MrlvIibpKEfGGLF89ZYa/MxSWreV1ceGqUI6m07gM/kuMQZAYp2a++EIZlP+UjNP51wFBhQ3c3zS
QdkFbBqG6uYLZzwSlk6gLqBqvuZE/svIDiGBQbqYiXvUtpsADkdJijHyEXCWIIfA2OybpwP9q9td
K8W1ihFrAkZes3XwNzA=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
S/HhZNGAOnVSjBaHp2/iJ+uhoS21MUt/ylKAWbdawBFCF9FkUaRlu5dlJRkeM7EFSLvmm6AdQ7tl
PFLc6nUqRxmcsib+JZVada3nOm2+ZzWt2pBGxOUWy1KlB3WROt2liUGfjrxKGEXvt9xlbj7bdIUb
2m+T4LI1aaXqhlGKjy/KpKUf1QOkJCRs0Ku5aotmezBo5GKTFGyZJ3MYO4GKMIfK9iu8sq6VaYMo
k1HNwS1FdJIkAS9xVgsyFkDCzQWeJzTkIZvZQmiwZL9HosMCrHwO2bB0MMldcTYqO/p/dWEFOMhj
t/a4spWmGP9HmOzdM3HjnWh6sHlnCzfHQSkgTA==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Casey7LdMe+nZ1xDjbqn5ljtI3LEVuHmV02n1dKqHlXDDy8DngD/F/sT3eZKKWGTYI9OYA8xmK96
NDm7hPSP0ZbcSw2tiWAvyCZWlna3Dzb0oLOsECWeQTM9trjqnrFG881fwCtgX9vmTRQDy7PCg4mn
qaXt4R91tVE0xabKcbKkG3xbZWQa6qcQ1h11pI3DqCvtBoftQdeMm5iU3cfBpqJqka9rRftnPdqV
2HoyzByDV6pDJ1J8/KIiRxyv5NnLSS2sGS/CBn4pn75rlQww9RJEI6qSkYVBdTDgR6hlIRpCam7s
v6LGO0DaEGEJx4a29MQt1LmwETzoV0LC+Kto1g==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2019_02", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Szmb9fARj7tLQ/kYcmela18wgMQOHuePfCjZoqT9rm2JaDsVv6W01aCED76msRM59qYJACEIkk+J
bcP8tgMPR2C/v734MT1slRro6En1Rh7JRymnQdCTkPfY0Gd+bBpKeCUjSHsEnypR3ANNLS7D3Wty
cqDCpd89/zwR4nU3fXm0CrN8SiZCmRUVpBfj7XWaBj7Yk+zSc5O3QSer4ary7oM/p77ZLrcUqPp4
rT+zRAzIxYRIx2Fwr4iC+RlgSveUS6anXWdYJCMvpvkqie/R1LODvRdI2STZ7+asbTdD3e3bEmUa
m0pCwPbzt7/lifwYfvlhF10n0yGIMhRwRY5peg==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
pL5q36kJfJC6ewp2x/1i7eeZBloaj/U5eYbGB9YTbBMi0l/bcSRiH+sqvmrNgzRd6nhqY8TvdSQx
+I7q+SxwYfHb7B6C5dIE2rOVpaRsOwRr9vEoe80+N3I+sArQRhW9gncruvIXEARrDzBmi6t0LD4T
S/NQ8qA26Znqzg7N6nE=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
XTdbHsxPlZvkQD0a/DK11HearLdHYvEKXjUg6uCX53UHblSKrvghRsCpGpo2P57LEqbC/O1sQefR
r+zkBI6qS66DFQTDwXUo5OXor8HluwZ2IM5iK90Im25PwSNoCgukNXIjcl+Du88CoEwH6KbHIt+V
ovklGLLjypbhfR0fjBexk6I+uBdRnUwsz1qjiXHfSPs+kiQpxLXUlNH6u9M1V1c+JvBpmMjLDs97
BLeZ0IQn8XeC0vmC/ga5xruNFULQ0L1x/bz7ogrEiNURm8YRyckk3MPZ5Ue2qe9rS6aFR5+BfbZs
aG8dmpJNqTItn6C4p5bVoGz/1SprAiE1UdTIIQ==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
euuuXgiCv1wOPpltLLnsWcSA5ILR7Z9Z2nZqW2W1SZ0RHMADeZd3r0Fm8aepgwBRrF47ZDKxcwIE
h/ogQEP/9UPuixzatre2Jg1RR3/B+0uPX/mOhoGz/iCwZBV3iHP+HLTWk6V09RT9mIl/txLdSARG
A5pL3qU+bwua/mqlHBBoh7SUZNlhRhXQjlQPAm9Ho6BR3uS0w6hvEFblGSN7YBoptM6X0/yX2m9y
bAvAkdyn+k1BbHMI9k6txj+oPWeymozWZ0b/R4Oe7mFFihDE4Z507yP9ZQFqWM5KfrPfrs0zHbbv
4mZRLDyxiI2J5Da7s1aCvIx8UzQ/XBIUH1eiVQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
iOQB5aGBsdpAkZKoRIzHsh2QvCNtVGEPOVeCT6VE0jb+kkSzZRWVMNbqirWI7PK9yBTZeQLH6bIi
i5KajG1MlQgJuWGyssWdJ0k3OnzgSvXcRW/j4CEo1rPFNS/Ls7+f25X2m5S6XAk4X5n5kPwJ14oo
gapTvy6hrbEFuX35QjW11bqj9fkqQL80wx+BFZXL5ONlCWKcwNBIQEpZISCtGuxYsvcV0n+nC2fT
O2BL9BcNWgHY3/JZZsUPcIm5TusHcOZTShJVOMS/Ey0+bkLqdVXzRE+JGHgcye/57bZDfnaYxoUT
kVCuHxRIrt2X3BCjXyPUIimlnRu1wt0BF5Zxfw==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rJonG/y9p2yPXInaMKX4q/ltc6NVaDuF8hzuAZGnfIOgvWXaV11cNzRh05/DD9QfdWdtOhhETQWO
f/xrq5zG7psXqH+cDeXXHP96heEZdjjaBP8uzOWWJo/rNcl5Iibjmk8MyhmE8VrXUrA0WzlGveMh
Tr/C6aV733pdaJDBSSTbV7WNx/ZjE9+lEYroCnv9YVSbHK+AbM3zy/oGz42ImhLcB4HxLqiycs55
qPq2PYNJkHGuReXuA4kcH3RbFL/OMbWZTRiVLdKd8fdDgj467I/Sx4Z7seaxE3vRyD5kakpiPwFd
8ev42PIa7kTzeVDc34EKcRxieWVh3xyeOp2XPw==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 24080)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
