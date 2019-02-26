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

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.0 Build 156 04/24/2013 SJ Web Edition"

-- DATE "02/09/2019 11:46:14"

-- 
-- Device: Altera EP2C20F484C7 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	EmisorSerie IS
    PORT (
	entrada : IN std_logic_vector(7 DOWNTO 0);
	boton : IN std_logic;
	clk : IN std_logic;
	reset_n : IN std_logic;
	salida : OUT std_logic
	);
END EmisorSerie;

-- Design Ports Information
-- salida	=>  Location: PIN_B16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- clk	=>  Location: PIN_M1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- reset_n	=>  Location: PIN_M2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- entrada[0]	=>  Location: PIN_F14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- entrada[1]	=>  Location: PIN_A15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- entrada[2]	=>  Location: PIN_B15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- entrada[3]	=>  Location: PIN_F13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- entrada[4]	=>  Location: PIN_A16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- entrada[5]	=>  Location: PIN_E14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- entrada[6]	=>  Location: PIN_F12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- entrada[7]	=>  Location: PIN_H13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- boton	=>  Location: PIN_D14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF EmisorSerie IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_entrada : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_boton : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset_n : std_logic;
SIGNAL ww_salida : std_logic;
SIGNAL \clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \reset_n~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \i_3|cuenta[9]~30_combout\ : std_logic;
SIGNAL \i_3|salida~3_combout\ : std_logic;
SIGNAL \i_2|cuenta[2]~0_combout\ : std_logic;
SIGNAL \i_5|desp_int~7_combout\ : std_logic;
SIGNAL \i_5|desp_int~8_combout\ : std_logic;
SIGNAL \clk~combout\ : std_logic;
SIGNAL \clk~clkctrl_outclk\ : std_logic;
SIGNAL \i_3|cuenta[0]~13\ : std_logic;
SIGNAL \i_3|cuenta[1]~15\ : std_logic;
SIGNAL \i_3|cuenta[2]~16_combout\ : std_logic;
SIGNAL \reset_n~combout\ : std_logic;
SIGNAL \reset_n~clkctrl_outclk\ : std_logic;
SIGNAL \i_3|cuenta[1]~14_combout\ : std_logic;
SIGNAL \i_3|LessThan0~0_combout\ : std_logic;
SIGNAL \i_3|LessThan0~1_combout\ : std_logic;
SIGNAL \i_3|cuenta[6]~25\ : std_logic;
SIGNAL \i_3|cuenta[7]~27\ : std_logic;
SIGNAL \i_3|cuenta[8]~28_combout\ : std_logic;
SIGNAL \i_3|cuenta[8]~29\ : std_logic;
SIGNAL \i_3|cuenta[9]~31\ : std_logic;
SIGNAL \i_3|cuenta[10]~33\ : std_logic;
SIGNAL \i_3|cuenta[11]~34_combout\ : std_logic;
SIGNAL \i_3|cuenta[10]~32_combout\ : std_logic;
SIGNAL \boton~combout\ : std_logic;
SIGNAL \i_1|estado_act.Esp0~feeder_combout\ : std_logic;
SIGNAL \i_1|estado_act.Esp0~regout\ : std_logic;
SIGNAL \i_1|Selector1~0_combout\ : std_logic;
SIGNAL \i_1|estado_act.Pulso~regout\ : std_logic;
SIGNAL \i_4|Selector0~0_combout\ : std_logic;
SIGNAL \i_4|estado_act.Rep~regout\ : std_logic;
SIGNAL \i_3|process_0~0_combout\ : std_logic;
SIGNAL \i_3|process_0~1_combout\ : std_logic;
SIGNAL \i_3|process_0~2_combout\ : std_logic;
SIGNAL \i_3|cuenta[2]~17\ : std_logic;
SIGNAL \i_3|cuenta[3]~18_combout\ : std_logic;
SIGNAL \i_3|cuenta[3]~19\ : std_logic;
SIGNAL \i_3|cuenta[4]~20_combout\ : std_logic;
SIGNAL \i_3|cuenta[4]~21\ : std_logic;
SIGNAL \i_3|cuenta[5]~22_combout\ : std_logic;
SIGNAL \i_3|cuenta[5]~23\ : std_logic;
SIGNAL \i_3|cuenta[6]~24_combout\ : std_logic;
SIGNAL \i_3|salida~0_combout\ : std_logic;
SIGNAL \i_3|cuenta[7]~26_combout\ : std_logic;
SIGNAL \i_3|salida~1_combout\ : std_logic;
SIGNAL \i_3|cuenta[0]~12_combout\ : std_logic;
SIGNAL \i_3|salida~2_combout\ : std_logic;
SIGNAL \i_3|salida~4_combout\ : std_logic;
SIGNAL \i_4|Selector3~0_combout\ : std_logic;
SIGNAL \i_4|estado_act.ActivaReg~regout\ : std_logic;
SIGNAL \i_2|cuenta[0]~2_combout\ : std_logic;
SIGNAL \i_2|cuenta[1]~1_combout\ : std_logic;
SIGNAL \i_2|Equal0~0_combout\ : std_logic;
SIGNAL \i_4|Selector4~0_combout\ : std_logic;
SIGNAL \i_4|Selector1~0_combout\ : std_logic;
SIGNAL \i_4|estado_act.BitStart~regout\ : std_logic;
SIGNAL \i_4|Selector2~0_combout\ : std_logic;
SIGNAL \i_4|estado_act.EsperaBit~regout\ : std_logic;
SIGNAL \i_4|Selector4~1_combout\ : std_logic;
SIGNAL \i_4|Selector4~2_combout\ : std_logic;
SIGNAL \i_4|estado_act.Paridad~regout\ : std_logic;
SIGNAL \i_4|estado_act.BitStop~0_combout\ : std_logic;
SIGNAL \i_4|estado_act.BitStop~regout\ : std_logic;
SIGNAL \i_5|desp_int~6_combout\ : std_logic;
SIGNAL \i_5|desp_int[0]~1_combout\ : std_logic;
SIGNAL \i_5|desp_int~5_combout\ : std_logic;
SIGNAL \i_5|desp_int~4_combout\ : std_logic;
SIGNAL \i_5|desp_int~3_combout\ : std_logic;
SIGNAL \i_5|desp_int~2_combout\ : std_logic;
SIGNAL \i_5|desp_int~0_combout\ : std_logic;
SIGNAL \i_7|Mux0~0_combout\ : std_logic;
SIGNAL \i_6|parid_impar~1_combout\ : std_logic;
SIGNAL \i_6|parid_impar~0_combout\ : std_logic;
SIGNAL \i_6|parid_impar~2_combout\ : std_logic;
SIGNAL \i_6|parid_impar~regout\ : std_logic;
SIGNAL \i_7|Mux0~1_combout\ : std_logic;
SIGNAL \i_2|cuenta\ : std_logic_vector(2 DOWNTO 0);
SIGNAL \i_3|cuenta\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \i_5|desp_int\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \entrada~combout\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_reset_n~clkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_clk~clkctrl_outclk\ : std_logic;

