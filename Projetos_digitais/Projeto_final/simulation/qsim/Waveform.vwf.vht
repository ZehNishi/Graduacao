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
-- Generated on "11/28/2022 12:20:47"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          Projeto_final
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Projeto_final_vhd_vec_tst IS
END Projeto_final_vhd_vec_tst;
ARCHITECTURE Projeto_final_arch OF Projeto_final_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL Clock : STD_LOGIC;
SIGNAL Frequencia : STD_LOGIC;
SIGNAL Reset : STD_LOGIC;
SIGNAL Saida : STD_LOGIC_VECTOR(23 DOWNTO 0);
COMPONENT Projeto_final
	PORT (
	Clock : IN STD_LOGIC;
	Frequencia : IN STD_LOGIC;
	Reset : IN STD_LOGIC;
	Saida : OUT STD_LOGIC_VECTOR(23 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : Projeto_final
	PORT MAP (
-- list connections between master ports and signals
	Clock => Clock,
	Frequencia => Frequencia,
	Reset => Reset,
	Saida => Saida
	);

-- Frequencia
t_prcs_Frequencia: PROCESS
BEGIN
LOOP
	Frequencia <= '0';
	WAIT FOR 10000 ps;
	Frequencia <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 1000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_Frequencia;

-- Clock
t_prcs_Clock: PROCESS
BEGIN
	Clock <= '0';
	WAIT FOR 990000 ps;
	Clock <= '1';
WAIT;
END PROCESS t_prcs_Clock;

-- Reset
t_prcs_Reset: PROCESS
BEGIN
	Reset <= '0';
WAIT;
END PROCESS t_prcs_Reset;
END Projeto_final_arch;
