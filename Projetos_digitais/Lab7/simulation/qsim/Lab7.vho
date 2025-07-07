-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"

-- DATE "12/05/2022 08:36:14"

-- 
-- Device: Altera 10M50DAF484C7G Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_TMS~	=>  Location: PIN_H2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TCK~	=>  Location: PIN_G2,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDI~	=>  Location: PIN_L4,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_TDO~	=>  Location: PIN_M5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_CONFIG_SEL~	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCONFIG~	=>  Location: PIN_H9,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_nSTATUS~	=>  Location: PIN_G9,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default
-- ~ALTERA_CONF_DONE~	=>  Location: PIN_F8,	 I/O Standard: 2.5 V Schmitt Trigger,	 Current Strength: Default


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_TMS~~padout\ : std_logic;
SIGNAL \~ALTERA_TCK~~padout\ : std_logic;
SIGNAL \~ALTERA_TDI~~padout\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~padout\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~padout\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~padout\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~padout\ : std_logic;
SIGNAL \~ALTERA_TMS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TCK~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_TDI~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONFIG_SEL~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nCONFIG~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_nSTATUS~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_CONF_DONE~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY ALTERA;
LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Lab7 IS
    PORT (
	ds : OUT std_logic;
	Clock : IN std_logic;
	Reset : IN std_logic;
	Pause : IN std_logic;
	\5a\ : OUT std_logic;
	\5b\ : OUT std_logic;
	\5c\ : OUT std_logic;
	\5d\ : OUT std_logic;
	\5e\ : OUT std_logic;
	\5f\ : OUT std_logic;
	\5g\ : OUT std_logic;
	\4a\ : OUT std_logic;
	\4b\ : OUT std_logic;
	\4c\ : OUT std_logic;
	\4d\ : OUT std_logic;
	\4e\ : OUT std_logic;
	\4f\ : OUT std_logic;
	\4g\ : OUT std_logic;
	\3a\ : OUT std_logic;
	\3b\ : OUT std_logic;
	\3c\ : OUT std_logic;
	\3d\ : OUT std_logic;
	\3e\ : OUT std_logic;
	\3f\ : OUT std_logic;
	\3g\ : OUT std_logic;
	\2a\ : OUT std_logic;
	\2b\ : OUT std_logic;
	\2c\ : OUT std_logic;
	\2d\ : OUT std_logic;
	\2e\ : OUT std_logic;
	\2f\ : OUT std_logic;
	\2g\ : OUT std_logic;
	\0a\ : OUT std_logic;
	\0b\ : OUT std_logic;
	\0c\ : OUT std_logic;
	\0d\ : OUT std_logic;
	\0e\ : OUT std_logic;
	\0f\ : OUT std_logic;
	\0g\ : OUT std_logic
	);
END Lab7;