BEGIN

ww_entrada <= entrada;
ww_boton <= boton;
ww_clk <= clk;
ww_reset_n <= reset_n;
salida <= ww_salida;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clk~combout\);

\reset_n~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \reset_n~combout\);
\ALT_INV_reset_n~clkctrl_outclk\ <= NOT \reset_n~clkctrl_outclk\;
\ALT_INV_clk~clkctrl_outclk\ <= NOT \clk~clkctrl_outclk\;

-- Location: LCFF_X36_Y24_N25
\i_3|cuenta[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \i_3|cuenta[9]~30_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	sclr => \i_3|process_0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i_3|cuenta\(9));

-- Location: LCCOMB_X36_Y24_N24
\i_3|cuenta[9]~30\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_3|cuenta[9]~30_combout\ = (\i_3|cuenta\(9) & (!\i_3|cuenta[8]~29\)) # (!\i_3|cuenta\(9) & ((\i_3|cuenta[8]~29\) # (GND)))
-- \i_3|cuenta[9]~31\ = CARRY((!\i_3|cuenta[8]~29\) # (!\i_3|cuenta\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \i_3|cuenta\(9),
	datad => VCC,
	cin => \i_3|cuenta[8]~29\,
	combout => \i_3|cuenta[9]~30_combout\,
	cout => \i_3|cuenta[9]~31\);

-- Location: LCFF_X34_Y24_N21
\i_5|desp_int[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \i_5|desp_int~8_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	sclr => \i_4|estado_act.ActivaReg~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i_5|desp_int\(7));

-- Location: LCFF_X37_Y24_N13
\i_2|cuenta[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \i_2|cuenta[2]~0_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i_2|cuenta\(2));

-- Location: LCCOMB_X36_Y24_N4
\i_3|salida~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_3|salida~3_combout\ = (\i_3|cuenta\(3) & (\i_3|cuenta\(11) & (\i_3|cuenta\(9) & \i_3|cuenta\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_3|cuenta\(3),
	datab => \i_3|cuenta\(11),
	datac => \i_3|cuenta\(9),
	datad => \i_3|cuenta\(5),
	combout => \i_3|salida~3_combout\);

-- Location: LCCOMB_X37_Y24_N12
\i_2|cuenta[2]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_2|cuenta[2]~0_combout\ = (\i_2|cuenta\(2)) # ((\i_4|estado_act.ActivaReg~regout\ & (\i_2|cuenta\(1) & \i_2|cuenta\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_4|estado_act.ActivaReg~regout\,
	datab => \i_2|cuenta\(1),
	datac => \i_2|cuenta\(2),
	datad => \i_2|cuenta\(0),
	combout => \i_2|cuenta[2]~0_combout\);

-- Location: LCFF_X34_Y24_N11
\i_5|desp_int[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \i_5|desp_int~7_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \i_5|desp_int[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i_5|desp_int\(6));

-- Location: LCCOMB_X34_Y24_N10
\i_5|desp_int~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_5|desp_int~7_combout\ = (\i_4|estado_act.ActivaReg~regout\ & (\i_5|desp_int\(7))) # (!\i_4|estado_act.ActivaReg~regout\ & ((\entrada~combout\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_5|desp_int\(7),
	datac => \entrada~combout\(6),
	datad => \i_4|estado_act.ActivaReg~regout\,
	combout => \i_5|desp_int~7_combout\);

-- Location: LCCOMB_X34_Y24_N20
\i_5|desp_int~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_5|desp_int~8_combout\ = (\i_4|estado_act.BitStart~regout\ & (\entrada~combout\(7))) # (!\i_4|estado_act.BitStart~regout\ & ((\i_5|desp_int\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \entrada~combout\(7),
	datac => \i_5|desp_int\(7),
	datad => \i_4|estado_act.BitStart~regout\,
	combout => \i_5|desp_int~8_combout\);

