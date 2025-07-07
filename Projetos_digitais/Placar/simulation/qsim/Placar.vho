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

-- DATE "12/12/2022 11:02:03"

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

ENTITY 	Placar IS
    PORT (
	a : OUT std_logic_vector(2 DOWNTO 0);
	Clock : IN std_logic;
	reset : IN std_logic;
	inverter : IN std_logic
	);
END Placar;

-- Design Ports Information
-- a[2]	=>  Location: PIN_D6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[1]	=>  Location: PIN_E6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- a[0]	=>  Location: PIN_C3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- inverter	=>  Location: PIN_C2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Clock	=>  Location: PIN_M8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_M9,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Placar IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_a : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_Clock : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_inverter : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_ADC2~_CHSEL_bus\ : std_logic_vector(4 DOWNTO 0);
SIGNAL \reset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Clock~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \~QUARTUS_CREATED_UNVM~~busy\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC1~~eoc\ : std_logic;
SIGNAL \~QUARTUS_CREATED_ADC2~~eoc\ : std_logic;
SIGNAL \a[2]~output_o\ : std_logic;
SIGNAL \a[1]~output_o\ : std_logic;
SIGNAL \a[0]~output_o\ : std_logic;
SIGNAL \Clock~input_o\ : std_logic;
SIGNAL \Clock~inputclkctrl_outclk\ : std_logic;
SIGNAL \inst|Add0~1_cout\ : std_logic;
SIGNAL \inst|Add0~2_combout\ : std_logic;
SIGNAL \inst|contagem[1]~feeder_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \inverter~input_o\ : std_logic;
SIGNAL \inst|contagem[0]~0_combout\ : std_logic;
SIGNAL \inst|Add0~3\ : std_logic;
SIGNAL \inst|Add0~5\ : std_logic;
SIGNAL \inst|Add0~6_combout\ : std_logic;
SIGNAL \inst|Equal0~8_combout\ : std_logic;
SIGNAL \inst|Add0~7\ : std_logic;
SIGNAL \inst|Add0~8_combout\ : std_logic;
SIGNAL \inst|Add0~9\ : std_logic;
SIGNAL \inst|Add0~10_combout\ : std_logic;
SIGNAL \inst|Add0~11\ : std_logic;
SIGNAL \inst|Add0~12_combout\ : std_logic;
SIGNAL \inst|Add0~13\ : std_logic;
SIGNAL \inst|Add0~14_combout\ : std_logic;
SIGNAL \inst|Add0~15\ : std_logic;
SIGNAL \inst|Add0~16_combout\ : std_logic;
SIGNAL \inst|Add0~17\ : std_logic;
SIGNAL \inst|Add0~18_combout\ : std_logic;
SIGNAL \inst|Add0~19\ : std_logic;
SIGNAL \inst|Add0~20_combout\ : std_logic;
SIGNAL \inst|Add0~21\ : std_logic;
SIGNAL \inst|Add0~22_combout\ : std_logic;
SIGNAL \inst|Add0~23\ : std_logic;
SIGNAL \inst|Add0~24_combout\ : std_logic;
SIGNAL \inst|Add0~25\ : std_logic;
SIGNAL \inst|Add0~26_combout\ : std_logic;
SIGNAL \inst|Add0~27\ : std_logic;
SIGNAL \inst|Add0~28_combout\ : std_logic;
SIGNAL \inst|Add0~29\ : std_logic;
SIGNAL \inst|Add0~30_combout\ : std_logic;
SIGNAL \inst|Equal0~5_combout\ : std_logic;
SIGNAL \inst|Equal0~7_combout\ : std_logic;
SIGNAL \inst|Equal0~6_combout\ : std_logic;
SIGNAL \inst|Equal0~9_combout\ : std_logic;
SIGNAL \inst|Add0~31\ : std_logic;
SIGNAL \inst|Add0~32_combout\ : std_logic;
SIGNAL \inst|Add0~33\ : std_logic;
SIGNAL \inst|Add0~34_combout\ : std_logic;
SIGNAL \inst|Add0~35\ : std_logic;
SIGNAL \inst|Add0~36_combout\ : std_logic;
SIGNAL \inst|Add0~37\ : std_logic;
SIGNAL \inst|Add0~38_combout\ : std_logic;
SIGNAL \inst|Add0~39\ : std_logic;
SIGNAL \inst|Add0~40_combout\ : std_logic;
SIGNAL \inst|Add0~41\ : std_logic;
SIGNAL \inst|Add0~42_combout\ : std_logic;
SIGNAL \inst|Add0~43\ : std_logic;
SIGNAL \inst|Add0~44_combout\ : std_logic;
SIGNAL \inst|Add0~45\ : std_logic;
SIGNAL \inst|Add0~46_combout\ : std_logic;
SIGNAL \inst|Add0~47\ : std_logic;
SIGNAL \inst|Add0~48_combout\ : std_logic;
SIGNAL \inst|Add0~49\ : std_logic;
SIGNAL \inst|Add0~50_combout\ : std_logic;
SIGNAL \inst|Add0~51\ : std_logic;
SIGNAL \inst|Add0~52_combout\ : std_logic;
SIGNAL \inst|Add0~53\ : std_logic;
SIGNAL \inst|Add0~54_combout\ : std_logic;
SIGNAL \inst|Equal0~1_combout\ : std_logic;
SIGNAL \inst|Equal0~3_combout\ : std_logic;
SIGNAL \inst|Add0~55\ : std_logic;
SIGNAL \inst|Add0~56_combout\ : std_logic;
SIGNAL \inst|Add0~57\ : std_logic;
SIGNAL \inst|Add0~58_combout\ : std_logic;
SIGNAL \inst|Add0~59\ : std_logic;
SIGNAL \inst|Add0~60_combout\ : std_logic;
SIGNAL \inst|Add0~61\ : std_logic;
SIGNAL \inst|Add0~62_combout\ : std_logic;
SIGNAL \inst|Equal0~0_combout\ : std_logic;
SIGNAL \inst|Equal0~2_combout\ : std_logic;
SIGNAL \inst|Equal0~4_combout\ : std_logic;
SIGNAL \inst|Equal1~0_combout\ : std_logic;
SIGNAL \inst|contagem[0]~1_combout\ : std_logic;
SIGNAL \inst|Equal0~10_combout\ : std_logic;
SIGNAL \inst|process_0~0_combout\ : std_logic;
SIGNAL \inst|Add0~4_combout\ : std_logic;
SIGNAL \inst|contagem\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \ALT_INV_reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \inst|ALT_INV_contagem\ : std_logic_vector(0 DOWNTO 0);

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