-- Design Ports Information
-- ds	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- 5a	=>  Location: PIN_J20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- 5b	=>  Location: PIN_K20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- 5c	=>  Location: PIN_L18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- 5d	=>  Location: PIN_N18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- 5e	=>  Location: PIN_M20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- 5f	=>  Location: PIN_N19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- 5g	=>  Location: PIN_N20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- 4a	=>  Location: PIN_F18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- 4b	=>  Location: PIN_E20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- 4c	=>  Location: PIN_E19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- 4d	=>  Location: PIN_J18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- 4e	=>  Location: PIN_H19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- 4f	=>  Location: PIN_F19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- 4g	=>  Location: PIN_F20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- 3a	=>  Location: PIN_F21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- 3b	=>  Location: PIN_E22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- 3c	=>  Location: PIN_E21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- 3d	=>  Location: PIN_C19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- 3e	=>  Location: PIN_C20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- 3f	=>  Location: PIN_D19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- 3g	=>  Location: PIN_E17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- 2a	=>  Location: PIN_B20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- 2b	=>  Location: PIN_A20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- 2c	=>  Location: PIN_B19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- 2d	=>  Location: PIN_A21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- 2e	=>  Location: PIN_B21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- 2f	=>  Location: PIN_C22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- 2g	=>  Location: PIN_B22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- 0a	=>  Location: PIN_C14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- 0b	=>  Location: PIN_E15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- 0c	=>  Location: PIN_C15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- 0d	=>  Location: PIN_C16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- 0e	=>  Location: PIN_E16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- 0f	=>  Location: PIN_D17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- 0g	=>  Location: PIN_C17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Reset	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Clock	=>  Location: PIN_P11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Pause	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Lab7 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_ds : std_logic;
SIGNAL ww_Clock : std_logic;
SIGNAL ww_Reset : std_logic;
SIGNAL ww_Pause : std_logic;
SIGNAL \ww_5a\ : std_logic;
SIGNAL \ww_5b\ : std_logic;
SIGNAL \ww_5c\ : std_logic;
SIGNAL \ww_5d\ : std_logic;
SIGNAL \ww_5e\ : std_logic;
SIGNAL \ww_5f\ : std_logic;
SIGNAL \ww_5g\ : std_logic;
SIGNAL \ww_4a\ : std_logic;
SIGNAL \ww_4b\ : std_logic;
SIGNAL \ww_4c\ : std_logic;
SIGNAL \ww_4d\ : std_logic;
SIGNAL \ww_4e\ : std_logic;
SIGNAL \ww_4f\ : std_logic;
SIGNAL \ww_4g\ : std_logic;
SIGNAL \ww_3a\ : std_logic;
SIGNAL \ww_3b\ : std_logic;
SIGNAL \ww_3c\ : std_logic;
SIGNAL \ww_3d\ : std_logic;
SIGNAL \ww_3e\ : std_logic;
SIGNAL \ww_3f\ : std_logic;
SIGNAL \ww_3g\ : std_logic;
SIGNAL \ww_2a\ : std_logic;
SIGNAL \ww_2b\ : std_logic;
SIGNAL \ww_2c\ : std_logic;
SIGNAL \ww_2d\ : std_logic;
SIGNAL \ww_2e\ : std_logic;
SIGNAL \ww_2f\ : std_logic;
SIGNAL \ww_2g\ : std_logic;
SIGNAL \ww_0a\ : std_logic;
SIGNAL \ww_0b\ : std_logic;
SIGNAL \ww_0c\ : std_logic;
SIGNAL \ww_0d\ : std_logic;
SIGNAL \ww_0e\ : std_logic;
SIGNAL \ww_0f\ : std_logic;
SIGNAL \ww_0g\ : std_logic;
SIGNAL \inst1|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \inst1|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\ : std_logic_vector(17 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC2~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \inst|inst|sx8~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \inst|inst|sx1~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Clock~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC2~~eoc\ : std_logic;
SIGNAL \ds~output_o\ : std_logic;
SIGNAL \5a~output_o\ : std_logic;
SIGNAL \5b~output_o\ : std_logic;
SIGNAL \5c~output_o\ : std_logic;
SIGNAL \5d~output_o\ : std_logic;
SIGNAL \5e~output_o\ : std_logic;
SIGNAL \5f~output_o\ : std_logic;
SIGNAL \5g~output_o\ : std_logic;
SIGNAL \4a~output_o\ : std_logic;
SIGNAL \4b~output_o\ : std_logic;
SIGNAL \4c~output_o\ : std_logic;
SIGNAL \4d~output_o\ : std_logic;
SIGNAL \4e~output_o\ : std_logic;
SIGNAL \4f~output_o\ : std_logic;
SIGNAL \4g~output_o\ : std_logic;
SIGNAL \3a~output_o\ : std_logic;
SIGNAL \3b~output_o\ : std_logic;
SIGNAL \3c~output_o\ : std_logic;
SIGNAL \3d~output_o\ : std_logic;
SIGNAL \3e~output_o\ : std_logic;
SIGNAL \3f~output_o\ : std_logic;
SIGNAL \3g~output_o\ : std_logic;
SIGNAL \2a~output_o\ : std_logic;
SIGNAL \2b~output_o\ : std_logic;
SIGNAL \2c~output_o\ : std_logic;
SIGNAL \2d~output_o\ : std_logic;
SIGNAL \2e~output_o\ : std_logic;
SIGNAL \2f~output_o\ : std_logic;
SIGNAL \2g~output_o\ : std_logic;
SIGNAL \0a~output_o\ : std_logic;
SIGNAL \0b~output_o\ : std_logic;
SIGNAL \0c~output_o\ : std_logic;
SIGNAL \0d~output_o\ : std_logic;
SIGNAL \0e~output_o\ : std_logic;
SIGNAL \0f~output_o\ : std_logic;
SIGNAL \0g~output_o\ : std_logic;
SIGNAL \Clock~input_o\ : std_logic;
SIGNAL \Clock~inputclkctrl_outclk\ : std_logic;
SIGNAL \Reset~input_o\ : std_logic;
SIGNAL \Pause~input_o\ : std_logic;
SIGNAL \inst8~combout\ : std_logic;
SIGNAL \inst4~0_combout\ : std_logic;
SIGNAL \inst4~q\ : std_logic;
SIGNAL \inst|inst|estado.s3~q\ : std_logic;
SIGNAL \inst|inst|estado.s4~feeder_combout\ : std_logic;
SIGNAL \inst|inst|estado.s4~q\ : std_logic;
SIGNAL \inst|inst|estado.s5~q\ : std_logic;
SIGNAL \inst|inst|estado.s6~feeder_combout\ : std_logic;
SIGNAL \inst|inst|estado.s6~q\ : std_logic;
SIGNAL \inst|inst|estado.s7~feeder_combout\ : std_logic;
SIGNAL \inst|inst|estado.s7~q\ : std_logic;
SIGNAL \inst|inst|estado.s8~feeder_combout\ : std_logic;
SIGNAL \inst|inst|estado.s8~q\ : std_logic;
SIGNAL \inst|inst|estado.s9~feeder_combout\ : std_logic;
SIGNAL \inst|inst|estado.s9~q\ : std_logic;
SIGNAL \inst|inst|estado.s10~feeder_combout\ : std_logic;
SIGNAL \inst|inst|estado.s10~q\ : std_logic;
SIGNAL \inst|inst|estado.s11~q\ : std_logic;
SIGNAL \inst|inst|estado.s12~feeder_combout\ : std_logic;
SIGNAL \inst|inst|estado.s12~q\ : std_logic;
SIGNAL \inst|inst|estado.s13~feeder_combout\ : std_logic;
SIGNAL \inst|inst|estado.s13~q\ : std_logic;
SIGNAL \inst|inst|estado.s14~feeder_combout\ : std_logic;
SIGNAL \inst|inst|estado.s14~q\ : std_logic;
SIGNAL \inst|inst|estado.s15~0_combout\ : std_logic;
SIGNAL \inst|inst|estado.s15~q\ : std_logic;
SIGNAL \inst|inst|estado.s0~0_combout\ : std_logic;
SIGNAL \inst|inst|estado.s0~q\ : std_logic;
SIGNAL \inst|inst|estado.s1~feeder_combout\ : std_logic;
SIGNAL \inst|inst|estado.s1~q\ : std_logic;
SIGNAL \inst|inst|estado.s2~feeder_combout\ : std_logic;
SIGNAL \inst|inst|estado.s2~q\ : std_logic;
SIGNAL \inst|inst|WideOr0~0_combout\ : std_logic;
SIGNAL \inst|inst|WideOr0~1_combout\ : std_logic;
SIGNAL \inst|inst|WideOr0~combout\ : std_logic;
SIGNAL \inst|inst|sx8~0_combout\ : std_logic;
SIGNAL \inst|inst|sx8~q\ : std_logic;
SIGNAL \inst|inst|sx8~clkctrl_outclk\ : std_logic;
SIGNAL \inst|inst|sx1~1_combout\ : std_logic;
SIGNAL \inst|inst|sx1~q\ : std_logic;
SIGNAL \inst|inst|sx1~clkctrl_outclk\ : std_logic;
SIGNAL \inst6|contagem[0]~21_combout\ : std_logic;
SIGNAL \inst6|contagem[1]~7_combout\ : std_logic;
SIGNAL \inst6|contagem[1]~8\ : std_logic;
SIGNAL \inst6|contagem[2]~9_combout\ : std_logic;
SIGNAL \inst6|contagem[2]~10\ : std_logic;
SIGNAL \inst6|contagem[3]~11_combout\ : std_logic;
SIGNAL \inst6|contagem[3]~12\ : std_logic;
SIGNAL \inst6|contagem[4]~13_combout\ : std_logic;
SIGNAL \inst6|contagem[4]~14\ : std_logic;
SIGNAL \inst6|contagem[5]~15_combout\ : std_logic;
SIGNAL \inst6|contagem[5]~16\ : std_logic;
SIGNAL \inst6|contagem[6]~17_combout\ : std_logic;
SIGNAL \inst6|contagem[6]~18\ : std_logic;
SIGNAL \inst6|contagem[7]~19_combout\ : std_logic;
SIGNAL \inst7|inst|inst~feeder_combout\ : std_logic;
SIGNAL \inst7|inst|inst~q\ : std_logic;
SIGNAL \inst7|inst|inst10|inst2~0_combout\ : std_logic;
SIGNAL \inst7|inst|inst1~q\ : std_logic;
SIGNAL \inst7|inst|inst11|inst2~0_combout\ : std_logic;
SIGNAL \inst7|inst|inst2~q\ : std_logic;
SIGNAL \inst7|inst|inst12|inst2~0_combout\ : std_logic;
SIGNAL \inst7|inst|inst3~q\ : std_logic;
SIGNAL \inst7|inst|inst13|inst2~0_combout\ : std_logic;
SIGNAL \inst7|inst|inst4~q\ : std_logic;
SIGNAL \inst7|inst|inst14|inst2~0_combout\ : std_logic;
SIGNAL \inst7|inst|inst5~q\ : std_logic;
SIGNAL \inst7|inst|inst15|inst2~0_combout\ : std_logic;
SIGNAL \inst7|inst|inst6~q\ : std_logic;
SIGNAL \inst7|inst|inst16|inst2~0_combout\ : std_logic;
SIGNAL \inst7|inst|inst7~q\ : std_logic;
SIGNAL \inst3|Selector1~0_combout\ : std_logic;
SIGNAL \inst3|Selector1~1_combout\ : std_logic;
SIGNAL \inst3|estado.s1~q\ : std_logic;
SIGNAL \inst3|estado~18_combout\ : std_logic;
SIGNAL \inst3|estado.s2~q\ : std_logic;
SIGNAL \inst3|Selector2~0_combout\ : std_logic;
SIGNAL \inst3|estado.s3~q\ : std_logic;
SIGNAL \inst3|estado~15_combout\ : std_logic;
SIGNAL \inst3|estado.s4~q\ : std_logic;
SIGNAL \inst3|estado~16_combout\ : std_logic;
SIGNAL \inst3|estado.s5~q\ : std_logic;
SIGNAL \inst3|estado~17_combout\ : std_logic;
SIGNAL \inst3|estado.s6~q\ : std_logic;
SIGNAL \inst3|estado~12_combout\ : std_logic;
SIGNAL \inst3|estado.s7~q\ : std_logic;
SIGNAL \inst3|estado~13_combout\ : std_logic;
SIGNAL \inst3|estado~14_combout\ : std_logic;
SIGNAL \inst3|estado.s0~q\ : std_logic;
SIGNAL \inst3|Selector0~0_combout\ : std_logic;
SIGNAL \inst3|d_s~q\ : std_logic;
SIGNAL \inst10|inst|inst6~feeder_combout\ : std_logic;
SIGNAL \inst10|inst|inst6~q\ : std_logic;
SIGNAL \inst10|inst|inst5~feeder_combout\ : std_logic;
SIGNAL \inst10|inst|inst5~q\ : std_logic;
SIGNAL \inst10|inst|inst7~q\ : std_logic;
SIGNAL \inst10|inst|inst4~q\ : std_logic;
SIGNAL \inst11|inst|inst2|inst10~0_combout\ : std_logic;
SIGNAL \inst11|inst|inst2|inst51|inst3~0_combout\ : std_logic;
SIGNAL \inst11|inst|inst2|inst52|inst3~0_combout\ : std_logic;
SIGNAL \inst11|inst|inst2|inst53|inst3~0_combout\ : std_logic;
SIGNAL \inst11|inst|inst2|inst38~0_combout\ : std_logic;
SIGNAL \inst11|inst|inst2|inst54|inst3~0_combout\ : std_logic;
SIGNAL \inst11|inst|inst2|inst55|inst3~0_combout\ : std_logic;
SIGNAL \inst10|inst|inst1~q\ : std_logic;
SIGNAL \inst10|inst|inst~q\ : std_logic;
SIGNAL \inst10|inst|inst2~q\ : std_logic;
SIGNAL \inst10|inst|inst3~q\ : std_logic;
SIGNAL \inst11|inst1|inst2|inst10~0_combout\ : std_logic;
SIGNAL \inst11|inst1|inst2|inst51|inst3~0_combout\ : std_logic;
SIGNAL \inst11|inst1|inst2|inst52|inst3~0_combout\ : std_logic;
SIGNAL \inst11|inst1|inst2|inst53|inst3~0_combout\ : std_logic;
SIGNAL \inst11|inst1|inst2|inst38~0_combout\ : std_logic;
SIGNAL \inst11|inst1|inst2|inst54|inst3~0_combout\ : std_logic;
SIGNAL \inst11|inst1|inst2|inst55|inst3~0_combout\ : std_logic;
SIGNAL \inst2|inst|inst6~feeder_combout\ : std_logic;
SIGNAL \inst2|inst|inst6~q\ : std_logic;
SIGNAL \inst2|inst|inst5~feeder_combout\ : std_logic;
SIGNAL \inst2|inst|inst5~q\ : std_logic;
SIGNAL \inst2|inst|inst4~feeder_combout\ : std_logic;
SIGNAL \inst2|inst|inst4~q\ : std_logic;
SIGNAL \inst2|inst|inst7~feeder_combout\ : std_logic;
SIGNAL \inst2|inst|inst7~q\ : std_logic;
SIGNAL \inst9|inst|inst2|inst10~0_combout\ : std_logic;
SIGNAL \inst9|inst|inst2|inst51|inst3~0_combout\ : std_logic;
SIGNAL \inst9|inst|inst2|inst52|inst3~0_combout\ : std_logic;
SIGNAL \inst9|inst|inst2|inst53|inst3~0_combout\ : std_logic;
SIGNAL \inst9|inst|inst2|inst38~0_combout\ : std_logic;
SIGNAL \inst9|inst|inst2|inst54|inst3~0_combout\ : std_logic;
SIGNAL \inst9|inst|inst2|inst55|inst3~0_combout\ : std_logic;
SIGNAL \inst2|inst|inst3~feeder_combout\ : std_logic;
SIGNAL \inst2|inst|inst3~q\ : std_logic;
SIGNAL \inst2|inst|inst2~feeder_combout\ : std_logic;
SIGNAL \inst2|inst|inst2~q\ : std_logic;
SIGNAL \inst2|inst|inst1~feeder_combout\ : std_logic;
SIGNAL \inst2|inst|inst1~q\ : std_logic;
SIGNAL \inst2|inst|inst~feeder_combout\ : std_logic;
SIGNAL \inst2|inst|inst~q\ : std_logic;
SIGNAL \inst9|inst1|inst2|inst10~0_combout\ : std_logic;
SIGNAL \inst9|inst1|inst2|inst51|inst3~0_combout\ : std_logic;
SIGNAL \inst9|inst1|inst2|inst52|inst3~0_combout\ : std_logic;
SIGNAL \inst9|inst1|inst2|inst53|inst3~0_combout\ : std_logic;
SIGNAL \inst9|inst1|inst2|inst38~0_combout\ : std_logic;
SIGNAL \inst9|inst1|inst2|inst54|inst3~0_combout\ : std_logic;
SIGNAL \inst9|inst1|inst2|inst55|inst3~0_combout\ : std_logic;
SIGNAL \inst3|WideOr1~0_combout\ : std_logic;
SIGNAL \inst3|WideOr2~combout\ : std_logic;
SIGNAL \inst3|WideOr3~combout\ : std_logic;
SIGNAL \inst12|inst2|inst10~0_combout\ : std_logic;
SIGNAL \inst12|inst2|inst51|inst3~0_combout\ : std_logic;
SIGNAL \inst12|inst2|inst52|inst3~0_combout\ : std_logic;
SIGNAL \inst12|inst2|inst53|inst3~0_combout\ : std_logic;
SIGNAL \inst12|inst2|inst38~0_combout\ : std_logic;
SIGNAL \inst12|inst2|inst54|inst~0_combout\ : std_logic;
SIGNAL \inst12|inst2|inst55|inst~0_combout\ : std_logic;
SIGNAL \inst3|est\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \inst6|contagem\ : std_logic_vector(8 DOWNTO 0);
SIGNAL \inst1|altsyncram_component|auto_generated|q_a\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_Reset~input_o\ : std_logic;
SIGNAL \ALT_INV_inst4~q\ : std_logic;
SIGNAL \inst|inst|ALT_INV_sx8~q\ : std_logic;
SIGNAL \inst12|inst2|inst55|ALT_INV_inst~0_combout\ : std_logic;
SIGNAL \inst12|inst2|inst54|ALT_INV_inst~0_combout\ : std_logic;
SIGNAL \inst12|inst2|ALT_INV_inst38~0_combout\ : std_logic;
SIGNAL \inst12|inst2|inst53|ALT_INV_inst3~0_combout\ : std_logic;
SIGNAL \inst12|inst2|inst52|ALT_INV_inst3~0_combout\ : std_logic;
SIGNAL \inst12|inst2|inst51|ALT_INV_inst3~0_combout\ : std_logic;
SIGNAL \inst12|inst2|ALT_INV_inst10~0_combout\ : std_logic;
SIGNAL \inst9|inst1|inst2|inst55|ALT_INV_inst3~0_combout\ : std_logic;
SIGNAL \inst9|inst1|inst2|inst54|ALT_INV_inst3~0_combout\ : std_logic;
SIGNAL \inst9|inst1|inst2|ALT_INV_inst38~0_combout\ : std_logic;
SIGNAL \inst9|inst1|inst2|inst53|ALT_INV_inst3~0_combout\ : std_logic;
SIGNAL \inst9|inst1|inst2|inst52|ALT_INV_inst3~0_combout\ : std_logic;
SIGNAL \inst9|inst1|inst2|inst51|ALT_INV_inst3~0_combout\ : std_logic;
SIGNAL \inst9|inst1|inst2|ALT_INV_inst10~0_combout\ : std_logic;
SIGNAL \inst|inst|ALT_INV_sx1~clkctrl_outclk\ : std_logic;
SIGNAL \inst|inst|ALT_INV_sx8~clkctrl_outclk\ : std_logic;
SIGNAL \inst9|inst|inst2|inst55|ALT_INV_inst3~0_combout\ : std_logic;
SIGNAL \inst9|inst|inst2|inst54|ALT_INV_inst3~0_combout\ : std_logic;
SIGNAL \inst9|inst|inst2|ALT_INV_inst38~0_combout\ : std_logic;
SIGNAL \inst9|inst|inst2|inst53|ALT_INV_inst3~0_combout\ : std_logic;
SIGNAL \inst9|inst|inst2|inst52|ALT_INV_inst3~0_combout\ : std_logic;
SIGNAL \inst9|inst|inst2|inst51|ALT_INV_inst3~0_combout\ : std_logic;
SIGNAL \inst9|inst|inst2|ALT_INV_inst10~0_combout\ : std_logic;
SIGNAL \inst11|inst1|inst2|inst55|ALT_INV_inst3~0_combout\ : std_logic;
SIGNAL \inst11|inst1|inst2|inst54|ALT_INV_inst3~0_combout\ : std_logic;
SIGNAL \inst11|inst1|inst2|ALT_INV_inst38~0_combout\ : std_logic;
SIGNAL \inst11|inst1|inst2|inst53|ALT_INV_inst3~0_combout\ : std_logic;
SIGNAL \inst11|inst1|inst2|inst52|ALT_INV_inst3~0_combout\ : std_logic;
SIGNAL \inst11|inst1|inst2|inst51|ALT_INV_inst3~0_combout\ : std_logic;
SIGNAL \inst11|inst1|inst2|ALT_INV_inst10~0_combout\ : std_logic;
SIGNAL \inst11|inst|inst2|inst55|ALT_INV_inst3~0_combout\ : std_logic;
SIGNAL \inst11|inst|inst2|inst54|ALT_INV_inst3~0_combout\ : std_logic;
SIGNAL \inst11|inst|inst2|ALT_INV_inst38~0_combout\ : std_logic;
SIGNAL \inst11|inst|inst2|inst53|ALT_INV_inst3~0_combout\ : std_logic;
SIGNAL \inst11|inst|inst2|inst52|ALT_INV_inst3~0_combout\ : std_logic;
SIGNAL \inst11|inst|inst2|inst51|ALT_INV_inst3~0_combout\ : std_logic;
SIGNAL \inst11|inst|inst2|ALT_INV_inst10~0_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ds <= ww_ds;
ww_Clock <= Clock;
ww_Reset <= Reset;
ww_Pause <= Pause;
\5a\ <= \ww_5a\;
\5b\ <= \ww_5b\;
\5c\ <= \ww_5c\;
\5d\ <= \ww_5d\;
\5e\ <= \ww_5e\;
\5f\ <= \ww_5f\;
\5g\ <= \ww_5g\;
\4a\ <= \ww_4a\;
\4b\ <= \ww_4b\;
\4c\ <= \ww_4c\;
\4d\ <= \ww_4d\;
\4e\ <= \ww_4e\;
\4f\ <= \ww_4f\;
\4g\ <= \ww_4g\;
\3a\ <= \ww_3a\;
\3b\ <= \ww_3b\;
\3c\ <= \ww_3c\;
\3d\ <= \ww_3d\;
\3e\ <= \ww_3e\;
\3f\ <= \ww_3f\;
\3g\ <= \ww_3g\;
\2a\ <= \ww_2a\;
\2b\ <= \ww_2b\;
\2c\ <= \ww_2c\;
\2d\ <= \ww_2d\;
\2e\ <= \ww_2e\;
\2f\ <= \ww_2f\;
\2g\ <= \ww_2g\;
\0a\ <= \ww_0a\;
\0b\ <= \ww_0b\;
\0c\ <= \ww_0c\;
\0d\ <= \ww_0d\;
\0e\ <= \ww_0e\;
\0f\ <= \ww_0f\;
\0g\ <= \ww_0g\;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\inst1|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\inst6|contagem\(7) & \inst6|contagem\(6) & \inst6|contagem\(5) & \inst6|contagem\(4) & \inst6|contagem\(3) & \inst6|contagem\(2) & \inst6|contagem\(1) & 
\inst6|contagem\(0));