-- Location: PIN_M1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\clk~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_clk,
	combout => \clk~combout\);

-- Location: PIN_H13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\entrada[7]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_entrada(7),
	combout => \entrada~combout\(7));

-- Location: CLKCTRL_G3
\clk~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~clkctrl_outclk\);

-- Location: LCCOMB_X36_Y24_N6
\i_3|cuenta[0]~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_3|cuenta[0]~12_combout\ = \i_3|cuenta\(0) $ (VCC)
-- \i_3|cuenta[0]~13\ = CARRY(\i_3|cuenta\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_3|cuenta\(0),
	datad => VCC,
	combout => \i_3|cuenta[0]~12_combout\,
	cout => \i_3|cuenta[0]~13\);

-- Location: LCCOMB_X36_Y24_N8
\i_3|cuenta[1]~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_3|cuenta[1]~14_combout\ = (\i_3|cuenta\(1) & (!\i_3|cuenta[0]~13\)) # (!\i_3|cuenta\(1) & ((\i_3|cuenta[0]~13\) # (GND)))
-- \i_3|cuenta[1]~15\ = CARRY((!\i_3|cuenta[0]~13\) # (!\i_3|cuenta\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \i_3|cuenta\(1),
	datad => VCC,
	cin => \i_3|cuenta[0]~13\,
	combout => \i_3|cuenta[1]~14_combout\,
	cout => \i_3|cuenta[1]~15\);

-- Location: LCCOMB_X36_Y24_N10
\i_3|cuenta[2]~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_3|cuenta[2]~16_combout\ = (\i_3|cuenta\(2) & (\i_3|cuenta[1]~15\ $ (GND))) # (!\i_3|cuenta\(2) & (!\i_3|cuenta[1]~15\ & VCC))
-- \i_3|cuenta[2]~17\ = CARRY((\i_3|cuenta\(2) & !\i_3|cuenta[1]~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \i_3|cuenta\(2),
	datad => VCC,
	cin => \i_3|cuenta[1]~15\,
	combout => \i_3|cuenta[2]~16_combout\,
	cout => \i_3|cuenta[2]~17\);

-- Location: PIN_M2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\reset_n~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_reset_n,
	combout => \reset_n~combout\);

-- Location: CLKCTRL_G1
\reset_n~clkctrl\ : cycloneii_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \reset_n~clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \reset_n~clkctrl_outclk\);

-- Location: LCFF_X36_Y24_N9
\i_3|cuenta[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \i_3|cuenta[1]~14_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	sclr => \i_3|process_0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i_3|cuenta\(1));

