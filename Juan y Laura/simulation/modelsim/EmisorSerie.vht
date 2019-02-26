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
-- Generated on "02/04/2019 09:35:13"

-- Vhdl Test Bench template for design  :  EmisorSerie
--
-- Simulation tool : ModelSim-Altera (VHDL)
--

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY EmisorSerie_vhd_tst IS
END EmisorSerie_vhd_tst;
ARCHITECTURE EmisorSerie_arch OF EmisorSerie_vhd_tst IS
-- constants
constant clk_semi : time := 10 ns;
-- signals
SIGNAL boton : STD_LOGIC := '1';
SIGNAL clk : STD_LOGIC := '0';
SIGNAL entrada : STD_LOGIC_VECTOR(7 DOWNTO 0) := "00000000";
SIGNAL reset_n : STD_LOGIC;
SIGNAL salida : STD_LOGIC;
COMPONENT EmisorSerie
	PORT (
	boton : IN STD_LOGIC;
	clk : IN STD_LOGIC;
	entrada : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	reset_n : IN STD_LOGIC;
	salida : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : EmisorSerie
	PORT MAP (
-- list connections between master ports and signals
	boton => boton,
	clk => clk,
	entrada => entrada,
	reset_n => reset_n,
	salida => salida
	);
	clk <= not(clk) after 10 ns;
init : PROCESS
-- variable declarations
BEGIN
        -- code that executes only once
WAIT;
END PROCESS init;
always : PROCESS
variable paridad : STD_LOGIC;
BEGIN
	reset_n <= '0';
	wait for 100 ns;

  for i in 0 to 255 loop
    reset_n <= '0';
    wait for 4* clk_semi;
    reset_n <= '1';
    entrada <= STD_LOGIC_VECTOR(to_unsigned(i,8));
    wait for 4*clk_semi;
    boton <= '0';
    wait for 4*clk_semi;
    boton <= '1';
    wait for 2604*clk_semi; -- Espera medio baudio
    assert salida = '0'
      report "Error en bit de start"
      severity failure;
    wait for 2604*2*clk_semi; --Espera un baudio
    for j in 0 to 7 loop
      assert salida = entrada(j);
        report "Se ha cometido un error al enviar la señal"
        severity warning;
      wait for 2604*2*clk_semi; --Espera un baudio
    end loop;
    paridad := (entrada(0) XOR entrada(1) XOR entrada(2) XOR entrada(3) XOR entrada(4) XOR entrada(5) XOR entrada(6) XOR entrada(7));
    assert salida = paridad
      report "La paridad no se está enviando correctamente"
      severity failure;
    wait for 2604*2*clk_semi; --Espera un baudio
    assert salida = '1'
      report "Error en bit de stop"
      severity failure;
  end loop;
  assert false
    report "Fin de la simulacion"
    severity failure;
WAIT;
END PROCESS always;
END EmisorSerie_arch;