a <= ww_a;
ww_Clock <= Clock;
ww_reset <= reset;
ww_inverter <= inverter;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\~QUARTUS_CREATED_ADC1~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\~QUARTUS_CREATED_ADC2~_CHSEL_bus\ <= (\~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\ & \~QUARTUS_CREATED_GND~I_combout\);

\reset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \reset~input_o\);

\Clock~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \Clock~input_o\);
\ALT_INV_reset~inputclkctrl_outclk\ <= NOT \reset~inputclkctrl_outclk\;
\inst|ALT_INV_contagem\(0) <= NOT \inst|contagem\(0);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: LCCOMB_X44_Y43_N16
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

-- Location: IOOBUF_X22_Y39_N30
\a[2]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|contagem\(2),
	devoe => ww_devoe,
	o => \a[2]~output_o\);

-- Location: IOOBUF_X20_Y39_N2
\a[1]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|contagem\(1),
	devoe => ww_devoe,
	o => \a[1]~output_o\);

-- Location: IOOBUF_X20_Y39_N9
\a[0]~output\ : fiftyfivenm_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|ALT_INV_contagem\(0),
	devoe => ww_devoe,
	o => \a[0]~output_o\);

-- Location: IOIBUF_X0_Y18_N15
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

-- Location: CLKCTRL_G3
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

-- Location: LCCOMB_X22_Y36_N0
\inst|Add0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Add0~1_cout\ = CARRY(!\inst|contagem\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|contagem\(0),
	datad => VCC,
	cout => \inst|Add0~1_cout\);

-- Location: LCCOMB_X22_Y36_N2
\inst|Add0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Add0~2_combout\ = (\inst|process_0~0_combout\ & ((\inst|contagem\(1) & (\inst|Add0~1_cout\ & VCC)) # (!\inst|contagem\(1) & (!\inst|Add0~1_cout\)))) # (!\inst|process_0~0_combout\ & ((\inst|contagem\(1) & (!\inst|Add0~1_cout\)) # 
-- (!\inst|contagem\(1) & ((\inst|Add0~1_cout\) # (GND)))))
-- \inst|Add0~3\ = CARRY((\inst|process_0~0_combout\ & (!\inst|contagem\(1) & !\inst|Add0~1_cout\)) # (!\inst|process_0~0_combout\ & ((!\inst|Add0~1_cout\) # (!\inst|contagem\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|process_0~0_combout\,
	datab => \inst|contagem\(1),
	datad => VCC,
	cin => \inst|Add0~1_cout\,
	combout => \inst|Add0~2_combout\,
	cout => \inst|Add0~3\);

-- Location: LCCOMB_X21_Y36_N28
\inst|contagem[1]~feeder\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|contagem[1]~feeder_combout\ = \inst|Add0~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|Add0~2_combout\,
	combout => \inst|contagem[1]~feeder_combout\);

-- Location: IOIBUF_X0_Y18_N22
\reset~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: CLKCTRL_G4
\reset~inputclkctrl\ : fiftyfivenm_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \reset~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \reset~inputclkctrl_outclk\);

-- Location: IOIBUF_X20_Y39_N15
\inverter~input\ : fiftyfivenm_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	listen_to_nsleep_signal => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_inverter,
	o => \inverter~input_o\);

-- Location: LCCOMB_X21_Y36_N12
\inst|contagem[0]~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|contagem[0]~0_combout\ = ((\inst|Equal1~0_combout\ & \inverter~input_o\)) # (!\inst|process_0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal1~0_combout\,
	datab => \inverter~input_o\,
	datad => \inst|process_0~0_combout\,
	combout => \inst|contagem[0]~0_combout\);

