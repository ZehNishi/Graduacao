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

-- DATE "09/05/2022 18:24:41"

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


LIBRARY FIFTYFIVENM;
LIBRARY IEEE;
USE FIFTYFIVENM.FIFTYFIVENM_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	Lab1 IS
    PORT (
	AFa : OUT std_logic;
	A3 : IN std_logic;
	A2 : IN std_logic;
	A1 : IN std_logic;
	A0 : IN std_logic;
	AFb : OUT std_logic;
	AFc : OUT std_logic;
	AFd : OUT std_logic;
	AFe : OUT std_logic;
	AFf : OUT std_logic;
	AFg : OUT std_logic;
	BFa : OUT std_logic;
	B3 : IN std_logic;
	B2 : IN std_logic;
	B1 : IN std_logic;
	B0 : IN std_logic;
	BFb : OUT std_logic;
	BFc : OUT std_logic;
	BFd : OUT std_logic;
	BFe : OUT std_logic;
	BFf : OUT std_logic;
	BFg : OUT std_logic;
	S0Fa : OUT std_logic;
	Ci : IN std_logic;
	S0Fb : OUT std_logic;
	S0Fc : OUT std_logic;
	S0Fd : OUT std_logic;
	S0Fe : OUT std_logic;
	S0Ff : OUT std_logic;
	S0Fg : OUT std_logic;
	S1Fa : OUT std_logic;
	S1Fb : OUT std_logic;
	S1Fc : OUT std_logic;
	S1Fd : OUT std_logic;
	S1Fe : OUT std_logic;
	S1Ff : OUT std_logic;
	S1Fg : OUT std_logic
	);
END Lab1;