-- Location: LCCOMB_X35_Y24_N2
\i_3|LessThan0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_3|LessThan0~0_combout\ = (!\i_3|cuenta\(4) & (!\i_3|cuenta\(2) & ((!\i_3|cuenta\(1)) # (!\i_3|cuenta\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_3|cuenta\(0),
	datab => \i_3|cuenta\(4),
	datac => \i_3|cuenta\(2),
	datad => \i_3|cuenta\(1),
	combout => \i_3|LessThan0~0_combout\);

-- Location: LCCOMB_X35_Y24_N4
\i_3|LessThan0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_3|LessThan0~1_combout\ = ((\i_3|LessThan0~0_combout\) # ((!\i_3|cuenta\(4) & !\i_3|cuenta\(3)))) # (!\i_3|cuenta\(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101010111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_3|cuenta\(5),
	datab => \i_3|cuenta\(4),
	datac => \i_3|cuenta\(3),
	datad => \i_3|LessThan0~0_combout\,
	combout => \i_3|LessThan0~1_combout\);

-- Location: LCCOMB_X36_Y24_N18
\i_3|cuenta[6]~24\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_3|cuenta[6]~24_combout\ = (\i_3|cuenta\(6) & (\i_3|cuenta[5]~23\ $ (GND))) # (!\i_3|cuenta\(6) & (!\i_3|cuenta[5]~23\ & VCC))
-- \i_3|cuenta[6]~25\ = CARRY((\i_3|cuenta\(6) & !\i_3|cuenta[5]~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \i_3|cuenta\(6),
	datad => VCC,
	cin => \i_3|cuenta[5]~23\,
	combout => \i_3|cuenta[6]~24_combout\,
	cout => \i_3|cuenta[6]~25\);

-- Location: LCCOMB_X36_Y24_N20
\i_3|cuenta[7]~26\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_3|cuenta[7]~26_combout\ = (\i_3|cuenta\(7) & (!\i_3|cuenta[6]~25\)) # (!\i_3|cuenta\(7) & ((\i_3|cuenta[6]~25\) # (GND)))
-- \i_3|cuenta[7]~27\ = CARRY((!\i_3|cuenta[6]~25\) # (!\i_3|cuenta\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \i_3|cuenta\(7),
	datad => VCC,
	cin => \i_3|cuenta[6]~25\,
	combout => \i_3|cuenta[7]~26_combout\,
	cout => \i_3|cuenta[7]~27\);

-- Location: LCCOMB_X36_Y24_N22
\i_3|cuenta[8]~28\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_3|cuenta[8]~28_combout\ = (\i_3|cuenta\(8) & (\i_3|cuenta[7]~27\ $ (GND))) # (!\i_3|cuenta\(8) & (!\i_3|cuenta[7]~27\ & VCC))
-- \i_3|cuenta[8]~29\ = CARRY((\i_3|cuenta\(8) & !\i_3|cuenta[7]~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \i_3|cuenta\(8),
	datad => VCC,
	cin => \i_3|cuenta[7]~27\,
	combout => \i_3|cuenta[8]~28_combout\,
	cout => \i_3|cuenta[8]~29\);

-- Location: LCFF_X36_Y24_N23
\i_3|cuenta[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \i_3|cuenta[8]~28_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	sclr => \i_3|process_0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i_3|cuenta\(8));

-- Location: LCCOMB_X36_Y24_N26
\i_3|cuenta[10]~32\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_3|cuenta[10]~32_combout\ = (\i_3|cuenta\(10) & (\i_3|cuenta[9]~31\ $ (GND))) # (!\i_3|cuenta\(10) & (!\i_3|cuenta[9]~31\ & VCC))
-- \i_3|cuenta[10]~33\ = CARRY((\i_3|cuenta\(10) & !\i_3|cuenta[9]~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \i_3|cuenta\(10),
	datad => VCC,
	cin => \i_3|cuenta[9]~31\,
	combout => \i_3|cuenta[10]~32_combout\,
	cout => \i_3|cuenta[10]~33\);

-- Location: LCCOMB_X36_Y24_N28
\i_3|cuenta[11]~34\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_3|cuenta[11]~34_combout\ = \i_3|cuenta[10]~33\ $ (\i_3|cuenta\(11))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \i_3|cuenta\(11),
	cin => \i_3|cuenta[10]~33\,
	combout => \i_3|cuenta[11]~34_combout\);

-- Location: LCFF_X36_Y24_N29
\i_3|cuenta[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \i_3|cuenta[11]~34_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	sclr => \i_3|process_0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i_3|cuenta\(11));

-- Location: LCFF_X36_Y24_N27
\i_3|cuenta[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \i_3|cuenta[10]~32_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	sclr => \i_3|process_0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i_3|cuenta\(10));

-- Location: PIN_D14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\boton~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_boton,
	combout => \boton~combout\);

-- Location: LCCOMB_X35_Y24_N6
\i_1|estado_act.Esp0~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_1|estado_act.Esp0~feeder_combout\ = \boton~combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \boton~combout\,
	combout => \i_1|estado_act.Esp0~feeder_combout\);

-- Location: LCFF_X35_Y24_N7
\i_1|estado_act.Esp0\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_clk~clkctrl_outclk\,
	datain => \i_1|estado_act.Esp0~feeder_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i_1|estado_act.Esp0~regout\);

-- Location: LCCOMB_X35_Y24_N0
\i_1|Selector1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_1|Selector1~0_combout\ = (\i_1|estado_act.Esp0~regout\ & !\boton~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \i_1|estado_act.Esp0~regout\,
	datad => \boton~combout\,
	combout => \i_1|Selector1~0_combout\);

-- Location: LCFF_X35_Y24_N1
\i_1|estado_act.Pulso\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_clk~clkctrl_outclk\,
	datain => \i_1|Selector1~0_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i_1|estado_act.Pulso~regout\);