\inst1|altsyncram_component|auto_generated|q_a\(0) <= \inst1|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(0);
\inst1|altsyncram_component|auto_generated|q_a\(1) <= \inst1|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(1);
\inst1|altsyncram_component|auto_generated|q_a\(2) <= \inst1|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(2);
\inst1|altsyncram_component|auto_generated|q_a\(3) <= \inst1|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(3);
\inst1|altsyncram_component|auto_generated|q_a\(4) <= \inst1|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(4);
\inst1|altsyncram_component|auto_generated|q_a\(5) <= \inst1|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(5);
\inst1|altsyncram_component|auto_generated|q_a\(6) <= \inst1|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(6);
\inst1|altsyncram_component|auto_generated|q_a\(7) <= \inst1|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\(7);

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\~QUARTUS_CREATED_ADC2~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\inst|inst|sx8~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \inst|inst|sx8~q\);

\inst|inst|sx1~clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \inst|inst|sx1~q\);

\Clock~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \Clock~input_o\);
\ALT_INV_Reset~input_o\ <= NOT \Reset~input_o\;
\ALT_INV_inst4~q\ <= NOT \inst4~q\;
\inst|inst|ALT_INV_sx8~q\ <= NOT \inst|inst|sx8~q\;
\inst12|inst2|inst55|ALT_INV_inst~0_combout\ <= NOT \inst12|inst2|inst55|inst~0_combout\;
\inst12|inst2|inst54|ALT_INV_inst~0_combout\ <= NOT \inst12|inst2|inst54|inst~0_combout\;
\inst12|inst2|ALT_INV_inst38~0_combout\ <= NOT \inst12|inst2|inst38~0_combout\;
\inst12|inst2|inst53|ALT_INV_inst3~0_combout\ <= NOT \inst12|inst2|inst53|inst3~0_combout\;
\inst12|inst2|inst52|ALT_INV_inst3~0_combout\ <= NOT \inst12|inst2|inst52|inst3~0_combout\;
\inst12|inst2|inst51|ALT_INV_inst3~0_combout\ <= NOT \inst12|inst2|inst51|inst3~0_combout\;
\inst12|inst2|ALT_INV_inst10~0_combout\ <= NOT \inst12|inst2|inst10~0_combout\;
\inst9|inst1|inst2|inst55|ALT_INV_inst3~0_combout\ <= NOT \inst9|inst1|inst2|inst55|inst3~0_combout\;
\inst9|inst1|inst2|inst54|ALT_INV_inst3~0_combout\ <= NOT \inst9|inst1|inst2|inst54|inst3~0_combout\;
\inst9|inst1|inst2|ALT_INV_inst38~0_combout\ <= NOT \inst9|inst1|inst2|inst38~0_combout\;
\inst9|inst1|inst2|inst53|ALT_INV_inst3~0_combout\ <= NOT \inst9|inst1|inst2|inst53|inst3~0_combout\;
\inst9|inst1|inst2|inst52|ALT_INV_inst3~0_combout\ <= NOT \inst9|inst1|inst2|inst52|inst3~0_combout\;
\inst9|inst1|inst2|inst51|ALT_INV_inst3~0_combout\ <= NOT \inst9|inst1|inst2|inst51|inst3~0_combout\;
\inst9|inst1|inst2|ALT_INV_inst10~0_combout\ <= NOT \inst9|inst1|inst2|inst10~0_combout\;
\inst|inst|ALT_INV_sx1~clkctrl_outclk\ <= NOT \inst|inst|sx1~clkctrl_outclk\;
\inst|inst|ALT_INV_sx8~clkctrl_outclk\ <= NOT \inst|inst|sx8~clkctrl_outclk\;
\inst9|inst|inst2|inst55|ALT_INV_inst3~0_combout\ <= NOT \inst9|inst|inst2|inst55|inst3~0_combout\;
\inst9|inst|inst2|inst54|ALT_INV_inst3~0_combout\ <= NOT \inst9|inst|inst2|inst54|inst3~0_combout\;
\inst9|inst|inst2|ALT_INV_inst38~0_combout\ <= NOT \inst9|inst|inst2|inst38~0_combout\;
\inst9|inst|inst2|inst53|ALT_INV_inst3~0_combout\ <= NOT \inst9|inst|inst2|inst53|inst3~0_combout\;
\inst9|inst|inst2|inst52|ALT_INV_inst3~0_combout\ <= NOT \inst9|inst|inst2|inst52|inst3~0_combout\;
\inst9|inst|inst2|inst51|ALT_INV_inst3~0_combout\ <= NOT \inst9|inst|inst2|inst51|inst3~0_combout\;
\inst9|inst|inst2|ALT_INV_inst10~0_combout\ <= NOT \inst9|inst|inst2|inst10~0_combout\;
\inst11|inst1|inst2|inst55|ALT_INV_inst3~0_combout\ <= NOT \inst11|inst1|inst2|inst55|inst3~0_combout\;
\inst11|inst1|inst2|inst54|ALT_INV_inst3~0_combout\ <= NOT \inst11|inst1|inst2|inst54|inst3~0_combout\;
\inst11|inst1|inst2|ALT_INV_inst38~0_combout\ <= NOT \inst11|inst1|inst2|inst38~0_combout\;
\inst11|inst1|inst2|inst53|ALT_INV_inst3~0_combout\ <= NOT \inst11|inst1|inst2|inst53|inst3~0_combout\;
\inst11|inst1|inst2|inst52|ALT_INV_inst3~0_combout\ <= NOT \inst11|inst1|inst2|inst52|inst3~0_combout\;
\inst11|inst1|inst2|inst51|ALT_INV_inst3~0_combout\ <= NOT \inst11|inst1|inst2|inst51|inst3~0_combout\;
\inst11|inst1|inst2|ALT_INV_inst10~0_combout\ <= NOT \inst11|inst1|inst2|inst10~0_combout\;
\inst11|inst|inst2|inst55|ALT_INV_inst3~0_combout\ <= NOT \inst11|inst|inst2|inst55|inst3~0_combout\;
\inst11|inst|inst2|inst54|ALT_INV_inst3~0_combout\ <= NOT \inst11|inst|inst2|inst54|inst3~0_combout\;
\inst11|inst|inst2|ALT_INV_inst38~0_combout\ <= NOT \inst11|inst|inst2|inst38~0_combout\;
\inst11|inst|inst2|inst53|ALT_INV_inst3~0_combout\ <= NOT \inst11|inst|inst2|inst53|inst3~0_combout\;
\inst11|inst|inst2|inst52|ALT_INV_inst3~0_combout\ <= NOT \inst11|inst|inst2|inst52|inst3~0_combout\;
\inst11|inst|inst2|inst51|ALT_INV_inst3~0_combout\ <= NOT \inst11|inst|inst2|inst51|inst3~0_combout\;
\inst11|inst|inst2|ALT_INV_inst10~0_combout\ <= NOT \inst11|inst|inst2|inst10~0_combout\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X44_Y52_N4
\~QUARTUS_CREATED_GND~I\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \~QUARTUS_CREATED_GND~I_combout\ = GND

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \~QUARTUS_CREATED_GND~I_combout\);

-- Location: IOOBUF_X46_Y54_N2
\ds~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst3|d_s~q\,
	devoe => ww_devoe,
	o => \ds~output_o\);

-- Location: IOOBUF_X78_Y45_N9
\5a~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst11|inst|inst2|ALT_INV_inst10~0_combout\,
	devoe => ww_devoe,
	o => \5a~output_o\);

-- Location: IOOBUF_X78_Y42_N2
\5b~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst11|inst|inst2|inst51|ALT_INV_inst3~0_combout\,
	devoe => ww_devoe,
	o => \5b~output_o\);

-- Location: IOOBUF_X78_Y37_N16
\5c~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst11|inst|inst2|inst52|ALT_INV_inst3~0_combout\,
	devoe => ww_devoe,
	o => \5c~output_o\);

-- Location: IOOBUF_X78_Y34_N24
\5d~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst11|inst|inst2|inst53|ALT_INV_inst3~0_combout\,
	devoe => ww_devoe,
	o => \5d~output_o\);

-- Location: IOOBUF_X78_Y34_N9
\5e~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst11|inst|inst2|ALT_INV_inst38~0_combout\,
	devoe => ww_devoe,
	o => \5e~output_o\);

-- Location: IOOBUF_X78_Y34_N16
\5f~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst11|inst|inst2|inst54|ALT_INV_inst3~0_combout\,
	devoe => ww_devoe,
	o => \5f~output_o\);

-- Location: IOOBUF_X78_Y34_N2
\5g~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst11|inst|inst2|inst55|ALT_INV_inst3~0_combout\,
	devoe => ww_devoe,
	o => \5g~output_o\);

-- Location: IOOBUF_X78_Y40_N16
\4a~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst11|inst1|inst2|ALT_INV_inst10~0_combout\,
	devoe => ww_devoe,
	o => \4a~output_o\);

-- Location: IOOBUF_X78_Y40_N2
\4b~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst11|inst1|inst2|inst51|ALT_INV_inst3~0_combout\,
	devoe => ww_devoe,
	o => \4b~output_o\);

-- Location: IOOBUF_X78_Y40_N23
\4c~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst11|inst1|inst2|inst52|ALT_INV_inst3~0_combout\,
	devoe => ww_devoe,
	o => \4c~output_o\);

-- Location: IOOBUF_X78_Y42_N16
\4d~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst11|inst1|inst2|inst53|ALT_INV_inst3~0_combout\,
	devoe => ww_devoe,
	o => \4d~output_o\);

-- Location: IOOBUF_X78_Y45_N23
\4e~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst11|inst1|inst2|ALT_INV_inst38~0_combout\,
	devoe => ww_devoe,
	o => \4e~output_o\);

-- Location: IOOBUF_X78_Y40_N9
\4f~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst11|inst1|inst2|inst54|ALT_INV_inst3~0_combout\,
	devoe => ww_devoe,
	o => \4f~output_o\);

-- Location: IOOBUF_X78_Y35_N16
\4g~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst11|inst1|inst2|inst55|ALT_INV_inst3~0_combout\,
	devoe => ww_devoe,
	o => \4g~output_o\);

-- Location: IOOBUF_X78_Y35_N23
\3a~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst9|inst|inst2|ALT_INV_inst10~0_combout\,
	devoe => ww_devoe,
	o => \3a~output_o\);

-- Location: IOOBUF_X78_Y33_N9
\3b~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst9|inst|inst2|inst51|ALT_INV_inst3~0_combout\,
	devoe => ww_devoe,
	o => \3b~output_o\);

-- Location: IOOBUF_X78_Y33_N2
\3c~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst9|inst|inst2|inst52|ALT_INV_inst3~0_combout\,
	devoe => ww_devoe,
	o => \3c~output_o\);

-- Location: IOOBUF_X69_Y54_N9
\3d~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst9|inst|inst2|inst53|ALT_INV_inst3~0_combout\,
	devoe => ww_devoe,
	o => \3d~output_o\);

-- Location: IOOBUF_X78_Y41_N9
\3e~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst9|inst|inst2|ALT_INV_inst38~0_combout\,
	devoe => ww_devoe,
	o => \3e~output_o\);

-- Location: IOOBUF_X78_Y41_N2
\3f~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst9|inst|inst2|inst54|ALT_INV_inst3~0_combout\,
	devoe => ww_devoe,
	o => \3f~output_o\);

-- Location: IOOBUF_X78_Y43_N16
\3g~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst9|inst|inst2|inst55|ALT_INV_inst3~0_combout\,
	devoe => ww_devoe,
	o => \3g~output_o\);

-- Location: IOOBUF_X78_Y44_N9
\2a~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst9|inst1|inst2|ALT_INV_inst10~0_combout\,
	devoe => ww_devoe,
	o => \2a~output_o\);

-- Location: IOOBUF_X66_Y54_N2
\2b~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst9|inst1|inst2|inst51|ALT_INV_inst3~0_combout\,
	devoe => ww_devoe,
	o => \2b~output_o\);

-- Location: IOOBUF_X69_Y54_N16
\2c~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst9|inst1|inst2|inst52|ALT_INV_inst3~0_combout\,
	devoe => ww_devoe,
	o => \2c~output_o\);

-- Location: IOOBUF_X78_Y44_N2
\2d~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst9|inst1|inst2|inst53|ALT_INV_inst3~0_combout\,
	devoe => ww_devoe,
	o => \2d~output_o\);

-- Location: IOOBUF_X78_Y43_N2
\2e~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst9|inst1|inst2|ALT_INV_inst38~0_combout\,
	devoe => ww_devoe,
	o => \2e~output_o\);

-- Location: IOOBUF_X78_Y35_N2
\2f~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst9|inst1|inst2|inst54|ALT_INV_inst3~0_combout\,
	devoe => ww_devoe,
	o => \2f~output_o\);

-- Location: IOOBUF_X78_Y43_N9
\2g~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst9|inst1|inst2|inst55|ALT_INV_inst3~0_combout\,
	devoe => ww_devoe,
	o => \2g~output_o\);

-- Location: IOOBUF_X58_Y54_N16
\0a~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst12|inst2|ALT_INV_inst10~0_combout\,
	devoe => ww_devoe,
	o => \0a~output_o\);

-- Location: IOOBUF_X74_Y54_N9
\0b~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst12|inst2|inst51|ALT_INV_inst3~0_combout\,
	devoe => ww_devoe,
	o => \0b~output_o\);

-- Location: IOOBUF_X60_Y54_N2
\0c~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst12|inst2|inst52|ALT_INV_inst3~0_combout\,
	devoe => ww_devoe,
	o => \0c~output_o\);

-- Location: IOOBUF_X62_Y54_N30
\0d~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst12|inst2|inst53|ALT_INV_inst3~0_combout\,
	devoe => ww_devoe,
	o => \0d~output_o\);

