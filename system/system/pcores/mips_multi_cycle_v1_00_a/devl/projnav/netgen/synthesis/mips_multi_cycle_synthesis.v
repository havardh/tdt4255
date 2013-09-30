////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2010 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: M.81d
//  \   \         Application: netgen
//  /   /         Filename: mips_multi_cycle_synthesis.v
// /___/   /\     Timestamp: Mon Sep 30 10:07:04 2013
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -insert_glbl true -w -dir netgen/synthesis -ofmt verilog -sim mips_multi_cycle.ngc mips_multi_cycle_synthesis.v 
// Device	: xc6slx16-2-csg324
// Input file	: mips_multi_cycle.ngc
// Output file	: C:\Users\runarbol\Desktop\tdt4255-new\system\system\pcores\mips_multi_cycle_v1_00_a\devl\projnav\netgen\synthesis\mips_multi_cycle_synthesis.v
// # of Modules	: 1
// Design Name	: mips_multi_cycle
// Xilinx        : C:\Xilinx\12.4\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module mips_multi_cycle (
  SPLB_Clk, SPLB_Rst, PLB_PAValid, PLB_SAValid, PLB_rdPrim, PLB_wrPrim, PLB_abort, PLB_busLock, PLB_RNW, PLB_lockErr, PLB_wrBurst, PLB_rdBurst, 