-- Location: FF_X21_Y36_N29
\inst|contagem[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|contagem[1]~feeder_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \inst|contagem[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|contagem\(1));

-- Location: LCCOMB_X22_Y36_N4
\inst|Add0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Add0~4_combout\ = ((\inst|process_0~0_combout\ $ (\inst|contagem\(2) $ (!\inst|Add0~3\)))) # (GND)
-- \inst|Add0~5\ = CARRY((\inst|process_0~0_combout\ & ((\inst|contagem\(2)) # (!\inst|Add0~3\))) # (!\inst|process_0~0_combout\ & (\inst|contagem\(2) & !\inst|Add0~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|process_0~0_combout\,
	datab => \inst|contagem\(2),
	datad => VCC,
	cin => \inst|Add0~3\,
	combout => \inst|Add0~4_combout\,
	cout => \inst|Add0~5\);

-- Location: LCCOMB_X22_Y36_N6
\inst|Add0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Add0~6_combout\ = (\inst|process_0~0_combout\ & ((\inst|contagem\(3) & (\inst|Add0~5\ & VCC)) # (!\inst|contagem\(3) & (!\inst|Add0~5\)))) # (!\inst|process_0~0_combout\ & ((\inst|contagem\(3) & (!\inst|Add0~5\)) # (!\inst|contagem\(3) & 
-- ((\inst|Add0~5\) # (GND)))))
-- \inst|Add0~7\ = CARRY((\inst|process_0~0_combout\ & (!\inst|contagem\(3) & !\inst|Add0~5\)) # (!\inst|process_0~0_combout\ & ((!\inst|Add0~5\) # (!\inst|contagem\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|process_0~0_combout\,
	datab => \inst|contagem\(3),
	datad => VCC,
	cin => \inst|Add0~5\,
	combout => \inst|Add0~6_combout\,
	cout => \inst|Add0~7\);

-- Location: FF_X21_Y36_N13
\inst|contagem[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	asdata => \inst|Add0~6_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	ena => \inst|contagem[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|contagem\(3));

-- Location: LCCOMB_X21_Y36_N10
\inst|Equal0~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Equal0~8_combout\ = (!\inst|contagem\(3) & !\inst|contagem\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|contagem\(3),
	datad => \inst|contagem\(1),
	combout => \inst|Equal0~8_combout\);

-- Location: LCCOMB_X22_Y36_N8
\inst|Add0~8\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Add0~8_combout\ = ((\inst|process_0~0_combout\ $ (\inst|contagem\(4) $ (!\inst|Add0~7\)))) # (GND)
-- \inst|Add0~9\ = CARRY((\inst|process_0~0_combout\ & ((\inst|contagem\(4)) # (!\inst|Add0~7\))) # (!\inst|process_0~0_combout\ & (\inst|contagem\(4) & !\inst|Add0~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|process_0~0_combout\,
	datab => \inst|contagem\(4),
	datad => VCC,
	cin => \inst|Add0~7\,
	combout => \inst|Add0~8_combout\,
	cout => \inst|Add0~9\);

-- Location: FF_X22_Y36_N9
\inst|contagem[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|Add0~8_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \inst|contagem[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|contagem\(4));

-- Location: LCCOMB_X22_Y36_N10
\inst|Add0~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Add0~10_combout\ = (\inst|process_0~0_combout\ & ((\inst|contagem\(5) & (\inst|Add0~9\ & VCC)) # (!\inst|contagem\(5) & (!\inst|Add0~9\)))) # (!\inst|process_0~0_combout\ & ((\inst|contagem\(5) & (!\inst|Add0~9\)) # (!\inst|contagem\(5) & 
-- ((\inst|Add0~9\) # (GND)))))
-- \inst|Add0~11\ = CARRY((\inst|process_0~0_combout\ & (!\inst|contagem\(5) & !\inst|Add0~9\)) # (!\inst|process_0~0_combout\ & ((!\inst|Add0~9\) # (!\inst|contagem\(5)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|process_0~0_combout\,
	datab => \inst|contagem\(5),
	datad => VCC,
	cin => \inst|Add0~9\,
	combout => \inst|Add0~10_combout\,
	cout => \inst|Add0~11\);

-- Location: FF_X22_Y36_N11
\inst|contagem[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|Add0~10_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \inst|contagem[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|contagem\(5));

-- Location: LCCOMB_X22_Y36_N12
\inst|Add0~12\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Add0~12_combout\ = ((\inst|process_0~0_combout\ $ (\inst|contagem\(6) $ (!\inst|Add0~11\)))) # (GND)
-- \inst|Add0~13\ = CARRY((\inst|process_0~0_combout\ & ((\inst|contagem\(6)) # (!\inst|Add0~11\))) # (!\inst|process_0~0_combout\ & (\inst|contagem\(6) & !\inst|Add0~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|process_0~0_combout\,
	datab => \inst|contagem\(6),
	datad => VCC,
	cin => \inst|Add0~11\,
	combout => \inst|Add0~12_combout\,
	cout => \inst|Add0~13\);

-- Location: FF_X22_Y36_N13
\inst|contagem[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|Add0~12_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \inst|contagem[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|contagem\(6));

-- Location: LCCOMB_X22_Y36_N14
\inst|Add0~14\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Add0~14_combout\ = (\inst|process_0~0_combout\ & ((\inst|contagem\(7) & (\inst|Add0~13\ & VCC)) # (!\inst|contagem\(7) & (!\inst|Add0~13\)))) # (!\inst|process_0~0_combout\ & ((\inst|contagem\(7) & (!\inst|Add0~13\)) # (!\inst|contagem\(7) & 
-- ((\inst|Add0~13\) # (GND)))))
-- \inst|Add0~15\ = CARRY((\inst|process_0~0_combout\ & (!\inst|contagem\(7) & !\inst|Add0~13\)) # (!\inst|process_0~0_combout\ & ((!\inst|Add0~13\) # (!\inst|contagem\(7)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|process_0~0_combout\,
	datab => \inst|contagem\(7),
	datad => VCC,
	cin => \inst|Add0~13\,
	combout => \inst|Add0~14_combout\,
	cout => \inst|Add0~15\);

-- Location: FF_X22_Y36_N15
\inst|contagem[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|Add0~14_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \inst|contagem[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|contagem\(7));

-- Location: LCCOMB_X22_Y36_N16
\inst|Add0~16\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Add0~16_combout\ = ((\inst|contagem\(8) $ (\inst|process_0~0_combout\ $ (!\inst|Add0~15\)))) # (GND)
-- \inst|Add0~17\ = CARRY((\inst|contagem\(8) & ((\inst|process_0~0_combout\) # (!\inst|Add0~15\))) # (!\inst|contagem\(8) & (\inst|process_0~0_combout\ & !\inst|Add0~15\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|contagem\(8),
	datab => \inst|process_0~0_combout\,
	datad => VCC,
	cin => \inst|Add0~15\,
	combout => \inst|Add0~16_combout\,
	cout => \inst|Add0~17\);

-- Location: FF_X22_Y36_N17
\inst|contagem[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|Add0~16_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \inst|contagem[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|contagem\(8));

-- Location: LCCOMB_X22_Y36_N18
\inst|Add0~18\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Add0~18_combout\ = (\inst|process_0~0_combout\ & ((\inst|contagem\(9) & (\inst|Add0~17\ & VCC)) # (!\inst|contagem\(9) & (!\inst|Add0~17\)))) # (!\inst|process_0~0_combout\ & ((\inst|contagem\(9) & (!\inst|Add0~17\)) # (!\inst|contagem\(9) & 
-- ((\inst|Add0~17\) # (GND)))))
-- \inst|Add0~19\ = CARRY((\inst|process_0~0_combout\ & (!\inst|contagem\(9) & !\inst|Add0~17\)) # (!\inst|process_0~0_combout\ & ((!\inst|Add0~17\) # (!\inst|contagem\(9)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|process_0~0_combout\,
	datab => \inst|contagem\(9),
	datad => VCC,
	cin => \inst|Add0~17\,
	combout => \inst|Add0~18_combout\,
	cout => \inst|Add0~19\);

-- Location: FF_X22_Y36_N19
\inst|contagem[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|Add0~18_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \inst|contagem[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|contagem\(9));

-- Location: LCCOMB_X22_Y36_N20
\inst|Add0~20\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Add0~20_combout\ = ((\inst|contagem\(10) $ (\inst|process_0~0_combout\ $ (!\inst|Add0~19\)))) # (GND)
-- \inst|Add0~21\ = CARRY((\inst|contagem\(10) & ((\inst|process_0~0_combout\) # (!\inst|Add0~19\))) # (!\inst|contagem\(10) & (\inst|process_0~0_combout\ & !\inst|Add0~19\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|contagem\(10),
	datab => \inst|process_0~0_combout\,
	datad => VCC,
	cin => \inst|Add0~19\,
	combout => \inst|Add0~20_combout\,
	cout => \inst|Add0~21\);

-- Location: FF_X22_Y36_N21
\inst|contagem[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|Add0~20_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \inst|contagem[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|contagem\(10));

-- Location: LCCOMB_X22_Y36_N22
\inst|Add0~22\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Add0~22_combout\ = (\inst|contagem\(11) & ((\inst|process_0~0_combout\ & (\inst|Add0~21\ & VCC)) # (!\inst|process_0~0_combout\ & (!\inst|Add0~21\)))) # (!\inst|contagem\(11) & ((\inst|process_0~0_combout\ & (!\inst|Add0~21\)) # 
-- (!\inst|process_0~0_combout\ & ((\inst|Add0~21\) # (GND)))))
-- \inst|Add0~23\ = CARRY((\inst|contagem\(11) & (!\inst|process_0~0_combout\ & !\inst|Add0~21\)) # (!\inst|contagem\(11) & ((!\inst|Add0~21\) # (!\inst|process_0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|contagem\(11),
	datab => \inst|process_0~0_combout\,
	datad => VCC,
	cin => \inst|Add0~21\,
	combout => \inst|Add0~22_combout\,
	cout => \inst|Add0~23\);

-- Location: FF_X22_Y36_N23
\inst|contagem[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|Add0~22_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \inst|contagem[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|contagem\(11));

-- Location: LCCOMB_X22_Y36_N24
\inst|Add0~24\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Add0~24_combout\ = ((\inst|contagem\(12) $ (\inst|process_0~0_combout\ $ (!\inst|Add0~23\)))) # (GND)
-- \inst|Add0~25\ = CARRY((\inst|contagem\(12) & ((\inst|process_0~0_combout\) # (!\inst|Add0~23\))) # (!\inst|contagem\(12) & (\inst|process_0~0_combout\ & !\inst|Add0~23\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|contagem\(12),
	datab => \inst|process_0~0_combout\,
	datad => VCC,
	cin => \inst|Add0~23\,
	combout => \inst|Add0~24_combout\,
	cout => \inst|Add0~25\);

-- Location: FF_X22_Y36_N25
\inst|contagem[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|Add0~24_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \inst|contagem[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|contagem\(12));

-- Location: LCCOMB_X22_Y36_N26
\inst|Add0~26\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Add0~26_combout\ = (\inst|contagem\(13) & ((\inst|process_0~0_combout\ & (\inst|Add0~25\ & VCC)) # (!\inst|process_0~0_combout\ & (!\inst|Add0~25\)))) # (!\inst|contagem\(13) & ((\inst|process_0~0_combout\ & (!\inst|Add0~25\)) # 
-- (!\inst|process_0~0_combout\ & ((\inst|Add0~25\) # (GND)))))
-- \inst|Add0~27\ = CARRY((\inst|contagem\(13) & (!\inst|process_0~0_combout\ & !\inst|Add0~25\)) # (!\inst|contagem\(13) & ((!\inst|Add0~25\) # (!\inst|process_0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|contagem\(13),
	datab => \inst|process_0~0_combout\,
	datad => VCC,
	cin => \inst|Add0~25\,
	combout => \inst|Add0~26_combout\,
	cout => \inst|Add0~27\);

-- Location: FF_X22_Y36_N27
\inst|contagem[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|Add0~26_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \inst|contagem[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|contagem\(13));

-- Location: LCCOMB_X22_Y36_N28
\inst|Add0~28\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Add0~28_combout\ = ((\inst|contagem\(14) $ (\inst|process_0~0_combout\ $ (!\inst|Add0~27\)))) # (GND)
-- \inst|Add0~29\ = CARRY((\inst|contagem\(14) & ((\inst|process_0~0_combout\) # (!\inst|Add0~27\))) # (!\inst|contagem\(14) & (\inst|process_0~0_combout\ & !\inst|Add0~27\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|contagem\(14),
	datab => \inst|process_0~0_combout\,
	datad => VCC,
	cin => \inst|Add0~27\,
	combout => \inst|Add0~28_combout\,
	cout => \inst|Add0~29\);

-- Location: FF_X22_Y36_N29
\inst|contagem[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|Add0~28_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \inst|contagem[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|contagem\(14));

-- Location: LCCOMB_X22_Y36_N30
\inst|Add0~30\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Add0~30_combout\ = (\inst|contagem\(15) & ((\inst|process_0~0_combout\ & (\inst|Add0~29\ & VCC)) # (!\inst|process_0~0_combout\ & (!\inst|Add0~29\)))) # (!\inst|contagem\(15) & ((\inst|process_0~0_combout\ & (!\inst|Add0~29\)) # 
-- (!\inst|process_0~0_combout\ & ((\inst|Add0~29\) # (GND)))))
-- \inst|Add0~31\ = CARRY((\inst|contagem\(15) & (!\inst|process_0~0_combout\ & !\inst|Add0~29\)) # (!\inst|contagem\(15) & ((!\inst|Add0~29\) # (!\inst|process_0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|contagem\(15),
	datab => \inst|process_0~0_combout\,
	datad => VCC,
	cin => \inst|Add0~29\,
	combout => \inst|Add0~30_combout\,
	cout => \inst|Add0~31\);

-- Location: FF_X22_Y36_N31
\inst|contagem[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|Add0~30_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \inst|contagem[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|contagem\(15));

-- Location: LCCOMB_X21_Y36_N18
\inst|Equal0~5\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Equal0~5_combout\ = (!\inst|contagem\(12) & (!\inst|contagem\(13) & (!\inst|contagem\(15) & !\inst|contagem\(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|contagem\(12),
	datab => \inst|contagem\(13),
	datac => \inst|contagem\(15),
	datad => \inst|contagem\(14),
	combout => \inst|Equal0~5_combout\);

-- Location: LCCOMB_X21_Y36_N30
\inst|Equal0~7\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Equal0~7_combout\ = (!\inst|contagem\(5) & (!\inst|contagem\(4) & (!\inst|contagem\(6) & !\inst|contagem\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|contagem\(5),
	datab => \inst|contagem\(4),
	datac => \inst|contagem\(6),
	datad => \inst|contagem\(7),
	combout => \inst|Equal0~7_combout\);

-- Location: LCCOMB_X21_Y36_N0
\inst|Equal0~6\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Equal0~6_combout\ = (!\inst|contagem\(10) & (!\inst|contagem\(11) & (!\inst|contagem\(9) & !\inst|contagem\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|contagem\(10),
	datab => \inst|contagem\(11),
	datac => \inst|contagem\(9),
	datad => \inst|contagem\(8),
	combout => \inst|Equal0~6_combout\);

-- Location: LCCOMB_X21_Y36_N8
\inst|Equal0~9\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Equal0~9_combout\ = (\inst|Equal0~8_combout\ & (\inst|Equal0~5_combout\ & (\inst|Equal0~7_combout\ & \inst|Equal0~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal0~8_combout\,
	datab => \inst|Equal0~5_combout\,
	datac => \inst|Equal0~7_combout\,
	datad => \inst|Equal0~6_combout\,
	combout => \inst|Equal0~9_combout\);

-- Location: LCCOMB_X22_Y35_N0
\inst|Add0~32\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Add0~32_combout\ = ((\inst|process_0~0_combout\ $ (\inst|contagem\(16) $ (!\inst|Add0~31\)))) # (GND)
-- \inst|Add0~33\ = CARRY((\inst|process_0~0_combout\ & ((\inst|contagem\(16)) # (!\inst|Add0~31\))) # (!\inst|process_0~0_combout\ & (\inst|contagem\(16) & !\inst|Add0~31\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|process_0~0_combout\,
	datab => \inst|contagem\(16),
	datad => VCC,
	cin => \inst|Add0~31\,
	combout => \inst|Add0~32_combout\,
	cout => \inst|Add0~33\);

-- Location: FF_X22_Y35_N1
\inst|contagem[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|Add0~32_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \inst|contagem[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|contagem\(16));

-- Location: LCCOMB_X22_Y35_N2
\inst|Add0~34\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Add0~34_combout\ = (\inst|process_0~0_combout\ & ((\inst|contagem\(17) & (\inst|Add0~33\ & VCC)) # (!\inst|contagem\(17) & (!\inst|Add0~33\)))) # (!\inst|process_0~0_combout\ & ((\inst|contagem\(17) & (!\inst|Add0~33\)) # (!\inst|contagem\(17) & 
-- ((\inst|Add0~33\) # (GND)))))
-- \inst|Add0~35\ = CARRY((\inst|process_0~0_combout\ & (!\inst|contagem\(17) & !\inst|Add0~33\)) # (!\inst|process_0~0_combout\ & ((!\inst|Add0~33\) # (!\inst|contagem\(17)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|process_0~0_combout\,
	datab => \inst|contagem\(17),
	datad => VCC,
	cin => \inst|Add0~33\,
	combout => \inst|Add0~34_combout\,
	cout => \inst|Add0~35\);

-- Location: FF_X22_Y35_N3
\inst|contagem[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|Add0~34_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \inst|contagem[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|contagem\(17));

-- Location: LCCOMB_X22_Y35_N4
\inst|Add0~36\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Add0~36_combout\ = ((\inst|process_0~0_combout\ $ (\inst|contagem\(18) $ (!\inst|Add0~35\)))) # (GND)
-- \inst|Add0~37\ = CARRY((\inst|process_0~0_combout\ & ((\inst|contagem\(18)) # (!\inst|Add0~35\))) # (!\inst|process_0~0_combout\ & (\inst|contagem\(18) & !\inst|Add0~35\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|process_0~0_combout\,
	datab => \inst|contagem\(18),
	datad => VCC,
	cin => \inst|Add0~35\,
	combout => \inst|Add0~36_combout\,
	cout => \inst|Add0~37\);

-- Location: FF_X22_Y35_N5
\inst|contagem[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|Add0~36_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \inst|contagem[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|contagem\(18));

-- Location: LCCOMB_X22_Y35_N6
\inst|Add0~38\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Add0~38_combout\ = (\inst|process_0~0_combout\ & ((\inst|contagem\(19) & (\inst|Add0~37\ & VCC)) # (!\inst|contagem\(19) & (!\inst|Add0~37\)))) # (!\inst|process_0~0_combout\ & ((\inst|contagem\(19) & (!\inst|Add0~37\)) # (!\inst|contagem\(19) & 
-- ((\inst|Add0~37\) # (GND)))))
-- \inst|Add0~39\ = CARRY((\inst|process_0~0_combout\ & (!\inst|contagem\(19) & !\inst|Add0~37\)) # (!\inst|process_0~0_combout\ & ((!\inst|Add0~37\) # (!\inst|contagem\(19)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|process_0~0_combout\,
	datab => \inst|contagem\(19),
	datad => VCC,
	cin => \inst|Add0~37\,
	combout => \inst|Add0~38_combout\,
	cout => \inst|Add0~39\);

-- Location: FF_X22_Y35_N7
\inst|contagem[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|Add0~38_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \inst|contagem[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|contagem\(19));

-- Location: LCCOMB_X22_Y35_N8
\inst|Add0~40\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Add0~40_combout\ = ((\inst|process_0~0_combout\ $ (\inst|contagem\(20) $ (!\inst|Add0~39\)))) # (GND)
-- \inst|Add0~41\ = CARRY((\inst|process_0~0_combout\ & ((\inst|contagem\(20)) # (!\inst|Add0~39\))) # (!\inst|process_0~0_combout\ & (\inst|contagem\(20) & !\inst|Add0~39\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|process_0~0_combout\,
	datab => \inst|contagem\(20),
	datad => VCC,
	cin => \inst|Add0~39\,
	combout => \inst|Add0~40_combout\,
	cout => \inst|Add0~41\);

-- Location: FF_X22_Y35_N9
\inst|contagem[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|Add0~40_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \inst|contagem[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|contagem\(20));

-- Location: LCCOMB_X22_Y35_N10
\inst|Add0~42\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Add0~42_combout\ = (\inst|process_0~0_combout\ & ((\inst|contagem\(21) & (\inst|Add0~41\ & VCC)) # (!\inst|contagem\(21) & (!\inst|Add0~41\)))) # (!\inst|process_0~0_combout\ & ((\inst|contagem\(21) & (!\inst|Add0~41\)) # (!\inst|contagem\(21) & 
-- ((\inst|Add0~41\) # (GND)))))
-- \inst|Add0~43\ = CARRY((\inst|process_0~0_combout\ & (!\inst|contagem\(21) & !\inst|Add0~41\)) # (!\inst|process_0~0_combout\ & ((!\inst|Add0~41\) # (!\inst|contagem\(21)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|process_0~0_combout\,
	datab => \inst|contagem\(21),
	datad => VCC,
	cin => \inst|Add0~41\,
	combout => \inst|Add0~42_combout\,
	cout => \inst|Add0~43\);

-- Location: FF_X22_Y35_N11
\inst|contagem[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|Add0~42_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \inst|contagem[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|contagem\(21));

-- Location: LCCOMB_X22_Y35_N12
\inst|Add0~44\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Add0~44_combout\ = ((\inst|process_0~0_combout\ $ (\inst|contagem\(22) $ (!\inst|Add0~43\)))) # (GND)
-- \inst|Add0~45\ = CARRY((\inst|process_0~0_combout\ & ((\inst|contagem\(22)) # (!\inst|Add0~43\))) # (!\inst|process_0~0_combout\ & (\inst|contagem\(22) & !\inst|Add0~43\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|process_0~0_combout\,
	datab => \inst|contagem\(22),
	datad => VCC,
	cin => \inst|Add0~43\,
	combout => \inst|Add0~44_combout\,
	cout => \inst|Add0~45\);

-- Location: FF_X22_Y35_N13
\inst|contagem[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|Add0~44_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \inst|contagem[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|contagem\(22));

-- Location: LCCOMB_X22_Y35_N14
\inst|Add0~46\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Add0~46_combout\ = (\inst|process_0~0_combout\ & ((\inst|contagem\(23) & (\inst|Add0~45\ & VCC)) # (!\inst|contagem\(23) & (!\inst|Add0~45\)))) # (!\inst|process_0~0_combout\ & ((\inst|contagem\(23) & (!\inst|Add0~45\)) # (!\inst|contagem\(23) & 
-- ((\inst|Add0~45\) # (GND)))))
-- \inst|Add0~47\ = CARRY((\inst|process_0~0_combout\ & (!\inst|contagem\(23) & !\inst|Add0~45\)) # (!\inst|process_0~0_combout\ & ((!\inst|Add0~45\) # (!\inst|contagem\(23)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|process_0~0_combout\,
	datab => \inst|contagem\(23),
	datad => VCC,
	cin => \inst|Add0~45\,
	combout => \inst|Add0~46_combout\,
	cout => \inst|Add0~47\);

-- Location: FF_X22_Y35_N15
\inst|contagem[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|Add0~46_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \inst|contagem[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|contagem\(23));

-- Location: LCCOMB_X22_Y35_N16
\inst|Add0~48\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Add0~48_combout\ = ((\inst|contagem\(24) $ (\inst|process_0~0_combout\ $ (!\inst|Add0~47\)))) # (GND)
-- \inst|Add0~49\ = CARRY((\inst|contagem\(24) & ((\inst|process_0~0_combout\) # (!\inst|Add0~47\))) # (!\inst|contagem\(24) & (\inst|process_0~0_combout\ & !\inst|Add0~47\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|contagem\(24),
	datab => \inst|process_0~0_combout\,
	datad => VCC,
	cin => \inst|Add0~47\,
	combout => \inst|Add0~48_combout\,
	cout => \inst|Add0~49\);

-- Location: FF_X22_Y35_N17
\inst|contagem[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|Add0~48_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \inst|contagem[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|contagem\(24));

-- Location: LCCOMB_X22_Y35_N18
\inst|Add0~50\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Add0~50_combout\ = (\inst|contagem\(25) & ((\inst|process_0~0_combout\ & (\inst|Add0~49\ & VCC)) # (!\inst|process_0~0_combout\ & (!\inst|Add0~49\)))) # (!\inst|contagem\(25) & ((\inst|process_0~0_combout\ & (!\inst|Add0~49\)) # 
-- (!\inst|process_0~0_combout\ & ((\inst|Add0~49\) # (GND)))))
-- \inst|Add0~51\ = CARRY((\inst|contagem\(25) & (!\inst|process_0~0_combout\ & !\inst|Add0~49\)) # (!\inst|contagem\(25) & ((!\inst|Add0~49\) # (!\inst|process_0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|contagem\(25),
	datab => \inst|process_0~0_combout\,
	datad => VCC,
	cin => \inst|Add0~49\,
	combout => \inst|Add0~50_combout\,
	cout => \inst|Add0~51\);

-- Location: FF_X22_Y35_N19
\inst|contagem[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|Add0~50_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \inst|contagem[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|contagem\(25));

-- Location: LCCOMB_X22_Y35_N20
\inst|Add0~52\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Add0~52_combout\ = ((\inst|contagem\(26) $ (\inst|process_0~0_combout\ $ (!\inst|Add0~51\)))) # (GND)
-- \inst|Add0~53\ = CARRY((\inst|contagem\(26) & ((\inst|process_0~0_combout\) # (!\inst|Add0~51\))) # (!\inst|contagem\(26) & (\inst|process_0~0_combout\ & !\inst|Add0~51\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|contagem\(26),
	datab => \inst|process_0~0_combout\,
	datad => VCC,
	cin => \inst|Add0~51\,
	combout => \inst|Add0~52_combout\,
	cout => \inst|Add0~53\);

-- Location: FF_X22_Y35_N21
\inst|contagem[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|Add0~52_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \inst|contagem[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|contagem\(26));

-- Location: LCCOMB_X22_Y35_N22
\inst|Add0~54\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Add0~54_combout\ = (\inst|contagem\(27) & ((\inst|process_0~0_combout\ & (\inst|Add0~53\ & VCC)) # (!\inst|process_0~0_combout\ & (!\inst|Add0~53\)))) # (!\inst|contagem\(27) & ((\inst|process_0~0_combout\ & (!\inst|Add0~53\)) # 
-- (!\inst|process_0~0_combout\ & ((\inst|Add0~53\) # (GND)))))
-- \inst|Add0~55\ = CARRY((\inst|contagem\(27) & (!\inst|process_0~0_combout\ & !\inst|Add0~53\)) # (!\inst|contagem\(27) & ((!\inst|Add0~53\) # (!\inst|process_0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|contagem\(27),
	datab => \inst|process_0~0_combout\,
	datad => VCC,
	cin => \inst|Add0~53\,
	combout => \inst|Add0~54_combout\,
	cout => \inst|Add0~55\);

-- Location: FF_X22_Y35_N23
\inst|contagem[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|Add0~54_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \inst|contagem[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|contagem\(27));

-- Location: LCCOMB_X21_Y36_N26
\inst|Equal0~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Equal0~1_combout\ = (!\inst|contagem\(27) & (!\inst|contagem\(26) & (!\inst|contagem\(24) & !\inst|contagem\(25))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|contagem\(27),
	datab => \inst|contagem\(26),
	datac => \inst|contagem\(24),
	datad => \inst|contagem\(25),
	combout => \inst|Equal0~1_combout\);

-- Location: LCCOMB_X21_Y36_N14
\inst|Equal0~3\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Equal0~3_combout\ = (!\inst|contagem\(18) & (!\inst|contagem\(16) & (!\inst|contagem\(17) & !\inst|contagem\(19))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|contagem\(18),
	datab => \inst|contagem\(16),
	datac => \inst|contagem\(17),
	datad => \inst|contagem\(19),
	combout => \inst|Equal0~3_combout\);

-- Location: LCCOMB_X22_Y35_N24
\inst|Add0~56\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Add0~56_combout\ = ((\inst|contagem\(28) $ (\inst|process_0~0_combout\ $ (!\inst|Add0~55\)))) # (GND)
-- \inst|Add0~57\ = CARRY((\inst|contagem\(28) & ((\inst|process_0~0_combout\) # (!\inst|Add0~55\))) # (!\inst|contagem\(28) & (\inst|process_0~0_combout\ & !\inst|Add0~55\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|contagem\(28),
	datab => \inst|process_0~0_combout\,
	datad => VCC,
	cin => \inst|Add0~55\,
	combout => \inst|Add0~56_combout\,
	cout => \inst|Add0~57\);

-- Location: FF_X22_Y35_N25
\inst|contagem[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|Add0~56_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \inst|contagem[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|contagem\(28));

-- Location: LCCOMB_X22_Y35_N26
\inst|Add0~58\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Add0~58_combout\ = (\inst|contagem\(29) & ((\inst|process_0~0_combout\ & (\inst|Add0~57\ & VCC)) # (!\inst|process_0~0_combout\ & (!\inst|Add0~57\)))) # (!\inst|contagem\(29) & ((\inst|process_0~0_combout\ & (!\inst|Add0~57\)) # 
-- (!\inst|process_0~0_combout\ & ((\inst|Add0~57\) # (GND)))))
-- \inst|Add0~59\ = CARRY((\inst|contagem\(29) & (!\inst|process_0~0_combout\ & !\inst|Add0~57\)) # (!\inst|contagem\(29) & ((!\inst|Add0~57\) # (!\inst|process_0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|contagem\(29),
	datab => \inst|process_0~0_combout\,
	datad => VCC,
	cin => \inst|Add0~57\,
	combout => \inst|Add0~58_combout\,
	cout => \inst|Add0~59\);

-- Location: FF_X22_Y35_N27
\inst|contagem[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|Add0~58_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \inst|contagem[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|contagem\(29));

-- Location: LCCOMB_X22_Y35_N28
\inst|Add0~60\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Add0~60_combout\ = ((\inst|contagem\(30) $ (\inst|process_0~0_combout\ $ (!\inst|Add0~59\)))) # (GND)
-- \inst|Add0~61\ = CARRY((\inst|contagem\(30) & ((\inst|process_0~0_combout\) # (!\inst|Add0~59\))) # (!\inst|contagem\(30) & (\inst|process_0~0_combout\ & !\inst|Add0~59\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|contagem\(30),
	datab => \inst|process_0~0_combout\,
	datad => VCC,
	cin => \inst|Add0~59\,
	combout => \inst|Add0~60_combout\,
	cout => \inst|Add0~61\);

-- Location: FF_X22_Y35_N29
\inst|contagem[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|Add0~60_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \inst|contagem[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|contagem\(30));

-- Location: LCCOMB_X22_Y35_N30
\inst|Add0~62\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Add0~62_combout\ = \inst|contagem\(31) $ (\inst|process_0~0_combout\ $ (\inst|Add0~61\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010010110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inst|contagem\(31),
	datab => \inst|process_0~0_combout\,
	cin => \inst|Add0~61\,
	combout => \inst|Add0~62_combout\);

-- Location: FF_X22_Y35_N31
\inst|contagem[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|Add0~62_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \inst|contagem[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|contagem\(31));

-- Location: LCCOMB_X21_Y36_N4
\inst|Equal0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Equal0~0_combout\ = (!\inst|contagem\(28) & (!\inst|contagem\(31) & (!\inst|contagem\(29) & !\inst|contagem\(30))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|contagem\(28),
	datab => \inst|contagem\(31),
	datac => \inst|contagem\(29),
	datad => \inst|contagem\(30),
	combout => \inst|Equal0~0_combout\);

-- Location: LCCOMB_X21_Y36_N20
\inst|Equal0~2\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Equal0~2_combout\ = (!\inst|contagem\(20) & (!\inst|contagem\(22) & (!\inst|contagem\(21) & !\inst|contagem\(23))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|contagem\(20),
	datab => \inst|contagem\(22),
	datac => \inst|contagem\(21),
	datad => \inst|contagem\(23),
	combout => \inst|Equal0~2_combout\);

-- Location: LCCOMB_X21_Y36_N24
\inst|Equal0~4\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Equal0~4_combout\ = (\inst|Equal0~1_combout\ & (\inst|Equal0~3_combout\ & (\inst|Equal0~0_combout\ & \inst|Equal0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal0~1_combout\,
	datab => \inst|Equal0~3_combout\,
	datac => \inst|Equal0~0_combout\,
	datad => \inst|Equal0~2_combout\,
	combout => \inst|Equal0~4_combout\);

-- Location: LCCOMB_X21_Y36_N6
\inst|Equal1~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Equal1~0_combout\ = (\inst|contagem\(2)) # ((\inst|contagem\(0)) # ((!\inst|Equal0~4_combout\) # (!\inst|Equal0~9_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|contagem\(2),
	datab => \inst|contagem\(0),
	datac => \inst|Equal0~9_combout\,
	datad => \inst|Equal0~4_combout\,
	combout => \inst|Equal1~0_combout\);

-- Location: LCCOMB_X21_Y36_N2
\inst|contagem[0]~1\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|contagem[0]~1_combout\ = \inst|contagem\(0) $ ((((\inst|Equal1~0_combout\ & \inverter~input_o\)) # (!\inst|process_0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal1~0_combout\,
	datab => \inverter~input_o\,
	datac => \inst|contagem\(0),
	datad => \inst|process_0~0_combout\,
	combout => \inst|contagem[0]~1_combout\);

-- Location: FF_X21_Y36_N3
\inst|contagem[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|contagem[0]~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|contagem\(0));

-- Location: LCCOMB_X21_Y36_N22
\inst|Equal0~10\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|Equal0~10_combout\ = (\inst|contagem\(0) & \inst|contagem\(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|contagem\(0),
	datad => \inst|contagem\(2),
	combout => \inst|Equal0~10_combout\);

-- Location: LCCOMB_X21_Y36_N16
\inst|process_0~0\ : fiftyfivenm_lcell_comb
-- Equation(s):
-- \inst|process_0~0_combout\ = (\inverter~input_o\) # ((\inst|Equal0~10_combout\ & (\inst|Equal0~9_combout\ & \inst|Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal0~10_combout\,
	datab => \inverter~input_o\,
	datac => \inst|Equal0~9_combout\,
	datad => \inst|Equal0~4_combout\,
	combout => \inst|process_0~0_combout\);

-- Location: FF_X22_Y36_N5
\inst|contagem[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \Clock~inputclkctrl_outclk\,
	d => \inst|Add0~4_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \inst|contagem[0]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|contagem\(2));

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

ww_a(2) <= \a[2]~output_o\;

ww_a(1) <= \a[1]~output_o\;

ww_a(0) <= \a[0]~output_o\;
END structure;