-- Location: IOOBUF_X74_Y54_N2
\0e~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst12|inst2|ALT_INV_inst38~0_combout\,
	devoe => ww_devoe,
	o => \0e~output_o\);

-- Location: IOOBUF_X74_Y54_N16
\0f~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst12|inst2|inst54|ALT_INV_inst~0_combout\,
	devoe => ww_devoe,
	o => \0f~output_o\);

-- Location: IOOBUF_X74_Y54_N23
\0g~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst12|inst2|inst55|ALT_INV_inst~0_combout\,
	devoe => ww_devoe,
	o => \0g~output_o\);

-- Location: IOIBUF_X34_Y0_N29
\Clock~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Clock,
	o => \Clock~input_o\);

-- Location: CLKCTRL_G19
\Clock~inputclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \Clock~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \Clock~inputclkctrl_outclk\);

-- Location: IOIBUF_X49_Y54_N29
\Reset~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Reset,
	o => \Reset~input_o\);

-- Location: IOIBUF_X46_Y54_N29
\Pause~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Pause,
	o => \Pause~input_o\);

-- Location: LCCOMB_X69_Y46_N28
inst8 : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst8~combout\ = LCELL(\Pause~input_o\ $ (\inst3|d_s~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Pause~input_o\,
	datad => \inst3|d_s~q\,
	combout => \inst8~combout\);

-- Location: LCCOMB_X69_Y46_N26
\inst4~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst4~0_combout\ = !\inst4~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst4~q\,
	combout => \inst4~0_combout\);

-- Location: FF_X69_Y46_N29
inst4 : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst8~combout\,
	asdata => \inst4~0_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst4~q\);

-- Location: FF_X70_Y46_N21
\inst|inst|estado.s3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	asdata => \inst|inst|estado.s2~q\,
	clrn => \ALT_INV_Reset~input_o\,
	sload => VCC,
	ena => \ALT_INV_inst4~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|estado.s3~q\);

-- Location: LCCOMB_X70_Y46_N8
\inst|inst|estado.s4~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|inst|estado.s4~feeder_combout\ = \inst|inst|estado.s3~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|inst|estado.s3~q\,
	combout => \inst|inst|estado.s4~feeder_combout\);

-- Location: FF_X70_Y46_N9
\inst|inst|estado.s4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|inst|estado.s4~feeder_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	ena => \ALT_INV_inst4~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|estado.s4~q\);

-- Location: FF_X70_Y46_N27
\inst|inst|estado.s5\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	asdata => \inst|inst|estado.s4~q\,
	clrn => \ALT_INV_Reset~input_o\,
	sload => VCC,
	ena => \ALT_INV_inst4~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|estado.s5~q\);

-- Location: LCCOMB_X70_Y46_N28
\inst|inst|estado.s6~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|inst|estado.s6~feeder_combout\ = \inst|inst|estado.s5~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|inst|estado.s5~q\,
	combout => \inst|inst|estado.s6~feeder_combout\);

-- Location: FF_X70_Y46_N29
\inst|inst|estado.s6\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|inst|estado.s6~feeder_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	ena => \ALT_INV_inst4~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|estado.s6~q\);

-- Location: LCCOMB_X70_Y46_N10
\inst|inst|estado.s7~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|inst|estado.s7~feeder_combout\ = \inst|inst|estado.s6~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|inst|estado.s6~q\,
	combout => \inst|inst|estado.s7~feeder_combout\);

-- Location: FF_X70_Y46_N11
\inst|inst|estado.s7\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|inst|estado.s7~feeder_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	ena => \ALT_INV_inst4~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|estado.s7~q\);

-- Location: LCCOMB_X70_Y46_N18
\inst|inst|estado.s8~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|inst|estado.s8~feeder_combout\ = \inst|inst|estado.s7~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|inst|estado.s7~q\,
	combout => \inst|inst|estado.s8~feeder_combout\);

-- Location: FF_X70_Y46_N19
\inst|inst|estado.s8\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|inst|estado.s8~feeder_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	ena => \ALT_INV_inst4~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|estado.s8~q\);

-- Location: LCCOMB_X71_Y46_N26
\inst|inst|estado.s9~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|inst|estado.s9~feeder_combout\ = \inst|inst|estado.s8~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|inst|estado.s8~q\,
	combout => \inst|inst|estado.s9~feeder_combout\);

-- Location: FF_X71_Y46_N27
\inst|inst|estado.s9\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|inst|estado.s9~feeder_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	ena => \ALT_INV_inst4~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|estado.s9~q\);

-- Location: LCCOMB_X70_Y46_N0
\inst|inst|estado.s10~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|inst|estado.s10~feeder_combout\ = \inst|inst|estado.s9~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|inst|estado.s9~q\,
	combout => \inst|inst|estado.s10~feeder_combout\);

-- Location: FF_X70_Y46_N1
\inst|inst|estado.s10\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|inst|estado.s10~feeder_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	ena => \ALT_INV_inst4~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|estado.s10~q\);

-- Location: FF_X70_Y46_N17
\inst|inst|estado.s11\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	asdata => \inst|inst|estado.s10~q\,
	clrn => \ALT_INV_Reset~input_o\,
	sload => VCC,
	ena => \ALT_INV_inst4~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|estado.s11~q\);

-- Location: LCCOMB_X70_Y46_N22
\inst|inst|estado.s12~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|inst|estado.s12~feeder_combout\ = \inst|inst|estado.s11~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|inst|estado.s11~q\,
	combout => \inst|inst|estado.s12~feeder_combout\);

-- Location: FF_X70_Y46_N23
\inst|inst|estado.s12\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|inst|estado.s12~feeder_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	ena => \ALT_INV_inst4~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|estado.s12~q\);

-- Location: LCCOMB_X70_Y46_N14
\inst|inst|estado.s13~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|inst|estado.s13~feeder_combout\ = \inst|inst|estado.s12~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|inst|estado.s12~q\,
	combout => \inst|inst|estado.s13~feeder_combout\);

-- Location: FF_X70_Y46_N15
\inst|inst|estado.s13\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|inst|estado.s13~feeder_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	ena => \ALT_INV_inst4~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|estado.s13~q\);

-- Location: LCCOMB_X70_Y46_N6
\inst|inst|estado.s14~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|inst|estado.s14~feeder_combout\ = \inst|inst|estado.s13~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|inst|estado.s13~q\,
	combout => \inst|inst|estado.s14~feeder_combout\);

-- Location: FF_X70_Y46_N7
\inst|inst|estado.s14\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|inst|estado.s14~feeder_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	ena => \ALT_INV_inst4~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|estado.s14~q\);

-- Location: LCCOMB_X70_Y46_N12
\inst|inst|estado.s15~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|inst|estado.s15~0_combout\ = !\inst|inst|estado.s14~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|inst|estado.s14~q\,
	combout => \inst|inst|estado.s15~0_combout\);

-- Location: FF_X70_Y46_N13
\inst|inst|estado.s15\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|inst|estado.s15~0_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	ena => \ALT_INV_inst4~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|estado.s15~q\);

-- Location: LCCOMB_X70_Y46_N30
\inst|inst|estado.s0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|inst|estado.s0~0_combout\ = !\inst|inst|estado.s15~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|inst|estado.s15~q\,
	combout => \inst|inst|estado.s0~0_combout\);

-- Location: FF_X70_Y46_N31
\inst|inst|estado.s0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|inst|estado.s0~0_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	ena => \ALT_INV_inst4~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|estado.s0~q\);

-- Location: LCCOMB_X71_Y46_N4
\inst|inst|estado.s1~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|inst|estado.s1~feeder_combout\ = \inst|inst|estado.s0~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|inst|estado.s0~q\,
	combout => \inst|inst|estado.s1~feeder_combout\);

-- Location: FF_X71_Y46_N5
\inst|inst|estado.s1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|inst|estado.s1~feeder_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	ena => \ALT_INV_inst4~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|estado.s1~q\);

-- Location: LCCOMB_X70_Y46_N4
\inst|inst|estado.s2~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|inst|estado.s2~feeder_combout\ = \inst|inst|estado.s1~q\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|inst|estado.s1~q\,
	combout => \inst|inst|estado.s2~feeder_combout\);

-- Location: FF_X70_Y46_N5
\inst|inst|estado.s2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|inst|estado.s2~feeder_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	ena => \ALT_INV_inst4~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|estado.s2~q\);

-- Location: LCCOMB_X70_Y46_N26
\inst|inst|WideOr0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|inst|WideOr0~0_combout\ = (\inst|inst|estado.s2~q\) # ((\inst|inst|estado.s6~q\) # ((\inst|inst|estado.s4~q\) # (\inst|inst|estado.s8~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|estado.s2~q\,
	datab => \inst|inst|estado.s6~q\,
	datac => \inst|inst|estado.s4~q\,
	datad => \inst|inst|estado.s8~q\,
	combout => \inst|inst|WideOr0~0_combout\);

-- Location: LCCOMB_X70_Y46_N16
\inst|inst|WideOr0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|inst|WideOr0~1_combout\ = (\inst|inst|estado.s0~q\) # ((\inst|inst|estado.s12~q\) # ((\inst|inst|estado.s10~q\) # (\inst|inst|estado.s14~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst|estado.s0~q\,
	datab => \inst|inst|estado.s12~q\,
	datac => \inst|inst|estado.s10~q\,
	datad => \inst|inst|estado.s14~q\,
	combout => \inst|inst|WideOr0~1_combout\);

-- Location: LCCOMB_X70_Y46_N24
\inst|inst|WideOr0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|inst|WideOr0~combout\ = (!\inst|inst|WideOr0~0_combout\ & !\inst|inst|WideOr0~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|inst|WideOr0~0_combout\,
	datad => \inst|inst|WideOr0~1_combout\,
	combout => \inst|inst|WideOr0~combout\);

-- Location: LCCOMB_X70_Y46_N20
\inst|inst|sx8~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|inst|sx8~0_combout\ = (!\Reset~input_o\ & !\inst4~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reset~input_o\,
	datad => \inst4~q\,
	combout => \inst|inst|sx8~0_combout\);

-- Location: FF_X70_Y46_N25
\inst|inst|sx8\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|inst|WideOr0~combout\,
	ena => \inst|inst|sx8~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|sx8~q\);

-- Location: CLKCTRL_G8
\inst|inst|sx8~clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \inst|inst|sx8~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \inst|inst|sx8~clkctrl_outclk\);

-- Location: LCCOMB_X70_Y46_N2
\inst|inst|sx1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|inst|sx1~1_combout\ = (\inst|inst|estado.s14~q\) # (\inst|inst|estado.s13~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|inst|estado.s14~q\,
	datac => \inst|inst|estado.s13~q\,
	combout => \inst|inst|sx1~1_combout\);

-- Location: FF_X70_Y46_N3
\inst|inst|sx1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|inst|sx1~1_combout\,
	ena => \inst|inst|sx8~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|inst|sx1~q\);

-- Location: CLKCTRL_G9
\inst|inst|sx1~clkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \inst|inst|sx1~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \inst|inst|sx1~clkctrl_outclk\);

-- Location: LCCOMB_X69_Y46_N30
\inst6|contagem[0]~21\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst6|contagem[0]~21_combout\ = !\inst6|contagem\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst6|contagem\(0),
	combout => \inst6|contagem[0]~21_combout\);

-- Location: FF_X69_Y46_N31
\inst6|contagem[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|sx1~clkctrl_outclk\,
	d => \inst6|contagem[0]~21_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	ena => \ALT_INV_inst4~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|contagem\(0));