-- Design Ports Information
-- AFa	=>  Location: PIN_C14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- AFb	=>  Location: PIN_E15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- AFc	=>  Location: PIN_C15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- AFd	=>  Location: PIN_C16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- AFe	=>  Location: PIN_E16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- AFf	=>  Location: PIN_D17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- AFg	=>  Location: PIN_C17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BFa	=>  Location: PIN_B20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BFb	=>  Location: PIN_A20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BFc	=>  Location: PIN_B19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BFd	=>  Location: PIN_A21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BFe	=>  Location: PIN_B21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BFf	=>  Location: PIN_C22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- BFg	=>  Location: PIN_B22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S0Fa	=>  Location: PIN_F18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S0Fb	=>  Location: PIN_E20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S0Fc	=>  Location: PIN_E19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S0Fd	=>  Location: PIN_J18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S0Fe	=>  Location: PIN_H19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S0Ff	=>  Location: PIN_F19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S0Fg	=>  Location: PIN_F20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S1Fa	=>  Location: PIN_J20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S1Fb	=>  Location: PIN_K20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S1Fc	=>  Location: PIN_L18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S1Fd	=>  Location: PIN_N18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S1Fe	=>  Location: PIN_M20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S1Ff	=>  Location: PIN_N19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- S1Fg	=>  Location: PIN_N20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A1	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A2	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A3	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A0	=>  Location: PIN_C10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B1	=>  Location: PIN_A14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B2	=>  Location: PIN_B14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B3	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B0	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Ci	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Lab1 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_AFa : std_logic;
SIGNAL ww_A3 : std_logic;
SIGNAL ww_A2 : std_logic;
SIGNAL ww_A1 : std_logic;
SIGNAL ww_A0 : std_logic;
SIGNAL ww_AFb : std_logic;
SIGNAL ww_AFc : std_logic;
SIGNAL ww_AFd : std_logic;
SIGNAL ww_AFe : std_logic;
SIGNAL ww_AFf : std_logic;
SIGNAL ww_AFg : std_logic;
SIGNAL ww_BFa : std_logic;
SIGNAL ww_B3 : std_logic;
SIGNAL ww_B2 : std_logic;
SIGNAL ww_B1 : std_logic;
SIGNAL ww_B0 : std_logic;
SIGNAL ww_BFb : std_logic;
SIGNAL ww_BFc : std_logic;
SIGNAL ww_BFd : std_logic;
SIGNAL ww_BFe : std_logic;
SIGNAL ww_BFf : std_logic;
SIGNAL ww_BFg : std_logic;
SIGNAL ww_S0Fa : std_logic;
SIGNAL ww_Ci : std_logic;
SIGNAL ww_S0Fb : std_logic;
SIGNAL ww_S0Fc : std_logic;
SIGNAL ww_S0Fd : std_logic;
SIGNAL ww_S0Fe : std_logic;
SIGNAL ww_S0Ff : std_logic;
SIGNAL ww_S0Fg : std_logic;
SIGNAL ww_S1Fa : std_logic;
SIGNAL ww_S1Fb : std_logic;
SIGNAL ww_S1Fc : std_logic;
SIGNAL ww_S1Fd : std_logic;
SIGNAL ww_S1Fe : std_logic;
SIGNAL ww_S1Ff : std_logic;
SIGNAL ww_S1Fg : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC2~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC2~~eoc\ : std_logic;
SIGNAL \AFa~output_o\ : std_logic;
SIGNAL \AFb~output_o\ : std_logic;
SIGNAL \AFc~output_o\ : std_logic;
SIGNAL \AFd~output_o\ : std_logic;
SIGNAL \AFe~output_o\ : std_logic;
SIGNAL \AFf~output_o\ : std_logic;
SIGNAL \AFg~output_o\ : std_logic;
SIGNAL \BFa~output_o\ : std_logic;
SIGNAL \BFb~output_o\ : std_logic;
SIGNAL \BFc~output_o\ : std_logic;
SIGNAL \BFd~output_o\ : std_logic;
SIGNAL \BFe~output_o\ : std_logic;
SIGNAL \BFf~output_o\ : std_logic;
SIGNAL \BFg~output_o\ : std_logic;
SIGNAL \S0Fa~output_o\ : std_logic;
SIGNAL \S0Fb~output_o\ : std_logic;
SIGNAL \S0Fc~output_o\ : std_logic;
SIGNAL \S0Fd~output_o\ : std_logic;
SIGNAL \S0Fe~output_o\ : std_logic;
SIGNAL \S0Ff~output_o\ : std_logic;
SIGNAL \S0Fg~output_o\ : std_logic;
SIGNAL \S1Fa~output_o\ : std_logic;
SIGNAL \S1Fb~output_o\ : std_logic;
SIGNAL \S1Fc~output_o\ : std_logic;
SIGNAL \S1Fd~output_o\ : std_logic;
SIGNAL \S1Fe~output_o\ : std_logic;
SIGNAL \S1Ff~output_o\ : std_logic;
SIGNAL \S1Fg~output_o\ : std_logic;
SIGNAL \A1~input_o\ : std_logic;
SIGNAL \A3~input_o\ : std_logic;
SIGNAL \A0~input_o\ : std_logic;
SIGNAL \A2~input_o\ : std_logic;
SIGNAL \inst9|inst10~0_combout\ : std_logic;
SIGNAL \inst9|inst51|inst3~0_combout\ : std_logic;
SIGNAL \inst9|inst52|inst3~0_combout\ : std_logic;
SIGNAL \inst9|inst53|inst3~0_combout\ : std_logic;
SIGNAL \inst9|inst38~0_combout\ : std_logic;
SIGNAL \inst9|inst54|inst3~0_combout\ : std_logic;
SIGNAL \inst9|inst55|inst3~0_combout\ : std_logic;
SIGNAL \B2~input_o\ : std_logic;
SIGNAL \B1~input_o\ : std_logic;
SIGNAL \B0~input_o\ : std_logic;
SIGNAL \B3~input_o\ : std_logic;
SIGNAL \inst10|inst10~0_combout\ : std_logic;
SIGNAL \inst10|inst51|inst3~0_combout\ : std_logic;
SIGNAL \inst10|inst52|inst3~0_combout\ : std_logic;
SIGNAL \inst10|inst53|inst3~0_combout\ : std_logic;
SIGNAL \inst10|inst38~0_combout\ : std_logic;
SIGNAL \inst10|inst54|inst3~0_combout\ : std_logic;
SIGNAL \inst10|inst55|inst3~0_combout\ : std_logic;
SIGNAL \Ci~input_o\ : std_logic;
SIGNAL \inst|inst7~combout\ : std_logic;
SIGNAL \inst|inst|inst~0_combout\ : std_logic;
SIGNAL \inst|inst2|inst2~1_cout\ : std_logic;
SIGNAL \inst|inst2|inst2~3\ : std_logic;
SIGNAL \inst|inst2|inst2~4_combout\ : std_logic;
SIGNAL \inst|inst2|inst2~2_combout\ : std_logic;
SIGNAL \inst|inst|inst2~0_combout\ : std_logic;
SIGNAL \inst|inst8~combout\ : std_logic;
SIGNAL \inst|inst2|inst2~5\ : std_logic;
SIGNAL \inst|inst2|inst2~6_combout\ : std_logic;
SIGNAL \inst11|inst10~0_combout\ : std_logic;
SIGNAL \inst11|inst51|inst3~0_combout\ : std_logic;
SIGNAL \inst11|inst52|inst3~combout\ : std_logic;
SIGNAL \inst11|inst53|inst3~0_combout\ : std_logic;
SIGNAL \inst11|inst38~0_combout\ : std_logic;
SIGNAL \inst11|inst54|inst3~0_combout\ : std_logic;
SIGNAL \inst11|inst55|inst3~0_combout\ : std_logic;
SIGNAL \inst|inst2|inst2~7\ : std_logic;
SIGNAL \inst|inst2|inst2~8_combout\ : std_logic;
SIGNAL \inst11|inst55|ALT_INV_inst3~0_combout\ : std_logic;
SIGNAL \inst11|inst54|ALT_INV_inst3~0_combout\ : std_logic;
SIGNAL \inst11|ALT_INV_inst38~0_combout\ : std_logic;
SIGNAL \inst11|inst53|ALT_INV_inst3~0_combout\ : std_logic;
SIGNAL \inst11|inst52|ALT_INV_inst3~combout\ : std_logic;
SIGNAL \inst11|inst51|ALT_INV_inst3~0_combout\ : std_logic;
SIGNAL \inst11|ALT_INV_inst10~0_combout\ : std_logic;
SIGNAL \inst10|inst55|ALT_INV_inst3~0_combout\ : std_logic;
SIGNAL \inst10|inst54|ALT_INV_inst3~0_combout\ : std_logic;
SIGNAL \inst10|ALT_INV_inst38~0_combout\ : std_logic;
SIGNAL \inst10|inst53|ALT_INV_inst3~0_combout\ : std_logic;
SIGNAL \inst10|inst52|ALT_INV_inst3~0_combout\ : std_logic;
SIGNAL \inst10|inst51|ALT_INV_inst3~0_combout\ : std_logic;
SIGNAL \inst10|ALT_INV_inst10~0_combout\ : std_logic;
SIGNAL \inst9|inst55|ALT_INV_inst3~0_combout\ : std_logic;
SIGNAL \inst9|inst54|ALT_INV_inst3~0_combout\ : std_logic;
SIGNAL \inst9|ALT_INV_inst38~0_combout\ : std_logic;
SIGNAL \inst9|inst53|ALT_INV_inst3~0_combout\ : std_logic;
SIGNAL \inst9|inst52|ALT_INV_inst3~0_combout\ : std_logic;
SIGNAL \inst9|inst51|ALT_INV_inst3~0_combout\ : std_logic;
SIGNAL \inst9|ALT_INV_inst10~0_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

