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
-- Generated on "11/07/2022 20:01:22"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Lab6
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Lab6_vhd_vec_tst IS
END Lab6_vhd_vec_tst;
ARCHITECTURE Lab6_arch OF Lab6_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL A : STD_LOGIC;
SIGNAL B : STD_LOGIC;
SIGNAL C : STD_LOGIC;
SIGNAL Clock : STD_LOGIC;
SIGNAL DS : STD_LOGIC;
SIGNAL Entrada : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
COMPONENT Lab6
	PORT (
	A : OUT STD_LOGIC;
	B : OUT STD_LOGIC;
	C : OUT STD_LOGIC;
	Clock : IN STD_LOGIC;
	DS : OUT STD_LOGIC;
	Entrada : IN STD_LOGIC;
	reset : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Lab6
	PORT MAP (
-- list connections between master ports and signals
	A => A,
	B => B,
	C => C,
	Clock => Clock,
	DS => DS,
	Entrada => Entrada,
	reset => reset
	);

-- reset
t_prcs_reset: PROCESS
BEGIN
	reset <= '1';
WAIT;
END PROCESS t_prcs_reset;

-- Clock
t_prcs_Clock: PROCESS
BEGIN
LOOP
	Clock <= '0';
	WAIT FOR 10000 ps;
	Clock <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_Clock;

-- Entrada
t_prcs_Entrada: PROCESS
BEGIN
	Entrada <= '0';
	WAIT FOR 30000 ps;
	Entrada <= '1';
	WAIT FOR 10000 ps;
	Entrada <= '0';
	WAIT FOR 30000 ps;
	Entrada <= '1';
	WAIT FOR 10000 ps;
	Entrada <= '0';
	WAIT FOR 50000 ps;
	Entrada <= '1';
	WAIT FOR 10000 ps;
	Entrada <= '0';
	WAIT FOR 10000 ps;
	Entrada <= '1';
	WAIT FOR 10000 ps;
	Entrada <= '0';
WAIT;
END PROCESS t_prcs_Entrada;
END Lab6_arch;