-- Location: LCCOMB_X69_Y46_N0
\inst6|contagem[1]~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst6|contagem[1]~7_combout\ = (\inst6|contagem\(0) & (\inst6|contagem\(1) $ (VCC))) # (!\inst6|contagem\(0) & (\inst6|contagem\(1) & VCC))
-- \inst6|contagem[1]~8\ = CARRY((\inst6|contagem\(0) & \inst6|contagem\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|contagem\(0),
	datab => \inst6|contagem\(1),
	datad => VCC,
	combout => \inst6|contagem[1]~7_combout\,
	cout => \inst6|contagem[1]~8\);

-- Location: FF_X69_Y46_N1
\inst6|contagem[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|sx1~clkctrl_outclk\,
	d => \inst6|contagem[1]~7_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	ena => \ALT_INV_inst4~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|contagem\(1));

-- Location: LCCOMB_X69_Y46_N2
\inst6|contagem[2]~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst6|contagem[2]~9_combout\ = (\inst6|contagem\(2) & (!\inst6|contagem[1]~8\)) # (!\inst6|contagem\(2) & ((\inst6|contagem[1]~8\) # (GND)))
-- \inst6|contagem[2]~10\ = CARRY((!\inst6|contagem[1]~8\) # (!\inst6|contagem\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst6|contagem\(2),
	datad => VCC,
	cin => \inst6|contagem[1]~8\,
	combout => \inst6|contagem[2]~9_combout\,
	cout => \inst6|contagem[2]~10\);

-- Location: FF_X69_Y46_N3
\inst6|contagem[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|sx1~clkctrl_outclk\,
	d => \inst6|contagem[2]~9_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	ena => \ALT_INV_inst4~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|contagem\(2));

-- Location: LCCOMB_X69_Y46_N4
\inst6|contagem[3]~11\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst6|contagem[3]~11_combout\ = (\inst6|contagem\(3) & (\inst6|contagem[2]~10\ $ (GND))) # (!\inst6|contagem\(3) & (!\inst6|contagem[2]~10\ & VCC))
-- \inst6|contagem[3]~12\ = CARRY((\inst6|contagem\(3) & !\inst6|contagem[2]~10\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst6|contagem\(3),
	datad => VCC,
	cin => \inst6|contagem[2]~10\,
	combout => \inst6|contagem[3]~11_combout\,
	cout => \inst6|contagem[3]~12\);

-- Location: FF_X69_Y46_N5
\inst6|contagem[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|sx1~clkctrl_outclk\,
	d => \inst6|contagem[3]~11_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	ena => \ALT_INV_inst4~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|contagem\(3));

-- Location: LCCOMB_X69_Y46_N6
\inst6|contagem[4]~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst6|contagem[4]~13_combout\ = (\inst6|contagem\(4) & (!\inst6|contagem[3]~12\)) # (!\inst6|contagem\(4) & ((\inst6|contagem[3]~12\) # (GND)))
-- \inst6|contagem[4]~14\ = CARRY((!\inst6|contagem[3]~12\) # (!\inst6|contagem\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|contagem\(4),
	datad => VCC,
	cin => \inst6|contagem[3]~12\,
	combout => \inst6|contagem[4]~13_combout\,
	cout => \inst6|contagem[4]~14\);

-- Location: FF_X69_Y46_N7
\inst6|contagem[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|sx1~clkctrl_outclk\,
	d => \inst6|contagem[4]~13_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	ena => \ALT_INV_inst4~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|contagem\(4));

-- Location: LCCOMB_X69_Y46_N8
\inst6|contagem[5]~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst6|contagem[5]~15_combout\ = (\inst6|contagem\(5) & (\inst6|contagem[4]~14\ $ (GND))) # (!\inst6|contagem\(5) & (!\inst6|contagem[4]~14\ & VCC))
-- \inst6|contagem[5]~16\ = CARRY((\inst6|contagem\(5) & !\inst6|contagem[4]~14\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \inst6|contagem\(5),
	datad => VCC,
	cin => \inst6|contagem[4]~14\,
	combout => \inst6|contagem[5]~15_combout\,
	cout => \inst6|contagem[5]~16\);

-- Location: FF_X69_Y46_N9
\inst6|contagem[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|sx1~clkctrl_outclk\,
	d => \inst6|contagem[5]~15_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	ena => \ALT_INV_inst4~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|contagem\(5));

-- Location: LCCOMB_X69_Y46_N10
\inst6|contagem[6]~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst6|contagem[6]~17_combout\ = (\inst6|contagem\(6) & (!\inst6|contagem[5]~16\)) # (!\inst6|contagem\(6) & ((\inst6|contagem[5]~16\) # (GND)))
-- \inst6|contagem[6]~18\ = CARRY((!\inst6|contagem[5]~16\) # (!\inst6|contagem\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst6|contagem\(6),
	datad => VCC,
	cin => \inst6|contagem[5]~16\,
	combout => \inst6|contagem[6]~17_combout\,
	cout => \inst6|contagem[6]~18\);

-- Location: FF_X69_Y46_N11
\inst6|contagem[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|sx1~clkctrl_outclk\,
	d => \inst6|contagem[6]~17_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	ena => \ALT_INV_inst4~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|contagem\(6));

-- Location: LCCOMB_X69_Y46_N12
\inst6|contagem[7]~19\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst6|contagem[7]~19_combout\ = \inst6|contagem[6]~18\ $ (!\inst6|contagem\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \inst6|contagem\(7),
	cin => \inst6|contagem[6]~18\,
	combout => \inst6|contagem[7]~19_combout\);

-- Location: FF_X69_Y46_N13
\inst6|contagem[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|sx1~clkctrl_outclk\,
	d => \inst6|contagem[7]~19_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	ena => \ALT_INV_inst4~q\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst6|contagem\(7));

-- Location: M9K_X73_Y44_N0
\inst1|altsyncram_component|auto_generated|ram_block1a0\ : fiftyfivenm_ram_block
-- pragma translate_off
GENERIC MAP (
	mem_init2 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init1 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
	mem_init0 => X"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000C80032000C800190014C0057001FC00FF0008800220008800260009800570017C00FF0004800120004800160005800570017C00FF0000800020000800060001800070007C00FF",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	init_file => "ex_hex.hex",
	init_file_layout => "port_a",
	logical_ram_name => "minharom:inst1|altsyncram:altsyncram_component|altsyncram_l991:auto_generated|ALTSYNCRAM",
	operation_mode => "rom",
	port_a_address_clear => "none",
	port_a_address_width => 8,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 18,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 255,
	port_a_logical_ram_depth => 256,
	port_a_logical_ram_width => 8,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_a_write_enable_clock => "none",
	port_b_address_width => 8,
	port_b_data_width => 18,
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portare => VCC,
	clk0 => \inst|inst|sx1~clkctrl_outclk\,
	portaaddr => \inst1|altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portadataout => \inst1|altsyncram_component|auto_generated|ram_block1a0_PORTADATAOUT_bus\);

-- Location: LCCOMB_X74_Y44_N22
\inst7|inst|inst~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|inst|inst~feeder_combout\ = \inst1|altsyncram_component|auto_generated|q_a\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst1|altsyncram_component|auto_generated|q_a\(0),
	combout => \inst7|inst|inst~feeder_combout\);

-- Location: FF_X74_Y44_N23
\inst7|inst|inst\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|ALT_INV_sx8~clkctrl_outclk\,
	d => \inst7|inst|inst~feeder_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|inst|inst~q\);

-- Location: LCCOMB_X74_Y44_N8
\inst7|inst|inst10|inst2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|inst|inst10|inst2~0_combout\ = (\inst|inst|sx1~q\ & ((\inst1|altsyncram_component|auto_generated|q_a\(1)))) # (!\inst|inst|sx1~q\ & (\inst7|inst|inst~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|inst|inst~q\,
	datac => \inst1|altsyncram_component|auto_generated|q_a\(1),
	datad => \inst|inst|sx1~q\,
	combout => \inst7|inst|inst10|inst2~0_combout\);

-- Location: FF_X74_Y44_N9
\inst7|inst|inst1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|ALT_INV_sx8~clkctrl_outclk\,
	d => \inst7|inst|inst10|inst2~0_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|inst|inst1~q\);

-- Location: LCCOMB_X74_Y44_N18
\inst7|inst|inst11|inst2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|inst|inst11|inst2~0_combout\ = (\inst|inst|sx1~q\ & ((\inst1|altsyncram_component|auto_generated|q_a\(2)))) # (!\inst|inst|sx1~q\ & (\inst7|inst|inst1~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst7|inst|inst1~q\,
	datac => \inst|inst|sx1~q\,
	datad => \inst1|altsyncram_component|auto_generated|q_a\(2),
	combout => \inst7|inst|inst11|inst2~0_combout\);

-- Location: FF_X74_Y44_N19
\inst7|inst|inst2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|ALT_INV_sx8~clkctrl_outclk\,
	d => \inst7|inst|inst11|inst2~0_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|inst|inst2~q\);

-- Location: LCCOMB_X74_Y44_N20
\inst7|inst|inst12|inst2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|inst|inst12|inst2~0_combout\ = (\inst|inst|sx1~q\ & ((\inst1|altsyncram_component|auto_generated|q_a\(3)))) # (!\inst|inst|sx1~q\ & (\inst7|inst|inst2~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst7|inst|inst2~q\,
	datac => \inst1|altsyncram_component|auto_generated|q_a\(3),
	datad => \inst|inst|sx1~q\,
	combout => \inst7|inst|inst12|inst2~0_combout\);

-- Location: FF_X74_Y44_N21
\inst7|inst|inst3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|ALT_INV_sx8~clkctrl_outclk\,
	d => \inst7|inst|inst12|inst2~0_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|inst|inst3~q\);

-- Location: LCCOMB_X72_Y44_N22
\inst7|inst|inst13|inst2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|inst|inst13|inst2~0_combout\ = (\inst|inst|sx1~q\ & ((\inst1|altsyncram_component|auto_generated|q_a\(4)))) # (!\inst|inst|sx1~q\ & (\inst7|inst|inst3~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|inst|inst3~q\,
	datac => \inst|inst|sx1~q\,
	datad => \inst1|altsyncram_component|auto_generated|q_a\(4),
	combout => \inst7|inst|inst13|inst2~0_combout\);

-- Location: FF_X72_Y44_N23
\inst7|inst|inst4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|ALT_INV_sx8~clkctrl_outclk\,
	d => \inst7|inst|inst13|inst2~0_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|inst|inst4~q\);

-- Location: LCCOMB_X72_Y44_N30
\inst7|inst|inst14|inst2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|inst|inst14|inst2~0_combout\ = (\inst|inst|sx1~q\ & ((\inst1|altsyncram_component|auto_generated|q_a\(5)))) # (!\inst|inst|sx1~q\ & (\inst7|inst|inst4~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|inst|inst4~q\,
	datac => \inst|inst|sx1~q\,
	datad => \inst1|altsyncram_component|auto_generated|q_a\(5),
	combout => \inst7|inst|inst14|inst2~0_combout\);

-- Location: FF_X72_Y44_N31
\inst7|inst|inst5\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|ALT_INV_sx8~clkctrl_outclk\,
	d => \inst7|inst|inst14|inst2~0_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|inst|inst5~q\);

-- Location: LCCOMB_X72_Y44_N28
\inst7|inst|inst15|inst2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|inst|inst15|inst2~0_combout\ = (\inst|inst|sx1~q\ & ((\inst1|altsyncram_component|auto_generated|q_a\(6)))) # (!\inst|inst|sx1~q\ & (\inst7|inst|inst5~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|inst|inst5~q\,
	datac => \inst1|altsyncram_component|auto_generated|q_a\(6),
	datad => \inst|inst|sx1~q\,
	combout => \inst7|inst|inst15|inst2~0_combout\);

-- Location: FF_X72_Y44_N29
\inst7|inst|inst6\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|ALT_INV_sx8~clkctrl_outclk\,
	d => \inst7|inst|inst15|inst2~0_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|inst|inst6~q\);

-- Location: LCCOMB_X72_Y44_N18
\inst7|inst|inst16|inst2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst7|inst|inst16|inst2~0_combout\ = (\inst|inst|sx1~q\ & ((\inst1|altsyncram_component|auto_generated|q_a\(7)))) # (!\inst|inst|sx1~q\ & (\inst7|inst|inst6~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst7|inst|inst6~q\,
	datac => \inst1|altsyncram_component|auto_generated|q_a\(7),
	datad => \inst|inst|sx1~q\,
	combout => \inst7|inst|inst16|inst2~0_combout\);

-- Location: FF_X72_Y44_N19
\inst7|inst|inst7\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|ALT_INV_sx8~clkctrl_outclk\,
	d => \inst7|inst|inst16|inst2~0_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst7|inst|inst7~q\);

-- Location: LCCOMB_X72_Y44_N2
\inst3|Selector1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst3|Selector1~0_combout\ = (\inst3|estado.s5~q\) # (\inst3|estado.s7~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst3|estado.s5~q\,
	datac => \inst3|estado.s7~q\,
	combout => \inst3|Selector1~0_combout\);

-- Location: LCCOMB_X72_Y44_N24
\inst3|Selector1~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst3|Selector1~1_combout\ = (!\inst3|estado.s2~q\ & (!\inst7|inst|inst7~q\ & (!\inst3|estado.s4~q\ & !\inst3|Selector1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|estado.s2~q\,
	datab => \inst7|inst|inst7~q\,
	datac => \inst3|estado.s4~q\,
	datad => \inst3|Selector1~0_combout\,
	combout => \inst3|Selector1~1_combout\);

-- Location: FF_X72_Y44_N25
\inst3|estado.s1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|ALT_INV_sx8~clkctrl_outclk\,
	d => \inst3|Selector1~1_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|estado.s1~q\);

-- Location: LCCOMB_X72_Y44_N26
\inst3|estado~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst3|estado~18_combout\ = (\inst7|inst|inst7~q\ & ((\inst3|estado.s1~q\) # (\inst3|estado.s5~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|inst|inst7~q\,
	datab => \inst3|estado.s1~q\,
	datac => \inst3|estado.s5~q\,
	combout => \inst3|estado~18_combout\);

-- Location: FF_X72_Y44_N27
\inst3|estado.s2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|ALT_INV_sx8~clkctrl_outclk\,
	d => \inst3|estado~18_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|estado.s2~q\);

-- Location: LCCOMB_X72_Y44_N16
\inst3|Selector2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst3|Selector2~0_combout\ = (!\inst7|inst|inst7~q\ & ((\inst3|estado.s2~q\) # (\inst3|estado.s7~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|estado.s2~q\,
	datab => \inst3|estado.s7~q\,
	datac => \inst7|inst|inst7~q\,
	combout => \inst3|Selector2~0_combout\);

-- Location: FF_X72_Y44_N17
\inst3|estado.s3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|ALT_INV_sx8~clkctrl_outclk\,
	d => \inst3|Selector2~0_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|estado.s3~q\);

-- Location: LCCOMB_X72_Y44_N20
\inst3|estado~15\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst3|estado~15_combout\ = (\inst7|inst|inst7~q\ & \inst3|estado.s3~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst7|inst|inst7~q\,
	datad => \inst3|estado.s3~q\,
	combout => \inst3|estado~15_combout\);

-- Location: FF_X72_Y44_N21
\inst3|estado.s4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|ALT_INV_sx8~clkctrl_outclk\,
	d => \inst3|estado~15_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|estado.s4~q\);

-- Location: LCCOMB_X72_Y44_N8
\inst3|estado~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst3|estado~16_combout\ = (!\inst7|inst|inst7~q\ & \inst3|estado.s4~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|inst|inst7~q\,
	datac => \inst3|estado.s4~q\,
	combout => \inst3|estado~16_combout\);