AFa <= ww_AFa;
ww_A3 <= A3;
ww_A2 <= A2;
ww_A1 <= A1;
ww_A0 <= A0;
AFb <= ww_AFb;
AFc <= ww_AFc;
AFd <= ww_AFd;
AFe <= ww_AFe;
AFf <= ww_AFf;
AFg <= ww_AFg;
BFa <= ww_BFa;
ww_B3 <= B3;
ww_B2 <= B2;
ww_B1 <= B1;
ww_B0 <= B0;
BFb <= ww_BFb;
BFc <= ww_BFc;
BFd <= ww_BFd;
BFe <= ww_BFe;
BFf <= ww_BFf;
BFg <= ww_BFg;
S0Fa <= ww_S0Fa;
ww_Ci <= Ci;
S0Fb <= ww_S0Fb;
S0Fc <= ww_S0Fc;
S0Fd <= ww_S0Fd;
S0Fe <= ww_S0Fe;
S0Ff <= ww_S0Ff;
S0Fg <= ww_S0Fg;
S1Fa <= ww_S1Fa;
S1Fb <= ww_S1Fb;
S1Fc <= ww_S1Fc;
S1Fd <= ww_S1Fd;
S1Fe <= ww_S1Fe;
S1Ff <= ww_S1Ff;
S1Fg <= ww_S1Fg;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\~QUARTUS_CREATED_ADC2~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);
\inst11|inst55|ALT_INV_inst3~0_combout\ <= NOT \inst11|inst55|inst3~0_combout\;
\inst11|inst54|ALT_INV_inst3~0_combout\ <= NOT \inst11|inst54|inst3~0_combout\;
\inst11|ALT_INV_inst38~0_combout\ <= NOT \inst11|inst38~0_combout\;
\inst11|inst53|ALT_INV_inst3~0_combout\ <= NOT \inst11|inst53|inst3~0_combout\;
\inst11|inst52|ALT_INV_inst3~combout\ <= NOT \inst11|inst52|inst3~combout\;
\inst11|inst51|ALT_INV_inst3~0_combout\ <= NOT \inst11|inst51|inst3~0_combout\;
\inst11|ALT_INV_inst10~0_combout\ <= NOT \inst11|inst10~0_combout\;
\inst10|inst55|ALT_INV_inst3~0_combout\ <= NOT \inst10|inst55|inst3~0_combout\;
\inst10|inst54|ALT_INV_inst3~0_combout\ <= NOT \inst10|inst54|inst3~0_combout\;
\inst10|ALT_INV_inst38~0_combout\ <= NOT \inst10|inst38~0_combout\;
\inst10|inst53|ALT_INV_inst3~0_combout\ <= NOT \inst10|inst53|inst3~0_combout\;
\inst10|inst52|ALT_INV_inst3~0_combout\ <= NOT \inst10|inst52|inst3~0_combout\;
\inst10|inst51|ALT_INV_inst3~0_combout\ <= NOT \inst10|inst51|inst3~0_combout\;
\inst10|ALT_INV_inst10~0_combout\ <= NOT \inst10|inst10~0_combout\;
\inst9|inst55|ALT_INV_inst3~0_combout\ <= NOT \inst9|inst55|inst3~0_combout\;
\inst9|inst54|ALT_INV_inst3~0_combout\ <= NOT \inst9|inst54|inst3~0_combout\;
\inst9|ALT_INV_inst38~0_combout\ <= NOT \inst9|inst38~0_combout\;
\inst9|inst53|ALT_INV_inst3~0_combout\ <= NOT \inst9|inst53|inst3~0_combout\;
\inst9|inst52|ALT_INV_inst3~0_combout\ <= NOT \inst9|inst52|inst3~0_combout\;
\inst9|inst51|ALT_INV_inst3~0_combout\ <= NOT \inst9|inst51|inst3~0_combout\;
\inst9|ALT_INV_inst10~0_combout\ <= NOT \inst9|inst10~0_combout\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X44_Y51_N16
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

-- Location: IOOBUF_X58_Y54_N16
\AFa~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst9|ALT_INV_inst10~0_combout\,
	devoe => ww_devoe,
	o => \AFa~output_o\);

