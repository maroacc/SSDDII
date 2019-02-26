-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "01/30/2019 21:44:49"
                                                            
-- Vhdl Test Bench template for design  :  SumadorNBits
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY SumadorNBits_vhd_tst IS
END SumadorNBits_vhd_tst;
ARCHITECTURE SumadorNBits_arch OF SumadorNBits_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL a : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL b : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL c_out : STD_LOGIC;
SIGNAL s : STD_LOGIC_VECTOR(31 DOWNTO 0);
COMPONENT SumadorNBits
	PORT (
	a : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	b : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	c_out : OUT STD_LOGIC;
	s : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : SumadorNBits
	PORT MAP (
-- list connections between master ports and signals
	a => a,
	b => b,
	c_out => c_out,
	s => s
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once                      
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          
END SumadorNBits_arch;
