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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "12/05/2022 08:36:13"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Lab7
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Lab7_vhd_vec_tst IS
END Lab7_vhd_vec_tst;
ARCHITECTURE Lab7_arch OF Lab7_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL 0a : STD_LOGIC;
SIGNAL 0b : STD_LOGIC;
SIGNAL 0c : STD_LOGIC;
SIGNAL 0d : STD_LOGIC;
SIGNAL 0e : STD_LOGIC;
SIGNAL 0f : STD_LOGIC;
SIGNAL 0g : STD_LOGIC;
SIGNAL 2a : STD_LOGIC;
SIGNAL 2b : STD_LOGIC;
SIGNAL 2c : STD_LOGIC;
SIGNAL 2d : STD_LOGIC;
SIGNAL 2e : STD_LOGIC;
SIGNAL 2f : STD_LOGIC;
SIGNAL 2g : STD_LOGIC;
SIGNAL 3a : STD_LOGIC;
SIGNAL 3b : STD_LOGIC;
SIGNAL 3c : STD_LOGIC;
SIGNAL 3d : STD_LOGIC;
SIGNAL 3e : STD_LOGIC;
SIGNAL 3f : STD_LOGIC;
SIGNAL 3g : STD_LOGIC;
SIGNAL 4a : STD_LOGIC;
SIGNAL 4b : STD_LOGIC;
SIGNAL 4c : STD_LOGIC;
SIGNAL 4d : STD_LOGIC;
SIGNAL 4e : STD_LOGIC;
SIGNAL 4f : STD_LOGIC;
SIGNAL 4g : STD_LOGIC;
SIGNAL 5a : STD_LOGIC;
SIGNAL 5b : STD_LOGIC;
SIGNAL 5c : STD_LOGIC;
SIGNAL 5d : STD_LOGIC;
SIGNAL 5e : STD_LOGIC;
SIGNAL 5f : STD_LOGIC;
SIGNAL 5g : STD_LOGIC;
SIGNAL Clock : STD_LOGIC;
SIGNAL ds : STD_LOGIC;
SIGNAL Pause : STD_LOGIC;
SIGNAL Reset : STD_LOGIC;
COMPONENT Lab7
	PORT (
	\0a\ : OUT STD_LOGIC;
	\0b\ : OUT STD_LOGIC;
	\0c\ : OUT STD_LOGIC;
	\0d\ : OUT STD_LOGIC;
	\0e\ : OUT STD_LOGIC;
	\0f\ : OUT STD_LOGIC;
	\0g\ : OUT STD_LOGIC;
	\2a\ : OUT STD_LOGIC;
	\2b\ : OUT STD_LOGIC;
	\2c\ : OUT STD_LOGIC;
	\2d\ : OUT STD_LOGIC;
	\2e\ : OUT STD_LOGIC;
	\2f\ : OUT STD_LOGIC;
	\2g\ : OUT STD_LOGIC;
	\3a\ : OUT STD_LOGIC;
	\3b\ : OUT STD_LOGIC;
	\3c\ : OUT STD_LOGIC;
	\3d\ : OUT STD_LOGIC;
	\3e\ : OUT STD_LOGIC;
	\3f\ : OUT STD_LOGIC;
	\3g\ : OUT STD_LOGIC;
	\4a\ : OUT STD_LOGIC;
	\4b\ : OUT STD_LOGIC;
	\4c\ : OUT STD_LOGIC;
	\4d\ : OUT STD_LOGIC;
	\4e\ : OUT STD_LOGIC;
	\4f\ : OUT STD_LOGIC;
	\4g\ : OUT STD_LOGIC;
	\5a\ : OUT STD_LOGIC;
	\5b\ : OUT STD_LOGIC;
	\5c\ : OUT STD_LOGIC;
	\5d\ : OUT STD_LOGIC;
	\5e\ : OUT STD_LOGIC;
	\5f\ : OUT STD_LOGIC;
	\5g\ : OUT STD_LOGIC;
	Clock : IN STD_LOGIC;
	ds : OUT STD_LOGIC;
	Pause : IN STD_LOGIC;
	Reset : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Lab7
	PORT MAP (
-- list connections between master ports and signals
	\0a\ => 0a,
	\0b\ => 0b,
	\0c\ => 0c,
	\0d\ => 0d,
	\0e\ => 0e,
	\0f\ => 0f,
	\0g\ => 0g,
	\2a\ => 2a,
	\2b\ => 2b,
	\2c\ => 2c,
	\2d\ => 2d,
	\2e\ => 2e,
	\2f\ => 2f,
	\2g\ => 2g,
	\3a\ => 3a,
	\3b\ => 3b,
	\3c\ => 3c,
	\3d\ => 3d,
	\3e\ => 3e,
	\3f\ => 3f,
	\3g\ => 3g,
	\4a\ => 4a,
	\4b\ => 4b,
	\4c\ => 4c,
	\4d\ => 4d,
	\4e\ => 4e,
	\4f\ => 4f,
	\4g\ => 4g,
	\5a\ => 5a,
	\5b\ => 5b,
	\5c\ => 5c,
	\5d\ => 5d,
	\5e\ => 5e,
	\5f\ => 5f,
	\5g\ => 5g,
	Clock => Clock,
	ds => ds,
	Pause => Pause,
	Reset => Reset
	);

-- Clock
t_prcs_Clock: PROCESS
BEGIN
LOOP
	Clock <= '0';
	WAIT FOR 1000 ps;
	Clock <= '1';
	WAIT FOR 1000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_Clock;

-- Pause
t_prcs_Pause: PROCESS
BEGIN
	Pause <= '0';
WAIT;
END PROCESS t_prcs_Pause;

-- Reset
t_prcs_Reset: PROCESS
BEGIN
	Reset <= '0';
WAIT;
END PROCESS t_prcs_Reset;
END Lab7_arch;