-- Location: IOOBUF_X74_Y54_N9
\AFb~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst9|inst51|ALT_INV_inst3~0_combout\,
	devoe => ww_devoe,
	o => \AFb~output_o\);

-- Location: IOOBUF_X60_Y54_N2
\AFc~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst9|inst52|ALT_INV_inst3~0_combout\,
	devoe => ww_devoe,
	o => \AFc~output_o\);

-- Location: IOOBUF_X62_Y54_N30
\AFd~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst9|inst53|ALT_INV_inst3~0_combout\,
	devoe => ww_devoe,
	o => \AFd~output_o\);

-- Location: IOOBUF_X74_Y54_N2
\AFe~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst9|ALT_INV_inst38~0_combout\,
	devoe => ww_devoe,
	o => \AFe~output_o\);

-- Location: IOOBUF_X74_Y54_N16
\AFf~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst9|inst54|ALT_INV_inst3~0_combout\,
	devoe => ww_devoe,
	o => \AFf~output_o\);

-- Location: IOOBUF_X74_Y54_N23
\AFg~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst9|inst55|ALT_INV_inst3~0_combout\,
	devoe => ww_devoe,
	o => \AFg~output_o\);

-- Location: IOOBUF_X78_Y44_N9
\BFa~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst10|ALT_INV_inst10~0_combout\,
	devoe => ww_devoe,
	o => \BFa~output_o\);

-- Location: IOOBUF_X66_Y54_N2
\BFb~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst10|inst51|ALT_INV_inst3~0_combout\,
	devoe => ww_devoe,
	o => \BFb~output_o\);

-- Location: IOOBUF_X69_Y54_N16
\BFc~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst10|inst52|ALT_INV_inst3~0_combout\,
	devoe => ww_devoe,
	o => \BFc~output_o\);

-- Location: IOOBUF_X78_Y44_N2
\BFd~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst10|inst53|ALT_INV_inst3~0_combout\,
	devoe => ww_devoe,
	o => \BFd~output_o\);

-- Location: IOOBUF_X78_Y43_N2
\BFe~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst10|ALT_INV_inst38~0_combout\,
	devoe => ww_devoe,
	o => \BFe~output_o\);

-- Location: IOOBUF_X78_Y35_N2
\BFf~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst10|inst54|ALT_INV_inst3~0_combout\,
	devoe => ww_devoe,
	o => \BFf~output_o\);

-- Location: IOOBUF_X78_Y43_N9
\BFg~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst10|inst55|ALT_INV_inst3~0_combout\,
	devoe => ww_devoe,
	o => \BFg~output_o\);

-- Location: IOOBUF_X78_Y40_N16
\S0Fa~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst11|ALT_INV_inst10~0_combout\,
	devoe => ww_devoe,
	o => \S0Fa~output_o\);

-- Location: IOOBUF_X78_Y40_N2
\S0Fb~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst11|inst51|ALT_INV_inst3~0_combout\,
	devoe => ww_devoe,
	o => \S0Fb~output_o\);

-- Location: IOOBUF_X78_Y40_N23
\S0Fc~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst11|inst52|ALT_INV_inst3~combout\,
	devoe => ww_devoe,
	o => \S0Fc~output_o\);

-- Location: IOOBUF_X78_Y42_N16
\S0Fd~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst11|inst53|ALT_INV_inst3~0_combout\,
	devoe => ww_devoe,
	o => \S0Fd~output_o\);

-- Location: IOOBUF_X78_Y45_N23
\S0Fe~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst11|ALT_INV_inst38~0_combout\,
	devoe => ww_devoe,
	o => \S0Fe~output_o\);

-- Location: IOOBUF_X78_Y40_N9
\S0Ff~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst11|inst54|ALT_INV_inst3~0_combout\,
	devoe => ww_devoe,
	o => \S0Ff~output_o\);

-- Location: IOOBUF_X78_Y35_N16
\S0Fg~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst11|inst55|ALT_INV_inst3~0_combout\,
	devoe => ww_devoe,
	o => \S0Fg~output_o\);

-- Location: IOOBUF_X78_Y45_N9
\S1Fa~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst2|inst2~8_combout\,
	devoe => ww_devoe,
	o => \S1Fa~output_o\);

-- Location: IOOBUF_X78_Y42_N2
\S1Fb~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \S1Fb~output_o\);

-- Location: IOOBUF_X78_Y37_N16
\S1Fc~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \S1Fc~output_o\);

-- Location: IOOBUF_X78_Y34_N24
\S1Fd~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst2|inst2~8_combout\,
	devoe => ww_devoe,
	o => \S1Fd~output_o\);

-- Location: IOOBUF_X78_Y34_N9
\S1Fe~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst2|inst2~8_combout\,
	devoe => ww_devoe,
	o => \S1Fe~output_o\);

-- Location: IOOBUF_X78_Y34_N16
\S1Ff~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|inst2|inst2~8_combout\,
	devoe => ww_devoe,
	o => \S1Ff~output_o\);

-- Location: IOOBUF_X78_Y34_N2
\S1Fg~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => VCC,
	devoe => ww_devoe,
	o => \S1Fg~output_o\);

-- Location: IOIBUF_X51_Y54_N22
\A1~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A1,
	o => \A1~input_o\);