PLB_wrPendReq, PLB_rdPendReq, Sl_addrAck, Sl_wait, Sl_rearbitrate, Sl_wrDAck, Sl_wrComp, Sl_wrBTerm, Sl_rdDAck, Sl_rdComp, Sl_rdBTerm, PLB_ABus, 
PLB_UABus, PLB_masterID, PLB_BE, PLB_MSize, PLB_size, PLB_type, PLB_wrDBus, PLB_wrPendPri, PLB_rdPendPri, PLB_reqPri, PLB_TAttribute, Sl_SSize, 
Sl_rdDBus, Sl_rdWdAddr, Sl_MBusy, Sl_MWrErr, Sl_MRdErr, Sl_MIRQ
);
  input SPLB_Clk;
  input SPLB_Rst;
  input PLB_PAValid;
  input PLB_SAValid;
  input PLB_rdPrim;
  input PLB_wrPrim;
  input PLB_abort;
  input PLB_busLock;
  input PLB_RNW;
  input PLB_lockErr;
  input PLB_wrBurst;
  input PLB_rdBurst;
  input PLB_wrPendReq;
  input PLB_rdPendReq;
  output Sl_addrAck;
  output Sl_wait;
  output Sl_rearbitrate;
  output Sl_wrDAck;
  output Sl_wrComp;
  output Sl_wrBTerm;
  output Sl_rdDAck;
  output Sl_rdComp;
  output Sl_rdBTerm;
  input [0 : 31] PLB_ABus;
  input [0 : 31] PLB_UABus;
  input [0 : 2] PLB_masterID;
  input [0 : 15] PLB_BE;
  input [0 : 1] PLB_MSize;
  input [0 : 3] PLB_size;
  input [0 : 2] PLB_type;
  input [0 : 127] PLB_wrDBus;
  input [0 : 1] PLB_wrPendPri;
  input [0 : 1] PLB_rdPendPri;
  input [0 : 1] PLB_reqPri;
  input [0 : 15] PLB_TAttribute;
  output [0 : 1] Sl_SSize;
  output [0 : 127] Sl_rdDBus;
  output [0 : 3] Sl_rdWdAddr;
  output [0 : 7] Sl_MBusy;
  output [0 : 7] Sl_MWrErr;
  output [0 : 7] Sl_MRdErr;
  output [0 : 7] Sl_MIRQ;
  wire PLB_ABus_0_IBUF_0;
  wire PLB_ABus_1_IBUF_1;
  wire PLB_ABus_2_IBUF_2;
  wire PLB_ABus_3_IBUF_3;
  wire PLB_ABus_4_IBUF_4;
  wire PLB_ABus_5_IBUF_5;
  wire PLB_ABus_6_IBUF_6;
  wire PLB_ABus_7_IBUF_7;
  wire PLB_ABus_8_IBUF_8;
  wire PLB_ABus_9_IBUF_9;
  wire PLB_ABus_10_IBUF_10;
  wire PLB_ABus_11_IBUF_11;
  wire PLB_ABus_12_IBUF_12;
  wire PLB_ABus_13_IBUF_13;
  wire PLB_ABus_14_IBUF_14;
  wire PLB_ABus_15_IBUF_15;
  wire PLB_ABus_16_IBUF_16;
  wire PLB_ABus_17_IBUF_17;
  wire PLB_ABus_18_IBUF_18;
  wire PLB_ABus_19_IBUF_19;
  wire PLB_ABus_20_IBUF_20;
  wire PLB_ABus_21_IBUF_21;
  wire PLB_ABus_22_IBUF_22;
  wire PLB_ABus_23_IBUF_23;
  wire PLB_ABus_24_IBUF_24;
  wire PLB_ABus_25_IBUF_25;
  wire PLB_ABus_26_IBUF_26;
  wire PLB_ABus_27_IBUF_27;
  wire PLB_ABus_28_IBUF_28;
  wire PLB_ABus_29_IBUF_29;
  wire PLB_ABus_30_IBUF_30;
  wire PLB_ABus_31_IBUF_31;
  wire PLB_masterID_0_IBUF_32;
  wire PLB_masterID_1_IBUF_33;
  wire PLB_masterID_2_IBUF_34;
  wire PLB_BE_0_IBUF_35;
  wire PLB_BE_1_IBUF_36;
  wire PLB_BE_2_IBUF_37;
  wire PLB_BE_3_IBUF_38;
  wire PLB_BE_4_IBUF_39;
  wire PLB_BE_5_IBUF_40;
  wire PLB_BE_6_IBUF_41;
  wire PLB_BE_7_IBUF_42;
  wire PLB_BE_8_IBUF_43;
  wire PLB_BE_9_IBUF_44;
  wire PLB_BE_10_IBUF_45;
  wire PLB_BE_11_IBUF_46;
  wire PLB_BE_12_IBUF_47;
  wire PLB_BE_13_IBUF_48;
  wire PLB_BE_14_IBUF_49;
  wire PLB_BE_15_IBUF_50;
  wire PLB_size_0_IBUF_51;
  wire PLB_size_1_IBUF_52;
  wire PLB_size_2_IBUF_53;
  wire PLB_size_3_IBUF_54;
  wire PLB_type_0_IBUF_55;
  wire PLB_type_1_IBUF_56;
  wire PLB_type_2_IBUF_57;
  wire PLB_wrDBus_0_IBUF_58;
  wire PLB_wrDBus_1_IBUF_59;
  wire PLB_wrDBus_2_IBUF_60;
  wire PLB_wrDBus_3_IBUF_61;
  wire PLB_wrDBus_4_IBUF_62;
  wire PLB_wrDBus_5_IBUF_63;
  wire PLB_wrDBus_6_IBUF_64;
  wire PLB_wrDBus_7_IBUF_65;
  wire PLB_wrDBus_8_IBUF_66;
  wire PLB_wrDBus_9_IBUF_67;
  wire PLB_wrDBus_10_IBUF_68;
  wire PLB_wrDBus_11_IBUF_69;
  wire PLB_wrDBus_12_IBUF_70;
  wire PLB_wrDBus_13_IBUF_71;
  wire PLB_wrDBus_14_IBUF_72;
  wire PLB_wrDBus_15_IBUF_73;
  wire PLB_wrDBus_16_IBUF_74;
  wire PLB_wrDBus_17_IBUF_75;
  wire PLB_wrDBus_18_IBUF_76;
  wire PLB_wrDBus_19_IBUF_77;
  wire PLB_wrDBus_20_IBUF_78;
  wire PLB_wrDBus_21_IBUF_79;
  wire PLB_wrDBus_22_IBUF_80;
  wire PLB_wrDBus_23_IBUF_81;
  wire PLB_wrDBus_24_IBUF_82;
  wire PLB_wrDBus_25_IBUF_83;
  wire PLB_wrDBus_26_IBUF_84;
  wire PLB_wrDBus_27_IBUF_85;
  wire PLB_wrDBus_28_IBUF_86;
  wire PLB_wrDBus_29_IBUF_87;
  wire PLB_wrDBus_30_IBUF_88;
  wire PLB_wrDBus_31_IBUF_89;
  wire SPLB_Clk_BUFGP_90;
  wire SPLB_Rst_IBUF_91;
  wire PLB_PAValid_IBUF_92;
  wire PLB_RNW_IBUF_93;
  wire Sl_rdDBus_0_OBUF_94;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i[0] ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i[1] ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i[2] ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i[3] ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i[4] ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i[8] ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_addrack_i_166 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_rearbitrate_i_167 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_wrdack_i_168 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/rd_clear_sl_busy_169 ;
  wire rst_Bus2IP_Reset;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GEN_FOR_SHARED.addr_cntl_cs_0 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/do_the_cmd_GND_13_o_MUX_108_o ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i[0]_PWR_13_o_MUX_135_o ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/decode_s_h_cs ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/data_ack ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GEN_FOR_SHARED.rearbitrate_condition ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i[0]_GND_13_o_mux_44_OUT<1> ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i[0]_GND_13_o_mux_44_OUT<2> ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i[0]_GND_13_o_mux_44_OUT<3> ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i[0]_GND_13_o_mux_44_OUT<4> ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i[0]_GND_13_o_mux_44_OUT<5> ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i[0]_GND_13_o_mux_44_OUT<6> ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i[0]_GND_13_o_mux_44_OUT<7> ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_166_o ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_164_o ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_162_o ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_160_o ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_158_o ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_156_o ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_154_o ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_152_o ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_150_o ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_148_o ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_146_o ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_144_o ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_142_o ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_140_o ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_138_o ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_136_o ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_rdack_i_204 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_rnw_i_206 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_busy_207 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_pavalid_reg_208 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GEN_FOR_SHARED.addr_cntl_cs_209 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GEN_FOR_SHARED.addr_cntl_ns_GND_13_o_MUX_113_o ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[0] ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[1] ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[2] ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[31] ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/data_timeout_216 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_rnw_reg_217 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Bus_Reset_clear_sl_busy_OR_56_o ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/decode_hit_reg_265 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/address_match_early ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rnw_s_h_267 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out[8]_GND_26_o_mux_5_OUT<4>_bdd0 ;
  wire \SOFT_RESET_I/wrack_ff_chain ;
  wire \SOFT_RESET_I/PWR_35_o_Bus2IP_BE[3]_AND_38_o ;
  wire \SOFT_RESET_I/sw_rst_cond ;
  wire \SOFT_RESET_I/sw_rst_cond_d1_283 ;
  wire \SOFT_RESET_I/wrack ;
  wire \USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_5_o ;
  wire \USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_4_o ;
  wire \USER_LOGIC_I/PWR_41_o_slv_reg_write_sel[0]_equal_3_o ;
  wire \USER_LOGIC_I/slv_reg2[31]_Bus2IP_Data[31]_MUX_284_o ;
  wire \USER_LOGIC_I/slv_reg1[31]_Bus2IP_Data[31]_MUX_252_o ;
  wire \USER_LOGIC_I/slv_reg0[31]_Bus2IP_Data[31]_MUX_220_o ;
  wire \USER_LOGIC_I/slv_reg2[30]_Bus2IP_Data[30]_MUX_283_o ;
  wire \USER_LOGIC_I/slv_reg1[30]_Bus2IP_Data[30]_MUX_251_o ;
  wire \USER_LOGIC_I/slv_reg0[30]_Bus2IP_Data[30]_MUX_219_o ;
  wire \USER_LOGIC_I/slv_reg2[29]_Bus2IP_Data[29]_MUX_282_o ;
  wire \USER_LOGIC_I/slv_reg1[29]_Bus2IP_Data[29]_MUX_250_o ;
  wire \USER_LOGIC_I/slv_reg0[29]_Bus2IP_Data[29]_MUX_218_o ;
  wire \USER_LOGIC_I/slv_reg2[28]_Bus2IP_Data[28]_MUX_281_o ;
  wire \USER_LOGIC_I/slv_reg1[28]_Bus2IP_Data[28]_MUX_249_o ;
  wire \USER_LOGIC_I/slv_reg0[28]_Bus2IP_Data[28]_MUX_217_o ;
  wire \USER_LOGIC_I/slv_reg2[27]_Bus2IP_Data[27]_MUX_280_o ;
  wire \USER_LOGIC_I/slv_reg1[27]_Bus2IP_Data[27]_MUX_248_o ;
  wire \USER_LOGIC_I/slv_reg0[27]_Bus2IP_Data[27]_MUX_216_o ;
  wire \USER_LOGIC_I/slv_reg2[26]_Bus2IP_Data[26]_MUX_279_o ;
  wire \USER_LOGIC_I/slv_reg1[26]_Bus2IP_Data[26]_MUX_247_o ;
  wire \USER_LOGIC_I/slv_reg0[26]_Bus2IP_Data[26]_MUX_215_o ;
  wire \USER_LOGIC_I/slv_reg2[25]_Bus2IP_Data[25]_MUX_278_o ;
  wire \USER_LOGIC_I/slv_reg1[25]_Bus2IP_Data[25]_MUX_246_o ;
  wire \USER_LOGIC_I/slv_reg0[25]_Bus2IP_Data[25]_MUX_214_o ;
  wire \USER_LOGIC_I/slv_reg2[24]_Bus2IP_Data[24]_MUX_277_o ;
  wire \USER_LOGIC_I/slv_reg1[24]_Bus2IP_Data[24]_MUX_245_o ;
  wire \USER_LOGIC_I/slv_reg0[24]_Bus2IP_Data[24]_MUX_213_o ;
  wire \USER_LOGIC_I/slv_reg2[23]_Bus2IP_Data[23]_MUX_276_o ;
  wire \USER_LOGIC_I/slv_reg1[23]_Bus2IP_Data[23]_MUX_244_o ;
  wire \USER_LOGIC_I/slv_reg0[23]_Bus2IP_Data[23]_MUX_212_o ;
  wire \USER_LOGIC_I/slv_reg2[22]_Bus2IP_Data[22]_MUX_275_o ;
  wire \USER_LOGIC_I/slv_reg1[22]_Bus2IP_Data[22]_MUX_243_o ;
  wire \USER_LOGIC_I/slv_reg0[22]_Bus2IP_Data[22]_MUX_211_o ;
  wire \USER_LOGIC_I/slv_reg2[21]_Bus2IP_Data[21]_MUX_274_o ;
  wire \USER_LOGIC_I/slv_reg1[21]_Bus2IP_Data[21]_MUX_242_o ;
  wire \USER_LOGIC_I/slv_reg0[21]_Bus2IP_Data[21]_MUX_210_o ;
  wire \USER_LOGIC_I/slv_reg2[20]_Bus2IP_Data[20]_MUX_273_o ;
  wire \USER_LOGIC_I/slv_reg1[20]_Bus2IP_Data[20]_MUX_241_o ;
  wire \USER_LOGIC_I/slv_reg0[20]_Bus2IP_Data[20]_MUX_209_o ;
  wire \USER_LOGIC_I/slv_reg2[19]_Bus2IP_Data[19]_MUX_272_o ;
  wire \USER_LOGIC_I/slv_reg1[19]_Bus2IP_Data[19]_MUX_240_o ;
  wire \USER_LOGIC_I/slv_reg0[19]_Bus2IP_Data[19]_MUX_208_o ;
  wire \USER_LOGIC_I/slv_reg2[18]_Bus2IP_Data[18]_MUX_271_o ;
  wire \USER_LOGIC_I/slv_reg1[18]_Bus2IP_Data[18]_MUX_239_o ;
  wire \USER_LOGIC_I/slv_reg0[18]_Bus2IP_Data[18]_MUX_207_o ;
  wire \USER_LOGIC_I/slv_reg2[17]_Bus2IP_Data[17]_MUX_270_o ;
  wire \USER_LOGIC_I/slv_reg1[17]_Bus2IP_Data[17]_MUX_238_o ;
  wire \USER_LOGIC_I/slv_reg0[17]_Bus2IP_Data[17]_MUX_206_o ;
  wire \USER_LOGIC_I/slv_reg2[16]_Bus2IP_Data[16]_MUX_269_o ;
  wire \USER_LOGIC_I/slv_reg1[16]_Bus2IP_Data[16]_MUX_237_o ;
  wire \USER_LOGIC_I/slv_reg0[16]_Bus2IP_Data[16]_MUX_205_o ;
  wire \USER_LOGIC_I/slv_reg2[15]_Bus2IP_Data[15]_MUX_268_o ;
  wire \USER_LOGIC_I/slv_reg1[15]_Bus2IP_Data[15]_MUX_236_o ;
  wire \USER_LOGIC_I/slv_reg0[15]_Bus2IP_Data[15]_MUX_204_o ;
  wire \USER_LOGIC_I/slv_reg2[14]_Bus2IP_Data[14]_MUX_267_o ;
  wire \USER_LOGIC_I/slv_reg1[14]_Bus2IP_Data[14]_MUX_235_o ;
  wire \USER_LOGIC_I/slv_reg0[14]_Bus2IP_Data[14]_MUX_203_o ;
  wire \USER_LOGIC_I/slv_reg2[13]_Bus2IP_Data[13]_MUX_266_o ;
  wire \USER_LOGIC_I/slv_reg1[13]_Bus2IP_Data[13]_MUX_234_o ;
  wire \USER_LOGIC_I/slv_reg0[13]_Bus2IP_Data[13]_MUX_202_o ;
  wire \USER_LOGIC_I/slv_reg2[12]_Bus2IP_Data[12]_MUX_265_o ;
  wire \USER_LOGIC_I/slv_reg1[12]_Bus2IP_Data[12]_MUX_233_o ;
  wire \USER_LOGIC_I/slv_reg0[12]_Bus2IP_Data[12]_MUX_201_o ;
  wire \USER_LOGIC_I/slv_reg2[11]_Bus2IP_Data[11]_MUX_264_o ;
  wire \USER_LOGIC_I/slv_reg1[11]_Bus2IP_Data[11]_MUX_232_o ;
  wire \USER_LOGIC_I/slv_reg0[11]_Bus2IP_Data[11]_MUX_200_o ;
  wire \USER_LOGIC_I/slv_reg2[10]_Bus2IP_Data[10]_MUX_263_o ;
  wire \USER_LOGIC_I/slv_reg1[10]_Bus2IP_Data[10]_MUX_231_o ;
  wire \USER_LOGIC_I/slv_reg0[10]_Bus2IP_Data[10]_MUX_199_o ;
  wire \USER_LOGIC_I/slv_reg2[9]_Bus2IP_Data[9]_MUX_262_o ;
  wire \USER_LOGIC_I/slv_reg1[9]_Bus2IP_Data[9]_MUX_230_o ;
  wire \USER_LOGIC_I/slv_reg0[9]_Bus2IP_Data[9]_MUX_198_o ;
  wire \USER_LOGIC_I/slv_reg2[8]_Bus2IP_Data[8]_MUX_261_o ;
  wire \USER_LOGIC_I/slv_reg1[8]_Bus2IP_Data[8]_MUX_229_o ;
  wire \USER_LOGIC_I/slv_reg0[8]_Bus2IP_Data[8]_MUX_197_o ;
  wire \USER_LOGIC_I/slv_reg2[7]_Bus2IP_Data[7]_MUX_260_o ;
  wire \USER_LOGIC_I/slv_reg1[7]_Bus2IP_Data[7]_MUX_228_o ;
  wire \USER_LOGIC_I/slv_reg0[7]_Bus2IP_Data[7]_MUX_196_o ;
  wire \USER_LOGIC_I/slv_reg2[6]_Bus2IP_Data[6]_MUX_259_o ;
  wire \USER_LOGIC_I/slv_reg1[6]_Bus2IP_Data[6]_MUX_227_o ;
  wire \USER_LOGIC_I/slv_reg0[6]_Bus2IP_Data[6]_MUX_195_o ;
  wire \USER_LOGIC_I/slv_reg2[5]_Bus2IP_Data[5]_MUX_258_o ;
  wire \USER_LOGIC_I/slv_reg1[5]_Bus2IP_Data[5]_MUX_226_o ;
  wire \USER_LOGIC_I/slv_reg0[5]_Bus2IP_Data[5]_MUX_194_o ;
  wire \USER_LOGIC_I/slv_reg2[4]_Bus2IP_Data[4]_MUX_257_o ;
  wire \USER_LOGIC_I/slv_reg1[4]_Bus2IP_Data[4]_MUX_225_o ;
  wire \USER_LOGIC_I/slv_reg0[4]_Bus2IP_Data[4]_MUX_193_o ;
  wire \USER_LOGIC_I/slv_reg2[3]_Bus2IP_Data[3]_MUX_256_o ;
  wire \USER_LOGIC_I/slv_reg1[3]_Bus2IP_Data[3]_MUX_224_o ;
  wire \USER_LOGIC_I/slv_reg0[3]_Bus2IP_Data[3]_MUX_192_o ;
  wire \USER_LOGIC_I/slv_reg2[2]_Bus2IP_Data[2]_MUX_255_o ;
  wire \USER_LOGIC_I/slv_reg1[2]_Bus2IP_Data[2]_MUX_223_o ;
  wire \USER_LOGIC_I/slv_reg0[2]_Bus2IP_Data[2]_MUX_191_o ;
  wire \USER_LOGIC_I/slv_reg2[1]_Bus2IP_Data[1]_MUX_254_o ;
  wire \USER_LOGIC_I/slv_reg1[1]_Bus2IP_Data[1]_MUX_222_o ;
  wire \USER_LOGIC_I/slv_reg0[1]_Bus2IP_Data[1]_MUX_190_o ;
  wire \USER_LOGIC_I/slv_reg2[0]_Bus2IP_Data[0]_MUX_253_o ;
  wire \USER_LOGIC_I/slv_reg1[0]_Bus2IP_Data[0]_MUX_221_o ;
  wire \USER_LOGIC_I/slv_reg0[0]_Bus2IP_Data[0]_MUX_189_o ;
  wire N16;
  wire N18;
  wire N20;
  wire N22;
  wire N32;
  wire N34;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i1 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i2_491 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/MEM_DECODE_GEN[0].GEN_PLB_SHARED.MEM_SELECT_I/Mmux_CS1 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/MEM_DECODE_GEN[0].GEN_PLB_SHARED.MEM_SELECT_I/Mmux_CS11_493 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/MEM_DECODE_GEN[0].GEN_PLB_SHARED.MEM_SELECT_I/Mmux_CS12_494 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/MEM_DECODE_GEN[0].GEN_PLB_SHARED.MEM_SELECT_I/Mmux_CS13_495 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/MEM_DECODE_GEN[0].GEN_PLB_SHARED.MEM_SELECT_I/Mmux_CS15 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_busy_glue_set_766 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id_31_glue_rst_767 ;
  wire \SOFT_RESET_I/RESET_FLOPS[3].RST_FLOPS_glue_set_768 ;
  wire \SOFT_RESET_I/RESET_FLOPS[2].RST_FLOPS_glue_set_769 ;
  wire \SOFT_RESET_I/RESET_FLOPS[1].RST_FLOPS_glue_set_770 ;
  wire \SOFT_RESET_I/reset_trig_771 ;
  wire \SOFT_RESET_I/reset_trig_rstpot_772 ;
  wire \SOFT_RESET_I/sw_rst_cond_d1_rstpot_773 ;
  wire N36;
  wire N38;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i_0_rstpot_776 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i_1_rstpot_777 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i_2_rstpot_778 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i_3_rstpot_779 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i_4_rstpot_780 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i_8_rstpot_781 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i_0_rstpot_782 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i_1_rstpot_783 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i_2_rstpot_784 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i_3_rstpot_785 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i_4_rstpot_786 ;
  wire N40;
  wire N42;
  wire N44;
  wire N46;
  wire N47;
  wire N50;
  wire N53;
  wire N56;
  wire N59;
  wire N61;
  wire N62;
  wire N65;
  wire N68;
  wire N71;
  wire N74;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_6_rstpot_802 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_5_rstpot_803 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_4_rstpot_804 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_3_rstpot_805 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_2_rstpot_806 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_1_rstpot_807 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_0_rstpot_808 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i_0_rstpot_809 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i_1_rstpot_810 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i_2_rstpot_811 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i_3_rstpot_812 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_rnw_i_rstpot_813 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_8_rstpot_814 ;
  wire \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_7_rstpot_815 ;
  wire N76;
  wire N78;
  wire N80;
  wire N82;
  wire N84;
  wire N86;
  wire N87;
  wire N89;
  wire N90;
  wire N92;
  wire N93;
  wire N95;
  wire N96;
  wire N98;
  wire N99;
  wire N101;
  wire N102;
  wire N104;
  wire N105;
  wire N107;
  wire N108;
  wire N110;
  wire N111;
  wire N113;
  wire N114;
  wire N116;
  wire N118;
  wire N120;
  wire N122;
  wire N124;
  wire N126;
  wire N127;
  wire N129;
  wire N130;
  wire N131;
  wire N132;
  wire N133;
  wire N134;
  wire N135;
  wire N136;
  wire N137;
  wire N138;
  wire N139;
  wire N140;
  wire N141;
  wire N142;
  wire N143;
  wire N144;
  wire \SOFT_RESET_I/reset_error1_864 ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_status<0>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_status<1>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_status<2>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_status<3>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_status<4>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_status<5>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_status<6>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_status<7>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_status<8>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_status<9>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_status<10>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_status<11>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_status<12>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_status<13>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_status<14>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_status<15>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_status<16>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_status<17>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_status<18>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_status<19>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_status<20>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_status<21>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_status<22>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_status<23>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_status<24>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_status<25>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_status<26>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_status<27>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_status<28>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_status<29>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_status<30>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_status<31>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<0>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<1>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<2>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<3>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<4>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<5>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<6>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<7>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<8>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<9>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<10>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<11>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<12>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<13>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<14>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<15>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<16>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<17>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<18>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<19>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<20>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<21>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<22>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<23>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<24>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<25>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<26>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<27>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<28>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<29>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<30>_UNCONNECTED ;
  wire \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<31>_UNCONNECTED ;
  wire [7 : 0] \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i ;
  wire [7 : 0] \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mwrerr_i ;
  wire [7 : 0] \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mrderr_i ;
  wire [31 : 0] \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg ;
  wire [3 : 0] \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i ;
  wire [4 : 0] \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i ;
  wire [3 : 0] \PLBV46_SLAVE_SINGLE_I/plb_be_muxed ;
  wire [8 : 0] \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out ;
  wire [2 : 0] \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_type_reg ;
  wire [3 : 0] \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_size_reg ;
  wire [3 : 0] \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_be_reg ;
  wire [2 : 0] \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_masterid_reg ;
  wire [31 : 0] \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg ;
  wire [2 : 0] \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/addr_out_s_h ;
  wire [4 : 1] \SOFT_RESET_I/flop_q_chain ;
  wire [31 : 0] \USER_LOGIC_I/slv_reg0 ;
  wire [31 : 0] \USER_LOGIC_I/slv_reg2 ;
  wire [31 : 0] \USER_LOGIC_I/slv_reg1 ;
  GND   XST_GND (
    .G(Sl_rdDBus_0_OBUF_94)
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i_0  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i[0]_GND_13_o_mux_44_OUT<7> ),
    .R(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Bus_Reset_clear_sl_busy_OR_56_o ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i [0])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i_1  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i[0]_GND_13_o_mux_44_OUT<6> ),
    .R(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Bus_Reset_clear_sl_busy_OR_56_o ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i [1])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i_2  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i[0]_GND_13_o_mux_44_OUT<5> ),
    .R(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Bus_Reset_clear_sl_busy_OR_56_o ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i [2])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i_3  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i[0]_GND_13_o_mux_44_OUT<4> ),
    .R(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Bus_Reset_clear_sl_busy_OR_56_o ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i [3])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i_4  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i[0]_GND_13_o_mux_44_OUT<3> ),
    .R(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Bus_Reset_clear_sl_busy_OR_56_o ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i [4])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i_5  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i[0]_GND_13_o_mux_44_OUT<2> ),
    .R(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Bus_Reset_clear_sl_busy_OR_56_o ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i [5])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i_6  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i[0]_GND_13_o_mux_44_OUT<1> ),
    .R(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Bus_Reset_clear_sl_busy_OR_56_o ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i [6])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i_7  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i[0]_PWR_13_o_MUX_135_o ),
    .R(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Bus_Reset_clear_sl_busy_OR_56_o ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i [7])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/data_timeout  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out [8]),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/data_timeout_216 )
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_rearbitrate_i  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GEN_FOR_SHARED.rearbitrate_condition ),
    .R(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GEN_FOR_SHARED.addr_cntl_cs_0 ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_rearbitrate_i_167 )
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_addrack_i  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/do_the_cmd_GND_13_o_MUX_108_o ),
    .R(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GEN_FOR_SHARED.addr_cntl_cs_0 ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_addrack_i_166 )
  );
  FD #(
    .INIT ( 1'b0 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GEN_FOR_SHARED.addr_cntl_cs  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GEN_FOR_SHARED.addr_cntl_ns_GND_13_o_MUX_113_o ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GEN_FOR_SHARED.addr_cntl_cs_209 )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id_2  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/decode_s_h_cs ),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_masterid_reg [0]),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[2] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id_1  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/decode_s_h_cs ),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_masterid_reg [1]),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[1] )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id_0  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/decode_s_h_cs ),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_masterid_reg [2]),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[0] )
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mwrerr_i_0  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_152_o ),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mwrerr_i [0])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mwrerr_i_1  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_154_o ),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mwrerr_i [1])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mwrerr_i_2  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_156_o ),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mwrerr_i [2])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mwrerr_i_3  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_158_o ),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mwrerr_i [3])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mwrerr_i_4  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_160_o ),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mwrerr_i [4])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mwrerr_i_5  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_162_o ),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mwrerr_i [5])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mwrerr_i_6  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_164_o ),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mwrerr_i [6])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mwrerr_i_7  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_166_o ),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mwrerr_i [7])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mrderr_i_0  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_136_o ),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mrderr_i [0])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mrderr_i_1  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_138_o ),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mrderr_i [1])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mrderr_i_2  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_140_o ),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mrderr_i [2])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mrderr_i_3  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_142_o ),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mrderr_i [3])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mrderr_i_4  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_144_o ),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mrderr_i [4])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mrderr_i_5  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_146_o ),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mrderr_i [5])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mrderr_i_6  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_148_o ),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mrderr_i [6])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mrderr_i_7  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_150_o ),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mrderr_i [7])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_pavalid_reg  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_PAValid_IBUF_92),
    .R(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GEN_FOR_SHARED.addr_cntl_cs_0 ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_pavalid_reg_208 )
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/rd_clear_sl_busy  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_rdack_i_204 ),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/rd_clear_sl_busy_169 )
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_wrdack_i  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i ),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_wrdack_i_168 )
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_rnw_reg  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_RNW_IBUF_93),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_rnw_reg_217 )
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg_0  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_wrDBus_0_IBUF_58),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [0])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg_1  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_wrDBus_1_IBUF_59),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [1])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg_2  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_wrDBus_2_IBUF_60),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [2])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg_3  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_wrDBus_3_IBUF_61),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [3])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg_4  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_wrDBus_4_IBUF_62),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [4])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg_5  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_wrDBus_5_IBUF_63),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [5])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg_6  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_wrDBus_6_IBUF_64),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [6])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg_7  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_wrDBus_7_IBUF_65),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [7])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg_8  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_wrDBus_8_IBUF_66),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [8])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg_9  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_wrDBus_9_IBUF_67),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [9])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg_10  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_wrDBus_10_IBUF_68),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [10])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg_11  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_wrDBus_11_IBUF_69),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [11])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg_12  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_wrDBus_12_IBUF_70),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [12])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg_13  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_wrDBus_13_IBUF_71),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [13])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg_14  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_wrDBus_14_IBUF_72),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [14])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg_15  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_wrDBus_15_IBUF_73),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [15])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg_16  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_wrDBus_16_IBUF_74),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [16])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg_17  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_wrDBus_17_IBUF_75),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [17])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg_18  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_wrDBus_18_IBUF_76),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [18])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg_19  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_wrDBus_19_IBUF_77),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [19])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg_20  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_wrDBus_20_IBUF_78),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [20])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg_21  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_wrDBus_21_IBUF_79),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [21])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg_22  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_wrDBus_22_IBUF_80),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [22])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg_23  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_wrDBus_23_IBUF_81),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [23])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg_24  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_wrDBus_24_IBUF_82),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [24])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg_25  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_wrDBus_25_IBUF_83),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [25])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg_26  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_wrDBus_26_IBUF_84),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [26])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg_27  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_wrDBus_27_IBUF_85),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [27])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg_28  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_wrDBus_28_IBUF_86),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [28])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg_29  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_wrDBus_29_IBUF_87),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [29])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg_30  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_wrDBus_30_IBUF_88),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [30])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg_31  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_wrDBus_31_IBUF_89),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [31])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_type_reg_0  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_type_0_IBUF_55),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_type_reg [0])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_type_reg_1  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_type_1_IBUF_56),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_type_reg [1])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_type_reg_2  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_type_2_IBUF_57),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_type_reg [2])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_size_reg_0  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_size_0_IBUF_51),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_size_reg [0])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_size_reg_1  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_size_1_IBUF_52),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_size_reg [1])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_size_reg_2  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_size_2_IBUF_53),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_size_reg [2])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_size_reg_3  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_size_3_IBUF_54),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_size_reg [3])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_be_reg_0  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/plb_be_muxed [0]),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_be_reg [0])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_be_reg_1  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/plb_be_muxed [1]),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_be_reg [1])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_be_reg_2  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/plb_be_muxed [2]),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_be_reg [2])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_be_reg_3  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/plb_be_muxed [3]),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_be_reg [3])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_masterid_reg_0  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_masterID_0_IBUF_32),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_masterid_reg [0])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_masterid_reg_1  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_masterID_1_IBUF_33),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_masterid_reg [1])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_masterid_reg_2  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_masterID_2_IBUF_34),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_masterid_reg [2])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg_0  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_ABus_0_IBUF_0),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [0])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg_1  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_ABus_1_IBUF_1),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [1])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg_2  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_ABus_2_IBUF_2),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [2])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg_3  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_ABus_3_IBUF_3),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [3])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg_4  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_ABus_4_IBUF_4),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [4])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg_5  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_ABus_5_IBUF_5),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [5])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg_6  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_ABus_6_IBUF_6),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [6])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg_7  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_ABus_7_IBUF_7),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [7])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg_8  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_ABus_8_IBUF_8),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [8])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg_9  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_ABus_9_IBUF_9),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [9])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg_10  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_ABus_10_IBUF_10),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [10])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg_11  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_ABus_11_IBUF_11),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [11])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg_12  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_ABus_12_IBUF_12),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [12])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg_13  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_ABus_13_IBUF_13),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [13])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg_14  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_ABus_14_IBUF_14),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [14])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg_15  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_ABus_15_IBUF_15),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [15])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg_16  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_ABus_16_IBUF_16),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [16])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg_17  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_ABus_17_IBUF_17),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [17])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg_18  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_ABus_18_IBUF_18),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [18])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg_19  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_ABus_19_IBUF_19),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [19])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg_20  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_ABus_20_IBUF_20),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [20])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg_21  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_ABus_21_IBUF_21),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [21])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg_22  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_ABus_22_IBUF_22),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [22])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg_23  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_ABus_23_IBUF_23),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [23])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg_24  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_ABus_24_IBUF_24),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [24])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg_25  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_ABus_25_IBUF_25),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [25])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg_26  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_ABus_26_IBUF_26),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [26])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg_27  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_ABus_27_IBUF_27),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [27])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg_28  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_ABus_28_IBUF_28),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [28])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg_29  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_ABus_29_IBUF_29),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [29])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg_30  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_ABus_30_IBUF_30),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [30])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg_31  (
    .C(SPLB_Clk_BUFGP_90),
    .D(PLB_ABus_31_IBUF_31),
    .R(SPLB_Rst_IBUF_91),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [31])
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/decode_hit_reg  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/address_match_early ),
    .R(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GEN_FOR_SHARED.addr_cntl_cs_0 ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/decode_hit_reg_265 )
  );
  FDRE   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rnw_s_h  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/decode_s_h_cs ),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_rnw_reg_217 ),
    .R(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Bus_Reset_clear_sl_busy_OR_56_o ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rnw_s_h_267 )
  );
  FDRE   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/addr_out_s_h_0  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/decode_s_h_cs ),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [27]),
    .R(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Bus_Reset_clear_sl_busy_OR_56_o ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/addr_out_s_h [0])
  );
  FDRE   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/addr_out_s_h_1  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/decode_s_h_cs ),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [28]),
    .R(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Bus_Reset_clear_sl_busy_OR_56_o ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/addr_out_s_h [1])
  );
  FDRE   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/addr_out_s_h_2  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/decode_s_h_cs ),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [29]),
    .R(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Bus_Reset_clear_sl_busy_OR_56_o ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/addr_out_s_h [2])
  );
  toplevel   \USER_LOGIC_I/tdt4255_toplevel  (
    .clk(SPLB_Clk_BUFGP_90),
    .reset(rst_Bus2IP_Reset),
    .command({\USER_LOGIC_I/slv_reg0 [0], \USER_LOGIC_I/slv_reg0 [1], \USER_LOGIC_I/slv_reg0 [2], \USER_LOGIC_I/slv_reg0 [3], 
\USER_LOGIC_I/slv_reg0 [4], \USER_LOGIC_I/slv_reg0 [5], \USER_LOGIC_I/slv_reg0 [6], \USER_LOGIC_I/slv_reg0 [7], \USER_LOGIC_I/slv_reg0 [8], 
\USER_LOGIC_I/slv_reg0 [9], \USER_LOGIC_I/slv_reg0 [10], \USER_LOGIC_I/slv_reg0 [11], \USER_LOGIC_I/slv_reg0 [12], \USER_LOGIC_I/slv_reg0 [13], 
\USER_LOGIC_I/slv_reg0 [14], \USER_LOGIC_I/slv_reg0 [15], \USER_LOGIC_I/slv_reg0 [16], \USER_LOGIC_I/slv_reg0 [17], \USER_LOGIC_I/slv_reg0 [18], 
\USER_LOGIC_I/slv_reg0 [19], \USER_LOGIC_I/slv_reg0 [20], \USER_LOGIC_I/slv_reg0 [21], \USER_LOGIC_I/slv_reg0 [22], \USER_LOGIC_I/slv_reg0 [23], 
\USER_LOGIC_I/slv_reg0 [24], \USER_LOGIC_I/slv_reg0 [25], \USER_LOGIC_I/slv_reg0 [26], \USER_LOGIC_I/slv_reg0 [27], \USER_LOGIC_I/slv_reg0 [28], 
\USER_LOGIC_I/slv_reg0 [29], \USER_LOGIC_I/slv_reg0 [30], \USER_LOGIC_I/slv_reg0 [31]}),
    .bus_address_in({\USER_LOGIC_I/slv_reg1 [0], \USER_LOGIC_I/slv_reg1 [1], \USER_LOGIC_I/slv_reg1 [2], \USER_LOGIC_I/slv_reg1 [3], 
\USER_LOGIC_I/slv_reg1 [4], \USER_LOGIC_I/slv_reg1 [5], \USER_LOGIC_I/slv_reg1 [6], \USER_LOGIC_I/slv_reg1 [7], \USER_LOGIC_I/slv_reg1 [8], 
\USER_LOGIC_I/slv_reg1 [9], \USER_LOGIC_I/slv_reg1 [10], \USER_LOGIC_I/slv_reg1 [11], \USER_LOGIC_I/slv_reg1 [12], \USER_LOGIC_I/slv_reg1 [13], 
\USER_LOGIC_I/slv_reg1 [14], \USER_LOGIC_I/slv_reg1 [15], \USER_LOGIC_I/slv_reg1 [16], \USER_LOGIC_I/slv_reg1 [17], \USER_LOGIC_I/slv_reg1 [18], 
\USER_LOGIC_I/slv_reg1 [19], \USER_LOGIC_I/slv_reg1 [20], \USER_LOGIC_I/slv_reg1 [21], \USER_LOGIC_I/slv_reg1 [22], \USER_LOGIC_I/slv_reg1 [23], 
\USER_LOGIC_I/slv_reg1 [24], \USER_LOGIC_I/slv_reg1 [25], \USER_LOGIC_I/slv_reg1 [26], \USER_LOGIC_I/slv_reg1 [27], \USER_LOGIC_I/slv_reg1 [28], 
\USER_LOGIC_I/slv_reg1 [29], \USER_LOGIC_I/slv_reg1 [30], \USER_LOGIC_I/slv_reg1 [31]}),
    .bus_data_in({\USER_LOGIC_I/slv_reg2 [0], \USER_LOGIC_I/slv_reg2 [1], \USER_LOGIC_I/slv_reg2 [2], \USER_LOGIC_I/slv_reg2 [3], 
\USER_LOGIC_I/slv_reg2 [4], \USER_LOGIC_I/slv_reg2 [5], \USER_LOGIC_I/slv_reg2 [6], \USER_LOGIC_I/slv_reg2 [7], \USER_LOGIC_I/slv_reg2 [8], 
\USER_LOGIC_I/slv_reg2 [9], \USER_LOGIC_I/slv_reg2 [10], \USER_LOGIC_I/slv_reg2 [11], \USER_LOGIC_I/slv_reg2 [12], \USER_LOGIC_I/slv_reg2 [13], 
\USER_LOGIC_I/slv_reg2 [14], \USER_LOGIC_I/slv_reg2 [15], \USER_LOGIC_I/slv_reg2 [16], \USER_LOGIC_I/slv_reg2 [17], \USER_LOGIC_I/slv_reg2 [18], 
\USER_LOGIC_I/slv_reg2 [19], \USER_LOGIC_I/slv_reg2 [20], \USER_LOGIC_I/slv_reg2 [21], \USER_LOGIC_I/slv_reg2 [22], \USER_LOGIC_I/slv_reg2 [23], 
\USER_LOGIC_I/slv_reg2 [24], \USER_LOGIC_I/slv_reg2 [25], \USER_LOGIC_I/slv_reg2 [26], \USER_LOGIC_I/slv_reg2 [27], \USER_LOGIC_I/slv_reg2 [28], 
\USER_LOGIC_I/slv_reg2 [29], \USER_LOGIC_I/slv_reg2 [30], \USER_LOGIC_I/slv_reg2 [31]}),
    .status({\NLW_USER_LOGIC_I/tdt4255_toplevel_status<0>_UNCONNECTED , \NLW_USER_LOGIC_I/tdt4255_toplevel_status<1>_UNCONNECTED , 
\NLW_USER_LOGIC_I/tdt4255_toplevel_status<2>_UNCONNECTED , \NLW_USER_LOGIC_I/tdt4255_toplevel_status<3>_UNCONNECTED , 
\NLW_USER_LOGIC_I/tdt4255_toplevel_status<4>_UNCONNECTED , \NLW_USER_LOGIC_I/tdt4255_toplevel_status<5>_UNCONNECTED , 
\NLW_USER_LOGIC_I/tdt4255_toplevel_status<6>_UNCONNECTED , \NLW_USER_LOGIC_I/tdt4255_toplevel_status<7>_UNCONNECTED , 
\NLW_USER_LOGIC_I/tdt4255_toplevel_status<8>_UNCONNECTED , \NLW_USER_LOGIC_I/tdt4255_toplevel_status<9>_UNCONNECTED , 
\NLW_USER_LOGIC_I/tdt4255_toplevel_status<10>_UNCONNECTED , \NLW_USER_LOGIC_I/tdt4255_toplevel_status<11>_UNCONNECTED , 
\NLW_USER_LOGIC_I/tdt4255_toplevel_status<12>_UNCONNECTED , \NLW_USER_LOGIC_I/tdt4255_toplevel_status<13>_UNCONNECTED , 
\NLW_USER_LOGIC_I/tdt4255_toplevel_status<14>_UNCONNECTED , \NLW_USER_LOGIC_I/tdt4255_toplevel_status<15>_UNCONNECTED , 
\NLW_USER_LOGIC_I/tdt4255_toplevel_status<16>_UNCONNECTED , \NLW_USER_LOGIC_I/tdt4255_toplevel_status<17>_UNCONNECTED , 
\NLW_USER_LOGIC_I/tdt4255_toplevel_status<18>_UNCONNECTED , \NLW_USER_LOGIC_I/tdt4255_toplevel_status<19>_UNCONNECTED , 
\NLW_USER_LOGIC_I/tdt4255_toplevel_status<20>_UNCONNECTED , \NLW_USER_LOGIC_I/tdt4255_toplevel_status<21>_UNCONNECTED , 
\NLW_USER_LOGIC_I/tdt4255_toplevel_status<22>_UNCONNECTED , \NLW_USER_LOGIC_I/tdt4255_toplevel_status<23>_UNCONNECTED , 
\NLW_USER_LOGIC_I/tdt4255_toplevel_status<24>_UNCONNECTED , \NLW_USER_LOGIC_I/tdt4255_toplevel_status<25>_UNCONNECTED , 
\NLW_USER_LOGIC_I/tdt4255_toplevel_status<26>_UNCONNECTED , \NLW_USER_LOGIC_I/tdt4255_toplevel_status<27>_UNCONNECTED , 
\NLW_USER_LOGIC_I/tdt4255_toplevel_status<28>_UNCONNECTED , \NLW_USER_LOGIC_I/tdt4255_toplevel_status<29>_UNCONNECTED , 
\NLW_USER_LOGIC_I/tdt4255_toplevel_status<30>_UNCONNECTED , \NLW_USER_LOGIC_I/tdt4255_toplevel_status<31>_UNCONNECTED }),
    .bus_data_out({\NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<0>_UNCONNECTED , \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<1>_UNCONNECTED , 
\NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<2>_UNCONNECTED , \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<3>_UNCONNECTED , 
\NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<4>_UNCONNECTED , \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<5>_UNCONNECTED , 
\NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<6>_UNCONNECTED , \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<7>_UNCONNECTED , 
\NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<8>_UNCONNECTED , \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<9>_UNCONNECTED , 
\NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<10>_UNCONNECTED , \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<11>_UNCONNECTED , 
\NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<12>_UNCONNECTED , \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<13>_UNCONNECTED , 
\NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<14>_UNCONNECTED , \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<15>_UNCONNECTED , 
\NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<16>_UNCONNECTED , \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<17>_UNCONNECTED , 
\NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<18>_UNCONNECTED , \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<19>_UNCONNECTED , 
\NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<20>_UNCONNECTED , \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<21>_UNCONNECTED , 
\NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<22>_UNCONNECTED , \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<23>_UNCONNECTED , 
\NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<24>_UNCONNECTED , \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<25>_UNCONNECTED , 
\NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<26>_UNCONNECTED , \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<27>_UNCONNECTED , 
\NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<28>_UNCONNECTED , \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<29>_UNCONNECTED , 
\NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<30>_UNCONNECTED , \NLW_USER_LOGIC_I/tdt4255_toplevel_bus_data_out<31>_UNCONNECTED })
  );
  FDRE   \USER_LOGIC_I/slv_reg0_0  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/PWR_41_o_slv_reg_write_sel[0]_equal_3_o ),
    .D(\USER_LOGIC_I/slv_reg0[0]_Bus2IP_Data[0]_MUX_189_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg0 [0])
  );
  FDRE   \USER_LOGIC_I/slv_reg0_1  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/PWR_41_o_slv_reg_write_sel[0]_equal_3_o ),
    .D(\USER_LOGIC_I/slv_reg0[1]_Bus2IP_Data[1]_MUX_190_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg0 [1])
  );
  FDRE   \USER_LOGIC_I/slv_reg0_2  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/PWR_41_o_slv_reg_write_sel[0]_equal_3_o ),
    .D(\USER_LOGIC_I/slv_reg0[2]_Bus2IP_Data[2]_MUX_191_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg0 [2])
  );
  FDRE   \USER_LOGIC_I/slv_reg0_3  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/PWR_41_o_slv_reg_write_sel[0]_equal_3_o ),
    .D(\USER_LOGIC_I/slv_reg0[3]_Bus2IP_Data[3]_MUX_192_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg0 [3])
  );
  FDRE   \USER_LOGIC_I/slv_reg0_4  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/PWR_41_o_slv_reg_write_sel[0]_equal_3_o ),
    .D(\USER_LOGIC_I/slv_reg0[4]_Bus2IP_Data[4]_MUX_193_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg0 [4])
  );
  FDRE   \USER_LOGIC_I/slv_reg0_5  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/PWR_41_o_slv_reg_write_sel[0]_equal_3_o ),
    .D(\USER_LOGIC_I/slv_reg0[5]_Bus2IP_Data[5]_MUX_194_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg0 [5])
  );
  FDRE   \USER_LOGIC_I/slv_reg0_6  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/PWR_41_o_slv_reg_write_sel[0]_equal_3_o ),
    .D(\USER_LOGIC_I/slv_reg0[6]_Bus2IP_Data[6]_MUX_195_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg0 [6])
  );
  FDRE   \USER_LOGIC_I/slv_reg0_7  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/PWR_41_o_slv_reg_write_sel[0]_equal_3_o ),
    .D(\USER_LOGIC_I/slv_reg0[7]_Bus2IP_Data[7]_MUX_196_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg0 [7])
  );
  FDRE   \USER_LOGIC_I/slv_reg0_8  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/PWR_41_o_slv_reg_write_sel[0]_equal_3_o ),
    .D(\USER_LOGIC_I/slv_reg0[8]_Bus2IP_Data[8]_MUX_197_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg0 [8])
  );
  FDRE   \USER_LOGIC_I/slv_reg0_9  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/PWR_41_o_slv_reg_write_sel[0]_equal_3_o ),
    .D(\USER_LOGIC_I/slv_reg0[9]_Bus2IP_Data[9]_MUX_198_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg0 [9])
  );
  FDRE   \USER_LOGIC_I/slv_reg0_10  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/PWR_41_o_slv_reg_write_sel[0]_equal_3_o ),
    .D(\USER_LOGIC_I/slv_reg0[10]_Bus2IP_Data[10]_MUX_199_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg0 [10])
  );
  FDRE   \USER_LOGIC_I/slv_reg0_11  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/PWR_41_o_slv_reg_write_sel[0]_equal_3_o ),
    .D(\USER_LOGIC_I/slv_reg0[11]_Bus2IP_Data[11]_MUX_200_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg0 [11])
  );
  FDRE   \USER_LOGIC_I/slv_reg0_12  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/PWR_41_o_slv_reg_write_sel[0]_equal_3_o ),
    .D(\USER_LOGIC_I/slv_reg0[12]_Bus2IP_Data[12]_MUX_201_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg0 [12])
  );
  FDRE   \USER_LOGIC_I/slv_reg0_13  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/PWR_41_o_slv_reg_write_sel[0]_equal_3_o ),
    .D(\USER_LOGIC_I/slv_reg0[13]_Bus2IP_Data[13]_MUX_202_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg0 [13])
  );
  FDRE   \USER_LOGIC_I/slv_reg0_14  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/PWR_41_o_slv_reg_write_sel[0]_equal_3_o ),
    .D(\USER_LOGIC_I/slv_reg0[14]_Bus2IP_Data[14]_MUX_203_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg0 [14])
  );
  FDRE   \USER_LOGIC_I/slv_reg0_15  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/PWR_41_o_slv_reg_write_sel[0]_equal_3_o ),
    .D(\USER_LOGIC_I/slv_reg0[15]_Bus2IP_Data[15]_MUX_204_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg0 [15])
  );
  FDRE   \USER_LOGIC_I/slv_reg0_16  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/PWR_41_o_slv_reg_write_sel[0]_equal_3_o ),
    .D(\USER_LOGIC_I/slv_reg0[16]_Bus2IP_Data[16]_MUX_205_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg0 [16])
  );
  FDRE   \USER_LOGIC_I/slv_reg0_17  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/PWR_41_o_slv_reg_write_sel[0]_equal_3_o ),
    .D(\USER_LOGIC_I/slv_reg0[17]_Bus2IP_Data[17]_MUX_206_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg0 [17])
  );
  FDRE   \USER_LOGIC_I/slv_reg0_18  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/PWR_41_o_slv_reg_write_sel[0]_equal_3_o ),
    .D(\USER_LOGIC_I/slv_reg0[18]_Bus2IP_Data[18]_MUX_207_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg0 [18])
  );
  FDRE   \USER_LOGIC_I/slv_reg0_19  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/PWR_41_o_slv_reg_write_sel[0]_equal_3_o ),
    .D(\USER_LOGIC_I/slv_reg0[19]_Bus2IP_Data[19]_MUX_208_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg0 [19])
  );
  FDRE   \USER_LOGIC_I/slv_reg0_20  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/PWR_41_o_slv_reg_write_sel[0]_equal_3_o ),
    .D(\USER_LOGIC_I/slv_reg0[20]_Bus2IP_Data[20]_MUX_209_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg0 [20])
  );
  FDRE   \USER_LOGIC_I/slv_reg0_21  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/PWR_41_o_slv_reg_write_sel[0]_equal_3_o ),
    .D(\USER_LOGIC_I/slv_reg0[21]_Bus2IP_Data[21]_MUX_210_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg0 [21])
  );
  FDRE   \USER_LOGIC_I/slv_reg0_22  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/PWR_41_o_slv_reg_write_sel[0]_equal_3_o ),
    .D(\USER_LOGIC_I/slv_reg0[22]_Bus2IP_Data[22]_MUX_211_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg0 [22])
  );
  FDRE   \USER_LOGIC_I/slv_reg0_23  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/PWR_41_o_slv_reg_write_sel[0]_equal_3_o ),
    .D(\USER_LOGIC_I/slv_reg0[23]_Bus2IP_Data[23]_MUX_212_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg0 [23])
  );
  FDRE   \USER_LOGIC_I/slv_reg0_24  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/PWR_41_o_slv_reg_write_sel[0]_equal_3_o ),
    .D(\USER_LOGIC_I/slv_reg0[24]_Bus2IP_Data[24]_MUX_213_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg0 [24])
  );
  FDRE   \USER_LOGIC_I/slv_reg0_25  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/PWR_41_o_slv_reg_write_sel[0]_equal_3_o ),
    .D(\USER_LOGIC_I/slv_reg0[25]_Bus2IP_Data[25]_MUX_214_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg0 [25])
  );
  FDRE   \USER_LOGIC_I/slv_reg0_26  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/PWR_41_o_slv_reg_write_sel[0]_equal_3_o ),
    .D(\USER_LOGIC_I/slv_reg0[26]_Bus2IP_Data[26]_MUX_215_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg0 [26])
  );
  FDRE   \USER_LOGIC_I/slv_reg0_27  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/PWR_41_o_slv_reg_write_sel[0]_equal_3_o ),
    .D(\USER_LOGIC_I/slv_reg0[27]_Bus2IP_Data[27]_MUX_216_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg0 [27])
  );
  FDRE   \USER_LOGIC_I/slv_reg0_28  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/PWR_41_o_slv_reg_write_sel[0]_equal_3_o ),
    .D(\USER_LOGIC_I/slv_reg0[28]_Bus2IP_Data[28]_MUX_217_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg0 [28])
  );
  FDRE   \USER_LOGIC_I/slv_reg0_29  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/PWR_41_o_slv_reg_write_sel[0]_equal_3_o ),
    .D(\USER_LOGIC_I/slv_reg0[29]_Bus2IP_Data[29]_MUX_218_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg0 [29])
  );
  FDRE   \USER_LOGIC_I/slv_reg0_30  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/PWR_41_o_slv_reg_write_sel[0]_equal_3_o ),
    .D(\USER_LOGIC_I/slv_reg0[30]_Bus2IP_Data[30]_MUX_219_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg0 [30])
  );
  FDRE   \USER_LOGIC_I/slv_reg0_31  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/PWR_41_o_slv_reg_write_sel[0]_equal_3_o ),
    .D(\USER_LOGIC_I/slv_reg0[31]_Bus2IP_Data[31]_MUX_220_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg0 [31])
  );
  FDRE   \USER_LOGIC_I/slv_reg2_0  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_5_o ),
    .D(\USER_LOGIC_I/slv_reg2[0]_Bus2IP_Data[0]_MUX_253_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg2 [0])
  );
  FDRE   \USER_LOGIC_I/slv_reg2_1  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_5_o ),
    .D(\USER_LOGIC_I/slv_reg2[1]_Bus2IP_Data[1]_MUX_254_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg2 [1])
  );
  FDRE   \USER_LOGIC_I/slv_reg2_2  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_5_o ),
    .D(\USER_LOGIC_I/slv_reg2[2]_Bus2IP_Data[2]_MUX_255_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg2 [2])
  );
  FDRE   \USER_LOGIC_I/slv_reg2_3  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_5_o ),
    .D(\USER_LOGIC_I/slv_reg2[3]_Bus2IP_Data[3]_MUX_256_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg2 [3])
  );
  FDRE   \USER_LOGIC_I/slv_reg2_4  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_5_o ),
    .D(\USER_LOGIC_I/slv_reg2[4]_Bus2IP_Data[4]_MUX_257_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg2 [4])
  );
  FDRE   \USER_LOGIC_I/slv_reg2_5  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_5_o ),
    .D(\USER_LOGIC_I/slv_reg2[5]_Bus2IP_Data[5]_MUX_258_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg2 [5])
  );
  FDRE   \USER_LOGIC_I/slv_reg2_6  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_5_o ),
    .D(\USER_LOGIC_I/slv_reg2[6]_Bus2IP_Data[6]_MUX_259_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg2 [6])
  );
  FDRE   \USER_LOGIC_I/slv_reg2_7  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_5_o ),
    .D(\USER_LOGIC_I/slv_reg2[7]_Bus2IP_Data[7]_MUX_260_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg2 [7])
  );
  FDRE   \USER_LOGIC_I/slv_reg2_8  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_5_o ),
    .D(\USER_LOGIC_I/slv_reg2[8]_Bus2IP_Data[8]_MUX_261_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg2 [8])
  );
  FDRE   \USER_LOGIC_I/slv_reg2_9  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_5_o ),
    .D(\USER_LOGIC_I/slv_reg2[9]_Bus2IP_Data[9]_MUX_262_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg2 [9])
  );
  FDRE   \USER_LOGIC_I/slv_reg2_10  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_5_o ),
    .D(\USER_LOGIC_I/slv_reg2[10]_Bus2IP_Data[10]_MUX_263_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg2 [10])
  );
  FDRE   \USER_LOGIC_I/slv_reg2_11  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_5_o ),
    .D(\USER_LOGIC_I/slv_reg2[11]_Bus2IP_Data[11]_MUX_264_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg2 [11])
  );
  FDRE   \USER_LOGIC_I/slv_reg2_12  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_5_o ),
    .D(\USER_LOGIC_I/slv_reg2[12]_Bus2IP_Data[12]_MUX_265_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg2 [12])
  );
  FDRE   \USER_LOGIC_I/slv_reg2_13  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_5_o ),
    .D(\USER_LOGIC_I/slv_reg2[13]_Bus2IP_Data[13]_MUX_266_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg2 [13])
  );
  FDRE   \USER_LOGIC_I/slv_reg2_14  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_5_o ),
    .D(\USER_LOGIC_I/slv_reg2[14]_Bus2IP_Data[14]_MUX_267_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg2 [14])
  );
  FDRE   \USER_LOGIC_I/slv_reg2_15  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_5_o ),
    .D(\USER_LOGIC_I/slv_reg2[15]_Bus2IP_Data[15]_MUX_268_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg2 [15])
  );
  FDRE   \USER_LOGIC_I/slv_reg2_16  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_5_o ),
    .D(\USER_LOGIC_I/slv_reg2[16]_Bus2IP_Data[16]_MUX_269_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg2 [16])
  );
  FDRE   \USER_LOGIC_I/slv_reg2_17  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_5_o ),
    .D(\USER_LOGIC_I/slv_reg2[17]_Bus2IP_Data[17]_MUX_270_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg2 [17])
  );
  FDRE   \USER_LOGIC_I/slv_reg2_18  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_5_o ),
    .D(\USER_LOGIC_I/slv_reg2[18]_Bus2IP_Data[18]_MUX_271_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg2 [18])
  );
  FDRE   \USER_LOGIC_I/slv_reg2_19  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_5_o ),
    .D(\USER_LOGIC_I/slv_reg2[19]_Bus2IP_Data[19]_MUX_272_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg2 [19])
  );
  FDRE   \USER_LOGIC_I/slv_reg2_20  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_5_o ),
    .D(\USER_LOGIC_I/slv_reg2[20]_Bus2IP_Data[20]_MUX_273_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg2 [20])
  );
  FDRE   \USER_LOGIC_I/slv_reg2_21  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_5_o ),
    .D(\USER_LOGIC_I/slv_reg2[21]_Bus2IP_Data[21]_MUX_274_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg2 [21])
  );
  FDRE   \USER_LOGIC_I/slv_reg2_22  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_5_o ),
    .D(\USER_LOGIC_I/slv_reg2[22]_Bus2IP_Data[22]_MUX_275_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg2 [22])
  );
  FDRE   \USER_LOGIC_I/slv_reg2_23  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_5_o ),
    .D(\USER_LOGIC_I/slv_reg2[23]_Bus2IP_Data[23]_MUX_276_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg2 [23])
  );
  FDRE   \USER_LOGIC_I/slv_reg2_24  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_5_o ),
    .D(\USER_LOGIC_I/slv_reg2[24]_Bus2IP_Data[24]_MUX_277_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg2 [24])
  );
  FDRE   \USER_LOGIC_I/slv_reg2_25  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_5_o ),
    .D(\USER_LOGIC_I/slv_reg2[25]_Bus2IP_Data[25]_MUX_278_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg2 [25])
  );
  FDRE   \USER_LOGIC_I/slv_reg2_26  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_5_o ),
    .D(\USER_LOGIC_I/slv_reg2[26]_Bus2IP_Data[26]_MUX_279_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg2 [26])
  );
  FDRE   \USER_LOGIC_I/slv_reg2_27  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_5_o ),
    .D(\USER_LOGIC_I/slv_reg2[27]_Bus2IP_Data[27]_MUX_280_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg2 [27])
  );
  FDRE   \USER_LOGIC_I/slv_reg2_28  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_5_o ),
    .D(\USER_LOGIC_I/slv_reg2[28]_Bus2IP_Data[28]_MUX_281_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg2 [28])
  );
  FDRE   \USER_LOGIC_I/slv_reg2_29  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_5_o ),
    .D(\USER_LOGIC_I/slv_reg2[29]_Bus2IP_Data[29]_MUX_282_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg2 [29])
  );
  FDRE   \USER_LOGIC_I/slv_reg2_30  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_5_o ),
    .D(\USER_LOGIC_I/slv_reg2[30]_Bus2IP_Data[30]_MUX_283_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg2 [30])
  );
  FDRE   \USER_LOGIC_I/slv_reg2_31  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_5_o ),
    .D(\USER_LOGIC_I/slv_reg2[31]_Bus2IP_Data[31]_MUX_284_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg2 [31])
  );
  FDRE   \USER_LOGIC_I/slv_reg1_0  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_4_o ),
    .D(\USER_LOGIC_I/slv_reg1[0]_Bus2IP_Data[0]_MUX_221_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg1 [0])
  );
  FDRE   \USER_LOGIC_I/slv_reg1_1  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_4_o ),
    .D(\USER_LOGIC_I/slv_reg1[1]_Bus2IP_Data[1]_MUX_222_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg1 [1])
  );
  FDRE   \USER_LOGIC_I/slv_reg1_2  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_4_o ),
    .D(\USER_LOGIC_I/slv_reg1[2]_Bus2IP_Data[2]_MUX_223_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg1 [2])
  );
  FDRE   \USER_LOGIC_I/slv_reg1_3  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_4_o ),
    .D(\USER_LOGIC_I/slv_reg1[3]_Bus2IP_Data[3]_MUX_224_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg1 [3])
  );
  FDRE   \USER_LOGIC_I/slv_reg1_4  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_4_o ),
    .D(\USER_LOGIC_I/slv_reg1[4]_Bus2IP_Data[4]_MUX_225_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg1 [4])
  );
  FDRE   \USER_LOGIC_I/slv_reg1_5  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_4_o ),
    .D(\USER_LOGIC_I/slv_reg1[5]_Bus2IP_Data[5]_MUX_226_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg1 [5])
  );
  FDRE   \USER_LOGIC_I/slv_reg1_6  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_4_o ),
    .D(\USER_LOGIC_I/slv_reg1[6]_Bus2IP_Data[6]_MUX_227_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg1 [6])
  );
  FDRE   \USER_LOGIC_I/slv_reg1_7  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_4_o ),
    .D(\USER_LOGIC_I/slv_reg1[7]_Bus2IP_Data[7]_MUX_228_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg1 [7])
  );
  FDRE   \USER_LOGIC_I/slv_reg1_8  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_4_o ),
    .D(\USER_LOGIC_I/slv_reg1[8]_Bus2IP_Data[8]_MUX_229_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg1 [8])
  );
  FDRE   \USER_LOGIC_I/slv_reg1_9  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_4_o ),
    .D(\USER_LOGIC_I/slv_reg1[9]_Bus2IP_Data[9]_MUX_230_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg1 [9])
  );
  FDRE   \USER_LOGIC_I/slv_reg1_10  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_4_o ),
    .D(\USER_LOGIC_I/slv_reg1[10]_Bus2IP_Data[10]_MUX_231_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg1 [10])
  );
  FDRE   \USER_LOGIC_I/slv_reg1_11  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_4_o ),
    .D(\USER_LOGIC_I/slv_reg1[11]_Bus2IP_Data[11]_MUX_232_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg1 [11])
  );
  FDRE   \USER_LOGIC_I/slv_reg1_12  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_4_o ),
    .D(\USER_LOGIC_I/slv_reg1[12]_Bus2IP_Data[12]_MUX_233_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg1 [12])
  );
  FDRE   \USER_LOGIC_I/slv_reg1_13  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_4_o ),
    .D(\USER_LOGIC_I/slv_reg1[13]_Bus2IP_Data[13]_MUX_234_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg1 [13])
  );
  FDRE   \USER_LOGIC_I/slv_reg1_14  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_4_o ),
    .D(\USER_LOGIC_I/slv_reg1[14]_Bus2IP_Data[14]_MUX_235_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg1 [14])
  );
  FDRE   \USER_LOGIC_I/slv_reg1_15  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_4_o ),
    .D(\USER_LOGIC_I/slv_reg1[15]_Bus2IP_Data[15]_MUX_236_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg1 [15])
  );
  FDRE   \USER_LOGIC_I/slv_reg1_16  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_4_o ),
    .D(\USER_LOGIC_I/slv_reg1[16]_Bus2IP_Data[16]_MUX_237_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg1 [16])
  );
  FDRE   \USER_LOGIC_I/slv_reg1_17  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_4_o ),
    .D(\USER_LOGIC_I/slv_reg1[17]_Bus2IP_Data[17]_MUX_238_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg1 [17])
  );
  FDRE   \USER_LOGIC_I/slv_reg1_18  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_4_o ),
    .D(\USER_LOGIC_I/slv_reg1[18]_Bus2IP_Data[18]_MUX_239_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg1 [18])
  );
  FDRE   \USER_LOGIC_I/slv_reg1_19  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_4_o ),
    .D(\USER_LOGIC_I/slv_reg1[19]_Bus2IP_Data[19]_MUX_240_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg1 [19])
  );
  FDRE   \USER_LOGIC_I/slv_reg1_20  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_4_o ),
    .D(\USER_LOGIC_I/slv_reg1[20]_Bus2IP_Data[20]_MUX_241_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg1 [20])
  );
  FDRE   \USER_LOGIC_I/slv_reg1_21  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_4_o ),
    .D(\USER_LOGIC_I/slv_reg1[21]_Bus2IP_Data[21]_MUX_242_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg1 [21])
  );
  FDRE   \USER_LOGIC_I/slv_reg1_22  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_4_o ),
    .D(\USER_LOGIC_I/slv_reg1[22]_Bus2IP_Data[22]_MUX_243_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg1 [22])
  );
  FDRE   \USER_LOGIC_I/slv_reg1_23  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_4_o ),
    .D(\USER_LOGIC_I/slv_reg1[23]_Bus2IP_Data[23]_MUX_244_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg1 [23])
  );
  FDRE   \USER_LOGIC_I/slv_reg1_24  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_4_o ),
    .D(\USER_LOGIC_I/slv_reg1[24]_Bus2IP_Data[24]_MUX_245_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg1 [24])
  );
  FDRE   \USER_LOGIC_I/slv_reg1_25  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_4_o ),
    .D(\USER_LOGIC_I/slv_reg1[25]_Bus2IP_Data[25]_MUX_246_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg1 [25])
  );
  FDRE   \USER_LOGIC_I/slv_reg1_26  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_4_o ),
    .D(\USER_LOGIC_I/slv_reg1[26]_Bus2IP_Data[26]_MUX_247_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg1 [26])
  );
  FDRE   \USER_LOGIC_I/slv_reg1_27  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_4_o ),
    .D(\USER_LOGIC_I/slv_reg1[27]_Bus2IP_Data[27]_MUX_248_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg1 [27])
  );
  FDRE   \USER_LOGIC_I/slv_reg1_28  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_4_o ),
    .D(\USER_LOGIC_I/slv_reg1[28]_Bus2IP_Data[28]_MUX_249_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg1 [28])
  );
  FDRE   \USER_LOGIC_I/slv_reg1_29  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_4_o ),
    .D(\USER_LOGIC_I/slv_reg1[29]_Bus2IP_Data[29]_MUX_250_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg1 [29])
  );
  FDRE   \USER_LOGIC_I/slv_reg1_30  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_4_o ),
    .D(\USER_LOGIC_I/slv_reg1[30]_Bus2IP_Data[30]_MUX_251_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg1 [30])
  );
  FDRE   \USER_LOGIC_I/slv_reg1_31  (
    .C(SPLB_Clk_BUFGP_90),
    .CE(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_4_o ),
    .D(\USER_LOGIC_I/slv_reg1[31]_Bus2IP_Data[31]_MUX_252_o ),
    .R(rst_Bus2IP_Reset),
    .Q(\USER_LOGIC_I/slv_reg1 [31])
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \PLBV46_SLAVE_SINGLE_I/Mmux_plb_be_muxed11  (
    .I0(PLB_ABus_28_IBUF_28),
    .I1(PLB_ABus_29_IBUF_29),
    .I2(PLB_BE_8_IBUF_43),
    .I3(PLB_BE_12_IBUF_47),
    .I4(PLB_BE_4_IBUF_39),
    .I5(PLB_BE_0_IBUF_35),
    .O(\PLBV46_SLAVE_SINGLE_I/plb_be_muxed [0])
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \PLBV46_SLAVE_SINGLE_I/Mmux_plb_be_muxed21  (
    .I0(PLB_ABus_28_IBUF_28),
    .I1(PLB_ABus_29_IBUF_29),
    .I2(PLB_BE_9_IBUF_44),
    .I3(PLB_BE_13_IBUF_48),
    .I4(PLB_BE_5_IBUF_40),
    .I5(PLB_BE_1_IBUF_36),
    .O(\PLBV46_SLAVE_SINGLE_I/plb_be_muxed [1])
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \PLBV46_SLAVE_SINGLE_I/Mmux_plb_be_muxed31  (
    .I0(PLB_ABus_28_IBUF_28),
    .I1(PLB_ABus_29_IBUF_29),
    .I2(PLB_BE_10_IBUF_45),
    .I3(PLB_BE_14_IBUF_49),
    .I4(PLB_BE_6_IBUF_41),
    .I5(PLB_BE_2_IBUF_37),
    .O(\PLBV46_SLAVE_SINGLE_I/plb_be_muxed [2])
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \PLBV46_SLAVE_SINGLE_I/Mmux_plb_be_muxed41  (
    .I0(PLB_ABus_28_IBUF_28),
    .I1(PLB_ABus_29_IBUF_29),
    .I2(PLB_BE_11_IBUF_46),
    .I3(PLB_BE_15_IBUF_50),
    .I4(PLB_BE_7_IBUF_42),
    .I5(PLB_BE_3_IBUF_38),
    .O(\PLBV46_SLAVE_SINGLE_I/plb_be_muxed [3])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GEN_FOR_SHARED.addr_cntl_cs_01  (
    .I0(SPLB_Rst_IBUF_91),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GEN_FOR_SHARED.addr_cntl_cs_209 ),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GEN_FOR_SHARED.addr_cntl_cs_0 )
  );
  LUT4 #(
    .INIT ( 16'h0001 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out[8]_GND_26_o_mux_5_OUT<4>11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out [0]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out [1]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out [2]),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out [3]),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out[8]_GND_26_o_mux_5_OUT<4>_bdd0 )
  );
  LUT6 #(
    .INIT ( 64'h0000000000800000 ))
  \SOFT_RESET_I/sw_rst_cond1  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [30]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [3]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [28]),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [29]),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i[8] ),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [31]),
    .O(\SOFT_RESET_I/sw_rst_cond )
  );
  LUT5 #(
    .INIT ( 32'h00000080 ))
  \SOFT_RESET_I/PWR_35_o_Bus2IP_BE[3]_AND_38_o1  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [3]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [28]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [30]),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [29]),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [31]),
    .O(\SOFT_RESET_I/PWR_35_o_Bus2IP_BE[3]_AND_38_o )
  );
  LUT6 #(
    .INIT ( 64'hAAAA8AAAAAAAAAAA ))
  \SOFT_RESET_I/reset_error1  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i[8] ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [29]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [30]),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [28]),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [31]),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [3]),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i1 )
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \SOFT_RESET_I/wrack_ff_chain1  (
    .I0(\SOFT_RESET_I/flop_q_chain [3]),
    .I1(\SOFT_RESET_I/flop_q_chain [4]),
    .O(\SOFT_RESET_I/wrack_ff_chain )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \SOFT_RESET_I/Reset2IP_Reset1  (
    .I0(SPLB_Rst_IBUF_91),
    .I1(\SOFT_RESET_I/flop_q_chain [4]),
    .O(rst_Bus2IP_Reset)
  );
  LUT5 #(
    .INIT ( 32'h00010000 ))
  \USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_5_o<0>1  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i[1] ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i[0] ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i[3] ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i[4] ),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i[2] ),
    .O(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_5_o )
  );
  LUT5 #(
    .INIT ( 32'h00010000 ))
  \USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_4_o<0>1  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i[2] ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i[0] ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i[3] ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i[4] ),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i[1] ),
    .O(\USER_LOGIC_I/GND_32_o_slv_reg_write_sel[0]_equal_4_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg2[31]_Bus2IP_Data[31]_MUX_284_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [3]),
    .I1(\USER_LOGIC_I/slv_reg2 [31]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [31]),
    .O(\USER_LOGIC_I/slv_reg2[31]_Bus2IP_Data[31]_MUX_284_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg1[31]_Bus2IP_Data[31]_MUX_252_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [3]),
    .I1(\USER_LOGIC_I/slv_reg1 [31]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [31]),
    .O(\USER_LOGIC_I/slv_reg1[31]_Bus2IP_Data[31]_MUX_252_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg2[30]_Bus2IP_Data[30]_MUX_283_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [3]),
    .I1(\USER_LOGIC_I/slv_reg2 [30]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [30]),
    .O(\USER_LOGIC_I/slv_reg2[30]_Bus2IP_Data[30]_MUX_283_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg1[30]_Bus2IP_Data[30]_MUX_251_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [3]),
    .I1(\USER_LOGIC_I/slv_reg1 [30]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [30]),
    .O(\USER_LOGIC_I/slv_reg1[30]_Bus2IP_Data[30]_MUX_251_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg0[31]_Bus2IP_Data[31]_MUX_220_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [3]),
    .I1(\USER_LOGIC_I/slv_reg0 [31]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [31]),
    .O(\USER_LOGIC_I/slv_reg0[31]_Bus2IP_Data[31]_MUX_220_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg2[29]_Bus2IP_Data[29]_MUX_282_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [3]),
    .I1(\USER_LOGIC_I/slv_reg2 [29]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [29]),
    .O(\USER_LOGIC_I/slv_reg2[29]_Bus2IP_Data[29]_MUX_282_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg1[29]_Bus2IP_Data[29]_MUX_250_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [3]),
    .I1(\USER_LOGIC_I/slv_reg1 [29]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [29]),
    .O(\USER_LOGIC_I/slv_reg1[29]_Bus2IP_Data[29]_MUX_250_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg0[30]_Bus2IP_Data[30]_MUX_219_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [3]),
    .I1(\USER_LOGIC_I/slv_reg0 [30]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [30]),
    .O(\USER_LOGIC_I/slv_reg0[30]_Bus2IP_Data[30]_MUX_219_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg2[28]_Bus2IP_Data[28]_MUX_281_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [3]),
    .I1(\USER_LOGIC_I/slv_reg2 [28]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [28]),
    .O(\USER_LOGIC_I/slv_reg2[28]_Bus2IP_Data[28]_MUX_281_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg1[28]_Bus2IP_Data[28]_MUX_249_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [3]),
    .I1(\USER_LOGIC_I/slv_reg1 [28]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [28]),
    .O(\USER_LOGIC_I/slv_reg1[28]_Bus2IP_Data[28]_MUX_249_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg0[29]_Bus2IP_Data[29]_MUX_218_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [3]),
    .I1(\USER_LOGIC_I/slv_reg0 [29]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [29]),
    .O(\USER_LOGIC_I/slv_reg0[29]_Bus2IP_Data[29]_MUX_218_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg2[27]_Bus2IP_Data[27]_MUX_280_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [3]),
    .I1(\USER_LOGIC_I/slv_reg2 [27]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [27]),
    .O(\USER_LOGIC_I/slv_reg2[27]_Bus2IP_Data[27]_MUX_280_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg1[27]_Bus2IP_Data[27]_MUX_248_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [3]),
    .I1(\USER_LOGIC_I/slv_reg1 [27]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [27]),
    .O(\USER_LOGIC_I/slv_reg1[27]_Bus2IP_Data[27]_MUX_248_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg0[28]_Bus2IP_Data[28]_MUX_217_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [3]),
    .I1(\USER_LOGIC_I/slv_reg0 [28]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [28]),
    .O(\USER_LOGIC_I/slv_reg0[28]_Bus2IP_Data[28]_MUX_217_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg2[26]_Bus2IP_Data[26]_MUX_279_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [3]),
    .I1(\USER_LOGIC_I/slv_reg2 [26]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [26]),
    .O(\USER_LOGIC_I/slv_reg2[26]_Bus2IP_Data[26]_MUX_279_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg1[26]_Bus2IP_Data[26]_MUX_247_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [3]),
    .I1(\USER_LOGIC_I/slv_reg1 [26]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [26]),
    .O(\USER_LOGIC_I/slv_reg1[26]_Bus2IP_Data[26]_MUX_247_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg0[27]_Bus2IP_Data[27]_MUX_216_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [3]),
    .I1(\USER_LOGIC_I/slv_reg0 [27]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [27]),
    .O(\USER_LOGIC_I/slv_reg0[27]_Bus2IP_Data[27]_MUX_216_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg2[25]_Bus2IP_Data[25]_MUX_278_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [3]),
    .I1(\USER_LOGIC_I/slv_reg2 [25]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [25]),
    .O(\USER_LOGIC_I/slv_reg2[25]_Bus2IP_Data[25]_MUX_278_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg1[25]_Bus2IP_Data[25]_MUX_246_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [3]),
    .I1(\USER_LOGIC_I/slv_reg1 [25]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [25]),
    .O(\USER_LOGIC_I/slv_reg1[25]_Bus2IP_Data[25]_MUX_246_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg0[26]_Bus2IP_Data[26]_MUX_215_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [3]),
    .I1(\USER_LOGIC_I/slv_reg0 [26]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [26]),
    .O(\USER_LOGIC_I/slv_reg0[26]_Bus2IP_Data[26]_MUX_215_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg2[24]_Bus2IP_Data[24]_MUX_277_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [3]),
    .I1(\USER_LOGIC_I/slv_reg2 [24]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [24]),
    .O(\USER_LOGIC_I/slv_reg2[24]_Bus2IP_Data[24]_MUX_277_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg1[24]_Bus2IP_Data[24]_MUX_245_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [3]),
    .I1(\USER_LOGIC_I/slv_reg1 [24]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [24]),
    .O(\USER_LOGIC_I/slv_reg1[24]_Bus2IP_Data[24]_MUX_245_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg0[25]_Bus2IP_Data[25]_MUX_214_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [3]),
    .I1(\USER_LOGIC_I/slv_reg0 [25]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [25]),
    .O(\USER_LOGIC_I/slv_reg0[25]_Bus2IP_Data[25]_MUX_214_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg2[23]_Bus2IP_Data[23]_MUX_276_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [2]),
    .I1(\USER_LOGIC_I/slv_reg2 [23]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [23]),
    .O(\USER_LOGIC_I/slv_reg2[23]_Bus2IP_Data[23]_MUX_276_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg1[23]_Bus2IP_Data[23]_MUX_244_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [2]),
    .I1(\USER_LOGIC_I/slv_reg1 [23]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [23]),
    .O(\USER_LOGIC_I/slv_reg1[23]_Bus2IP_Data[23]_MUX_244_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg0[24]_Bus2IP_Data[24]_MUX_213_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [3]),
    .I1(\USER_LOGIC_I/slv_reg0 [24]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [24]),
    .O(\USER_LOGIC_I/slv_reg0[24]_Bus2IP_Data[24]_MUX_213_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg2[22]_Bus2IP_Data[22]_MUX_275_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [2]),
    .I1(\USER_LOGIC_I/slv_reg2 [22]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [22]),
    .O(\USER_LOGIC_I/slv_reg2[22]_Bus2IP_Data[22]_MUX_275_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg1[22]_Bus2IP_Data[22]_MUX_243_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [2]),
    .I1(\USER_LOGIC_I/slv_reg1 [22]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [22]),
    .O(\USER_LOGIC_I/slv_reg1[22]_Bus2IP_Data[22]_MUX_243_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg0[23]_Bus2IP_Data[23]_MUX_212_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [2]),
    .I1(\USER_LOGIC_I/slv_reg0 [23]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [23]),
    .O(\USER_LOGIC_I/slv_reg0[23]_Bus2IP_Data[23]_MUX_212_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg2[21]_Bus2IP_Data[21]_MUX_274_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [2]),
    .I1(\USER_LOGIC_I/slv_reg2 [21]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [21]),
    .O(\USER_LOGIC_I/slv_reg2[21]_Bus2IP_Data[21]_MUX_274_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg1[21]_Bus2IP_Data[21]_MUX_242_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [2]),
    .I1(\USER_LOGIC_I/slv_reg1 [21]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [21]),
    .O(\USER_LOGIC_I/slv_reg1[21]_Bus2IP_Data[21]_MUX_242_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg0[22]_Bus2IP_Data[22]_MUX_211_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [2]),
    .I1(\USER_LOGIC_I/slv_reg0 [22]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [22]),
    .O(\USER_LOGIC_I/slv_reg0[22]_Bus2IP_Data[22]_MUX_211_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg2[20]_Bus2IP_Data[20]_MUX_273_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [2]),
    .I1(\USER_LOGIC_I/slv_reg2 [20]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [20]),
    .O(\USER_LOGIC_I/slv_reg2[20]_Bus2IP_Data[20]_MUX_273_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg1[20]_Bus2IP_Data[20]_MUX_241_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [2]),
    .I1(\USER_LOGIC_I/slv_reg1 [20]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [20]),
    .O(\USER_LOGIC_I/slv_reg1[20]_Bus2IP_Data[20]_MUX_241_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg0[21]_Bus2IP_Data[21]_MUX_210_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [2]),
    .I1(\USER_LOGIC_I/slv_reg0 [21]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [21]),
    .O(\USER_LOGIC_I/slv_reg0[21]_Bus2IP_Data[21]_MUX_210_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg2[19]_Bus2IP_Data[19]_MUX_272_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [2]),
    .I1(\USER_LOGIC_I/slv_reg2 [19]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [19]),
    .O(\USER_LOGIC_I/slv_reg2[19]_Bus2IP_Data[19]_MUX_272_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg1[19]_Bus2IP_Data[19]_MUX_240_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [2]),
    .I1(\USER_LOGIC_I/slv_reg1 [19]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [19]),
    .O(\USER_LOGIC_I/slv_reg1[19]_Bus2IP_Data[19]_MUX_240_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg0[20]_Bus2IP_Data[20]_MUX_209_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [2]),
    .I1(\USER_LOGIC_I/slv_reg0 [20]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [20]),
    .O(\USER_LOGIC_I/slv_reg0[20]_Bus2IP_Data[20]_MUX_209_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg2[18]_Bus2IP_Data[18]_MUX_271_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [2]),
    .I1(\USER_LOGIC_I/slv_reg2 [18]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [18]),
    .O(\USER_LOGIC_I/slv_reg2[18]_Bus2IP_Data[18]_MUX_271_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg1[18]_Bus2IP_Data[18]_MUX_239_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [2]),
    .I1(\USER_LOGIC_I/slv_reg1 [18]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [18]),
    .O(\USER_LOGIC_I/slv_reg1[18]_Bus2IP_Data[18]_MUX_239_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg0[19]_Bus2IP_Data[19]_MUX_208_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [2]),
    .I1(\USER_LOGIC_I/slv_reg0 [19]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [19]),
    .O(\USER_LOGIC_I/slv_reg0[19]_Bus2IP_Data[19]_MUX_208_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg2[17]_Bus2IP_Data[17]_MUX_270_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [2]),
    .I1(\USER_LOGIC_I/slv_reg2 [17]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [17]),
    .O(\USER_LOGIC_I/slv_reg2[17]_Bus2IP_Data[17]_MUX_270_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg1[17]_Bus2IP_Data[17]_MUX_238_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [2]),
    .I1(\USER_LOGIC_I/slv_reg1 [17]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [17]),
    .O(\USER_LOGIC_I/slv_reg1[17]_Bus2IP_Data[17]_MUX_238_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg0[18]_Bus2IP_Data[18]_MUX_207_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [2]),
    .I1(\USER_LOGIC_I/slv_reg0 [18]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [18]),
    .O(\USER_LOGIC_I/slv_reg0[18]_Bus2IP_Data[18]_MUX_207_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg0[17]_Bus2IP_Data[17]_MUX_206_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [2]),
    .I1(\USER_LOGIC_I/slv_reg0 [17]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [17]),
    .O(\USER_LOGIC_I/slv_reg0[17]_Bus2IP_Data[17]_MUX_206_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg2[16]_Bus2IP_Data[16]_MUX_269_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [2]),
    .I1(\USER_LOGIC_I/slv_reg2 [16]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [16]),
    .O(\USER_LOGIC_I/slv_reg2[16]_Bus2IP_Data[16]_MUX_269_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg1[16]_Bus2IP_Data[16]_MUX_237_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [2]),
    .I1(\USER_LOGIC_I/slv_reg1 [16]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [16]),
    .O(\USER_LOGIC_I/slv_reg1[16]_Bus2IP_Data[16]_MUX_237_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg0[16]_Bus2IP_Data[16]_MUX_205_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [2]),
    .I1(\USER_LOGIC_I/slv_reg0 [16]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [16]),
    .O(\USER_LOGIC_I/slv_reg0[16]_Bus2IP_Data[16]_MUX_205_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg1[15]_Bus2IP_Data[15]_MUX_236_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [1]),
    .I1(\USER_LOGIC_I/slv_reg1 [15]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [15]),
    .O(\USER_LOGIC_I/slv_reg1[15]_Bus2IP_Data[15]_MUX_236_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg0[15]_Bus2IP_Data[15]_MUX_204_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [1]),
    .I1(\USER_LOGIC_I/slv_reg0 [15]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [15]),
    .O(\USER_LOGIC_I/slv_reg0[15]_Bus2IP_Data[15]_MUX_204_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg2[15]_Bus2IP_Data[15]_MUX_268_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [1]),
    .I1(\USER_LOGIC_I/slv_reg2 [15]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [15]),
    .O(\USER_LOGIC_I/slv_reg2[15]_Bus2IP_Data[15]_MUX_268_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg1[14]_Bus2IP_Data[14]_MUX_235_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [1]),
    .I1(\USER_LOGIC_I/slv_reg1 [14]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [14]),
    .O(\USER_LOGIC_I/slv_reg1[14]_Bus2IP_Data[14]_MUX_235_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg0[14]_Bus2IP_Data[14]_MUX_203_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [1]),
    .I1(\USER_LOGIC_I/slv_reg0 [14]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [14]),
    .O(\USER_LOGIC_I/slv_reg0[14]_Bus2IP_Data[14]_MUX_203_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg2[14]_Bus2IP_Data[14]_MUX_267_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [1]),
    .I1(\USER_LOGIC_I/slv_reg2 [14]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [14]),
    .O(\USER_LOGIC_I/slv_reg2[14]_Bus2IP_Data[14]_MUX_267_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg1[13]_Bus2IP_Data[13]_MUX_234_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [1]),
    .I1(\USER_LOGIC_I/slv_reg1 [13]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [13]),
    .O(\USER_LOGIC_I/slv_reg1[13]_Bus2IP_Data[13]_MUX_234_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg0[13]_Bus2IP_Data[13]_MUX_202_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [1]),
    .I1(\USER_LOGIC_I/slv_reg0 [13]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [13]),
    .O(\USER_LOGIC_I/slv_reg0[13]_Bus2IP_Data[13]_MUX_202_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg2[13]_Bus2IP_Data[13]_MUX_266_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [1]),
    .I1(\USER_LOGIC_I/slv_reg2 [13]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [13]),
    .O(\USER_LOGIC_I/slv_reg2[13]_Bus2IP_Data[13]_MUX_266_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg1[12]_Bus2IP_Data[12]_MUX_233_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [1]),
    .I1(\USER_LOGIC_I/slv_reg1 [12]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [12]),
    .O(\USER_LOGIC_I/slv_reg1[12]_Bus2IP_Data[12]_MUX_233_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg0[12]_Bus2IP_Data[12]_MUX_201_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [1]),
    .I1(\USER_LOGIC_I/slv_reg0 [12]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [12]),
    .O(\USER_LOGIC_I/slv_reg0[12]_Bus2IP_Data[12]_MUX_201_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg2[12]_Bus2IP_Data[12]_MUX_265_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [1]),
    .I1(\USER_LOGIC_I/slv_reg2 [12]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [12]),
    .O(\USER_LOGIC_I/slv_reg2[12]_Bus2IP_Data[12]_MUX_265_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg1[11]_Bus2IP_Data[11]_MUX_232_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [1]),
    .I1(\USER_LOGIC_I/slv_reg1 [11]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [11]),
    .O(\USER_LOGIC_I/slv_reg1[11]_Bus2IP_Data[11]_MUX_232_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg0[11]_Bus2IP_Data[11]_MUX_200_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [1]),
    .I1(\USER_LOGIC_I/slv_reg0 [11]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [11]),
    .O(\USER_LOGIC_I/slv_reg0[11]_Bus2IP_Data[11]_MUX_200_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg2[11]_Bus2IP_Data[11]_MUX_264_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [1]),
    .I1(\USER_LOGIC_I/slv_reg2 [11]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [11]),
    .O(\USER_LOGIC_I/slv_reg2[11]_Bus2IP_Data[11]_MUX_264_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg1[10]_Bus2IP_Data[10]_MUX_231_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [1]),
    .I1(\USER_LOGIC_I/slv_reg1 [10]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [10]),
    .O(\USER_LOGIC_I/slv_reg1[10]_Bus2IP_Data[10]_MUX_231_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg0[10]_Bus2IP_Data[10]_MUX_199_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [1]),
    .I1(\USER_LOGIC_I/slv_reg0 [10]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [10]),
    .O(\USER_LOGIC_I/slv_reg0[10]_Bus2IP_Data[10]_MUX_199_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg2[10]_Bus2IP_Data[10]_MUX_263_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [1]),
    .I1(\USER_LOGIC_I/slv_reg2 [10]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [10]),
    .O(\USER_LOGIC_I/slv_reg2[10]_Bus2IP_Data[10]_MUX_263_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg1[9]_Bus2IP_Data[9]_MUX_230_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [1]),
    .I1(\USER_LOGIC_I/slv_reg1 [9]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [9]),
    .O(\USER_LOGIC_I/slv_reg1[9]_Bus2IP_Data[9]_MUX_230_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg0[9]_Bus2IP_Data[9]_MUX_198_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [1]),
    .I1(\USER_LOGIC_I/slv_reg0 [9]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [9]),
    .O(\USER_LOGIC_I/slv_reg0[9]_Bus2IP_Data[9]_MUX_198_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg2[9]_Bus2IP_Data[9]_MUX_262_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [1]),
    .I1(\USER_LOGIC_I/slv_reg2 [9]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [9]),
    .O(\USER_LOGIC_I/slv_reg2[9]_Bus2IP_Data[9]_MUX_262_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg1[8]_Bus2IP_Data[8]_MUX_229_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [1]),
    .I1(\USER_LOGIC_I/slv_reg1 [8]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [8]),
    .O(\USER_LOGIC_I/slv_reg1[8]_Bus2IP_Data[8]_MUX_229_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg0[8]_Bus2IP_Data[8]_MUX_197_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [1]),
    .I1(\USER_LOGIC_I/slv_reg0 [8]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [8]),
    .O(\USER_LOGIC_I/slv_reg0[8]_Bus2IP_Data[8]_MUX_197_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg2[8]_Bus2IP_Data[8]_MUX_261_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [1]),
    .I1(\USER_LOGIC_I/slv_reg2 [8]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [8]),
    .O(\USER_LOGIC_I/slv_reg2[8]_Bus2IP_Data[8]_MUX_261_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg1[7]_Bus2IP_Data[7]_MUX_228_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [0]),
    .I1(\USER_LOGIC_I/slv_reg1 [7]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [7]),
    .O(\USER_LOGIC_I/slv_reg1[7]_Bus2IP_Data[7]_MUX_228_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg0[7]_Bus2IP_Data[7]_MUX_196_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [0]),
    .I1(\USER_LOGIC_I/slv_reg0 [7]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [7]),
    .O(\USER_LOGIC_I/slv_reg0[7]_Bus2IP_Data[7]_MUX_196_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg2[7]_Bus2IP_Data[7]_MUX_260_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [0]),
    .I1(\USER_LOGIC_I/slv_reg2 [7]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [7]),
    .O(\USER_LOGIC_I/slv_reg2[7]_Bus2IP_Data[7]_MUX_260_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg1[6]_Bus2IP_Data[6]_MUX_227_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [0]),
    .I1(\USER_LOGIC_I/slv_reg1 [6]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [6]),
    .O(\USER_LOGIC_I/slv_reg1[6]_Bus2IP_Data[6]_MUX_227_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg0[6]_Bus2IP_Data[6]_MUX_195_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [0]),
    .I1(\USER_LOGIC_I/slv_reg0 [6]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [6]),
    .O(\USER_LOGIC_I/slv_reg0[6]_Bus2IP_Data[6]_MUX_195_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg2[6]_Bus2IP_Data[6]_MUX_259_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [0]),
    .I1(\USER_LOGIC_I/slv_reg2 [6]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [6]),
    .O(\USER_LOGIC_I/slv_reg2[6]_Bus2IP_Data[6]_MUX_259_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg1[5]_Bus2IP_Data[5]_MUX_226_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [0]),
    .I1(\USER_LOGIC_I/slv_reg1 [5]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [5]),
    .O(\USER_LOGIC_I/slv_reg1[5]_Bus2IP_Data[5]_MUX_226_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg0[5]_Bus2IP_Data[5]_MUX_194_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [0]),
    .I1(\USER_LOGIC_I/slv_reg0 [5]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [5]),
    .O(\USER_LOGIC_I/slv_reg0[5]_Bus2IP_Data[5]_MUX_194_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg2[5]_Bus2IP_Data[5]_MUX_258_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [0]),
    .I1(\USER_LOGIC_I/slv_reg2 [5]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [5]),
    .O(\USER_LOGIC_I/slv_reg2[5]_Bus2IP_Data[5]_MUX_258_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg1[4]_Bus2IP_Data[4]_MUX_225_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [0]),
    .I1(\USER_LOGIC_I/slv_reg1 [4]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [4]),
    .O(\USER_LOGIC_I/slv_reg1[4]_Bus2IP_Data[4]_MUX_225_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg0[4]_Bus2IP_Data[4]_MUX_193_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [0]),
    .I1(\USER_LOGIC_I/slv_reg0 [4]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [4]),
    .O(\USER_LOGIC_I/slv_reg0[4]_Bus2IP_Data[4]_MUX_193_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg2[4]_Bus2IP_Data[4]_MUX_257_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [0]),
    .I1(\USER_LOGIC_I/slv_reg2 [4]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [4]),
    .O(\USER_LOGIC_I/slv_reg2[4]_Bus2IP_Data[4]_MUX_257_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg1[3]_Bus2IP_Data[3]_MUX_224_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [0]),
    .I1(\USER_LOGIC_I/slv_reg1 [3]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [3]),
    .O(\USER_LOGIC_I/slv_reg1[3]_Bus2IP_Data[3]_MUX_224_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg0[3]_Bus2IP_Data[3]_MUX_192_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [0]),
    .I1(\USER_LOGIC_I/slv_reg0 [3]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [3]),
    .O(\USER_LOGIC_I/slv_reg0[3]_Bus2IP_Data[3]_MUX_192_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg2[3]_Bus2IP_Data[3]_MUX_256_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [0]),
    .I1(\USER_LOGIC_I/slv_reg2 [3]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [3]),
    .O(\USER_LOGIC_I/slv_reg2[3]_Bus2IP_Data[3]_MUX_256_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg1[2]_Bus2IP_Data[2]_MUX_223_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [0]),
    .I1(\USER_LOGIC_I/slv_reg1 [2]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [2]),
    .O(\USER_LOGIC_I/slv_reg1[2]_Bus2IP_Data[2]_MUX_223_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg0[2]_Bus2IP_Data[2]_MUX_191_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [0]),
    .I1(\USER_LOGIC_I/slv_reg0 [2]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [2]),
    .O(\USER_LOGIC_I/slv_reg0[2]_Bus2IP_Data[2]_MUX_191_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg2[2]_Bus2IP_Data[2]_MUX_255_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [0]),
    .I1(\USER_LOGIC_I/slv_reg2 [2]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [2]),
    .O(\USER_LOGIC_I/slv_reg2[2]_Bus2IP_Data[2]_MUX_255_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg1[1]_Bus2IP_Data[1]_MUX_222_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [0]),
    .I1(\USER_LOGIC_I/slv_reg1 [1]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [1]),
    .O(\USER_LOGIC_I/slv_reg1[1]_Bus2IP_Data[1]_MUX_222_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg0[1]_Bus2IP_Data[1]_MUX_190_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [0]),
    .I1(\USER_LOGIC_I/slv_reg0 [1]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [1]),
    .O(\USER_LOGIC_I/slv_reg0[1]_Bus2IP_Data[1]_MUX_190_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg2[1]_Bus2IP_Data[1]_MUX_254_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [0]),
    .I1(\USER_LOGIC_I/slv_reg2 [1]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [1]),
    .O(\USER_LOGIC_I/slv_reg2[1]_Bus2IP_Data[1]_MUX_254_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg2[0]_Bus2IP_Data[0]_MUX_253_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [0]),
    .I1(\USER_LOGIC_I/slv_reg2 [0]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [0]),
    .O(\USER_LOGIC_I/slv_reg2[0]_Bus2IP_Data[0]_MUX_253_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg1[0]_Bus2IP_Data[0]_MUX_221_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [0]),
    .I1(\USER_LOGIC_I/slv_reg1 [0]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [0]),
    .O(\USER_LOGIC_I/slv_reg1[0]_Bus2IP_Data[0]_MUX_221_o )
  );
  LUT3 #(
    .INIT ( 8'hE4 ))
  \USER_LOGIC_I/Mmux_slv_reg0[0]_Bus2IP_Data[0]_MUX_189_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [0]),
    .I1(\USER_LOGIC_I/slv_reg0 [0]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [0]),
    .O(\USER_LOGIC_I/slv_reg0[0]_Bus2IP_Data[0]_MUX_189_o )
  );
  LUT5 #(
    .INIT ( 32'h00010000 ))
  \USER_LOGIC_I/PWR_41_o_slv_reg_write_sel[0]_equal_3_o<0>1  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i[1] ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i[2] ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i[3] ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i[4] ),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i[0] ),
    .O(\USER_LOGIC_I/PWR_41_o_slv_reg_write_sel[0]_equal_3_o )
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Mmux_sl_mbusy_i[0]_PWR_13_o_MUX_135_o1_SW0  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[1] ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[0] ),
    .O(N16)
  );
  LUT6 #(
    .INIT ( 64'h44F4444444444444 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Mmux_sl_mbusy_i[0]_PWR_13_o_MUX_135_o1  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Bus_Reset_clear_sl_busy_OR_56_o ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i [7]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_addrack_i_166 ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[31] ),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[2] ),
    .I5(N16),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i[0]_PWR_13_o_MUX_135_o )
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Mmux_sl_mbusy_i[0]_GND_13_o_mux_44_OUT1_SW0  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[0] ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[1] ),
    .O(N18)
  );
  LUT6 #(
    .INIT ( 64'h5555555504000000 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Mmux_sl_mbusy_i[0]_GND_13_o_mux_44_OUT1  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Bus_Reset_clear_sl_busy_OR_56_o ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_addrack_i_166 ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[31] ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[2] ),
    .I4(N18),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i [6]),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i[0]_GND_13_o_mux_44_OUT<1> )
  );
  LUT2 #(
    .INIT ( 4'h4 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Mmux_sl_mbusy_i[0]_GND_13_o_mux_44_OUT2_SW0  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[1] ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[0] ),
    .O(N20)
  );
  LUT6 #(
    .INIT ( 64'h5555555504000000 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Mmux_sl_mbusy_i[0]_GND_13_o_mux_44_OUT2  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Bus_Reset_clear_sl_busy_OR_56_o ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_addrack_i_166 ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[31] ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[2] ),
    .I4(N20),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i [5]),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i[0]_GND_13_o_mux_44_OUT<2> )
  );
  LUT2 #(
    .INIT ( 4'h1 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Mmux_sl_mbusy_i[0]_GND_13_o_mux_44_OUT3_SW0  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[1] ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[0] ),
    .O(N22)
  );
  LUT6 #(
    .INIT ( 64'h5555555504000000 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Mmux_sl_mbusy_i[0]_GND_13_o_mux_44_OUT3  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Bus_Reset_clear_sl_busy_OR_56_o ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_addrack_i_166 ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[31] ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[2] ),
    .I4(N22),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i [4]),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i[0]_GND_13_o_mux_44_OUT<3> )
  );
  LUT6 #(
    .INIT ( 64'h5555555500040000 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Mmux_sl_mbusy_i[0]_GND_13_o_mux_44_OUT4  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Bus_Reset_clear_sl_busy_OR_56_o ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_addrack_i_166 ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[31] ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[2] ),
    .I4(N16),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i [3]),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i[0]_GND_13_o_mux_44_OUT<4> )
  );
  LUT6 #(
    .INIT ( 64'h5555555500040000 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Mmux_sl_mbusy_i[0]_GND_13_o_mux_44_OUT5  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Bus_Reset_clear_sl_busy_OR_56_o ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_addrack_i_166 ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[31] ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[2] ),
    .I4(N18),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i [2]),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i[0]_GND_13_o_mux_44_OUT<5> )
  );
  LUT6 #(
    .INIT ( 64'h5555555500040000 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Mmux_sl_mbusy_i[0]_GND_13_o_mux_44_OUT6  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Bus_Reset_clear_sl_busy_OR_56_o ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_addrack_i_166 ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[31] ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[2] ),
    .I4(N20),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i [1]),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i[0]_GND_13_o_mux_44_OUT<6> )
  );
  LUT6 #(
    .INIT ( 64'h5555555500040000 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Mmux_sl_mbusy_i[0]_GND_13_o_mux_44_OUT7  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Bus_Reset_clear_sl_busy_OR_56_o ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_addrack_i_166 ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[31] ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[2] ),
    .I4(N22),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i [0]),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i[0]_GND_13_o_mux_44_OUT<7> )
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/valid_request_address_match_early_AND_6_o_SW0  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_size_reg [3]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_size_reg [2]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_size_reg [1]),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_size_reg [0]),
    .O(N32)
  );
  LUT2 #(
    .INIT ( 4'h8 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_rdack_i_SW0  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/data_timeout_216 ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_rnw_i_206 ),
    .O(N34)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_rdack_i  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [1]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [0]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [4]),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [3]),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [2]),
    .I5(N34),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_rdack_i_204 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i2  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i[3] ),
    .I1(\SOFT_RESET_I/wrack ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i[1] ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i[2] ),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i[4] ),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i[0] ),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i2_491 )
  );
  LUT4 #(
    .INIT ( 16'hFFF2 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i3  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/data_timeout_216 ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_rnw_i_206 ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i2_491 ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i1 ),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i )
  );
  LUT6 #(
    .INIT ( 64'h8000000000000000 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/MEM_DECODE_GEN[0].GEN_PLB_SHARED.MEM_SELECT_I/Mmux_CS11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [16]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [17]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [14]),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [15]),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [12]),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [13]),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/MEM_DECODE_GEN[0].GEN_PLB_SHARED.MEM_SELECT_I/Mmux_CS1 )
  );
  LUT6 #(
    .INIT ( 64'h8000000000000000 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/MEM_DECODE_GEN[0].GEN_PLB_SHARED.MEM_SELECT_I/Mmux_CS12  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [22]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [23]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [20]),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [21]),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [18]),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [19]),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/MEM_DECODE_GEN[0].GEN_PLB_SHARED.MEM_SELECT_I/Mmux_CS11_493 )
  );
  LUT6 #(
    .INIT ( 64'h8000000000000000 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/MEM_DECODE_GEN[0].GEN_PLB_SHARED.MEM_SELECT_I/Mmux_CS13  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [10]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [11]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [8]),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [9]),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [6]),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [7]),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/MEM_DECODE_GEN[0].GEN_PLB_SHARED.MEM_SELECT_I/Mmux_CS12_494 )
  );
  LUT5 #(
    .INIT ( 32'h80000000 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/MEM_DECODE_GEN[0].GEN_PLB_SHARED.MEM_SELECT_I/Mmux_CS14  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [2]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [3]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_pavalid_reg_208 ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [0]),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [1]),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/MEM_DECODE_GEN[0].GEN_PLB_SHARED.MEM_SELECT_I/Mmux_CS13_495 )
  );
  LUT6 #(
    .INIT ( 64'h8000000000000000 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/MEM_DECODE_GEN[0].GEN_PLB_SHARED.MEM_SELECT_I/Mmux_CS16  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [25]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [24]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [26]),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [27]),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [29]),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [28]),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/MEM_DECODE_GEN[0].GEN_PLB_SHARED.MEM_SELECT_I/Mmux_CS15 )
  );
  IBUF   PLB_ABus_0_IBUF (
    .I(PLB_ABus[0]),
    .O(PLB_ABus_0_IBUF_0)
  );
  IBUF   PLB_ABus_1_IBUF (
    .I(PLB_ABus[1]),
    .O(PLB_ABus_1_IBUF_1)
  );
  IBUF   PLB_ABus_2_IBUF (
    .I(PLB_ABus[2]),
    .O(PLB_ABus_2_IBUF_2)
  );
  IBUF   PLB_ABus_3_IBUF (
    .I(PLB_ABus[3]),
    .O(PLB_ABus_3_IBUF_3)
  );
  IBUF   PLB_ABus_4_IBUF (
    .I(PLB_ABus[4]),
    .O(PLB_ABus_4_IBUF_4)
  );
  IBUF   PLB_ABus_5_IBUF (
    .I(PLB_ABus[5]),
    .O(PLB_ABus_5_IBUF_5)
  );
  IBUF   PLB_ABus_6_IBUF (
    .I(PLB_ABus[6]),
    .O(PLB_ABus_6_IBUF_6)
  );
  IBUF   PLB_ABus_7_IBUF (
    .I(PLB_ABus[7]),
    .O(PLB_ABus_7_IBUF_7)
  );
  IBUF   PLB_ABus_8_IBUF (
    .I(PLB_ABus[8]),
    .O(PLB_ABus_8_IBUF_8)
  );
  IBUF   PLB_ABus_9_IBUF (
    .I(PLB_ABus[9]),
    .O(PLB_ABus_9_IBUF_9)
  );
  IBUF   PLB_ABus_10_IBUF (
    .I(PLB_ABus[10]),
    .O(PLB_ABus_10_IBUF_10)
  );
  IBUF   PLB_ABus_11_IBUF (
    .I(PLB_ABus[11]),
    .O(PLB_ABus_11_IBUF_11)
  );
  IBUF   PLB_ABus_12_IBUF (
    .I(PLB_ABus[12]),
    .O(PLB_ABus_12_IBUF_12)
  );
  IBUF   PLB_ABus_13_IBUF (
    .I(PLB_ABus[13]),
    .O(PLB_ABus_13_IBUF_13)
  );
  IBUF   PLB_ABus_14_IBUF (
    .I(PLB_ABus[14]),
    .O(PLB_ABus_14_IBUF_14)
  );
  IBUF   PLB_ABus_15_IBUF (
    .I(PLB_ABus[15]),
    .O(PLB_ABus_15_IBUF_15)
  );
  IBUF   PLB_ABus_16_IBUF (
    .I(PLB_ABus[16]),
    .O(PLB_ABus_16_IBUF_16)
  );
  IBUF   PLB_ABus_17_IBUF (
    .I(PLB_ABus[17]),
    .O(PLB_ABus_17_IBUF_17)
  );
  IBUF   PLB_ABus_18_IBUF (
    .I(PLB_ABus[18]),
    .O(PLB_ABus_18_IBUF_18)
  );
  IBUF   PLB_ABus_19_IBUF (
    .I(PLB_ABus[19]),
    .O(PLB_ABus_19_IBUF_19)
  );
  IBUF   PLB_ABus_20_IBUF (
    .I(PLB_ABus[20]),
    .O(PLB_ABus_20_IBUF_20)
  );
  IBUF   PLB_ABus_21_IBUF (
    .I(PLB_ABus[21]),
    .O(PLB_ABus_21_IBUF_21)
  );
  IBUF   PLB_ABus_22_IBUF (
    .I(PLB_ABus[22]),
    .O(PLB_ABus_22_IBUF_22)
  );
  IBUF   PLB_ABus_23_IBUF (
    .I(PLB_ABus[23]),
    .O(PLB_ABus_23_IBUF_23)
  );
  IBUF   PLB_ABus_24_IBUF (
    .I(PLB_ABus[24]),
    .O(PLB_ABus_24_IBUF_24)
  );
  IBUF   PLB_ABus_25_IBUF (
    .I(PLB_ABus[25]),
    .O(PLB_ABus_25_IBUF_25)
  );
  IBUF   PLB_ABus_26_IBUF (
    .I(PLB_ABus[26]),
    .O(PLB_ABus_26_IBUF_26)
  );
  IBUF   PLB_ABus_27_IBUF (
    .I(PLB_ABus[27]),
    .O(PLB_ABus_27_IBUF_27)
  );
  IBUF   PLB_ABus_28_IBUF (
    .I(PLB_ABus[28]),
    .O(PLB_ABus_28_IBUF_28)
  );
  IBUF   PLB_ABus_29_IBUF (
    .I(PLB_ABus[29]),
    .O(PLB_ABus_29_IBUF_29)
  );
  IBUF   PLB_ABus_30_IBUF (
    .I(PLB_ABus[30]),
    .O(PLB_ABus_30_IBUF_30)
  );
  IBUF   PLB_ABus_31_IBUF (
    .I(PLB_ABus[31]),
    .O(PLB_ABus_31_IBUF_31)
  );
  IBUF   PLB_masterID_0_IBUF (
    .I(PLB_masterID[0]),
    .O(PLB_masterID_0_IBUF_32)
  );
  IBUF   PLB_masterID_1_IBUF (
    .I(PLB_masterID[1]),
    .O(PLB_masterID_1_IBUF_33)
  );
  IBUF   PLB_masterID_2_IBUF (
    .I(PLB_masterID[2]),
    .O(PLB_masterID_2_IBUF_34)
  );
  IBUF   PLB_BE_0_IBUF (
    .I(PLB_BE[0]),
    .O(PLB_BE_0_IBUF_35)
  );
  IBUF   PLB_BE_1_IBUF (
    .I(PLB_BE[1]),
    .O(PLB_BE_1_IBUF_36)
  );
  IBUF   PLB_BE_2_IBUF (
    .I(PLB_BE[2]),
    .O(PLB_BE_2_IBUF_37)
  );
  IBUF   PLB_BE_3_IBUF (
    .I(PLB_BE[3]),
    .O(PLB_BE_3_IBUF_38)
  );
  IBUF   PLB_BE_4_IBUF (
    .I(PLB_BE[4]),
    .O(PLB_BE_4_IBUF_39)
  );
  IBUF   PLB_BE_5_IBUF (
    .I(PLB_BE[5]),
    .O(PLB_BE_5_IBUF_40)
  );
  IBUF   PLB_BE_6_IBUF (
    .I(PLB_BE[6]),
    .O(PLB_BE_6_IBUF_41)
  );
  IBUF   PLB_BE_7_IBUF (
    .I(PLB_BE[7]),
    .O(PLB_BE_7_IBUF_42)
  );
  IBUF   PLB_BE_8_IBUF (
    .I(PLB_BE[8]),
    .O(PLB_BE_8_IBUF_43)
  );
  IBUF   PLB_BE_9_IBUF (
    .I(PLB_BE[9]),
    .O(PLB_BE_9_IBUF_44)
  );
  IBUF   PLB_BE_10_IBUF (
    .I(PLB_BE[10]),
    .O(PLB_BE_10_IBUF_45)
  );
  IBUF   PLB_BE_11_IBUF (
    .I(PLB_BE[11]),
    .O(PLB_BE_11_IBUF_46)
  );
  IBUF   PLB_BE_12_IBUF (
    .I(PLB_BE[12]),
    .O(PLB_BE_12_IBUF_47)
  );
  IBUF   PLB_BE_13_IBUF (
    .I(PLB_BE[13]),
    .O(PLB_BE_13_IBUF_48)
  );
  IBUF   PLB_BE_14_IBUF (
    .I(PLB_BE[14]),
    .O(PLB_BE_14_IBUF_49)
  );
  IBUF   PLB_BE_15_IBUF (
    .I(PLB_BE[15]),
    .O(PLB_BE_15_IBUF_50)
  );
  IBUF   PLB_size_0_IBUF (
    .I(PLB_size[0]),
    .O(PLB_size_0_IBUF_51)
  );
  IBUF   PLB_size_1_IBUF (
    .I(PLB_size[1]),
    .O(PLB_size_1_IBUF_52)
  );
  IBUF   PLB_size_2_IBUF (
    .I(PLB_size[2]),
    .O(PLB_size_2_IBUF_53)
  );
  IBUF   PLB_size_3_IBUF (
    .I(PLB_size[3]),
    .O(PLB_size_3_IBUF_54)
  );
  IBUF   PLB_type_0_IBUF (
    .I(PLB_type[0]),
    .O(PLB_type_0_IBUF_55)
  );
  IBUF   PLB_type_1_IBUF (
    .I(PLB_type[1]),
    .O(PLB_type_1_IBUF_56)
  );
  IBUF   PLB_type_2_IBUF (
    .I(PLB_type[2]),
    .O(PLB_type_2_IBUF_57)
  );
  IBUF   PLB_wrDBus_0_IBUF (
    .I(PLB_wrDBus[0]),
    .O(PLB_wrDBus_0_IBUF_58)
  );
  IBUF   PLB_wrDBus_1_IBUF (
    .I(PLB_wrDBus[1]),
    .O(PLB_wrDBus_1_IBUF_59)
  );
  IBUF   PLB_wrDBus_2_IBUF (
    .I(PLB_wrDBus[2]),
    .O(PLB_wrDBus_2_IBUF_60)
  );
  IBUF   PLB_wrDBus_3_IBUF (
    .I(PLB_wrDBus[3]),
    .O(PLB_wrDBus_3_IBUF_61)
  );
  IBUF   PLB_wrDBus_4_IBUF (
    .I(PLB_wrDBus[4]),
    .O(PLB_wrDBus_4_IBUF_62)
  );
  IBUF   PLB_wrDBus_5_IBUF (
    .I(PLB_wrDBus[5]),
    .O(PLB_wrDBus_5_IBUF_63)
  );
  IBUF   PLB_wrDBus_6_IBUF (
    .I(PLB_wrDBus[6]),
    .O(PLB_wrDBus_6_IBUF_64)
  );
  IBUF   PLB_wrDBus_7_IBUF (
    .I(PLB_wrDBus[7]),
    .O(PLB_wrDBus_7_IBUF_65)
  );
  IBUF   PLB_wrDBus_8_IBUF (
    .I(PLB_wrDBus[8]),
    .O(PLB_wrDBus_8_IBUF_66)
  );
  IBUF   PLB_wrDBus_9_IBUF (
    .I(PLB_wrDBus[9]),
    .O(PLB_wrDBus_9_IBUF_67)
  );
  IBUF   PLB_wrDBus_10_IBUF (
    .I(PLB_wrDBus[10]),
    .O(PLB_wrDBus_10_IBUF_68)
  );
  IBUF   PLB_wrDBus_11_IBUF (
    .I(PLB_wrDBus[11]),
    .O(PLB_wrDBus_11_IBUF_69)
  );
  IBUF   PLB_wrDBus_12_IBUF (
    .I(PLB_wrDBus[12]),
    .O(PLB_wrDBus_12_IBUF_70)
  );
  IBUF   PLB_wrDBus_13_IBUF (
    .I(PLB_wrDBus[13]),
    .O(PLB_wrDBus_13_IBUF_71)
  );
  IBUF   PLB_wrDBus_14_IBUF (
    .I(PLB_wrDBus[14]),
    .O(PLB_wrDBus_14_IBUF_72)
  );
  IBUF   PLB_wrDBus_15_IBUF (
    .I(PLB_wrDBus[15]),
    .O(PLB_wrDBus_15_IBUF_73)
  );
  IBUF   PLB_wrDBus_16_IBUF (
    .I(PLB_wrDBus[16]),
    .O(PLB_wrDBus_16_IBUF_74)
  );
  IBUF   PLB_wrDBus_17_IBUF (
    .I(PLB_wrDBus[17]),
    .O(PLB_wrDBus_17_IBUF_75)
  );
  IBUF   PLB_wrDBus_18_IBUF (
    .I(PLB_wrDBus[18]),
    .O(PLB_wrDBus_18_IBUF_76)
  );
  IBUF   PLB_wrDBus_19_IBUF (
    .I(PLB_wrDBus[19]),
    .O(PLB_wrDBus_19_IBUF_77)
  );
  IBUF   PLB_wrDBus_20_IBUF (
    .I(PLB_wrDBus[20]),
    .O(PLB_wrDBus_20_IBUF_78)
  );
  IBUF   PLB_wrDBus_21_IBUF (
    .I(PLB_wrDBus[21]),
    .O(PLB_wrDBus_21_IBUF_79)
  );
  IBUF   PLB_wrDBus_22_IBUF (
    .I(PLB_wrDBus[22]),
    .O(PLB_wrDBus_22_IBUF_80)
  );
  IBUF   PLB_wrDBus_23_IBUF (
    .I(PLB_wrDBus[23]),
    .O(PLB_wrDBus_23_IBUF_81)
  );
  IBUF   PLB_wrDBus_24_IBUF (
    .I(PLB_wrDBus[24]),
    .O(PLB_wrDBus_24_IBUF_82)
  );
  IBUF   PLB_wrDBus_25_IBUF (
    .I(PLB_wrDBus[25]),
    .O(PLB_wrDBus_25_IBUF_83)
  );
  IBUF   PLB_wrDBus_26_IBUF (
    .I(PLB_wrDBus[26]),
    .O(PLB_wrDBus_26_IBUF_84)
  );
  IBUF   PLB_wrDBus_27_IBUF (
    .I(PLB_wrDBus[27]),
    .O(PLB_wrDBus_27_IBUF_85)
  );
  IBUF   PLB_wrDBus_28_IBUF (
    .I(PLB_wrDBus[28]),
    .O(PLB_wrDBus_28_IBUF_86)
  );
  IBUF   PLB_wrDBus_29_IBUF (
    .I(PLB_wrDBus[29]),
    .O(PLB_wrDBus_29_IBUF_87)
  );
  IBUF   PLB_wrDBus_30_IBUF (
    .I(PLB_wrDBus[30]),
    .O(PLB_wrDBus_30_IBUF_88)
  );
  IBUF   PLB_wrDBus_31_IBUF (
    .I(PLB_wrDBus[31]),
    .O(PLB_wrDBus_31_IBUF_89)
  );
  IBUF   SPLB_Rst_IBUF (
    .I(SPLB_Rst),
    .O(SPLB_Rst_IBUF_91)
  );
  IBUF   PLB_PAValid_IBUF (
    .I(PLB_PAValid),
    .O(PLB_PAValid_IBUF_92)
  );
  IBUF   PLB_RNW_IBUF (
    .I(PLB_RNW),
    .O(PLB_RNW_IBUF_93)
  );
  OBUF   Sl_SSize_0_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_SSize[0])
  );
  OBUF   Sl_SSize_1_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_SSize[1])
  );
  OBUF   Sl_rdDBus_0_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[0])
  );
  OBUF   Sl_rdDBus_1_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[1])
  );
  OBUF   Sl_rdDBus_2_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[2])
  );
  OBUF   Sl_rdDBus_3_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[3])
  );
  OBUF   Sl_rdDBus_4_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[4])
  );
  OBUF   Sl_rdDBus_5_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[5])
  );
  OBUF   Sl_rdDBus_6_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[6])
  );
  OBUF   Sl_rdDBus_7_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[7])
  );
  OBUF   Sl_rdDBus_8_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[8])
  );
  OBUF   Sl_rdDBus_9_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[9])
  );
  OBUF   Sl_rdDBus_10_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[10])
  );
  OBUF   Sl_rdDBus_11_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[11])
  );
  OBUF   Sl_rdDBus_12_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[12])
  );
  OBUF   Sl_rdDBus_13_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[13])
  );
  OBUF   Sl_rdDBus_14_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[14])
  );
  OBUF   Sl_rdDBus_15_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[15])
  );
  OBUF   Sl_rdDBus_16_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[16])
  );
  OBUF   Sl_rdDBus_17_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[17])
  );
  OBUF   Sl_rdDBus_18_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[18])
  );
  OBUF   Sl_rdDBus_19_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[19])
  );
  OBUF   Sl_rdDBus_20_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[20])
  );
  OBUF   Sl_rdDBus_21_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[21])
  );
  OBUF   Sl_rdDBus_22_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[22])
  );
  OBUF   Sl_rdDBus_23_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[23])
  );
  OBUF   Sl_rdDBus_24_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[24])
  );
  OBUF   Sl_rdDBus_25_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[25])
  );
  OBUF   Sl_rdDBus_26_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[26])
  );
  OBUF   Sl_rdDBus_27_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[27])
  );
  OBUF   Sl_rdDBus_28_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[28])
  );
  OBUF   Sl_rdDBus_29_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[29])
  );
  OBUF   Sl_rdDBus_30_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[30])
  );
  OBUF   Sl_rdDBus_31_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[31])
  );
  OBUF   Sl_rdDBus_32_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[32])
  );
  OBUF   Sl_rdDBus_33_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[33])
  );
  OBUF   Sl_rdDBus_34_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[34])
  );
  OBUF   Sl_rdDBus_35_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[35])
  );
  OBUF   Sl_rdDBus_36_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[36])
  );
  OBUF   Sl_rdDBus_37_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[37])
  );
  OBUF   Sl_rdDBus_38_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[38])
  );
  OBUF   Sl_rdDBus_39_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[39])
  );
  OBUF   Sl_rdDBus_40_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[40])
  );
  OBUF   Sl_rdDBus_41_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[41])
  );
  OBUF   Sl_rdDBus_42_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[42])
  );
  OBUF   Sl_rdDBus_43_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[43])
  );
  OBUF   Sl_rdDBus_44_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[44])
  );
  OBUF   Sl_rdDBus_45_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[45])
  );
  OBUF   Sl_rdDBus_46_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[46])
  );
  OBUF   Sl_rdDBus_47_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[47])
  );
  OBUF   Sl_rdDBus_48_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[48])
  );
  OBUF   Sl_rdDBus_49_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[49])
  );
  OBUF   Sl_rdDBus_50_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[50])
  );
  OBUF   Sl_rdDBus_51_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[51])
  );
  OBUF   Sl_rdDBus_52_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[52])
  );
  OBUF   Sl_rdDBus_53_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[53])
  );
  OBUF   Sl_rdDBus_54_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[54])
  );
  OBUF   Sl_rdDBus_55_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[55])
  );
  OBUF   Sl_rdDBus_56_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[56])
  );
  OBUF   Sl_rdDBus_57_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[57])
  );
  OBUF   Sl_rdDBus_58_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[58])
  );
  OBUF   Sl_rdDBus_59_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[59])
  );
  OBUF   Sl_rdDBus_60_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[60])
  );
  OBUF   Sl_rdDBus_61_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[61])
  );
  OBUF   Sl_rdDBus_62_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[62])
  );
  OBUF   Sl_rdDBus_63_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[63])
  );
  OBUF   Sl_rdDBus_64_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[64])
  );
  OBUF   Sl_rdDBus_65_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[65])
  );
  OBUF   Sl_rdDBus_66_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[66])
  );
  OBUF   Sl_rdDBus_67_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[67])
  );
  OBUF   Sl_rdDBus_68_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[68])
  );
  OBUF   Sl_rdDBus_69_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[69])
  );
  OBUF   Sl_rdDBus_70_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[70])
  );
  OBUF   Sl_rdDBus_71_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[71])
  );
  OBUF   Sl_rdDBus_72_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[72])
  );
  OBUF   Sl_rdDBus_73_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[73])
  );
  OBUF   Sl_rdDBus_74_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[74])
  );
  OBUF   Sl_rdDBus_75_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[75])
  );
  OBUF   Sl_rdDBus_76_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[76])
  );
  OBUF   Sl_rdDBus_77_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[77])
  );
  OBUF   Sl_rdDBus_78_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[78])
  );
  OBUF   Sl_rdDBus_79_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[79])
  );
  OBUF   Sl_rdDBus_80_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[80])
  );
  OBUF   Sl_rdDBus_81_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[81])
  );
  OBUF   Sl_rdDBus_82_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[82])
  );
  OBUF   Sl_rdDBus_83_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[83])
  );
  OBUF   Sl_rdDBus_84_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[84])
  );
  OBUF   Sl_rdDBus_85_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[85])
  );
  OBUF   Sl_rdDBus_86_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[86])
  );
  OBUF   Sl_rdDBus_87_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[87])
  );
  OBUF   Sl_rdDBus_88_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[88])
  );
  OBUF   Sl_rdDBus_89_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[89])
  );
  OBUF   Sl_rdDBus_90_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[90])
  );
  OBUF   Sl_rdDBus_91_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[91])
  );
  OBUF   Sl_rdDBus_92_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[92])
  );
  OBUF   Sl_rdDBus_93_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[93])
  );
  OBUF   Sl_rdDBus_94_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[94])
  );
  OBUF   Sl_rdDBus_95_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[95])
  );
  OBUF   Sl_rdDBus_96_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[96])
  );
  OBUF   Sl_rdDBus_97_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[97])
  );
  OBUF   Sl_rdDBus_98_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[98])
  );
  OBUF   Sl_rdDBus_99_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[99])
  );
  OBUF   Sl_rdDBus_100_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[100])
  );
  OBUF   Sl_rdDBus_101_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[101])
  );
  OBUF   Sl_rdDBus_102_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[102])
  );
  OBUF   Sl_rdDBus_103_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[103])
  );
  OBUF   Sl_rdDBus_104_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[104])
  );
  OBUF   Sl_rdDBus_105_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[105])
  );
  OBUF   Sl_rdDBus_106_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[106])
  );
  OBUF   Sl_rdDBus_107_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[107])
  );
  OBUF   Sl_rdDBus_108_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[108])
  );
  OBUF   Sl_rdDBus_109_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[109])
  );
  OBUF   Sl_rdDBus_110_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[110])
  );
  OBUF   Sl_rdDBus_111_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[111])
  );
  OBUF   Sl_rdDBus_112_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[112])
  );
  OBUF   Sl_rdDBus_113_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[113])
  );
  OBUF   Sl_rdDBus_114_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[114])
  );
  OBUF   Sl_rdDBus_115_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[115])
  );
  OBUF   Sl_rdDBus_116_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[116])
  );
  OBUF   Sl_rdDBus_117_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[117])
  );
  OBUF   Sl_rdDBus_118_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[118])
  );
  OBUF   Sl_rdDBus_119_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[119])
  );
  OBUF   Sl_rdDBus_120_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[120])
  );
  OBUF   Sl_rdDBus_121_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[121])
  );
  OBUF   Sl_rdDBus_122_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[122])
  );
  OBUF   Sl_rdDBus_123_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[123])
  );
  OBUF   Sl_rdDBus_124_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[124])
  );
  OBUF   Sl_rdDBus_125_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[125])
  );
  OBUF   Sl_rdDBus_126_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[126])
  );
  OBUF   Sl_rdDBus_127_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdDBus[127])
  );
  OBUF   Sl_rdWdAddr_0_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdWdAddr[0])
  );
  OBUF   Sl_rdWdAddr_1_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdWdAddr[1])
  );
  OBUF   Sl_rdWdAddr_2_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdWdAddr[2])
  );
  OBUF   Sl_rdWdAddr_3_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdWdAddr[3])
  );
  OBUF   Sl_MBusy_0_OBUF (
    .I(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i [0]),
    .O(Sl_MBusy[0])
  );
  OBUF   Sl_MBusy_1_OBUF (
    .I(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i [1]),
    .O(Sl_MBusy[1])
  );
  OBUF   Sl_MBusy_2_OBUF (
    .I(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i [2]),
    .O(Sl_MBusy[2])
  );
  OBUF   Sl_MBusy_3_OBUF (
    .I(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i [3]),
    .O(Sl_MBusy[3])
  );
  OBUF   Sl_MBusy_4_OBUF (
    .I(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i [4]),
    .O(Sl_MBusy[4])
  );
  OBUF   Sl_MBusy_5_OBUF (
    .I(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i [5]),
    .O(Sl_MBusy[5])
  );
  OBUF   Sl_MBusy_6_OBUF (
    .I(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i [6]),
    .O(Sl_MBusy[6])
  );
  OBUF   Sl_MBusy_7_OBUF (
    .I(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mbusy_i [7]),
    .O(Sl_MBusy[7])
  );
  OBUF   Sl_MWrErr_0_OBUF (
    .I(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mwrerr_i [0]),
    .O(Sl_MWrErr[0])
  );
  OBUF   Sl_MWrErr_1_OBUF (
    .I(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mwrerr_i [1]),
    .O(Sl_MWrErr[1])
  );
  OBUF   Sl_MWrErr_2_OBUF (
    .I(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mwrerr_i [2]),
    .O(Sl_MWrErr[2])
  );
  OBUF   Sl_MWrErr_3_OBUF (
    .I(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mwrerr_i [3]),
    .O(Sl_MWrErr[3])
  );
  OBUF   Sl_MWrErr_4_OBUF (
    .I(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mwrerr_i [4]),
    .O(Sl_MWrErr[4])
  );
  OBUF   Sl_MWrErr_5_OBUF (
    .I(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mwrerr_i [5]),
    .O(Sl_MWrErr[5])
  );
  OBUF   Sl_MWrErr_6_OBUF (
    .I(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mwrerr_i [6]),
    .O(Sl_MWrErr[6])
  );
  OBUF   Sl_MWrErr_7_OBUF (
    .I(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mwrerr_i [7]),
    .O(Sl_MWrErr[7])
  );
  OBUF   Sl_MRdErr_0_OBUF (
    .I(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mrderr_i [0]),
    .O(Sl_MRdErr[0])
  );
  OBUF   Sl_MRdErr_1_OBUF (
    .I(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mrderr_i [1]),
    .O(Sl_MRdErr[1])
  );
  OBUF   Sl_MRdErr_2_OBUF (
    .I(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mrderr_i [2]),
    .O(Sl_MRdErr[2])
  );
  OBUF   Sl_MRdErr_3_OBUF (
    .I(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mrderr_i [3]),
    .O(Sl_MRdErr[3])
  );
  OBUF   Sl_MRdErr_4_OBUF (
    .I(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mrderr_i [4]),
    .O(Sl_MRdErr[4])
  );
  OBUF   Sl_MRdErr_5_OBUF (
    .I(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mrderr_i [5]),
    .O(Sl_MRdErr[5])
  );
  OBUF   Sl_MRdErr_6_OBUF (
    .I(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mrderr_i [6]),
    .O(Sl_MRdErr[6])
  );
  OBUF   Sl_MRdErr_7_OBUF (
    .I(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_mrderr_i [7]),
    .O(Sl_MRdErr[7])
  );
  OBUF   Sl_MIRQ_0_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_MIRQ[0])
  );
  OBUF   Sl_MIRQ_1_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_MIRQ[1])
  );
  OBUF   Sl_MIRQ_2_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_MIRQ[2])
  );
  OBUF   Sl_MIRQ_3_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_MIRQ[3])
  );
  OBUF   Sl_MIRQ_4_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_MIRQ[4])
  );
  OBUF   Sl_MIRQ_5_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_MIRQ[5])
  );
  OBUF   Sl_MIRQ_6_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_MIRQ[6])
  );
  OBUF   Sl_MIRQ_7_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_MIRQ[7])
  );
  OBUF   Sl_addrAck_OBUF (
    .I(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_addrack_i_166 ),
    .O(Sl_addrAck)
  );
  OBUF   Sl_wait_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_wait)
  );
  OBUF   Sl_rearbitrate_OBUF (
    .I(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_rearbitrate_i_167 ),
    .O(Sl_rearbitrate)
  );
  OBUF   Sl_wrDAck_OBUF (
    .I(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_wrdack_i_168 ),
    .O(Sl_wrDAck)
  );
  OBUF   Sl_wrComp_OBUF (
    .I(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_wrdack_i_168 ),
    .O(Sl_wrComp)
  );
  OBUF   Sl_wrBTerm_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_wrBTerm)
  );
  OBUF   Sl_rdDAck_OBUF (
    .I(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/rd_clear_sl_busy_169 ),
    .O(Sl_rdDAck)
  );
  OBUF   Sl_rdComp_OBUF (
    .I(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/rd_clear_sl_busy_169 ),
    .O(Sl_rdComp)
  );
  OBUF   Sl_rdBTerm_OBUF (
    .I(Sl_rdDBus_0_OBUF_94),
    .O(Sl_rdBTerm)
  );
  FDR   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_busy  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_busy_glue_set_766 ),
    .R(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Bus_Reset_clear_sl_busy_OR_56_o ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_busy_207 )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_busy_glue_set  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_busy_207 ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_addrack_i_166 ),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_busy_glue_set_766 )
  );
  FD #(
    .INIT ( 1'b1 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id_31  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id_31_glue_rst_767 ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[31] )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \SOFT_RESET_I/FF_WRACK  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\SOFT_RESET_I/wrack_ff_chain ),
    .R(SPLB_Rst_IBUF_91),
    .Q(\SOFT_RESET_I/wrack )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \SOFT_RESET_I/RESET_FLOPS[3].RST_FLOPS  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\SOFT_RESET_I/RESET_FLOPS[3].RST_FLOPS_glue_set_768 ),
    .R(SPLB_Rst_IBUF_91),
    .Q(\SOFT_RESET_I/flop_q_chain [4])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \SOFT_RESET_I/RESET_FLOPS[3].RST_FLOPS_glue_set  (
    .I0(\SOFT_RESET_I/flop_q_chain [3]),
    .I1(\SOFT_RESET_I/reset_trig_771 ),
    .O(\SOFT_RESET_I/RESET_FLOPS[3].RST_FLOPS_glue_set_768 )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \SOFT_RESET_I/RESET_FLOPS[2].RST_FLOPS  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\SOFT_RESET_I/RESET_FLOPS[2].RST_FLOPS_glue_set_769 ),
    .R(SPLB_Rst_IBUF_91),
    .Q(\SOFT_RESET_I/flop_q_chain [3])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \SOFT_RESET_I/RESET_FLOPS[2].RST_FLOPS_glue_set  (
    .I0(\SOFT_RESET_I/flop_q_chain [2]),
    .I1(\SOFT_RESET_I/reset_trig_771 ),
    .O(\SOFT_RESET_I/RESET_FLOPS[2].RST_FLOPS_glue_set_769 )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \SOFT_RESET_I/RESET_FLOPS[1].RST_FLOPS  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\SOFT_RESET_I/RESET_FLOPS[1].RST_FLOPS_glue_set_770 ),
    .R(SPLB_Rst_IBUF_91),
    .Q(\SOFT_RESET_I/flop_q_chain [2])
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \SOFT_RESET_I/RESET_FLOPS[1].RST_FLOPS_glue_set  (
    .I0(\SOFT_RESET_I/flop_q_chain [1]),
    .I1(\SOFT_RESET_I/reset_trig_771 ),
    .O(\SOFT_RESET_I/RESET_FLOPS[1].RST_FLOPS_glue_set_770 )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \SOFT_RESET_I/RESET_FLOPS[0].RST_FLOPS  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\SOFT_RESET_I/reset_trig_771 ),
    .R(SPLB_Rst_IBUF_91),
    .Q(\SOFT_RESET_I/flop_q_chain [1])
  );
  FD   \SOFT_RESET_I/reset_trig  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\SOFT_RESET_I/reset_trig_rstpot_772 ),
    .Q(\SOFT_RESET_I/reset_trig_771 )
  );
  FD   \SOFT_RESET_I/sw_rst_cond_d1  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\SOFT_RESET_I/sw_rst_cond_d1_rstpot_773 ),
    .Q(\SOFT_RESET_I/sw_rst_cond_d1_283 )
  );
  LUT4 #(
    .INIT ( 16'h8000 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/MEM_DECODE_GEN[0].GEN_PLB_SHARED.MEM_SELECT_I/Mmux_CS15_SW0  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [5]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [4]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [31]),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_abus_reg [30]),
    .O(N36)
  );
  LUT6 #(
    .INIT ( 64'h8000000000000000 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/MEM_DECODE_GEN[0].GEN_PLB_SHARED.MEM_SELECT_I/Mmux_CS17  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/MEM_DECODE_GEN[0].GEN_PLB_SHARED.MEM_SELECT_I/Mmux_CS13_495 ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/MEM_DECODE_GEN[0].GEN_PLB_SHARED.MEM_SELECT_I/Mmux_CS12_494 ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/MEM_DECODE_GEN[0].GEN_PLB_SHARED.MEM_SELECT_I/Mmux_CS11_493 ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/MEM_DECODE_GEN[0].GEN_PLB_SHARED.MEM_SELECT_I/Mmux_CS1 ),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/MEM_DECODE_GEN[0].GEN_PLB_SHARED.MEM_SELECT_I/Mmux_CS15 ),
    .I5(N36),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/address_match_early )
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/data_ack1_SW0  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [4]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [3]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [2]),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [1]),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [0]),
    .O(N38)
  );
  FD   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i_0  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i_0_rstpot_776 ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i[0] )
  );
  FD   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i_1  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i_1_rstpot_777 ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i[1] )
  );
  FD   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i_2  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i_2_rstpot_778 ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i[2] )
  );
  FD   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i_3  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i_3_rstpot_779 ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i[3] )
  );
  FD   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i_4  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i_4_rstpot_780 ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i[4] )
  );
  FD   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i_8  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i_8_rstpot_781 ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i[8] )
  );
  FD   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i_0  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i_0_rstpot_782 ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [0])
  );
  FD   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i_1  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i_1_rstpot_783 ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [1])
  );
  FD   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i_2  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i_2_rstpot_784 ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [2])
  );
  FD   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i_3  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i_3_rstpot_785 ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [3])
  );
  FD   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i_4  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i_4_rstpot_786 ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [4])
  );
  LUT4 #(
    .INIT ( 16'hA8FF ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/decode_s_h_cs1  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/decode_hit_reg_265 ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/rd_clear_sl_busy_169 ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_wrdack_i_168 ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_busy_207 ),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/decode_s_h_cs )
  );
  LUT6 #(
    .INIT ( 64'h0000000005040004 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i_8_rstpot  (
    .I0(SPLB_Rst_IBUF_91),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i[8] ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rnw_s_h_267 ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_addrack_i_166 ),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/address_match_early ),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/data_ack ),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i_8_rstpot_781 )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/valid_request_address_match_early_AND_6_o_SW1  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_type_reg [1]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_type_reg [0]),
    .O(N40)
  );
  LUT6 #(
    .INIT ( 64'h0000000400000000 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Mmux_do_the_cmd_GND_13_o_MUX_108_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_type_reg [2]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_pavalid_reg_208 ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_busy_207 ),
    .I3(N40),
    .I4(N32),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/address_match_early ),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/do_the_cmd_GND_13_o_MUX_108_o )
  );
  LUT4 #(
    .INIT ( 16'hFEFF ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/valid_request_address_match_early_AND_6_o_SW2  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_type_reg [0]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_type_reg [2]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_type_reg [1]),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_busy_207 ),
    .O(N42)
  );
  LUT6 #(
    .INIT ( 64'h0000000200000000 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GEN_FOR_SHARED.rearbitrate_condition1  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_pavalid_reg_208 ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/rd_clear_sl_busy_169 ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_wrdack_i_168 ),
    .I3(N32),
    .I4(N42),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/address_match_early ),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GEN_FOR_SHARED.rearbitrate_condition )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFEFFFFFFFF ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/valid_request_address_match_early_AND_6_o_SW3  (
    .I0(SPLB_Rst_IBUF_91),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_type_reg [2]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_type_reg [1]),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_type_reg [0]),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GEN_FOR_SHARED.addr_cntl_cs_209 ),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_pavalid_reg_208 ),
    .O(N44)
  );
  LUT6 #(
    .INIT ( 64'h0000001F00000000 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Mmux_GEN_FOR_SHARED.addr_cntl_ns_GND_13_o_MUX_113_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/rd_clear_sl_busy_169 ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_wrdack_i_168 ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_busy_207 ),
    .I3(N32),
    .I4(N44),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/address_match_early ),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GEN_FOR_SHARED.addr_cntl_ns_GND_13_o_MUX_113_o )
  );
  LUT2 #(
    .INIT ( 4'hE ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i_0_rstpot_SW0  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rnw_s_h_267 ),
    .I1(SPLB_Rst_IBUF_91),
    .O(N46)
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i_0_rstpot_SW1  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rnw_s_h_267 ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/addr_out_s_h [2]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/addr_out_s_h [1]),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/addr_out_s_h [0]),
    .I4(SPLB_Rst_IBUF_91),
    .O(N47)
  );
  LUT6 #(
    .INIT ( 64'h0000000002CE0202 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i_0_rstpot  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i[0] ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_addrack_i_166 ),
    .I2(N46),
    .I3(N47),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/address_match_early ),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/data_ack ),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i_0_rstpot_776 )
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFD ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i_1_rstpot_SW1  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/addr_out_s_h [2]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rnw_s_h_267 ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/addr_out_s_h [1]),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/addr_out_s_h [0]),
    .I4(SPLB_Rst_IBUF_91),
    .O(N50)
  );
  LUT6 #(
    .INIT ( 64'h0000000002CE0202 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i_1_rstpot  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i[1] ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_addrack_i_166 ),
    .I2(N46),
    .I3(N50),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/address_match_early ),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/data_ack ),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i_1_rstpot_777 )
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFD ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i_2_rstpot_SW1  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/addr_out_s_h [1]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/addr_out_s_h [2]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rnw_s_h_267 ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/addr_out_s_h [0]),
    .I4(SPLB_Rst_IBUF_91),
    .O(N53)
  );
  LUT6 #(
    .INIT ( 64'h0000000002CE0202 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i_2_rstpot  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i[2] ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_addrack_i_166 ),
    .I2(N46),
    .I3(N53),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/address_match_early ),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/data_ack ),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i_2_rstpot_778 )
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFF7 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i_3_rstpot_SW1  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/addr_out_s_h [2]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/addr_out_s_h [1]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rnw_s_h_267 ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/addr_out_s_h [0]),
    .I4(SPLB_Rst_IBUF_91),
    .O(N56)
  );
  LUT6 #(
    .INIT ( 64'h0000000002CE0202 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i_3_rstpot  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i[3] ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_addrack_i_166 ),
    .I2(N46),
    .I3(N56),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/address_match_early ),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/data_ack ),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i_3_rstpot_779 )
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFD ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i_4_rstpot_SW1  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/addr_out_s_h [0]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/addr_out_s_h [2]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/addr_out_s_h [1]),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rnw_s_h_267 ),
    .I4(SPLB_Rst_IBUF_91),
    .O(N59)
  );
  LUT6 #(
    .INIT ( 64'h0000000002CE0202 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i_4_rstpot  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i[4] ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_addrack_i_166 ),
    .I2(N46),
    .I3(N59),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/address_match_early ),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/data_ack ),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i_4_rstpot_780 )
  );
  LUT2 #(
    .INIT ( 4'hB ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i_0_rstpot_SW0  (
    .I0(SPLB_Rst_IBUF_91),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rnw_s_h_267 ),
    .O(N61)
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFD ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i_0_rstpot_SW1  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rnw_s_h_267 ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/addr_out_s_h [2]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/addr_out_s_h [1]),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/addr_out_s_h [0]),
    .I4(SPLB_Rst_IBUF_91),
    .O(N62)
  );
  LUT6 #(
    .INIT ( 64'h0000000002CE0202 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i_0_rstpot  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [0]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_addrack_i_166 ),
    .I2(N61),
    .I3(N62),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/address_match_early ),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/data_ack ),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i_0_rstpot_782 )
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFF7 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i_1_rstpot_SW1  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rnw_s_h_267 ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/addr_out_s_h [2]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/addr_out_s_h [1]),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/addr_out_s_h [0]),
    .I4(SPLB_Rst_IBUF_91),
    .O(N65)
  );
  LUT6 #(
    .INIT ( 64'h0000000002CE0202 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i_1_rstpot  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [1]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_addrack_i_166 ),
    .I2(N61),
    .I3(N65),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/address_match_early ),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/data_ack ),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i_1_rstpot_783 )
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFF7 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i_2_rstpot_SW1  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rnw_s_h_267 ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/addr_out_s_h [1]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/addr_out_s_h [2]),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/addr_out_s_h [0]),
    .I4(SPLB_Rst_IBUF_91),
    .O(N68)
  );
  LUT6 #(
    .INIT ( 64'h0000000002CE0202 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i_2_rstpot  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [2]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_addrack_i_166 ),
    .I2(N61),
    .I3(N68),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/address_match_early ),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/data_ack ),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i_2_rstpot_784 )
  );
  LUT5 #(
    .INIT ( 32'hFFF7FFFF ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i_3_rstpot_SW1  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rnw_s_h_267 ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/addr_out_s_h [2]),
    .I2(SPLB_Rst_IBUF_91),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/addr_out_s_h [0]),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/addr_out_s_h [1]),
    .O(N71)
  );
  LUT6 #(
    .INIT ( 64'h0000000002CE0202 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i_3_rstpot  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [3]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_addrack_i_166 ),
    .I2(N61),
    .I3(N71),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/address_match_early ),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/data_ack ),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i_3_rstpot_785 )
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFF7 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i_4_rstpot_SW1  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rnw_s_h_267 ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/addr_out_s_h [0]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/addr_out_s_h [1]),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/addr_out_s_h [2]),
    .I4(SPLB_Rst_IBUF_91),
    .O(N74)
  );
  LUT6 #(
    .INIT ( 64'h0000000002CE0202 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i_4_rstpot  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [4]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_addrack_i_166 ),
    .I2(N61),
    .I3(N74),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/address_match_early ),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/data_ack ),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i_4_rstpot_786 )
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/data_ack1  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/data_timeout_216 ),
    .I1(\SOFT_RESET_I/reset_error1_864 ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i2_491 ),
    .I3(N38),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/data_ack )
  );
  LUT3 #(
    .INIT ( 8'hFE ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Bus_Reset_clear_sl_busy_OR_56_o1  (
    .I0(SPLB_Rst_IBUF_91),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/rd_clear_sl_busy_169 ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_wrdack_i_168 ),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Bus_Reset_clear_sl_busy_OR_56_o )
  );
  LUT5 #(
    .INIT ( 32'h00010000 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Mmux_GND_13_o_ip2bus_error_i_MUX_152_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[1] ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[31] ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[2] ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[0] ),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i1 ),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_152_o )
  );
  LUT5 #(
    .INIT ( 32'h00000200 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Mmux_GND_13_o_ip2bus_error_i_MUX_156_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[1] ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[31] ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[2] ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i1 ),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[0] ),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_156_o )
  );
  LUT5 #(
    .INIT ( 32'h00000200 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Mmux_GND_13_o_ip2bus_error_i_MUX_154_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[0] ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[1] ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[31] ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i1 ),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[2] ),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_154_o )
  );
  LUT5 #(
    .INIT ( 32'h00400000 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Mmux_GND_13_o_ip2bus_error_i_MUX_164_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[0] ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[1] ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[2] ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[31] ),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i1 ),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_164_o )
  );
  LUT5 #(
    .INIT ( 32'h00400000 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Mmux_GND_13_o_ip2bus_error_i_MUX_162_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[1] ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[0] ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[2] ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[31] ),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i1 ),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_162_o )
  );
  LUT5 #(
    .INIT ( 32'h00800000 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Mmux_GND_13_o_ip2bus_error_i_MUX_166_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[0] ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[1] ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[2] ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[31] ),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i1 ),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_166_o )
  );
  LUT5 #(
    .INIT ( 32'h00100000 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Mmux_GND_13_o_ip2bus_error_i_MUX_160_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[0] ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[1] ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[2] ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[31] ),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i1 ),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_160_o )
  );
  LUT5 #(
    .INIT ( 32'h00080000 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Mmux_GND_13_o_ip2bus_error_i_MUX_158_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[1] ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[0] ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[2] ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[31] ),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i1 ),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_158_o )
  );
  FD   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_6  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_6_rstpot_802 ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out [6])
  );
  FD   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_5  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_5_rstpot_803 ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out [5])
  );
  FD   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_4  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_4_rstpot_804 ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out [4])
  );
  FD   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_3  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_3_rstpot_805 ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out [3])
  );
  FD   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_2  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_2_rstpot_806 ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out [2])
  );
  FD   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_1  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_1_rstpot_807 ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out [1])
  );
  FD   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_0  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_0_rstpot_808 ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out [0])
  );
  FD   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i_0  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i_0_rstpot_809 ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [0])
  );
  FD   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i_1  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i_1_rstpot_810 ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [1])
  );
  FD   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i_2  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i_2_rstpot_811 ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [2])
  );
  FD   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i_3  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i_3_rstpot_812 ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [3])
  );
  FD   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_rnw_i  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_rnw_i_rstpot_813 ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_rnw_i_206 )
  );
  FD   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_8  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_8_rstpot_814 ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out [8])
  );
  FD   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_7  (
    .C(SPLB_Clk_BUFGP_90),
    .D(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_7_rstpot_815 ),
    .Q(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out [7])
  );
  LUT3 #(
    .INIT ( 8'h27 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Bus_Reset_data_ack_OR_67_o1_SW0  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_addrack_i_166 ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_be_reg [0]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [0]),
    .O(N76)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i_0_rstpot  (
    .I0(SPLB_Rst_IBUF_91),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/data_timeout_216 ),
    .I2(N76),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i2_491 ),
    .I4(N38),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i1 ),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i_0_rstpot_809 )
  );
  LUT3 #(
    .INIT ( 8'h27 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Bus_Reset_data_ack_OR_67_o1_SW1  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_addrack_i_166 ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_be_reg [1]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [1]),
    .O(N78)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i_1_rstpot  (
    .I0(SPLB_Rst_IBUF_91),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/data_timeout_216 ),
    .I2(N78),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i2_491 ),
    .I4(N38),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i1 ),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i_1_rstpot_810 )
  );
  LUT3 #(
    .INIT ( 8'h27 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Bus_Reset_data_ack_OR_67_o1_SW2  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_addrack_i_166 ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_be_reg [2]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [2]),
    .O(N80)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i_2_rstpot  (
    .I0(SPLB_Rst_IBUF_91),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/data_timeout_216 ),
    .I2(N80),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i2_491 ),
    .I4(N38),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i1 ),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i_2_rstpot_811 )
  );
  LUT3 #(
    .INIT ( 8'h27 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Bus_Reset_data_ack_OR_67_o1_SW3  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_addrack_i_166 ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_be_reg [3]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [3]),
    .O(N82)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i_3_rstpot  (
    .I0(SPLB_Rst_IBUF_91),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/data_timeout_216 ),
    .I2(N82),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i2_491 ),
    .I4(N38),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i1 ),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i_3_rstpot_812 )
  );
  LUT3 #(
    .INIT ( 8'h27 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Bus_Reset_data_ack_OR_67_o1_SW4  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_addrack_i_166 ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_rnw_reg_217 ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_rnw_i_206 ),
    .O(N84)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000001 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_rnw_i_rstpot  (
    .I0(SPLB_Rst_IBUF_91),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/data_timeout_216 ),
    .I2(N84),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i2_491 ),
    .I4(N38),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i1 ),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_rnw_i_rstpot_813 )
  );
  LUT4 #(
    .INIT ( 16'hDFFF ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_rdack_i_SW2  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[1] ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[31] ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[0] ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[2] ),
    .O(N87)
  );
  LUT6 #(
    .INIT ( 64'h00FE000001FF0000 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Mmux_GND_13_o_ip2bus_error_i_MUX_150_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [3]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [4]),
    .I2(N34),
    .I3(N87),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i1 ),
    .I5(N86),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_150_o )
  );
  LUT4 #(
    .INIT ( 16'hFFDF ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_rdack_i_SW4  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[1] ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[0] ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[2] ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[31] ),
    .O(N90)
  );
  LUT6 #(
    .INIT ( 64'h00FE000001FF0000 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Mmux_GND_13_o_ip2bus_error_i_MUX_148_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [3]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [4]),
    .I2(N34),
    .I3(N90),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i1 ),
    .I5(N89),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_148_o )
  );
  LUT4 #(
    .INIT ( 16'hFFDF ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_rdack_i_SW6  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[0] ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[1] ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[2] ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[31] ),
    .O(N93)
  );
  LUT6 #(
    .INIT ( 64'h00FE000001FF0000 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Mmux_GND_13_o_ip2bus_error_i_MUX_146_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [3]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [4]),
    .I2(N34),
    .I3(N93),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i1 ),
    .I5(N92),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_146_o )
  );
  LUT4 #(
    .INIT ( 16'hFEFF ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_rdack_i_SW8  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[1] ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[0] ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[31] ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[2] ),
    .O(N96)
  );
  LUT6 #(
    .INIT ( 64'h00FE000001FF0000 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Mmux_GND_13_o_ip2bus_error_i_MUX_144_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [3]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [4]),
    .I2(N34),
    .I3(N96),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i1 ),
    .I5(N95),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_144_o )
  );
  LUT4 #(
    .INIT ( 16'hFFF7 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_rdack_i_SW10  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[0] ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[1] ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[2] ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[31] ),
    .O(N99)
  );
  LUT6 #(
    .INIT ( 64'h00FE000001FF0000 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Mmux_GND_13_o_ip2bus_error_i_MUX_142_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [3]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [4]),
    .I2(N34),
    .I3(N99),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i1 ),
    .I5(N98),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_142_o )
  );
  LUT4 #(
    .INIT ( 16'hFFFD ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_rdack_i_SW12  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[1] ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[0] ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[2] ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[31] ),
    .O(N102)
  );
  LUT6 #(
    .INIT ( 64'h00FE000001FF0000 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Mmux_GND_13_o_ip2bus_error_i_MUX_140_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [3]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [4]),
    .I2(N34),
    .I3(N102),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i1 ),
    .I5(N101),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_140_o )
  );
  LUT4 #(
    .INIT ( 16'hFFFD ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_rdack_i_SW14  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[0] ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[1] ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[2] ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[31] ),
    .O(N105)
  );
  LUT6 #(
    .INIT ( 64'h00FE000001FF0000 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Mmux_GND_13_o_ip2bus_error_i_MUX_138_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [3]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [4]),
    .I2(N34),
    .I3(N105),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i1 ),
    .I5(N104),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_138_o )
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_rdack_i_SW16  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[1] ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[0] ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[31] ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[2] ),
    .O(N108)
  );
  LUT6 #(
    .INIT ( 64'h00FE000001FF0000 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Mmux_GND_13_o_ip2bus_error_i_MUX_136_o11  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [3]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [4]),
    .I2(N34),
    .I3(N108),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i1 ),
    .I5(N107),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/GND_13_o_ip2bus_error_i_MUX_136_o )
  );
  LUT6 #(
    .INIT ( 64'h0000000000000004 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_0_rstpot  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out [0]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_busy_207 ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/data_timeout_216 ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i2_491 ),
    .I4(N38),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i1 ),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_0_rstpot_808 )
  );
  LUT3 #(
    .INIT ( 8'hFB ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Mmux_INCLUDE_DATA_PHASE_WDT.dpto_cntr_ld_en11_SW0  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/data_timeout_216 ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_busy_207 ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out [6]),
    .O(N110)
  );
  LUT5 #(
    .INIT ( 32'hFDFDFDDF ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Mmux_INCLUDE_DATA_PHASE_WDT.dpto_cntr_ld_en11_SW1  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_busy_207 ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/data_timeout_216 ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out [6]),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out [5]),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out [4]),
    .O(N111)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFE4 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_6_rstpot  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out[8]_GND_26_o_mux_5_OUT<4>_bdd0 ),
    .I1(N110),
    .I2(N111),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i2_491 ),
    .I4(N38),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i1 ),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_6_rstpot_802 )
  );
  LUT3 #(
    .INIT ( 8'hFB ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Mmux_INCLUDE_DATA_PHASE_WDT.dpto_cntr_ld_en11_SW2  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/data_timeout_216 ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_busy_207 ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out [5]),
    .O(N113)
  );
  LUT4 #(
    .INIT ( 16'hFDDF ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Mmux_INCLUDE_DATA_PHASE_WDT.dpto_cntr_ld_en11_SW3  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_busy_207 ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/data_timeout_216 ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out [5]),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out [4]),
    .O(N114)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFE4 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_5_rstpot  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out[8]_GND_26_o_mux_5_OUT<4>_bdd0 ),
    .I1(N113),
    .I2(N114),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i2_491 ),
    .I4(N38),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i1 ),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_5_rstpot_803 )
  );
  LUT2 #(
    .INIT ( 4'hB ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Mmux_INCLUDE_DATA_PHASE_WDT.dpto_cntr_ld_en11_SW4  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/data_timeout_216 ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_busy_207 ),
    .O(N116)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFF6 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_4_rstpot  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out [4]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out[8]_GND_26_o_mux_5_OUT<4>_bdd0 ),
    .I2(N116),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i2_491 ),
    .I4(N38),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i1 ),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_4_rstpot_804 )
  );
  LUT4 #(
    .INIT ( 16'hCCC9 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Mmux_INCLUDE_DATA_PHASE_WDT.dpto_cntr_ld_en11_SW5  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out [2]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out [3]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out [1]),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out [0]),
    .O(N118)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFD ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_3_rstpot  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_busy_207 ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/data_timeout_216 ),
    .I2(N118),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i2_491 ),
    .I4(N38),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i1 ),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_3_rstpot_805 )
  );
  LUT3 #(
    .INIT ( 8'hA9 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Mmux_INCLUDE_DATA_PHASE_WDT.dpto_cntr_ld_en11_SW6  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out [2]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out [1]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out [0]),
    .O(N120)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFD ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_2_rstpot  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_busy_207 ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/data_timeout_216 ),
    .I2(N120),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i2_491 ),
    .I4(N38),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i1 ),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_2_rstpot_806 )
  );
  LUT2 #(
    .INIT ( 4'h9 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Mmux_INCLUDE_DATA_PHASE_WDT.dpto_cntr_ld_en11_SW7  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out [1]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out [0]),
    .O(N122)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFD ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_1_rstpot  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_busy_207 ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/data_timeout_216 ),
    .I2(N122),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i2_491 ),
    .I4(N38),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i1 ),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_1_rstpot_807 )
  );
  LUT5 #(
    .INIT ( 32'hFFFFFFFE ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Mmux_INCLUDE_DATA_PHASE_WDT.dpto_cntr_ld_en11_SW8  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/data_timeout_216 ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out [7]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out [6]),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out [5]),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out [4]),
    .O(N124)
  );
  LUT6 #(
    .INIT ( 64'h0000000000000008 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_8_rstpot  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_busy_207 ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out[8]_GND_26_o_mux_5_OUT<4>_bdd0 ),
    .I2(N124),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i2_491 ),
    .I4(N38),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i1 ),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_8_rstpot_814 )
  );
  LUT3 #(
    .INIT ( 8'hBF ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Mmux_INCLUDE_DATA_PHASE_WDT.dpto_cntr_ld_en11_SW9  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/data_timeout_216 ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_busy_207 ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out [7]),
    .O(N126)
  );
  LUT6 #(
    .INIT ( 64'hDFDFDFDFDFDFDFFD ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/Mmux_INCLUDE_DATA_PHASE_WDT.dpto_cntr_ld_en11_SW10  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_busy_207 ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/data_timeout_216 ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out [7]),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out [6]),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out [5]),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out [4]),
    .O(N127)
  );
  LUT6 #(
    .INIT ( 64'h000000000000001B ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_7_rstpot  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out[8]_GND_26_o_mux_5_OUT<4>_bdd0 ),
    .I1(N126),
    .I2(N127),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i2_491 ),
    .I4(N38),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_wrack_i1 ),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/INCLUDE_DATA_PHASE_WDT.I_DPTO_COUNTER/INFERRED_GEN.icount_out_7_rstpot_815 )
  );
  MUXF7   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_rdack_i_SW1  (
    .I0(N129),
    .I1(N130),
    .S(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [2]),
    .O(N86)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFF1FFFFFFF ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_rdack_i_SW1_F  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [1]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [0]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[0] ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[1] ),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[2] ),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[31] ),
    .O(N129)
  );
  LUT4 #(
    .INIT ( 16'hDFFF ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_rdack_i_SW1_G  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[1] ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[31] ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[0] ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[2] ),
    .O(N130)
  );
  MUXF7   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_rdack_i_SW3  (
    .I0(N131),
    .I1(N132),
    .S(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [2]),
    .O(N89)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFF1FFFFF ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_rdack_i_SW3_F  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [1]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [0]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[1] ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[0] ),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[2] ),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[31] ),
    .O(N131)
  );
  LUT4 #(
    .INIT ( 16'hEFFF ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_rdack_i_SW3_G  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[31] ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[0] ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[1] ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[2] ),
    .O(N132)
  );
  MUXF7   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_rdack_i_SW5  (
    .I0(N133),
    .I1(N134),
    .S(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [2]),
    .O(N92)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFF1FFFFF ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_rdack_i_SW5_F  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [1]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [0]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[0] ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[1] ),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[2] ),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[31] ),
    .O(N133)
  );
  LUT4 #(
    .INIT ( 16'hEFFF ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_rdack_i_SW5_G  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[31] ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[1] ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[0] ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[2] ),
    .O(N134)
  );
  MUXF7   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_rdack_i_SW7  (
    .I0(N135),
    .I1(N136),
    .S(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [2]),
    .O(N95)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFF1FFFF ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_rdack_i_SW7_F  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [0]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [1]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[0] ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[1] ),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[2] ),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[31] ),
    .O(N135)
  );
  LUT4 #(
    .INIT ( 16'hFEFF ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_rdack_i_SW7_G  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[1] ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[0] ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[31] ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[2] ),
    .O(N136)
  );
  MUXF7   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_rdack_i_SW9  (
    .I0(N137),
    .I1(N138),
    .S(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [2]),
    .O(N98)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFF1FFF ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_rdack_i_SW9_F  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [1]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [0]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[0] ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[1] ),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[2] ),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[31] ),
    .O(N137)
  );
  LUT4 #(
    .INIT ( 16'hEFFF ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_rdack_i_SW9_G  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[31] ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[2] ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[1] ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[0] ),
    .O(N138)
  );
  MUXF7   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_rdack_i_SW11  (
    .I0(N139),
    .I1(N140),
    .S(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [2]),
    .O(N101)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFF1FF ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_rdack_i_SW11_F  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [0]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [1]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[0] ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[1] ),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[2] ),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[31] ),
    .O(N139)
  );
  LUT4 #(
    .INIT ( 16'hFEFF ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_rdack_i_SW11_G  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[2] ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[0] ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[31] ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[1] ),
    .O(N140)
  );
  MUXF7   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_rdack_i_SW13  (
    .I0(N141),
    .I1(N142),
    .S(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [2]),
    .O(N104)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFF1FF ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_rdack_i_SW13_F  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [0]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [1]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[1] ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[0] ),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[2] ),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[31] ),
    .O(N141)
  );
  LUT4 #(
    .INIT ( 16'hFEFF ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_rdack_i_SW13_G  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[2] ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[1] ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[31] ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[0] ),
    .O(N142)
  );
  MUXF7   \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_rdack_i_SW15  (
    .I0(N143),
    .I1(N144),
    .S(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [2]),
    .O(N107)
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFF1 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_rdack_i_SW15_F  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [0]),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/rdce_out_i [1]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[1] ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[0] ),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[2] ),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[31] ),
    .O(N143)
  );
  LUT4 #(
    .INIT ( 16'hFFFE ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/ip2bus_rdack_i_SW15_G  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[1] ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[0] ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[31] ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[2] ),
    .O(N144)
  );
  LUT3 #(
    .INIT ( 8'h10 ))
  \SOFT_RESET_I/reset_trig_rstpot  (
    .I0(\SOFT_RESET_I/sw_rst_cond_d1_283 ),
    .I1(SPLB_Rst_IBUF_91),
    .I2(\SOFT_RESET_I/sw_rst_cond ),
    .O(\SOFT_RESET_I/reset_trig_rstpot_772 )
  );
  LUT3 #(
    .INIT ( 8'h40 ))
  \SOFT_RESET_I/sw_rst_cond_d1_rstpot  (
    .I0(SPLB_Rst_IBUF_91),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i[8] ),
    .I2(\SOFT_RESET_I/PWR_35_o_Bus2IP_BE[3]_AND_38_o ),
    .O(\SOFT_RESET_I/sw_rst_cond_d1_rstpot_773 )
  );
  LUT6 #(
    .INIT ( 64'h0000004040404040 ))
  \PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id_31_glue_rst  (
    .I0(SPLB_Rst_IBUF_91),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id[31] ),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_busy_207 ),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/sl_wrdack_i_168 ),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/rd_clear_sl_busy_169 ),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/decode_hit_reg_265 ),
    .O(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/master_id_31_glue_rst_767 )
  );
  LUT6 #(
    .INIT ( 64'hAAAA8AAAAAAAAAAA ))
  \SOFT_RESET_I/reset_error1_1  (
    .I0(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/I_DECODER/wrce_out_i[8] ),
    .I1(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [29]),
    .I2(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [30]),
    .I3(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [28]),
    .I4(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/plb_wrdbus_reg [31]),
    .I5(\PLBV46_SLAVE_SINGLE_I/I_SLAVE_ATTACHMENT/bus2ip_be_i [3]),
    .O(\SOFT_RESET_I/reset_error1_864 )
  );
  BUFGP   SPLB_Clk_BUFGP (
    .I(SPLB_Clk),
    .O(SPLB_Clk_BUFGP_90)
  );
endmodule


`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

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

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
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