-- Location: LCCOMB_X35_Y24_N14
\i_4|Selector0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_4|Selector0~0_combout\ = (\i_4|estado_act.BitStop~regout\ & (!\i_3|salida~4_combout\ & ((\i_1|estado_act.Pulso~regout\) # (\i_4|estado_act.Rep~regout\)))) # (!\i_4|estado_act.BitStop~regout\ & ((\i_1|estado_act.Pulso~regout\) # 
-- ((\i_4|estado_act.Rep~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_4|estado_act.BitStop~regout\,
	datab => \i_1|estado_act.Pulso~regout\,
	datac => \i_4|estado_act.Rep~regout\,
	datad => \i_3|salida~4_combout\,
	combout => \i_4|Selector0~0_combout\);

-- Location: LCFF_X35_Y24_N15
\i_4|estado_act.Rep\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_clk~clkctrl_outclk\,
	datain => \i_4|Selector0~0_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i_4|estado_act.Rep~regout\);

-- Location: LCCOMB_X35_Y24_N22
\i_3|process_0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_3|process_0~0_combout\ = (\i_4|estado_act.Rep~regout\ & !\i_4|estado_act.ActivaReg~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \i_4|estado_act.Rep~regout\,
	datad => \i_4|estado_act.ActivaReg~regout\,
	combout => \i_3|process_0~0_combout\);

-- Location: LCCOMB_X35_Y24_N12
\i_3|process_0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_3|process_0~1_combout\ = (\i_3|process_0~0_combout\ & (((!\i_3|cuenta\(9) & !\i_3|cuenta\(10))) # (!\i_3|cuenta\(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_3|cuenta\(9),
	datab => \i_3|cuenta\(11),
	datac => \i_3|cuenta\(10),
	datad => \i_3|process_0~0_combout\,
	combout => \i_3|process_0~1_combout\);

-- Location: LCCOMB_X36_Y24_N30
\i_3|process_0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_3|process_0~2_combout\ = (!\i_3|process_0~1_combout\ & (((!\i_3|LessThan0~1_combout\) # (!\i_3|salida~0_combout\)) # (!\i_3|salida~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_3|salida~1_combout\,
	datab => \i_3|salida~0_combout\,
	datac => \i_3|LessThan0~1_combout\,
	datad => \i_3|process_0~1_combout\,
	combout => \i_3|process_0~2_combout\);

-- Location: LCFF_X36_Y24_N11
\i_3|cuenta[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \i_3|cuenta[2]~16_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	sclr => \i_3|process_0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i_3|cuenta\(2));

-- Location: LCCOMB_X36_Y24_N12
\i_3|cuenta[3]~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_3|cuenta[3]~18_combout\ = (\i_3|cuenta\(3) & (!\i_3|cuenta[2]~17\)) # (!\i_3|cuenta\(3) & ((\i_3|cuenta[2]~17\) # (GND)))
-- \i_3|cuenta[3]~19\ = CARRY((!\i_3|cuenta[2]~17\) # (!\i_3|cuenta\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \i_3|cuenta\(3),
	datad => VCC,
	cin => \i_3|cuenta[2]~17\,
	combout => \i_3|cuenta[3]~18_combout\,
	cout => \i_3|cuenta[3]~19\);

-- Location: LCFF_X36_Y24_N13
\i_3|cuenta[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \i_3|cuenta[3]~18_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	sclr => \i_3|process_0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i_3|cuenta\(3));

-- Location: LCCOMB_X36_Y24_N14
\i_3|cuenta[4]~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_3|cuenta[4]~20_combout\ = (\i_3|cuenta\(4) & (\i_3|cuenta[3]~19\ $ (GND))) # (!\i_3|cuenta\(4) & (!\i_3|cuenta[3]~19\ & VCC))
-- \i_3|cuenta[4]~21\ = CARRY((\i_3|cuenta\(4) & !\i_3|cuenta[3]~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \i_3|cuenta\(4),
	datad => VCC,
	cin => \i_3|cuenta[3]~19\,
	combout => \i_3|cuenta[4]~20_combout\,
	cout => \i_3|cuenta[4]~21\);

-- Location: LCFF_X36_Y24_N15
\i_3|cuenta[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \i_3|cuenta[4]~20_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	sclr => \i_3|process_0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i_3|cuenta\(4));

-- Location: LCCOMB_X36_Y24_N16
\i_3|cuenta[5]~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_3|cuenta[5]~22_combout\ = (\i_3|cuenta\(5) & (!\i_3|cuenta[4]~21\)) # (!\i_3|cuenta\(5) & ((\i_3|cuenta[4]~21\) # (GND)))
-- \i_3|cuenta[5]~23\ = CARRY((!\i_3|cuenta[4]~21\) # (!\i_3|cuenta\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \i_3|cuenta\(5),
	datad => VCC,
	cin => \i_3|cuenta[4]~21\,
	combout => \i_3|cuenta[5]~22_combout\,
	cout => \i_3|cuenta[5]~23\);

-- Location: LCFF_X36_Y24_N17
\i_3|cuenta[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \i_3|cuenta[5]~22_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	sclr => \i_3|process_0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i_3|cuenta\(5));

-- Location: LCFF_X36_Y24_N19
\i_3|cuenta[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \i_3|cuenta[6]~24_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	sclr => \i_3|process_0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i_3|cuenta\(6));

-- Location: LCCOMB_X36_Y24_N0
\i_3|salida~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_3|salida~0_combout\ = (\i_4|estado_act.Rep~regout\ & (!\i_3|cuenta\(6) & (!\i_4|estado_act.ActivaReg~regout\ & !\i_3|cuenta\(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_4|estado_act.Rep~regout\,
	datab => \i_3|cuenta\(6),
	datac => \i_4|estado_act.ActivaReg~regout\,
	datad => \i_3|cuenta\(10),
	combout => \i_3|salida~0_combout\);

-- Location: LCFF_X36_Y24_N21
\i_3|cuenta[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \i_3|cuenta[7]~26_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	sclr => \i_3|process_0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i_3|cuenta\(7));

-- Location: LCCOMB_X35_Y24_N16
\i_3|salida~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_3|salida~1_combout\ = (!\i_3|cuenta\(8) & !\i_3|cuenta\(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \i_3|cuenta\(8),
	datad => \i_3|cuenta\(7),
	combout => \i_3|salida~1_combout\);

-- Location: LCFF_X36_Y24_N7
\i_3|cuenta[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \i_3|cuenta[0]~12_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	sclr => \i_3|process_0~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i_3|cuenta\(0));

-- Location: LCCOMB_X36_Y24_N2
\i_3|salida~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_3|salida~2_combout\ = (!\i_3|cuenta\(2) & (!\i_3|cuenta\(4) & (\i_3|cuenta\(1) & \i_3|cuenta\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_3|cuenta\(2),
	datab => \i_3|cuenta\(4),
	datac => \i_3|cuenta\(1),
	datad => \i_3|cuenta\(0),
	combout => \i_3|salida~2_combout\);

-- Location: LCCOMB_X35_Y24_N10
\i_3|salida~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_3|salida~4_combout\ = (\i_3|salida~3_combout\ & (\i_3|salida~0_combout\ & (\i_3|salida~1_combout\ & \i_3|salida~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_3|salida~3_combout\,
	datab => \i_3|salida~0_combout\,
	datac => \i_3|salida~1_combout\,
	datad => \i_3|salida~2_combout\,
	combout => \i_3|salida~4_combout\);

-- Location: LCCOMB_X35_Y24_N30
\i_4|Selector3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_4|Selector3~0_combout\ = (\i_4|estado_act.EsperaBit~regout\ & (!\i_2|Equal0~0_combout\ & \i_3|salida~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_4|estado_act.EsperaBit~regout\,
	datac => \i_2|Equal0~0_combout\,
	datad => \i_3|salida~4_combout\,
	combout => \i_4|Selector3~0_combout\);

-- Location: LCFF_X35_Y24_N31
\i_4|estado_act.ActivaReg\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_clk~clkctrl_outclk\,
	datain => \i_4|Selector3~0_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i_4|estado_act.ActivaReg~regout\);

-- Location: LCCOMB_X37_Y24_N0
\i_2|cuenta[0]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_2|cuenta[0]~2_combout\ = (\i_2|cuenta\(0) & (((\i_2|cuenta\(2) & \i_2|cuenta\(1))) # (!\i_4|estado_act.ActivaReg~regout\))) # (!\i_2|cuenta\(0) & (((\i_4|estado_act.ActivaReg~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_2|cuenta\(2),
	datab => \i_2|cuenta\(1),
	datac => \i_2|cuenta\(0),
	datad => \i_4|estado_act.ActivaReg~regout\,
	combout => \i_2|cuenta[0]~2_combout\);

-- Location: LCFF_X37_Y24_N1
\i_2|cuenta[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \i_2|cuenta[0]~2_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i_2|cuenta\(0));

-- Location: LCCOMB_X37_Y24_N2
\i_2|cuenta[1]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_2|cuenta[1]~1_combout\ = (\i_2|cuenta\(0) & ((\i_2|cuenta\(1) & ((\i_2|cuenta\(2)) # (!\i_4|estado_act.ActivaReg~regout\))) # (!\i_2|cuenta\(1) & ((\i_4|estado_act.ActivaReg~regout\))))) # (!\i_2|cuenta\(0) & (((\i_2|cuenta\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_2|cuenta\(2),
	datab => \i_2|cuenta\(0),
	datac => \i_2|cuenta\(1),
	datad => \i_4|estado_act.ActivaReg~regout\,
	combout => \i_2|cuenta[1]~1_combout\);

-- Location: LCFF_X37_Y24_N3
\i_2|cuenta[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \i_2|cuenta[1]~1_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i_2|cuenta\(1));

-- Location: LCCOMB_X37_Y24_N6
\i_2|Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_2|Equal0~0_combout\ = (\i_2|cuenta\(2) & (\i_2|cuenta\(1) & \i_2|cuenta\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_2|cuenta\(2),
	datab => \i_2|cuenta\(1),
	datad => \i_2|cuenta\(0),
	combout => \i_2|Equal0~0_combout\);

-- Location: LCCOMB_X35_Y24_N18
\i_4|Selector4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_4|Selector4~0_combout\ = (\i_4|estado_act.ActivaReg~regout\ & ((\i_4|estado_act.Rep~regout\))) # (!\i_4|estado_act.ActivaReg~regout\ & (\i_1|estado_act.Pulso~regout\ & !\i_4|estado_act.Rep~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_1|estado_act.Pulso~regout\,
	datac => \i_4|estado_act.ActivaReg~regout\,
	datad => \i_4|estado_act.Rep~regout\,
	combout => \i_4|Selector4~0_combout\);

-- Location: LCCOMB_X35_Y24_N26
\i_4|Selector1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_4|Selector1~0_combout\ = (\i_4|estado_act.Rep~regout\ & (((\i_4|estado_act.BitStart~regout\ & !\i_3|salida~4_combout\)))) # (!\i_4|estado_act.Rep~regout\ & ((\i_1|estado_act.Pulso~regout\) # ((\i_4|estado_act.BitStart~regout\ & 
-- !\i_3|salida~4_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_4|estado_act.Rep~regout\,
	datab => \i_1|estado_act.Pulso~regout\,
	datac => \i_4|estado_act.BitStart~regout\,
	datad => \i_3|salida~4_combout\,
	combout => \i_4|Selector1~0_combout\);

-- Location: LCFF_X35_Y24_N27
\i_4|estado_act.BitStart\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_clk~clkctrl_outclk\,
	datain => \i_4|Selector1~0_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i_4|estado_act.BitStart~regout\);

-- Location: LCCOMB_X35_Y24_N20
\i_4|Selector2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_4|Selector2~0_combout\ = (\i_4|estado_act.ActivaReg~regout\) # ((\i_3|salida~4_combout\ & (\i_4|estado_act.BitStart~regout\)) # (!\i_3|salida~4_combout\ & ((\i_4|estado_act.EsperaBit~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_4|estado_act.ActivaReg~regout\,
	datab => \i_4|estado_act.BitStart~regout\,
	datac => \i_4|estado_act.EsperaBit~regout\,
	datad => \i_3|salida~4_combout\,
	combout => \i_4|Selector2~0_combout\);

-- Location: LCFF_X35_Y24_N21
\i_4|estado_act.EsperaBit\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_clk~clkctrl_outclk\,
	datain => \i_4|Selector2~0_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i_4|estado_act.EsperaBit~regout\);

-- Location: LCCOMB_X35_Y24_N28
\i_4|Selector4~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_4|Selector4~1_combout\ = (\i_4|estado_act.EsperaBit~regout\ & (((\i_3|salida~4_combout\)))) # (!\i_4|estado_act.EsperaBit~regout\ & ((\i_4|estado_act.Rep~regout\ & (!\i_4|Selector4~0_combout\ & \i_3|salida~4_combout\)) # (!\i_4|estado_act.Rep~regout\ & 
-- (\i_4|Selector4~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_4|estado_act.Rep~regout\,
	datab => \i_4|Selector4~0_combout\,
	datac => \i_4|estado_act.EsperaBit~regout\,
	datad => \i_3|salida~4_combout\,
	combout => \i_4|Selector4~1_combout\);

-- Location: LCCOMB_X35_Y24_N24
\i_4|Selector4~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_4|Selector4~2_combout\ = (\i_4|Selector4~1_combout\ & (\i_4|estado_act.EsperaBit~regout\ & (\i_2|Equal0~0_combout\))) # (!\i_4|Selector4~1_combout\ & (((\i_4|estado_act.Paridad~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_4|estado_act.EsperaBit~regout\,
	datab => \i_2|Equal0~0_combout\,
	datac => \i_4|estado_act.Paridad~regout\,
	datad => \i_4|Selector4~1_combout\,
	combout => \i_4|Selector4~2_combout\);

-- Location: LCFF_X35_Y24_N25
\i_4|estado_act.Paridad\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_clk~clkctrl_outclk\,
	datain => \i_4|Selector4~2_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i_4|estado_act.Paridad~regout\);

-- Location: LCCOMB_X35_Y24_N8
\i_4|estado_act.BitStop~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_4|estado_act.BitStop~0_combout\ = (\i_3|salida~4_combout\ & (\i_4|estado_act.Paridad~regout\)) # (!\i_3|salida~4_combout\ & ((\i_4|estado_act.BitStop~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_4|estado_act.Paridad~regout\,
	datac => \i_4|estado_act.BitStop~regout\,
	datad => \i_3|salida~4_combout\,
	combout => \i_4|estado_act.BitStop~0_combout\);

-- Location: LCFF_X35_Y24_N9
\i_4|estado_act.BitStop\ : cycloneii_lcell_ff
PORT MAP (
	clk => \ALT_INV_clk~clkctrl_outclk\,
	datain => \i_4|estado_act.BitStop~0_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i_4|estado_act.BitStop~regout\);

-- Location: PIN_F14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\entrada[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_entrada(0),
	combout => \entrada~combout\(0));

-- Location: PIN_A15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\entrada[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_entrada(1),
	combout => \entrada~combout\(1));

-- Location: PIN_B15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\entrada[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_entrada(2),
	combout => \entrada~combout\(2));

-- Location: PIN_A16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\entrada[4]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_entrada(4),
	combout => \entrada~combout\(4));

-- Location: PIN_E14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\entrada[5]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_entrada(5),
	combout => \entrada~combout\(5));

-- Location: LCCOMB_X34_Y24_N4
\i_5|desp_int~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_5|desp_int~6_combout\ = (\i_4|estado_act.ActivaReg~regout\ & (\i_5|desp_int\(6))) # (!\i_4|estado_act.ActivaReg~regout\ & ((\entrada~combout\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_5|desp_int\(6),
	datab => \i_4|estado_act.ActivaReg~regout\,
	datad => \entrada~combout\(5),
	combout => \i_5|desp_int~6_combout\);

-- Location: LCCOMB_X34_Y24_N24
\i_5|desp_int[0]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_5|desp_int[0]~1_combout\ = (\i_4|estado_act.BitStart~regout\) # (\i_4|estado_act.ActivaReg~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \i_4|estado_act.BitStart~regout\,
	datad => \i_4|estado_act.ActivaReg~regout\,
	combout => \i_5|desp_int[0]~1_combout\);

-- Location: LCFF_X34_Y24_N5
\i_5|desp_int[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \i_5|desp_int~6_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \i_5|desp_int[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i_5|desp_int\(5));

-- Location: LCCOMB_X34_Y24_N2
\i_5|desp_int~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_5|desp_int~5_combout\ = (\i_4|estado_act.ActivaReg~regout\ & ((\i_5|desp_int\(5)))) # (!\i_4|estado_act.ActivaReg~regout\ & (\entrada~combout\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \entrada~combout\(4),
	datac => \i_5|desp_int\(5),
	datad => \i_4|estado_act.ActivaReg~regout\,
	combout => \i_5|desp_int~5_combout\);

-- Location: LCFF_X34_Y24_N3
\i_5|desp_int[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \i_5|desp_int~5_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \i_5|desp_int[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i_5|desp_int\(4));

-- Location: PIN_F13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\entrada[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_entrada(3),
	combout => \entrada~combout\(3));

-- Location: LCCOMB_X34_Y24_N0
\i_5|desp_int~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_5|desp_int~4_combout\ = (\i_4|estado_act.ActivaReg~regout\ & (\i_5|desp_int\(4))) # (!\i_4|estado_act.ActivaReg~regout\ & ((\entrada~combout\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_4|estado_act.ActivaReg~regout\,
	datac => \i_5|desp_int\(4),
	datad => \entrada~combout\(3),
	combout => \i_5|desp_int~4_combout\);

-- Location: LCFF_X34_Y24_N1
\i_5|desp_int[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \i_5|desp_int~4_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \i_5|desp_int[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i_5|desp_int\(3));

-- Location: LCCOMB_X34_Y24_N26
\i_5|desp_int~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_5|desp_int~3_combout\ = (\i_4|estado_act.ActivaReg~regout\ & ((\i_5|desp_int\(3)))) # (!\i_4|estado_act.ActivaReg~regout\ & (\entrada~combout\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_4|estado_act.ActivaReg~regout\,
	datac => \entrada~combout\(2),
	datad => \i_5|desp_int\(3),
	combout => \i_5|desp_int~3_combout\);

-- Location: LCFF_X34_Y24_N27
\i_5|desp_int[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \i_5|desp_int~3_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \i_5|desp_int[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i_5|desp_int\(2));

-- Location: LCCOMB_X34_Y24_N22
\i_5|desp_int~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_5|desp_int~2_combout\ = (\i_4|estado_act.ActivaReg~regout\ & ((\i_5|desp_int\(2)))) # (!\i_4|estado_act.ActivaReg~regout\ & (\entrada~combout\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_4|estado_act.ActivaReg~regout\,
	datac => \entrada~combout\(1),
	datad => \i_5|desp_int\(2),
	combout => \i_5|desp_int~2_combout\);

-- Location: LCFF_X34_Y24_N23
\i_5|desp_int[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \i_5|desp_int~2_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \i_5|desp_int[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i_5|desp_int\(1));

-- Location: LCCOMB_X34_Y24_N28
\i_5|desp_int~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_5|desp_int~0_combout\ = (\i_4|estado_act.ActivaReg~regout\ & ((\i_5|desp_int\(1)))) # (!\i_4|estado_act.ActivaReg~regout\ & (\entrada~combout\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_4|estado_act.ActivaReg~regout\,
	datac => \entrada~combout\(0),
	datad => \i_5|desp_int\(1),
	combout => \i_5|desp_int~0_combout\);

-- Location: LCFF_X34_Y24_N29
\i_5|desp_int[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \i_5|desp_int~0_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \i_5|desp_int[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i_5|desp_int\(0));

-- Location: LCCOMB_X34_Y24_N14
\i_7|Mux0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_7|Mux0~0_combout\ = (\i_4|estado_act.Rep~regout\ & (!\i_4|estado_act.BitStop~regout\ & ((\i_4|estado_act.BitStart~regout\) # (!\i_5|desp_int\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_4|estado_act.Rep~regout\,
	datab => \i_4|estado_act.BitStart~regout\,
	datac => \i_4|estado_act.BitStop~regout\,
	datad => \i_5|desp_int\(0),
	combout => \i_7|Mux0~0_combout\);

-- Location: PIN_F12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\entrada[6]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_entrada(6),
	combout => \entrada~combout\(6));

-- Location: LCCOMB_X34_Y24_N16
\i_6|parid_impar~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_6|parid_impar~1_combout\ = \entrada~combout\(7) $ (\entrada~combout\(4) $ (\entrada~combout\(6) $ (\entrada~combout\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \entrada~combout\(7),
	datab => \entrada~combout\(4),
	datac => \entrada~combout\(6),
	datad => \entrada~combout\(5),
	combout => \i_6|parid_impar~1_combout\);

-- Location: LCCOMB_X34_Y24_N18
\i_6|parid_impar~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_6|parid_impar~0_combout\ = \entrada~combout\(2) $ (\entrada~combout\(1) $ (\entrada~combout\(0) $ (\entrada~combout\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \entrada~combout\(2),
	datab => \entrada~combout\(1),
	datac => \entrada~combout\(0),
	datad => \entrada~combout\(3),
	combout => \i_6|parid_impar~0_combout\);

-- Location: LCCOMB_X34_Y24_N6
\i_6|parid_impar~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_6|parid_impar~2_combout\ = \i_6|parid_impar~1_combout\ $ (!\i_6|parid_impar~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \i_6|parid_impar~1_combout\,
	datad => \i_6|parid_impar~0_combout\,
	combout => \i_6|parid_impar~2_combout\);

-- Location: LCFF_X34_Y24_N7
\i_6|parid_impar\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \i_6|parid_impar~2_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \i_6|parid_impar~regout\);

-- Location: LCCOMB_X34_Y24_N12
\i_7|Mux0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \i_7|Mux0~1_combout\ = (\i_4|estado_act.Paridad~regout\ & (((!\i_6|parid_impar~regout\)))) # (!\i_4|estado_act.Paridad~regout\ & (!\i_7|Mux0~0_combout\ & ((!\i_6|parid_impar~regout\) # (!\i_4|estado_act.BitStart~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000110111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_4|estado_act.Paridad~regout\,
	datab => \i_7|Mux0~0_combout\,
	datac => \i_4|estado_act.BitStart~regout\,
	datad => \i_6|parid_impar~regout\,
	combout => \i_7|Mux0~1_combout\);

-- Location: PIN_B16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\salida~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \i_7|Mux0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_salida);
END structure;