-- Location: FF_X72_Y44_N9
\inst3|estado.s5\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|ALT_INV_sx8~clkctrl_outclk\,
	d => \inst3|estado~16_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|estado.s5~q\);

-- Location: LCCOMB_X72_Y44_N6
\inst3|estado~17\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst3|estado~17_combout\ = (!\inst7|inst|inst7~q\ & \inst3|estado.s5~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst7|inst|inst7~q\,
	datac => \inst3|estado.s5~q\,
	combout => \inst3|estado~17_combout\);

-- Location: FF_X72_Y44_N7
\inst3|estado.s6\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|ALT_INV_sx8~clkctrl_outclk\,
	d => \inst3|estado~17_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|estado.s6~q\);

-- Location: LCCOMB_X72_Y44_N10
\inst3|estado~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst3|estado~12_combout\ = (\inst7|inst|inst7~q\ & \inst3|estado.s6~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst7|inst|inst7~q\,
	datad => \inst3|estado.s6~q\,
	combout => \inst3|estado~12_combout\);

-- Location: FF_X72_Y44_N11
\inst3|estado.s7\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|ALT_INV_sx8~clkctrl_outclk\,
	d => \inst3|estado~12_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|estado.s7~q\);

-- Location: LCCOMB_X72_Y44_N12
\inst3|estado~13\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst3|estado~13_combout\ = (\inst3|estado.s7~q\) # ((\inst3|estado.s2~q\) # ((\inst3|estado.s4~q\) # (!\inst3|estado.s0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|estado.s7~q\,
	datab => \inst3|estado.s2~q\,
	datac => \inst3|estado.s4~q\,
	datad => \inst3|estado.s0~q\,
	combout => \inst3|estado~13_combout\);

-- Location: LCCOMB_X72_Y44_N4
\inst3|estado~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst3|estado~14_combout\ = (!\inst3|estado~13_combout\) # (!\inst7|inst|inst7~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst7|inst|inst7~q\,
	datad => \inst3|estado~13_combout\,
	combout => \inst3|estado~14_combout\);

-- Location: FF_X72_Y44_N5
\inst3|estado.s0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|ALT_INV_sx8~clkctrl_outclk\,
	d => \inst3|estado~14_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|estado.s0~q\);

-- Location: LCCOMB_X72_Y44_N14
\inst3|Selector0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst3|Selector0~0_combout\ = (\inst3|estado.s7~q\ & (((\inst3|d_s~q\) # (\inst7|inst|inst7~q\)))) # (!\inst3|estado.s7~q\ & (\inst3|estado.s0~q\ & (\inst3|d_s~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|estado.s7~q\,
	datab => \inst3|estado.s0~q\,
	datac => \inst3|d_s~q\,
	datad => \inst7|inst|inst7~q\,
	combout => \inst3|Selector0~0_combout\);

-- Location: FF_X72_Y44_N15
\inst3|d_s\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|ALT_INV_sx8~q\,
	d => \inst3|Selector0~0_combout\,
	ena => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|d_s~q\);

-- Location: LCCOMB_X77_Y42_N30
\inst10|inst|inst6~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst10|inst|inst6~feeder_combout\ = \inst6|contagem\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst6|contagem\(6),
	combout => \inst10|inst|inst6~feeder_combout\);

-- Location: FF_X77_Y42_N31
\inst10|inst|inst6\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|ALT_INV_sx1~clkctrl_outclk\,
	d => \inst10|inst|inst6~feeder_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|inst|inst6~q\);

-- Location: LCCOMB_X77_Y42_N0
\inst10|inst|inst5~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst10|inst|inst5~feeder_combout\ = \inst6|contagem\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst6|contagem\(5),
	combout => \inst10|inst|inst5~feeder_combout\);

-- Location: FF_X77_Y42_N1
\inst10|inst|inst5\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|ALT_INV_sx1~clkctrl_outclk\,
	d => \inst10|inst|inst5~feeder_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|inst|inst5~q\);

-- Location: FF_X77_Y42_N9
\inst10|inst|inst7\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|ALT_INV_sx1~clkctrl_outclk\,
	asdata => \inst6|contagem\(7),
	clrn => \ALT_INV_Reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|inst|inst7~q\);

-- Location: FF_X77_Y42_N7
\inst10|inst|inst4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|ALT_INV_sx1~clkctrl_outclk\,
	asdata => \inst6|contagem\(4),
	clrn => \ALT_INV_Reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|inst|inst4~q\);