-- Location: IOIBUF_X54_Y54_N29
\A3~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A3,
	o => \A3~input_o\);

-- Location: IOIBUF_X51_Y54_N29
\A0~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A0,
	o => \A0~input_o\);

-- Location: IOIBUF_X51_Y54_N1
\A2~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A2,
	o => \A2~input_o\);

-- Location: LCCOMB_X67_Y50_N0
\inst9|inst10~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst9|inst10~0_combout\ = (\A3~input_o\ & ((\A1~input_o\ $ (!\A2~input_o\)) # (!\A0~input_o\))) # (!\A3~input_o\ & ((\A1~input_o\) # (\A0~input_o\ $ (!\A2~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111001101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A1~input_o\,
	datab => \A3~input_o\,
	datac => \A0~input_o\,
	datad => \A2~input_o\,
	combout => \inst9|inst10~0_combout\);

-- Location: LCCOMB_X67_Y50_N10
\inst9|inst51|inst3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst9|inst51|inst3~0_combout\ = (\A1~input_o\ & ((\A0~input_o\ & (!\A3~input_o\)) # (!\A0~input_o\ & ((!\A2~input_o\))))) # (!\A1~input_o\ & ((\A3~input_o\ $ (!\A0~input_o\)) # (!\A2~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110000101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A1~input_o\,
	datab => \A3~input_o\,
	datac => \A0~input_o\,
	datad => \A2~input_o\,
	combout => \inst9|inst51|inst3~0_combout\);

-- Location: LCCOMB_X67_Y50_N4
\inst9|inst52|inst3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst9|inst52|inst3~0_combout\ = (\A3~input_o\ & (((!\A1~input_o\ & \A0~input_o\)) # (!\A2~input_o\))) # (!\A3~input_o\ & (((\A0~input_o\) # (\A2~input_o\)) # (!\A1~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A1~input_o\,
	datab => \A3~input_o\,
	datac => \A0~input_o\,
	datad => \A2~input_o\,
	combout => \inst9|inst52|inst3~0_combout\);

-- Location: LCCOMB_X67_Y50_N30
\inst9|inst53|inst3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst9|inst53|inst3~0_combout\ = (\A1~input_o\ & ((\A0~input_o\ & ((!\A2~input_o\))) # (!\A0~input_o\ & ((\A2~input_o\) # (!\A3~input_o\))))) # (!\A1~input_o\ & ((\A3~input_o\) # (\A0~input_o\ $ (!\A2~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111011100111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A1~input_o\,
	datab => \A3~input_o\,
	datac => \A0~input_o\,
	datad => \A2~input_o\,
	combout => \inst9|inst53|inst3~0_combout\);

-- Location: LCCOMB_X67_Y50_N24
\inst9|inst38~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst9|inst38~0_combout\ = (\A1~input_o\ & ((\A3~input_o\) # ((!\A0~input_o\)))) # (!\A1~input_o\ & ((\A2~input_o\ & (\A3~input_o\)) # (!\A2~input_o\ & ((!\A0~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111010001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A1~input_o\,
	datab => \A3~input_o\,
	datac => \A0~input_o\,
	datad => \A2~input_o\,
	combout => \inst9|inst38~0_combout\);

-- Location: LCCOMB_X67_Y50_N2
\inst9|inst54|inst3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst9|inst54|inst3~0_combout\ = (\A1~input_o\ & ((\A3~input_o\) # ((!\A0~input_o\ & \A2~input_o\)))) # (!\A1~input_o\ & ((\A3~input_o\ $ (\A2~input_o\)) # (!\A0~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001111111001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A1~input_o\,
	datab => \A3~input_o\,
	datac => \A0~input_o\,
	datad => \A2~input_o\,
	combout => \inst9|inst54|inst3~0_combout\);

-- Location: LCCOMB_X67_Y50_N12
\inst9|inst55|inst3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst9|inst55|inst3~0_combout\ = (\A0~input_o\ & ((\A3~input_o\) # (\A1~input_o\ $ (\A2~input_o\)))) # (!\A0~input_o\ & ((\A1~input_o\) # (\A3~input_o\ $ (\A2~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A1~input_o\,
	datab => \A3~input_o\,
	datac => \A0~input_o\,
	datad => \A2~input_o\,
	combout => \inst9|inst55|inst3~0_combout\);

-- Location: IOIBUF_X56_Y54_N1
\B2~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B2,
	o => \B2~input_o\);

-- Location: IOIBUF_X58_Y54_N29
\B1~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B1,
	o => \B1~input_o\);

-- Location: IOIBUF_X54_Y54_N15
\B0~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B0,
	o => \B0~input_o\);

-- Location: IOIBUF_X69_Y54_N1
\B3~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B3,
	o => \B3~input_o\);

-- Location: LCCOMB_X72_Y50_N24
\inst10|inst10~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst10|inst10~0_combout\ = (\B2~input_o\ & ((\B1~input_o\) # (\B0~input_o\ $ (\B3~input_o\)))) # (!\B2~input_o\ & ((\B1~input_o\ $ (\B3~input_o\)) # (!\B0~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001111111101101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B2~input_o\,
	datab => \B1~input_o\,
	datac => \B0~input_o\,
	datad => \B3~input_o\,
	combout => \inst10|inst10~0_combout\);

-- Location: LCCOMB_X72_Y50_N26
\inst10|inst51|inst3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst10|inst51|inst3~0_combout\ = (\B1~input_o\ & ((\B0~input_o\ & ((!\B3~input_o\))) # (!\B0~input_o\ & (!\B2~input_o\)))) # (!\B1~input_o\ & ((\B0~input_o\ $ (!\B3~input_o\)) # (!\B2~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011010111010111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B2~input_o\,
	datab => \B1~input_o\,
	datac => \B0~input_o\,
	datad => \B3~input_o\,
	combout => \inst10|inst51|inst3~0_combout\);

-- Location: LCCOMB_X72_Y50_N4
\inst10|inst52|inst3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst10|inst52|inst3~0_combout\ = (\B2~input_o\ & (((!\B1~input_o\ & \B0~input_o\)) # (!\B3~input_o\))) # (!\B2~input_o\ & (((\B0~input_o\) # (\B3~input_o\)) # (!\B1~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B2~input_o\,
	datab => \B1~input_o\,
	datac => \B0~input_o\,
	datad => \B3~input_o\,
	combout => \inst10|inst52|inst3~0_combout\);

-- Location: LCCOMB_X72_Y50_N22
\inst10|inst53|inst3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst10|inst53|inst3~0_combout\ = (\B1~input_o\ & ((\B2~input_o\ & (!\B0~input_o\)) # (!\B2~input_o\ & ((\B0~input_o\) # (!\B3~input_o\))))) # (!\B1~input_o\ & ((\B3~input_o\) # (\B2~input_o\ $ (!\B0~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111101101101101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B2~input_o\,
	datab => \B1~input_o\,
	datac => \B0~input_o\,
	datad => \B3~input_o\,
	combout => \inst10|inst53|inst3~0_combout\);

-- Location: LCCOMB_X72_Y50_N0
\inst10|inst38~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst10|inst38~0_combout\ = (\B1~input_o\ & (((\B3~input_o\) # (!\B0~input_o\)))) # (!\B1~input_o\ & ((\B2~input_o\ & ((\B3~input_o\))) # (!\B2~input_o\ & (!\B0~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111100001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B2~input_o\,
	datab => \B1~input_o\,
	datac => \B0~input_o\,
	datad => \B3~input_o\,
	combout => \inst10|inst38~0_combout\);

-- Location: LCCOMB_X72_Y50_N2
\inst10|inst54|inst3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst10|inst54|inst3~0_combout\ = (\B2~input_o\ & ((\B1~input_o\ $ (!\B3~input_o\)) # (!\B0~input_o\))) # (!\B2~input_o\ & ((\B3~input_o\) # ((!\B1~input_o\ & !\B0~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111100101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B2~input_o\,
	datab => \B1~input_o\,
	datac => \B0~input_o\,
	datad => \B3~input_o\,
	combout => \inst10|inst54|inst3~0_combout\);

-- Location: LCCOMB_X72_Y50_N12
\inst10|inst55|inst3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst10|inst55|inst3~0_combout\ = (\B0~input_o\ & ((\B3~input_o\) # (\B2~input_o\ $ (\B1~input_o\)))) # (!\B0~input_o\ & ((\B1~input_o\) # (\B2~input_o\ $ (\B3~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110101101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B2~input_o\,
	datab => \B1~input_o\,
	datac => \B0~input_o\,
	datad => \B3~input_o\,
	combout => \inst10|inst55|inst3~0_combout\);

-- Location: IOIBUF_X54_Y54_N22
\Ci~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Ci,
	o => \Ci~input_o\);

-- Location: LCCOMB_X67_Y50_N26
\inst|inst7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|inst7~combout\ = \Ci~input_o\ $ (\B2~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ci~input_o\,
	datac => \B2~input_o\,
	combout => \inst|inst7~combout\);

-- Location: LCCOMB_X67_Y50_N8
\inst|inst|inst~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|inst|inst~0_combout\ = (\B0~input_o\ & (\A0~input_o\)) # (!\B0~input_o\ & ((\Ci~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A0~input_o\,
	datab => \B0~input_o\,
	datac => \Ci~input_o\,
	combout => \inst|inst|inst~0_combout\);

-- Location: LCCOMB_X67_Y50_N14
\inst|inst2|inst2~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|inst2|inst2~1_cout\ = CARRY(\Ci~input_o\ $ (\B1~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Ci~input_o\,
	datab => \B1~input_o\,
	datad => VCC,
	cout => \inst|inst2|inst2~1_cout\);

-- Location: LCCOMB_X67_Y50_N16
\inst|inst2|inst2~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|inst2|inst2~2_combout\ = (\A1~input_o\ & ((\inst|inst|inst~0_combout\ & (\inst|inst2|inst2~1_cout\ & VCC)) # (!\inst|inst|inst~0_combout\ & (!\inst|inst2|inst2~1_cout\)))) # (!\A1~input_o\ & ((\inst|inst|inst~0_combout\ & 
-- (!\inst|inst2|inst2~1_cout\)) # (!\inst|inst|inst~0_combout\ & ((\inst|inst2|inst2~1_cout\) # (GND)))))
-- \inst|inst2|inst2~3\ = CARRY((\A1~input_o\ & (!\inst|inst|inst~0_combout\ & !\inst|inst2|inst2~1_cout\)) # (!\A1~input_o\ & ((!\inst|inst2|inst2~1_cout\) # (!\inst|inst|inst~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A1~input_o\,
	datab => \inst|inst|inst~0_combout\,
	datad => VCC,
	cin => \inst|inst2|inst2~1_cout\,
	combout => \inst|inst2|inst2~2_combout\,
	cout => \inst|inst2|inst2~3\);

-- Location: LCCOMB_X67_Y50_N18
\inst|inst2|inst2~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|inst2|inst2~4_combout\ = ((\A2~input_o\ $ (\inst|inst7~combout\ $ (!\inst|inst2|inst2~3\)))) # (GND)
-- \inst|inst2|inst2~5\ = CARRY((\A2~input_o\ & ((\inst|inst7~combout\) # (!\inst|inst2|inst2~3\))) # (!\A2~input_o\ & (\inst|inst7~combout\ & !\inst|inst2|inst2~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \A2~input_o\,
	datab => \inst|inst7~combout\,
	datad => VCC,
	cin => \inst|inst2|inst2~3\,
	combout => \inst|inst2|inst2~4_combout\,
	cout => \inst|inst2|inst2~5\);

-- Location: LCCOMB_X67_Y50_N6
\inst|inst|inst2~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|inst|inst2~0_combout\ = \A0~input_o\ $ (\B0~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A0~input_o\,
	datac => \B0~input_o\,
	combout => \inst|inst|inst2~0_combout\);

-- Location: LCCOMB_X67_Y50_N28
\inst|inst8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|inst8~combout\ = \B3~input_o\ $ (\Ci~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \B3~input_o\,
	datac => \Ci~input_o\,
	combout => \inst|inst8~combout\);

-- Location: LCCOMB_X67_Y50_N20
\inst|inst2|inst2~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|inst2|inst2~6_combout\ = (\inst|inst8~combout\ & ((\A3~input_o\ & (\inst|inst2|inst2~5\ & VCC)) # (!\A3~input_o\ & (!\inst|inst2|inst2~5\)))) # (!\inst|inst8~combout\ & ((\A3~input_o\ & (!\inst|inst2|inst2~5\)) # (!\A3~input_o\ & 
-- ((\inst|inst2|inst2~5\) # (GND)))))
-- \inst|inst2|inst2~7\ = CARRY((\inst|inst8~combout\ & (!\A3~input_o\ & !\inst|inst2|inst2~5\)) # (!\inst|inst8~combout\ & ((!\inst|inst2|inst2~5\) # (!\A3~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst8~combout\,
	datab => \A3~input_o\,
	datad => VCC,
	cin => \inst|inst2|inst2~5\,
	combout => \inst|inst2|inst2~6_combout\,
	cout => \inst|inst2|inst2~7\);

-- Location: LCCOMB_X75_Y44_N8
\inst11|inst10~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst11|inst10~0_combout\ = (\inst|inst2|inst2~4_combout\ & ((\inst|inst2|inst2~2_combout\) # (\inst|inst|inst2~0_combout\ $ (\inst|inst2|inst2~6_combout\)))) # (!\inst|inst2|inst2~4_combout\ & ((\inst|inst2|inst2~2_combout\ $ 
-- (\inst|inst2|inst2~6_combout\)) # (!\inst|inst|inst2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001111111101101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst2|inst2~4_combout\,
	datab => \inst|inst2|inst2~2_combout\,
	datac => \inst|inst|inst2~0_combout\,
	datad => \inst|inst2|inst2~6_combout\,
	combout => \inst11|inst10~0_combout\);

-- Location: LCCOMB_X75_Y44_N10
\inst11|inst51|inst3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst11|inst51|inst3~0_combout\ = (\inst|inst2|inst2~2_combout\ & ((\inst|inst|inst2~0_combout\ & ((!\inst|inst2|inst2~6_combout\))) # (!\inst|inst|inst2~0_combout\ & (!\inst|inst2|inst2~4_combout\)))) # (!\inst|inst2|inst2~2_combout\ & 
-- ((\inst|inst|inst2~0_combout\ $ (!\inst|inst2|inst2~6_combout\)) # (!\inst|inst2|inst2~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011010111010111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst2|inst2~4_combout\,
	datab => \inst|inst2|inst2~2_combout\,
	datac => \inst|inst|inst2~0_combout\,
	datad => \inst|inst2|inst2~6_combout\,
	combout => \inst11|inst51|inst3~0_combout\);

-- Location: LCCOMB_X75_Y44_N4
\inst11|inst52|inst3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst11|inst52|inst3~combout\ = (\inst|inst2|inst2~4_combout\ & (((!\inst|inst2|inst2~2_combout\ & \inst|inst|inst2~0_combout\)) # (!\inst|inst2|inst2~6_combout\))) # (!\inst|inst2|inst2~4_combout\ & (((\inst|inst|inst2~0_combout\) # 
-- (\inst|inst2|inst2~6_combout\)) # (!\inst|inst2|inst2~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst2|inst2~4_combout\,
	datab => \inst|inst2|inst2~2_combout\,
	datac => \inst|inst|inst2~0_combout\,
	datad => \inst|inst2|inst2~6_combout\,
	combout => \inst11|inst52|inst3~combout\);

-- Location: LCCOMB_X75_Y44_N6
\inst11|inst53|inst3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst11|inst53|inst3~0_combout\ = (\inst|inst2|inst2~2_combout\ & ((\inst|inst2|inst2~4_combout\ & (!\inst|inst|inst2~0_combout\)) # (!\inst|inst2|inst2~4_combout\ & ((\inst|inst|inst2~0_combout\) # (!\inst|inst2|inst2~6_combout\))))) # 
-- (!\inst|inst2|inst2~2_combout\ & ((\inst|inst2|inst2~6_combout\) # (\inst|inst2|inst2~4_combout\ $ (!\inst|inst|inst2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111101101101101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst2|inst2~4_combout\,
	datab => \inst|inst2|inst2~2_combout\,
	datac => \inst|inst|inst2~0_combout\,
	datad => \inst|inst2|inst2~6_combout\,
	combout => \inst11|inst53|inst3~0_combout\);

-- Location: LCCOMB_X75_Y44_N0
\inst11|inst38~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst11|inst38~0_combout\ = (\inst|inst2|inst2~2_combout\ & (((\inst|inst2|inst2~6_combout\) # (!\inst|inst|inst2~0_combout\)))) # (!\inst|inst2|inst2~2_combout\ & ((\inst|inst2|inst2~4_combout\ & ((\inst|inst2|inst2~6_combout\))) # 
-- (!\inst|inst2|inst2~4_combout\ & (!\inst|inst|inst2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111100001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst2|inst2~4_combout\,
	datab => \inst|inst2|inst2~2_combout\,
	datac => \inst|inst|inst2~0_combout\,
	datad => \inst|inst2|inst2~6_combout\,
	combout => \inst11|inst38~0_combout\);

-- Location: LCCOMB_X75_Y44_N26
\inst11|inst54|inst3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst11|inst54|inst3~0_combout\ = (\inst|inst2|inst2~4_combout\ & ((\inst|inst2|inst2~2_combout\ $ (!\inst|inst2|inst2~6_combout\)) # (!\inst|inst|inst2~0_combout\))) # (!\inst|inst2|inst2~4_combout\ & ((\inst|inst2|inst2~6_combout\) # 
-- ((!\inst|inst2|inst2~2_combout\ & !\inst|inst|inst2~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111100101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst2|inst2~4_combout\,
	datab => \inst|inst2|inst2~2_combout\,
	datac => \inst|inst|inst2~0_combout\,
	datad => \inst|inst2|inst2~6_combout\,
	combout => \inst11|inst54|inst3~0_combout\);

-- Location: LCCOMB_X75_Y44_N28
\inst11|inst55|inst3~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst11|inst55|inst3~0_combout\ = (\inst|inst|inst2~0_combout\ & ((\inst|inst2|inst2~6_combout\) # (\inst|inst2|inst2~4_combout\ $ (\inst|inst2|inst2~2_combout\)))) # (!\inst|inst|inst2~0_combout\ & ((\inst|inst2|inst2~2_combout\) # 
-- (\inst|inst2|inst2~4_combout\ $ (\inst|inst2|inst2~6_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110101101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|inst2|inst2~4_combout\,
	datab => \inst|inst2|inst2~2_combout\,
	datac => \inst|inst|inst2~0_combout\,
	datad => \inst|inst2|inst2~6_combout\,
	combout => \inst11|inst55|inst3~0_combout\);

-- Location: LCCOMB_X67_Y50_N22
\inst|inst2|inst2~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|inst2|inst2~8_combout\ = !\inst|inst2|inst2~7\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	cin => \inst|inst2|inst2~7\,
	combout => \inst|inst2|inst2~8_combout\);

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

ww_AFa <= \AFa~output_o\;

ww_AFb <= \AFb~output_o\;

ww_AFc <= \AFc~output_o\;

ww_AFd <= \AFd~output_o\;

ww_AFe <= \AFe~output_o\;

ww_AFf <= \AFf~output_o\;

ww_AFg <= \AFg~output_o\;

ww_BFa <= \BFa~output_o\;

ww_BFb <= \BFb~output_o\;

ww_BFc <= \BFc~output_o\;

ww_BFd <= \BFd~output_o\;

ww_BFe <= \BFe~output_o\;

ww_BFf <= \BFf~output_o\;

ww_BFg <= \BFg~output_o\;

ww_S0Fa <= \S0Fa~output_o\;

ww_S0Fb <= \S0Fb~output_o\;

ww_S0Fc <= \S0Fc~output_o\;

ww_S0Fd <= \S0Fd~output_o\;

ww_S0Fe <= \S0Fe~output_o\;

ww_S0Ff <= \S0Ff~output_o\;

ww_S0Fg <= \S0Fg~output_o\;

ww_S1Fa <= \S1Fa~output_o\;

ww_S1Fb <= \S1Fb~output_o\;

ww_S1Fc <= \S1Fc~output_o\;

ww_S1Fd <= \S1Fd~output_o\;

ww_S1Fe <= \S1Fe~output_o\;

ww_S1Ff <= \S1Ff~output_o\;

ww_S1Fg <= \S1Fg~output_o\;
END structure;