-- Location: LCCOMB_X77_Y42_N16
\inst11|inst|inst2|inst10~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst11|inst|inst2|inst10~0_combout\ = (\inst10|inst|inst6~q\ & ((\inst10|inst|inst5~q\) # (\inst10|inst|inst7~q\ $ (\inst10|inst|inst4~q\)))) # (!\inst10|inst|inst6~q\ & ((\inst10|inst|inst5~q\ $ (\inst10|inst|inst7~q\)) # (!\inst10|inst|inst4~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001111011111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|inst|inst6~q\,
	datab => \inst10|inst|inst5~q\,
	datac => \inst10|inst|inst7~q\,
	datad => \inst10|inst|inst4~q\,
	combout => \inst11|inst|inst2|inst10~0_combout\);

-- Location: LCCOMB_X77_Y42_N18
\inst11|inst|inst2|inst51|inst3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst11|inst|inst2|inst51|inst3~0_combout\ = (\inst10|inst|inst5~q\ & ((\inst10|inst|inst4~q\ & ((!\inst10|inst|inst7~q\))) # (!\inst10|inst|inst4~q\ & (!\inst10|inst|inst6~q\)))) # (!\inst10|inst|inst5~q\ & ((\inst10|inst|inst7~q\ $ 
-- (!\inst10|inst|inst4~q\)) # (!\inst10|inst|inst6~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110101010111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|inst|inst6~q\,
	datab => \inst10|inst|inst5~q\,
	datac => \inst10|inst|inst7~q\,
	datad => \inst10|inst|inst4~q\,
	combout => \inst11|inst|inst2|inst51|inst3~0_combout\);

-- Location: LCCOMB_X77_Y42_N24
\inst11|inst|inst2|inst52|inst3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst11|inst|inst2|inst52|inst3~0_combout\ = (\inst10|inst|inst6~q\ & (((!\inst10|inst|inst5~q\ & \inst10|inst|inst4~q\)) # (!\inst10|inst|inst7~q\))) # (!\inst10|inst|inst6~q\ & (((\inst10|inst|inst7~q\) # (\inst10|inst|inst4~q\)) # 
-- (!\inst10|inst|inst5~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111101011011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|inst|inst6~q\,
	datab => \inst10|inst|inst5~q\,
	datac => \inst10|inst|inst7~q\,
	datad => \inst10|inst|inst4~q\,
	combout => \inst11|inst|inst2|inst52|inst3~0_combout\);

-- Location: LCCOMB_X77_Y42_N22
\inst11|inst|inst2|inst53|inst3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst11|inst|inst2|inst53|inst3~0_combout\ = (\inst10|inst|inst5~q\ & ((\inst10|inst|inst6~q\ & ((!\inst10|inst|inst4~q\))) # (!\inst10|inst|inst6~q\ & ((\inst10|inst|inst4~q\) # (!\inst10|inst|inst7~q\))))) # (!\inst10|inst|inst5~q\ & 
-- ((\inst10|inst|inst7~q\) # (\inst10|inst|inst6~q\ $ (!\inst10|inst|inst4~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011010111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|inst|inst6~q\,
	datab => \inst10|inst|inst5~q\,
	datac => \inst10|inst|inst7~q\,
	datad => \inst10|inst|inst4~q\,
	combout => \inst11|inst|inst2|inst53|inst3~0_combout\);

-- Location: LCCOMB_X77_Y42_N12
\inst11|inst|inst2|inst38~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst11|inst|inst2|inst38~0_combout\ = (\inst10|inst|inst5~q\ & (((\inst10|inst|inst7~q\) # (!\inst10|inst|inst4~q\)))) # (!\inst10|inst|inst5~q\ & ((\inst10|inst|inst6~q\ & (\inst10|inst|inst7~q\)) # (!\inst10|inst|inst6~q\ & 
-- ((!\inst10|inst|inst4~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|inst|inst6~q\,
	datab => \inst10|inst|inst5~q\,
	datac => \inst10|inst|inst7~q\,
	datad => \inst10|inst|inst4~q\,
	combout => \inst11|inst|inst2|inst38~0_combout\);

-- Location: LCCOMB_X77_Y42_N8
\inst11|inst|inst2|inst54|inst3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst11|inst|inst2|inst54|inst3~0_combout\ = (\inst10|inst|inst6~q\ & ((\inst10|inst|inst5~q\ $ (!\inst10|inst|inst7~q\)) # (!\inst10|inst|inst4~q\))) # (!\inst10|inst|inst6~q\ & ((\inst10|inst|inst7~q\) # ((!\inst10|inst|inst5~q\ & 
-- !\inst10|inst|inst4~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101001011111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|inst|inst6~q\,
	datab => \inst10|inst|inst5~q\,
	datac => \inst10|inst|inst7~q\,
	datad => \inst10|inst|inst4~q\,
	combout => \inst11|inst|inst2|inst54|inst3~0_combout\);

-- Location: LCCOMB_X77_Y42_N6
\inst11|inst|inst2|inst55|inst3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst11|inst|inst2|inst55|inst3~0_combout\ = (\inst10|inst|inst4~q\ & ((\inst10|inst|inst7~q\) # (\inst10|inst|inst6~q\ $ (\inst10|inst|inst5~q\)))) # (!\inst10|inst|inst4~q\ & ((\inst10|inst|inst5~q\) # (\inst10|inst|inst6~q\ $ (\inst10|inst|inst7~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111111100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|inst|inst6~q\,
	datab => \inst10|inst|inst7~q\,
	datac => \inst10|inst|inst4~q\,
	datad => \inst10|inst|inst5~q\,
	combout => \inst11|inst|inst2|inst55|inst3~0_combout\);

-- Location: FF_X77_Y42_N11
\inst10|inst|inst1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|ALT_INV_sx1~clkctrl_outclk\,
	asdata => \inst6|contagem\(1),
	clrn => \ALT_INV_Reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|inst|inst1~q\);

-- Location: FF_X77_Y42_N21
\inst10|inst|inst\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|ALT_INV_sx1~clkctrl_outclk\,
	asdata => \inst6|contagem\(0),
	clrn => \ALT_INV_Reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|inst|inst~q\);

-- Location: FF_X77_Y42_N5
\inst10|inst|inst2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|ALT_INV_sx1~clkctrl_outclk\,
	asdata => \inst6|contagem\(2),
	clrn => \ALT_INV_Reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|inst|inst2~q\);

-- Location: FF_X77_Y42_N3
\inst10|inst|inst3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|ALT_INV_sx1~clkctrl_outclk\,
	asdata => \inst6|contagem\(3),
	clrn => \ALT_INV_Reset~input_o\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst10|inst|inst3~q\);

-- Location: LCCOMB_X77_Y42_N26
\inst11|inst1|inst2|inst10~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst11|inst1|inst2|inst10~0_combout\ = (\inst10|inst|inst2~q\ & ((\inst10|inst|inst1~q\) # (\inst10|inst|inst~q\ $ (\inst10|inst|inst3~q\)))) # (!\inst10|inst|inst2~q\ & ((\inst10|inst|inst1~q\ $ (\inst10|inst|inst3~q\)) # (!\inst10|inst|inst~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011011111101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|inst|inst1~q\,
	datab => \inst10|inst|inst~q\,
	datac => \inst10|inst|inst2~q\,
	datad => \inst10|inst|inst3~q\,
	combout => \inst11|inst1|inst2|inst10~0_combout\);

-- Location: LCCOMB_X77_Y42_N28
\inst11|inst1|inst2|inst51|inst3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst11|inst1|inst2|inst51|inst3~0_combout\ = (\inst10|inst|inst1~q\ & ((\inst10|inst|inst~q\ & ((!\inst10|inst|inst3~q\))) # (!\inst10|inst|inst~q\ & (!\inst10|inst|inst2~q\)))) # (!\inst10|inst|inst1~q\ & ((\inst10|inst|inst~q\ $ 
-- (!\inst10|inst|inst3~q\)) # (!\inst10|inst|inst2~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100011110011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|inst|inst1~q\,
	datab => \inst10|inst|inst~q\,
	datac => \inst10|inst|inst2~q\,
	datad => \inst10|inst|inst3~q\,
	combout => \inst11|inst1|inst2|inst51|inst3~0_combout\);

-- Location: LCCOMB_X77_Y42_N14
\inst11|inst1|inst2|inst52|inst3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst11|inst1|inst2|inst52|inst3~0_combout\ = (\inst10|inst|inst2~q\ & (((!\inst10|inst|inst1~q\ & \inst10|inst|inst~q\)) # (!\inst10|inst|inst3~q\))) # (!\inst10|inst|inst2~q\ & (((\inst10|inst|inst~q\) # (\inst10|inst|inst3~q\)) # 
-- (!\inst10|inst|inst1~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|inst|inst1~q\,
	datab => \inst10|inst|inst~q\,
	datac => \inst10|inst|inst2~q\,
	datad => \inst10|inst|inst3~q\,
	combout => \inst11|inst1|inst2|inst52|inst3~0_combout\);

-- Location: LCCOMB_X77_Y42_N10
\inst11|inst1|inst2|inst53|inst3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst11|inst1|inst2|inst53|inst3~0_combout\ = (\inst10|inst|inst1~q\ & ((\inst10|inst|inst2~q\ & (!\inst10|inst|inst~q\)) # (!\inst10|inst|inst2~q\ & ((\inst10|inst|inst~q\) # (!\inst10|inst|inst3~q\))))) # (!\inst10|inst|inst1~q\ & 
-- ((\inst10|inst|inst3~q\) # (\inst10|inst|inst2~q\ $ (!\inst10|inst|inst~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110111101111001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|inst|inst2~q\,
	datab => \inst10|inst|inst~q\,
	datac => \inst10|inst|inst1~q\,
	datad => \inst10|inst|inst3~q\,
	combout => \inst11|inst1|inst2|inst53|inst3~0_combout\);

-- Location: LCCOMB_X77_Y42_N4
\inst11|inst1|inst2|inst38~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst11|inst1|inst2|inst38~0_combout\ = (\inst10|inst|inst1~q\ & (((\inst10|inst|inst3~q\)) # (!\inst10|inst|inst~q\))) # (!\inst10|inst|inst1~q\ & ((\inst10|inst|inst2~q\ & ((\inst10|inst|inst3~q\))) # (!\inst10|inst|inst2~q\ & (!\inst10|inst|inst~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101100100011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|inst|inst1~q\,
	datab => \inst10|inst|inst~q\,
	datac => \inst10|inst|inst2~q\,
	datad => \inst10|inst|inst3~q\,
	combout => \inst11|inst1|inst2|inst38~0_combout\);

-- Location: LCCOMB_X77_Y42_N2
\inst11|inst1|inst2|inst54|inst3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst11|inst1|inst2|inst54|inst3~0_combout\ = (\inst10|inst|inst1~q\ & ((\inst10|inst|inst3~q\) # ((\inst10|inst|inst2~q\ & !\inst10|inst|inst~q\)))) # (!\inst10|inst|inst1~q\ & ((\inst10|inst|inst2~q\ $ (\inst10|inst|inst3~q\)) # 
-- (!\inst10|inst|inst~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011010011111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|inst|inst1~q\,
	datab => \inst10|inst|inst2~q\,
	datac => \inst10|inst|inst3~q\,
	datad => \inst10|inst|inst~q\,
	combout => \inst11|inst1|inst2|inst54|inst3~0_combout\);

-- Location: LCCOMB_X77_Y42_N20
\inst11|inst1|inst2|inst55|inst3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst11|inst1|inst2|inst55|inst3~0_combout\ = (\inst10|inst|inst~q\ & ((\inst10|inst|inst3~q\) # (\inst10|inst|inst1~q\ $ (\inst10|inst|inst2~q\)))) # (!\inst10|inst|inst~q\ & ((\inst10|inst|inst1~q\) # (\inst10|inst|inst2~q\ $ (\inst10|inst|inst3~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101101101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst10|inst|inst1~q\,
	datab => \inst10|inst|inst2~q\,
	datac => \inst10|inst|inst~q\,
	datad => \inst10|inst|inst3~q\,
	combout => \inst11|inst1|inst2|inst55|inst3~0_combout\);

-- Location: LCCOMB_X74_Y44_N14
\inst2|inst|inst6~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst2|inst|inst6~feeder_combout\ = \inst1|altsyncram_component|auto_generated|q_a\(6)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst1|altsyncram_component|auto_generated|q_a\(6),
	combout => \inst2|inst|inst6~feeder_combout\);

-- Location: FF_X74_Y44_N15
\inst2|inst|inst6\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|ALT_INV_sx1~clkctrl_outclk\,
	d => \inst2|inst|inst6~feeder_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|inst|inst6~q\);

-- Location: LCCOMB_X74_Y44_N28
\inst2|inst|inst5~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst2|inst|inst5~feeder_combout\ = \inst1|altsyncram_component|auto_generated|q_a\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst1|altsyncram_component|auto_generated|q_a\(5),
	combout => \inst2|inst|inst5~feeder_combout\);

-- Location: FF_X74_Y44_N29
\inst2|inst|inst5\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|ALT_INV_sx1~clkctrl_outclk\,
	d => \inst2|inst|inst5~feeder_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|inst|inst5~q\);

-- Location: LCCOMB_X74_Y44_N0
\inst2|inst|inst4~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst2|inst|inst4~feeder_combout\ = \inst1|altsyncram_component|auto_generated|q_a\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst1|altsyncram_component|auto_generated|q_a\(4),
	combout => \inst2|inst|inst4~feeder_combout\);

-- Location: FF_X74_Y44_N1
\inst2|inst|inst4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|ALT_INV_sx1~clkctrl_outclk\,
	d => \inst2|inst|inst4~feeder_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|inst|inst4~q\);

-- Location: LCCOMB_X75_Y44_N12
\inst2|inst|inst7~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst2|inst|inst7~feeder_combout\ = \inst1|altsyncram_component|auto_generated|q_a\(7)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst1|altsyncram_component|auto_generated|q_a\(7),
	combout => \inst2|inst|inst7~feeder_combout\);

-- Location: FF_X75_Y44_N13
\inst2|inst|inst7\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|ALT_INV_sx1~clkctrl_outclk\,
	d => \inst2|inst|inst7~feeder_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|inst|inst7~q\);

-- Location: LCCOMB_X75_Y44_N2
\inst9|inst|inst2|inst10~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst9|inst|inst2|inst10~0_combout\ = (\inst2|inst|inst6~q\ & ((\inst2|inst|inst5~q\) # (\inst2|inst|inst4~q\ $ (\inst2|inst|inst7~q\)))) # (!\inst2|inst|inst6~q\ & ((\inst2|inst|inst5~q\ $ (\inst2|inst|inst7~q\)) # (!\inst2|inst|inst4~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001111111101101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst|inst6~q\,
	datab => \inst2|inst|inst5~q\,
	datac => \inst2|inst|inst4~q\,
	datad => \inst2|inst|inst7~q\,
	combout => \inst9|inst|inst2|inst10~0_combout\);

-- Location: LCCOMB_X75_Y44_N28
\inst9|inst|inst2|inst51|inst3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst9|inst|inst2|inst51|inst3~0_combout\ = (\inst2|inst|inst5~q\ & ((\inst2|inst|inst4~q\ & ((!\inst2|inst|inst7~q\))) # (!\inst2|inst|inst4~q\ & (!\inst2|inst|inst6~q\)))) # (!\inst2|inst|inst5~q\ & ((\inst2|inst|inst4~q\ $ (!\inst2|inst|inst7~q\)) # 
-- (!\inst2|inst|inst6~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011010111010111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst|inst6~q\,
	datab => \inst2|inst|inst5~q\,
	datac => \inst2|inst|inst4~q\,
	datad => \inst2|inst|inst7~q\,
	combout => \inst9|inst|inst2|inst51|inst3~0_combout\);

-- Location: LCCOMB_X75_Y44_N10
\inst9|inst|inst2|inst52|inst3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst9|inst|inst2|inst52|inst3~0_combout\ = (\inst2|inst|inst6~q\ & (((!\inst2|inst|inst5~q\ & \inst2|inst|inst4~q\)) # (!\inst2|inst|inst7~q\))) # (!\inst2|inst|inst6~q\ & (((\inst2|inst|inst4~q\) # (\inst2|inst|inst7~q\)) # (!\inst2|inst|inst5~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst|inst6~q\,
	datab => \inst2|inst|inst5~q\,
	datac => \inst2|inst|inst4~q\,
	datad => \inst2|inst|inst7~q\,
	combout => \inst9|inst|inst2|inst52|inst3~0_combout\);

-- Location: LCCOMB_X75_Y44_N16
\inst9|inst|inst2|inst53|inst3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst9|inst|inst2|inst53|inst3~0_combout\ = (\inst2|inst|inst5~q\ & ((\inst2|inst|inst6~q\ & (!\inst2|inst|inst4~q\)) # (!\inst2|inst|inst6~q\ & ((\inst2|inst|inst4~q\) # (!\inst2|inst|inst7~q\))))) # (!\inst2|inst|inst5~q\ & ((\inst2|inst|inst7~q\) # 
-- (\inst2|inst|inst6~q\ $ (!\inst2|inst|inst4~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111101101101101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst|inst6~q\,
	datab => \inst2|inst|inst5~q\,
	datac => \inst2|inst|inst4~q\,
	datad => \inst2|inst|inst7~q\,
	combout => \inst9|inst|inst2|inst53|inst3~0_combout\);

-- Location: LCCOMB_X75_Y44_N6
\inst9|inst|inst2|inst38~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst9|inst|inst2|inst38~0_combout\ = (\inst2|inst|inst5~q\ & (((\inst2|inst|inst7~q\) # (!\inst2|inst|inst4~q\)))) # (!\inst2|inst|inst5~q\ & ((\inst2|inst|inst6~q\ & ((\inst2|inst|inst7~q\))) # (!\inst2|inst|inst6~q\ & (!\inst2|inst|inst4~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111100001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst|inst6~q\,
	datab => \inst2|inst|inst5~q\,
	datac => \inst2|inst|inst4~q\,
	datad => \inst2|inst|inst7~q\,
	combout => \inst9|inst|inst2|inst38~0_combout\);

-- Location: LCCOMB_X75_Y44_N24
\inst9|inst|inst2|inst54|inst3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst9|inst|inst2|inst54|inst3~0_combout\ = (\inst2|inst|inst6~q\ & ((\inst2|inst|inst5~q\ $ (!\inst2|inst|inst7~q\)) # (!\inst2|inst|inst4~q\))) # (!\inst2|inst|inst6~q\ & ((\inst2|inst|inst7~q\) # ((!\inst2|inst|inst5~q\ & !\inst2|inst|inst4~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111100101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst|inst6~q\,
	datab => \inst2|inst|inst5~q\,
	datac => \inst2|inst|inst4~q\,
	datad => \inst2|inst|inst7~q\,
	combout => \inst9|inst|inst2|inst54|inst3~0_combout\);

-- Location: LCCOMB_X75_Y44_N30
\inst9|inst|inst2|inst55|inst3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst9|inst|inst2|inst55|inst3~0_combout\ = (\inst2|inst|inst4~q\ & ((\inst2|inst|inst7~q\) # (\inst2|inst|inst6~q\ $ (\inst2|inst|inst5~q\)))) # (!\inst2|inst|inst4~q\ & ((\inst2|inst|inst5~q\) # (\inst2|inst|inst6~q\ $ (\inst2|inst|inst7~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110101101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst|inst6~q\,
	datab => \inst2|inst|inst5~q\,
	datac => \inst2|inst|inst4~q\,
	datad => \inst2|inst|inst7~q\,
	combout => \inst9|inst|inst2|inst55|inst3~0_combout\);

-- Location: LCCOMB_X74_Y44_N6
\inst2|inst|inst3~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst2|inst|inst3~feeder_combout\ = \inst1|altsyncram_component|auto_generated|q_a\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst1|altsyncram_component|auto_generated|q_a\(3),
	combout => \inst2|inst|inst3~feeder_combout\);

-- Location: FF_X74_Y44_N7
\inst2|inst|inst3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|ALT_INV_sx1~clkctrl_outclk\,
	d => \inst2|inst|inst3~feeder_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|inst|inst3~q\);

-- Location: LCCOMB_X74_Y44_N12
\inst2|inst|inst2~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst2|inst|inst2~feeder_combout\ = \inst1|altsyncram_component|auto_generated|q_a\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst1|altsyncram_component|auto_generated|q_a\(2),
	combout => \inst2|inst|inst2~feeder_combout\);

-- Location: FF_X74_Y44_N13
\inst2|inst|inst2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|ALT_INV_sx1~clkctrl_outclk\,
	d => \inst2|inst|inst2~feeder_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|inst|inst2~q\);

-- Location: LCCOMB_X74_Y44_N26
\inst2|inst|inst1~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst2|inst|inst1~feeder_combout\ = \inst1|altsyncram_component|auto_generated|q_a\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst1|altsyncram_component|auto_generated|q_a\(1),
	combout => \inst2|inst|inst1~feeder_combout\);

-- Location: FF_X74_Y44_N27
\inst2|inst|inst1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|ALT_INV_sx1~clkctrl_outclk\,
	d => \inst2|inst|inst1~feeder_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|inst|inst1~q\);

-- Location: LCCOMB_X74_Y44_N16
\inst2|inst|inst~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst2|inst|inst~feeder_combout\ = \inst1|altsyncram_component|auto_generated|q_a\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst1|altsyncram_component|auto_generated|q_a\(0),
	combout => \inst2|inst|inst~feeder_combout\);

-- Location: FF_X74_Y44_N17
\inst2|inst|inst\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|ALT_INV_sx1~clkctrl_outclk\,
	d => \inst2|inst|inst~feeder_combout\,
	clrn => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst2|inst|inst~q\);

-- Location: LCCOMB_X74_Y44_N10
\inst9|inst1|inst2|inst10~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst9|inst1|inst2|inst10~0_combout\ = (\inst2|inst|inst3~q\ & ((\inst2|inst|inst2~q\ $ (!\inst2|inst|inst1~q\)) # (!\inst2|inst|inst~q\))) # (!\inst2|inst|inst3~q\ & ((\inst2|inst|inst1~q\) # (\inst2|inst|inst2~q\ $ (!\inst2|inst|inst~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101011011111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst|inst3~q\,
	datab => \inst2|inst|inst2~q\,
	datac => \inst2|inst|inst1~q\,
	datad => \inst2|inst|inst~q\,
	combout => \inst9|inst1|inst2|inst10~0_combout\);

-- Location: LCCOMB_X74_Y44_N4
\inst9|inst1|inst2|inst51|inst3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst9|inst1|inst2|inst51|inst3~0_combout\ = (\inst2|inst|inst3~q\ & ((\inst2|inst|inst~q\ & ((!\inst2|inst|inst1~q\))) # (!\inst2|inst|inst~q\ & (!\inst2|inst|inst2~q\)))) # (!\inst2|inst|inst3~q\ & ((\inst2|inst|inst1~q\ $ (!\inst2|inst|inst~q\)) # 
-- (!\inst2|inst|inst2~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101100110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst|inst3~q\,
	datab => \inst2|inst|inst2~q\,
	datac => \inst2|inst|inst1~q\,
	datad => \inst2|inst|inst~q\,
	combout => \inst9|inst1|inst2|inst51|inst3~0_combout\);

-- Location: LCCOMB_X74_Y44_N2
\inst9|inst1|inst2|inst52|inst3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst9|inst1|inst2|inst52|inst3~0_combout\ = (\inst2|inst|inst3~q\ & (((!\inst2|inst|inst1~q\ & \inst2|inst|inst~q\)) # (!\inst2|inst|inst2~q\))) # (!\inst2|inst|inst3~q\ & ((\inst2|inst|inst2~q\) # ((\inst2|inst|inst~q\) # (!\inst2|inst|inst1~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111101100111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst|inst3~q\,
	datab => \inst2|inst|inst2~q\,
	datac => \inst2|inst|inst1~q\,
	datad => \inst2|inst|inst~q\,
	combout => \inst9|inst1|inst2|inst52|inst3~0_combout\);

-- Location: LCCOMB_X74_Y44_N24
\inst9|inst1|inst2|inst53|inst3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst9|inst1|inst2|inst53|inst3~0_combout\ = (\inst2|inst|inst1~q\ & ((\inst2|inst|inst2~q\ & ((!\inst2|inst|inst~q\))) # (!\inst2|inst|inst2~q\ & ((\inst2|inst|inst~q\) # (!\inst2|inst|inst3~q\))))) # (!\inst2|inst|inst1~q\ & ((\inst2|inst|inst3~q\) # 
-- (\inst2|inst|inst2~q\ $ (!\inst2|inst|inst~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111011011011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst|inst3~q\,
	datab => \inst2|inst|inst2~q\,
	datac => \inst2|inst|inst1~q\,
	datad => \inst2|inst|inst~q\,
	combout => \inst9|inst1|inst2|inst53|inst3~0_combout\);

-- Location: LCCOMB_X74_Y44_N30
\inst9|inst1|inst2|inst38~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst9|inst1|inst2|inst38~0_combout\ = (\inst2|inst|inst1~q\ & ((\inst2|inst|inst3~q\) # ((!\inst2|inst|inst~q\)))) # (!\inst2|inst|inst1~q\ & ((\inst2|inst|inst2~q\ & (\inst2|inst|inst3~q\)) # (!\inst2|inst|inst2~q\ & ((!\inst2|inst|inst~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100011111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst|inst3~q\,
	datab => \inst2|inst|inst2~q\,
	datac => \inst2|inst|inst1~q\,
	datad => \inst2|inst|inst~q\,
	combout => \inst9|inst1|inst2|inst38~0_combout\);

-- Location: LCCOMB_X74_Y40_N8
\inst9|inst1|inst2|inst54|inst3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst9|inst1|inst2|inst54|inst3~0_combout\ = (\inst2|inst|inst1~q\ & ((\inst2|inst|inst3~q\) # ((\inst2|inst|inst2~q\ & !\inst2|inst|inst~q\)))) # (!\inst2|inst|inst1~q\ & ((\inst2|inst|inst3~q\ $ (\inst2|inst|inst2~q\)) # (!\inst2|inst|inst~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001101011111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst|inst3~q\,
	datab => \inst2|inst|inst1~q\,
	datac => \inst2|inst|inst2~q\,
	datad => \inst2|inst|inst~q\,
	combout => \inst9|inst1|inst2|inst54|inst3~0_combout\);

-- Location: LCCOMB_X74_Y40_N10
\inst9|inst1|inst2|inst55|inst3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst9|inst1|inst2|inst55|inst3~0_combout\ = (\inst2|inst|inst~q\ & ((\inst2|inst|inst3~q\) # (\inst2|inst|inst1~q\ $ (\inst2|inst|inst2~q\)))) # (!\inst2|inst|inst~q\ & ((\inst2|inst|inst1~q\) # (\inst2|inst|inst3~q\ $ (\inst2|inst|inst2~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111011011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst2|inst|inst3~q\,
	datab => \inst2|inst|inst1~q\,
	datac => \inst2|inst|inst2~q\,
	datad => \inst2|inst|inst~q\,
	combout => \inst9|inst1|inst2|inst55|inst3~0_combout\);

-- Location: LCCOMB_X72_Y50_N12
\inst3|WideOr1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst3|WideOr1~0_combout\ = (!\inst3|estado.s1~q\ & (!\inst3|estado.s2~q\ & (!\inst3|estado.s3~q\ & \inst3|estado.s0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|estado.s1~q\,
	datab => \inst3|estado.s2~q\,
	datac => \inst3|estado.s3~q\,
	datad => \inst3|estado.s0~q\,
	combout => \inst3|WideOr1~0_combout\);

-- Location: FF_X72_Y50_N13
\inst3|est[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|ALT_INV_sx8~clkctrl_outclk\,
	d => \inst3|WideOr1~0_combout\,
	ena => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|est\(2));

-- Location: LCCOMB_X72_Y50_N24
\inst3|WideOr2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst3|WideOr2~combout\ = (!\inst3|estado.s1~q\ & (\inst3|estado.s0~q\ & (!\inst3|estado.s5~q\ & !\inst3|estado.s4~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|estado.s1~q\,
	datab => \inst3|estado.s0~q\,
	datac => \inst3|estado.s5~q\,
	datad => \inst3|estado.s4~q\,
	combout => \inst3|WideOr2~combout\);

-- Location: FF_X72_Y50_N25
\inst3|est[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|ALT_INV_sx8~clkctrl_outclk\,
	d => \inst3|WideOr2~combout\,
	ena => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|est\(1));

-- Location: LCCOMB_X72_Y50_N10
\inst3|WideOr3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst3|WideOr3~combout\ = (!\inst3|estado.s6~q\ & (!\inst3|estado.s2~q\ & (\inst3|estado.s0~q\ & !\inst3|estado.s4~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|estado.s6~q\,
	datab => \inst3|estado.s2~q\,
	datac => \inst3|estado.s0~q\,
	datad => \inst3|estado.s4~q\,
	combout => \inst3|WideOr3~combout\);

-- Location: FF_X72_Y50_N11
\inst3|est[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \inst|inst|ALT_INV_sx8~clkctrl_outclk\,
	d => \inst3|WideOr3~combout\,
	ena => \ALT_INV_Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst3|est\(0));

-- Location: LCCOMB_X72_Y50_N2
\inst12|inst2|inst10~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst12|inst2|inst10~0_combout\ = (\inst3|est\(1)) # (\inst3|est\(2) $ (!\inst3|est\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|est\(2),
	datab => \inst3|est\(1),
	datad => \inst3|est\(0),
	combout => \inst12|inst2|inst10~0_combout\);

-- Location: LCCOMB_X72_Y50_N28
\inst12|inst2|inst51|inst3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst12|inst2|inst51|inst3~0_combout\ = (\inst3|est\(1) $ (!\inst3|est\(0))) # (!\inst3|est\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110101110111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|est\(2),
	datab => \inst3|est\(1),
	datad => \inst3|est\(0),
	combout => \inst12|inst2|inst51|inst3~0_combout\);

-- Location: LCCOMB_X72_Y50_N22
\inst12|inst2|inst52|inst3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst12|inst2|inst52|inst3~0_combout\ = (\inst3|est\(2)) # ((\inst3|est\(0)) # (!\inst3|est\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|est\(2),
	datab => \inst3|est\(1),
	datad => \inst3|est\(0),
	combout => \inst12|inst2|inst52|inst3~0_combout\);

-- Location: LCCOMB_X72_Y50_N4
\inst12|inst2|inst53|inst3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst12|inst2|inst53|inst3~0_combout\ = (\inst3|est\(2) & (\inst3|est\(1) $ (\inst3|est\(0)))) # (!\inst3|est\(2) & ((\inst3|est\(1)) # (!\inst3|est\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|est\(2),
	datab => \inst3|est\(1),
	datad => \inst3|est\(0),
	combout => \inst12|inst2|inst53|inst3~0_combout\);

-- Location: LCCOMB_X72_Y50_N18
\inst12|inst2|inst38~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst12|inst2|inst38~0_combout\ = (!\inst3|est\(0) & ((\inst3|est\(1)) # (!\inst3|est\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|est\(2),
	datab => \inst3|est\(1),
	datad => \inst3|est\(0),
	combout => \inst12|inst2|inst38~0_combout\);

-- Location: LCCOMB_X72_Y50_N8
\inst12|inst2|inst54|inst~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst12|inst2|inst54|inst~0_combout\ = (\inst3|est\(2) & ((!\inst3|est\(0)) # (!\inst3|est\(1)))) # (!\inst3|est\(2) & (!\inst3|est\(1) & !\inst3|est\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001010111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|est\(2),
	datab => \inst3|est\(1),
	datad => \inst3|est\(0),
	combout => \inst12|inst2|inst54|inst~0_combout\);

-- Location: LCCOMB_X72_Y50_N26
\inst12|inst2|inst55|inst~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst12|inst2|inst55|inst~0_combout\ = (\inst3|est\(2) & ((!\inst3|est\(0)) # (!\inst3|est\(1)))) # (!\inst3|est\(2) & (\inst3|est\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst3|est\(2),
	datab => \inst3|est\(1),
	datad => \inst3|est\(0),
	combout => \inst12|inst2|inst55|inst~0_combout\);

-- Location: UNVM_X0_Y40_N40
\~QUARTUS_CREATED_UNVM~\ : fiftyfivenm_unvm
-- pragma translate_off
GENERIC MAP (
	addr_range1_end_addr => -1,
	addr_range1_offset => -1,
	addr_range2_offset => -1,
	is_compressed_image => "false",
	is_dual_boot => "false",
	is_eram_skip => "false",
	max_ufm_valid_addr => -1,
	max_valid_addr => -1,
	min_ufm_valid_addr => -1,
	min_valid_addr => -1,
	part_name => "quartus_created_unvm",
	reserve_block => "true")
-- pragma translate_on
PORT MAP (
	nosc_ena => \~QUARTUS_CREATED_GND~I_combout\,
	xe_ye => \~QUARTUS_CREATED_GND~I_combout\,
	se => \~QUARTUS_CREATED_GND~I_combout\,
	busy => \~QUARTUS_CREATED_UNVM~~busy\);

-- Location: ADCBLOCK_X43_Y52_N0
\~QUARTUS_CREATED_ADC1~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 1,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC1~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC1~~eoc\);

-- Location: ADCBLOCK_X43_Y51_N0
\~QUARTUS_CREATED_ADC2~\ : fiftyfivenm_adcblock
-- pragma translate_off
GENERIC MAP (
	analog_input_pin_mask => 0,
	clkdiv => 1,
	device_partname_fivechar_prefix => "none",
	is_this_first_or_second_adc => 2,
	prescalar => 0,
	pwd => 1,
	refsel => 0,
	reserve_block => "true",
	testbits => 66,
	tsclkdiv => 1,
	tsclksel => 0)
-- pragma translate_on
PORT MAP (
	soc => \~QUARTUS_CREATED_GND~I_combout\,
	usr_pwd => VCC,
	tsen => \~QUARTUS_CREATED_GND~I_combout\,
	chsel => \~QUARTUS_CREATED_ADC2~_CHSEL_bus\,
	eoc => \~QUARTUS_CREATED_ADC2~~eoc\);

ww_ds <= \ds~output_o\;

\ww_5a\ <= \5a~output_o\;

\ww_5b\ <= \5b~output_o\;

\ww_5c\ <= \5c~output_o\;

\ww_5d\ <= \5d~output_o\;

\ww_5e\ <= \5e~output_o\;

\ww_5f\ <= \5f~output_o\;

\ww_5g\ <= \5g~output_o\;

\ww_4a\ <= \4a~output_o\;

\ww_4b\ <= \4b~output_o\;

\ww_4c\ <= \4c~output_o\;

\ww_4d\ <= \4d~output_o\;

\ww_4e\ <= \4e~output_o\;

\ww_4f\ <= \4f~output_o\;

\ww_4g\ <= \4g~output_o\;

\ww_3a\ <= \3a~output_o\;

\ww_3b\ <= \3b~output_o\;

\ww_3c\ <= \3c~output_o\;

\ww_3d\ <= \3d~output_o\;

\ww_3e\ <= \3e~output_o\;

\ww_3f\ <= \3f~output_o\;

\ww_3g\ <= \3g~output_o\;

\ww_2a\ <= \2a~output_o\;

\ww_2b\ <= \2b~output_o\;

\ww_2c\ <= \2c~output_o\;

\ww_2d\ <= \2d~output_o\;

\ww_2e\ <= \2e~output_o\;

\ww_2f\ <= \2f~output_o\;

\ww_2g\ <= \2g~output_o\;

\ww_0a\ <= \0a~output_o\;

\ww_0b\ <= \0b~output_o\;

\ww_0c\ <= \0c~output_o\;

\ww_0d\ <= \0d~output_o\;

\ww_0e\ <= \0e~output_o\;

\ww_0f\ <= \0f~output_o\;

\ww_0g\ <= \0g~output_o\;
END structure;


