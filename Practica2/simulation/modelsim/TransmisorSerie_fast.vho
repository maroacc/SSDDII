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

-- DATE "02/14/2019 22:17:40"

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

ENTITY 	TransmisorSerie IS
    PORT (
	clk : IN std_logic;
	reset_n : IN std_logic;
	e_p : IN std_logic_vector(7 DOWNTO 0);
	pulsador : IN std_logic;
	s_s : OUT std_logic
	);
END TransmisorSerie;

-- Design Ports Information
-- s_s	=>  Location: PIN_B19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- clk	=>  Location: PIN_M1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- reset_n	=>  Location: PIN_M2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- e_p[0]	=>  Location: PIN_B20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- pulsador	=>  Location: PIN_C19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- e_p[1]	=>  Location: PIN_A18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- e_p[2]	=>  Location: PIN_A20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- e_p[3]	=>  Location: PIN_A19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- e_p[4]	=>  Location: PIN_C18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- e_p[5]	=>  Location: PIN_B18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- e_p[6]	=>  Location: PIN_C21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- e_p[7]	=>  Location: PIN_C22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF TransmisorSerie IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset_n : std_logic;
SIGNAL ww_e_p : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_pulsador : std_logic;
SIGNAL ww_s_s : std_logic;
SIGNAL \clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \reset_n~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \TemporizadorUnBit_i|Add0~0_combout\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~10_combout\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~14_combout\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~18_combout\ : std_logic;
SIGNAL \TemporizadorUnBit_i|contador~5_combout\ : std_logic;
SIGNAL \RegParSer_i|registro~2_combout\ : std_logic;
SIGNAL \RegParSer_i|registro~3_combout\ : std_logic;
SIGNAL \RegParSer_i|registro~4_combout\ : std_logic;
SIGNAL \RegParSer_i|registro~5_combout\ : std_logic;
SIGNAL \RegParSer_i|registro~6_combout\ : std_logic;
SIGNAL \RegParSer_i|registro~7_combout\ : std_logic;
SIGNAL \RegParSer_i|registro~8_combout\ : std_logic;
SIGNAL \GeneraBitParidad_i|bit_paridad~regout\ : std_logic;
SIGNAL \RegParSer_i|registro~9_combout\ : std_logic;
SIGNAL \GeneraBitParidad_i|paridad~regout\ : std_logic;
SIGNAL \GeneraBitParidad_i|paridad~0_combout\ : std_logic;
SIGNAL \GeneraBitParidad_i|paridad~1_combout\ : std_logic;
SIGNAL \GeneraBitParidad_i|paridad~2_combout\ : std_logic;
SIGNAL \clk~combout\ : std_logic;
SIGNAL \clk~clkctrl_outclk\ : std_logic;
SIGNAL \GeneraBitParidad_i|bit_paridad~feeder_combout\ : std_logic;
SIGNAL \pulsador~combout\ : std_logic;
SIGNAL \DetectorFlanco_i|estado_act.Esp1~0_combout\ : std_logic;
SIGNAL \reset_n~combout\ : std_logic;
SIGNAL \reset_n~clkctrl_outclk\ : std_logic;
SIGNAL \DetectorFlanco_i|estado_act.Esp1~regout\ : std_logic;
SIGNAL \DetectorFlanco_i|Selector1~0_combout\ : std_logic;
SIGNAL \DetectorFlanco_i|estado_act.Pulso~regout\ : std_logic;
SIGNAL \CircuitoControl_i|Selector2~2_combout\ : std_logic;
SIGNAL \CircuitoControl_i|Selector2~0_combout\ : std_logic;
SIGNAL \CircuitoControl_i|Selector2~3_combout\ : std_logic;
SIGNAL \CircuitoControl_i|estado_actual.Registra~regout\ : std_logic;
SIGNAL \ContadorM10_i|contador[0]~3_combout\ : std_logic;
SIGNAL \CircuitoControl_i|Selector4~0_combout\ : std_logic;
SIGNAL \ContadorM10_i|contador[2]~1_combout\ : std_logic;
SIGNAL \ContadorM10_i|contador~0_combout\ : std_logic;
SIGNAL \ContadorM10_i|contador~2_combout\ : std_logic;
SIGNAL \ContadorM10_i|Equal0~0_combout\ : std_logic;
SIGNAL \ContadorM10_i|s~combout\ : std_logic;
SIGNAL \CircuitoControl_i|Selector0~2_combout\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~1\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~2_combout\ : std_logic;
SIGNAL \CircuitoControl_i|en_contador_un_bit~0_combout\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~3\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~5\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~6_combout\ : std_logic;
SIGNAL \TemporizadorUnBit_i|contador~3_combout\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~4_combout\ : std_logic;
SIGNAL \TemporizadorUnBit_i|contador~4_combout\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Equal0~2_combout\ : std_logic;
SIGNAL \TemporizadorUnBit_i|contador~2_combout\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~7\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~8_combout\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~9\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~11\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~12_combout\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Equal0~1_combout\ : std_logic;
SIGNAL \TemporizadorUnBit_i|contador~1_combout\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~13\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~15\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~16_combout\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~17\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~19\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~20_combout\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~21\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~22_combout\ : std_logic;
SIGNAL \TemporizadorUnBit_i|contador~0_combout\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Equal0~0_combout\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Equal0~3_combout\ : std_logic;
SIGNAL \CircuitoControl_i|Selector0~3_combout\ : std_logic;
SIGNAL \CircuitoControl_i|estado_actual.Reposo~regout\ : std_logic;
SIGNAL \CircuitoControl_i|Selector2~1_combout\ : std_logic;
SIGNAL \CircuitoControl_i|Selector1~0_combout\ : std_logic;
SIGNAL \CircuitoControl_i|Selector1~1_combout\ : std_logic;
SIGNAL \CircuitoControl_i|estado_actual.EnviaStart~regout\ : std_logic;
SIGNAL \RegParSer_i|registro~1_combout\ : std_logic;
SIGNAL \Mux3a1_i|Mux0~1_combout\ : std_logic;
SIGNAL \RegParSer_i|registro~0_combout\ : std_logic;
SIGNAL \CircuitoControl_i|estado_actual.Espera1Bit~regout\ : std_logic;
SIGNAL \Mux3a1_i|Mux0~0_combout\ : std_logic;
SIGNAL \RegParSer_i|registro\ : std_logic_vector(9 DOWNTO 0);
SIGNAL \TemporizadorUnBit_i|contador\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \ContadorM10_i|contador\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \e_p~combout\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_reset_n~clkctrl_outclk\ : std_logic;

BEGIN

ww_clk <= clk;
ww_reset_n <= reset_n;
ww_e_p <= e_p;
ww_pulsador <= pulsador;
s_s <= ww_s_s;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clk~combout\);

\reset_n~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \reset_n~combout\);
\ALT_INV_reset_n~clkctrl_outclk\ <= NOT \reset_n~clkctrl_outclk\;

-- Location: LCCOMB_X45_Y24_N6
\TemporizadorUnBit_i|Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorUnBit_i|Add0~0_combout\ = \TemporizadorUnBit_i|contador\(0) $ (VCC)
-- \TemporizadorUnBit_i|Add0~1\ = CARRY(\TemporizadorUnBit_i|contador\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TemporizadorUnBit_i|contador\(0),
	datad => VCC,
	combout => \TemporizadorUnBit_i|Add0~0_combout\,
	cout => \TemporizadorUnBit_i|Add0~1\);

-- Location: LCCOMB_X45_Y24_N16
\TemporizadorUnBit_i|Add0~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorUnBit_i|Add0~10_combout\ = (\TemporizadorUnBit_i|contador\(5) & (!\TemporizadorUnBit_i|Add0~9\)) # (!\TemporizadorUnBit_i|contador\(5) & ((\TemporizadorUnBit_i|Add0~9\) # (GND)))
-- \TemporizadorUnBit_i|Add0~11\ = CARRY((!\TemporizadorUnBit_i|Add0~9\) # (!\TemporizadorUnBit_i|contador\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \TemporizadorUnBit_i|contador\(5),
	datad => VCC,
	cin => \TemporizadorUnBit_i|Add0~9\,
	combout => \TemporizadorUnBit_i|Add0~10_combout\,
	cout => \TemporizadorUnBit_i|Add0~11\);

-- Location: LCCOMB_X45_Y24_N20
\TemporizadorUnBit_i|Add0~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorUnBit_i|Add0~14_combout\ = (\TemporizadorUnBit_i|contador\(7) & (!\TemporizadorUnBit_i|Add0~13\)) # (!\TemporizadorUnBit_i|contador\(7) & ((\TemporizadorUnBit_i|Add0~13\) # (GND)))
-- \TemporizadorUnBit_i|Add0~15\ = CARRY((!\TemporizadorUnBit_i|Add0~13\) # (!\TemporizadorUnBit_i|contador\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TemporizadorUnBit_i|contador\(7),
	datad => VCC,
	cin => \TemporizadorUnBit_i|Add0~13\,
	combout => \TemporizadorUnBit_i|Add0~14_combout\,
	cout => \TemporizadorUnBit_i|Add0~15\);

-- Location: LCCOMB_X45_Y24_N24
\TemporizadorUnBit_i|Add0~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorUnBit_i|Add0~18_combout\ = (\TemporizadorUnBit_i|contador\(9) & (!\TemporizadorUnBit_i|Add0~17\)) # (!\TemporizadorUnBit_i|contador\(9) & ((\TemporizadorUnBit_i|Add0~17\) # (GND)))
-- \TemporizadorUnBit_i|Add0~19\ = CARRY((!\TemporizadorUnBit_i|Add0~17\) # (!\TemporizadorUnBit_i|contador\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \TemporizadorUnBit_i|contador\(9),
	datad => VCC,
	cin => \TemporizadorUnBit_i|Add0~17\,
	combout => \TemporizadorUnBit_i|Add0~18_combout\,
	cout => \TemporizadorUnBit_i|Add0~19\);

-- Location: LCFF_X45_Y24_N21
\TemporizadorUnBit_i|contador[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \TemporizadorUnBit_i|Add0~14_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \CircuitoControl_i|en_contador_un_bit~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TemporizadorUnBit_i|contador\(7));

-- Location: LCFF_X44_Y24_N13
\TemporizadorUnBit_i|contador[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \TemporizadorUnBit_i|contador~5_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \CircuitoControl_i|en_contador_un_bit~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TemporizadorUnBit_i|contador\(0));

-- Location: LCFF_X47_Y24_N13
\RegParSer_i|registro[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \RegParSer_i|registro~2_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \Mux3a1_i|Mux0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \RegParSer_i|registro\(2));

-- Location: LCCOMB_X44_Y24_N12
\TemporizadorUnBit_i|contador~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorUnBit_i|contador~5_combout\ = (\TemporizadorUnBit_i|Add0~0_combout\ & (((!\TemporizadorUnBit_i|Equal0~1_combout\) # (!\TemporizadorUnBit_i|Equal0~0_combout\)) # (!\TemporizadorUnBit_i|Equal0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TemporizadorUnBit_i|Equal0~2_combout\,
	datab => \TemporizadorUnBit_i|Equal0~0_combout\,
	datac => \TemporizadorUnBit_i|Equal0~1_combout\,
	datad => \TemporizadorUnBit_i|Add0~0_combout\,
	combout => \TemporizadorUnBit_i|contador~5_combout\);

-- Location: LCFF_X47_Y24_N3
\RegParSer_i|registro[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \RegParSer_i|registro~3_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \Mux3a1_i|Mux0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \RegParSer_i|registro\(3));

-- Location: LCCOMB_X47_Y24_N12
\RegParSer_i|registro~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \RegParSer_i|registro~2_combout\ = (\CircuitoControl_i|estado_actual.EnviaStart~regout\ & ((\e_p~combout\(1)))) # (!\CircuitoControl_i|estado_actual.EnviaStart~regout\ & (\RegParSer_i|registro\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegParSer_i|registro\(3),
	datac => \e_p~combout\(1),
	datad => \CircuitoControl_i|estado_actual.EnviaStart~regout\,
	combout => \RegParSer_i|registro~2_combout\);

-- Location: LCFF_X47_Y24_N5
\RegParSer_i|registro[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \RegParSer_i|registro~4_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \Mux3a1_i|Mux0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \RegParSer_i|registro\(4));

-- Location: LCCOMB_X47_Y24_N2
\RegParSer_i|registro~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \RegParSer_i|registro~3_combout\ = (\CircuitoControl_i|estado_actual.EnviaStart~regout\ & ((\e_p~combout\(2)))) # (!\CircuitoControl_i|estado_actual.EnviaStart~regout\ & (\RegParSer_i|registro\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CircuitoControl_i|estado_actual.EnviaStart~regout\,
	datac => \RegParSer_i|registro\(4),
	datad => \e_p~combout\(2),
	combout => \RegParSer_i|registro~3_combout\);

-- Location: LCFF_X47_Y24_N19
\RegParSer_i|registro[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \RegParSer_i|registro~5_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \Mux3a1_i|Mux0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \RegParSer_i|registro\(5));

-- Location: LCCOMB_X47_Y24_N4
\RegParSer_i|registro~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \RegParSer_i|registro~4_combout\ = (\CircuitoControl_i|estado_actual.EnviaStart~regout\ & (\e_p~combout\(3))) # (!\CircuitoControl_i|estado_actual.EnviaStart~regout\ & ((\RegParSer_i|registro\(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CircuitoControl_i|estado_actual.EnviaStart~regout\,
	datac => \e_p~combout\(3),
	datad => \RegParSer_i|registro\(5),
	combout => \RegParSer_i|registro~4_combout\);

-- Location: LCFF_X47_Y24_N29
\RegParSer_i|registro[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \RegParSer_i|registro~6_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \Mux3a1_i|Mux0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \RegParSer_i|registro\(6));

-- Location: LCCOMB_X47_Y24_N18
\RegParSer_i|registro~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \RegParSer_i|registro~5_combout\ = (\CircuitoControl_i|estado_actual.EnviaStart~regout\ & ((\e_p~combout\(4)))) # (!\CircuitoControl_i|estado_actual.EnviaStart~regout\ & (\RegParSer_i|registro\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \RegParSer_i|registro\(6),
	datac => \e_p~combout\(4),
	datad => \CircuitoControl_i|estado_actual.EnviaStart~regout\,
	combout => \RegParSer_i|registro~5_combout\);

-- Location: LCFF_X47_Y24_N15
\RegParSer_i|registro[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \RegParSer_i|registro~7_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \Mux3a1_i|Mux0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \RegParSer_i|registro\(7));

-- Location: LCCOMB_X47_Y24_N28
\RegParSer_i|registro~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \RegParSer_i|registro~6_combout\ = (\CircuitoControl_i|estado_actual.EnviaStart~regout\ & (\e_p~combout\(5))) # (!\CircuitoControl_i|estado_actual.EnviaStart~regout\ & ((\RegParSer_i|registro\(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CircuitoControl_i|estado_actual.EnviaStart~regout\,
	datac => \e_p~combout\(5),
	datad => \RegParSer_i|registro\(7),
	combout => \RegParSer_i|registro~6_combout\);

-- Location: LCFF_X47_Y24_N25
\RegParSer_i|registro[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \RegParSer_i|registro~8_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \Mux3a1_i|Mux0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \RegParSer_i|registro\(8));

-- Location: LCCOMB_X47_Y24_N14
\RegParSer_i|registro~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \RegParSer_i|registro~7_combout\ = (\CircuitoControl_i|estado_actual.EnviaStart~regout\ & ((\e_p~combout\(6)))) # (!\CircuitoControl_i|estado_actual.EnviaStart~regout\ & (\RegParSer_i|registro\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CircuitoControl_i|estado_actual.EnviaStart~regout\,
	datac => \RegParSer_i|registro\(8),
	datad => \e_p~combout\(6),
	combout => \RegParSer_i|registro~7_combout\);

-- Location: LCFF_X47_Y24_N27
\RegParSer_i|registro[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \RegParSer_i|registro~9_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \Mux3a1_i|Mux0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \RegParSer_i|registro\(9));

-- Location: LCCOMB_X47_Y24_N24
\RegParSer_i|registro~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \RegParSer_i|registro~8_combout\ = (\CircuitoControl_i|estado_actual.EnviaStart~regout\ & (\e_p~combout\(7))) # (!\CircuitoControl_i|estado_actual.EnviaStart~regout\ & ((\RegParSer_i|registro\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \e_p~combout\(7),
	datab => \CircuitoControl_i|estado_actual.EnviaStart~regout\,
	datad => \RegParSer_i|registro\(9),
	combout => \RegParSer_i|registro~8_combout\);

-- Location: LCFF_X48_Y24_N31
\GeneraBitParidad_i|bit_paridad\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GeneraBitParidad_i|bit_paridad~feeder_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GeneraBitParidad_i|bit_paridad~regout\);

-- Location: LCCOMB_X47_Y24_N26
\RegParSer_i|registro~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \RegParSer_i|registro~9_combout\ = (\CircuitoControl_i|estado_actual.EnviaStart~regout\ & !\GeneraBitParidad_i|bit_paridad~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CircuitoControl_i|estado_actual.EnviaStart~regout\,
	datad => \GeneraBitParidad_i|bit_paridad~regout\,
	combout => \RegParSer_i|registro~9_combout\);

-- Location: LCFF_X48_Y24_N1
\GeneraBitParidad_i|paridad\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \GeneraBitParidad_i|paridad~2_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \CircuitoControl_i|estado_actual.EnviaStart~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \GeneraBitParidad_i|paridad~regout\);

-- Location: LCCOMB_X47_Y24_N16
\GeneraBitParidad_i|paridad~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \GeneraBitParidad_i|paridad~0_combout\ = \e_p~combout\(3) $ (\e_p~combout\(0) $ (\e_p~combout\(1) $ (\e_p~combout\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \e_p~combout\(3),
	datab => \e_p~combout\(0),
	datac => \e_p~combout\(1),
	datad => \e_p~combout\(2),
	combout => \GeneraBitParidad_i|paridad~0_combout\);

-- Location: LCCOMB_X47_Y24_N30
\GeneraBitParidad_i|paridad~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \GeneraBitParidad_i|paridad~1_combout\ = \e_p~combout\(7) $ (\e_p~combout\(4) $ (\e_p~combout\(5) $ (\e_p~combout\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \e_p~combout\(7),
	datab => \e_p~combout\(4),
	datac => \e_p~combout\(5),
	datad => \e_p~combout\(6),
	combout => \GeneraBitParidad_i|paridad~1_combout\);

-- Location: LCCOMB_X48_Y24_N0
\GeneraBitParidad_i|paridad~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \GeneraBitParidad_i|paridad~2_combout\ = \GeneraBitParidad_i|paridad~1_combout\ $ (\GeneraBitParidad_i|paridad~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \GeneraBitParidad_i|paridad~1_combout\,
	datad => \GeneraBitParidad_i|paridad~0_combout\,
	combout => \GeneraBitParidad_i|paridad~2_combout\);

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

-- Location: PIN_A18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\e_p[1]~I\ : cycloneii_io
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
	padio => ww_e_p(1),
	combout => \e_p~combout\(1));

-- Location: PIN_A20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\e_p[2]~I\ : cycloneii_io
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
	padio => ww_e_p(2),
	combout => \e_p~combout\(2));

-- Location: PIN_A19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\e_p[3]~I\ : cycloneii_io
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
	padio => ww_e_p(3),
	combout => \e_p~combout\(3));

-- Location: PIN_C18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\e_p[4]~I\ : cycloneii_io
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
	padio => ww_e_p(4),
	combout => \e_p~combout\(4));

-- Location: PIN_B18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\e_p[5]~I\ : cycloneii_io
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
	padio => ww_e_p(5),
	combout => \e_p~combout\(5));

-- Location: PIN_C21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\e_p[6]~I\ : cycloneii_io
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
	padio => ww_e_p(6),
	combout => \e_p~combout\(6));

-- Location: PIN_C22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\e_p[7]~I\ : cycloneii_io
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
	padio => ww_e_p(7),
	combout => \e_p~combout\(7));

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

-- Location: LCCOMB_X48_Y24_N30
\GeneraBitParidad_i|bit_paridad~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \GeneraBitParidad_i|bit_paridad~feeder_combout\ = \GeneraBitParidad_i|paridad~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \GeneraBitParidad_i|paridad~regout\,
	combout => \GeneraBitParidad_i|bit_paridad~feeder_combout\);

-- Location: PIN_C19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\pulsador~I\ : cycloneii_io
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
	padio => ww_pulsador,
	combout => \pulsador~combout\);

-- Location: LCCOMB_X48_Y24_N8
\DetectorFlanco_i|estado_act.Esp1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \DetectorFlanco_i|estado_act.Esp1~0_combout\ = !\pulsador~combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \pulsador~combout\,
	combout => \DetectorFlanco_i|estado_act.Esp1~0_combout\);

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

-- Location: LCFF_X48_Y24_N9
\DetectorFlanco_i|estado_act.Esp1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \DetectorFlanco_i|estado_act.Esp1~0_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DetectorFlanco_i|estado_act.Esp1~regout\);

-- Location: LCCOMB_X46_Y24_N22
\DetectorFlanco_i|Selector1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \DetectorFlanco_i|Selector1~0_combout\ = (!\DetectorFlanco_i|estado_act.Esp1~regout\ & !\pulsador~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \DetectorFlanco_i|estado_act.Esp1~regout\,
	datad => \pulsador~combout\,
	combout => \DetectorFlanco_i|Selector1~0_combout\);

-- Location: LCFF_X46_Y24_N23
\DetectorFlanco_i|estado_act.Pulso\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \DetectorFlanco_i|Selector1~0_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DetectorFlanco_i|estado_act.Pulso~regout\);

-- Location: LCCOMB_X46_Y24_N4
\CircuitoControl_i|Selector2~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CircuitoControl_i|Selector2~2_combout\ = (\CircuitoControl_i|estado_actual.Reposo~regout\ & (!\CircuitoControl_i|estado_actual.Espera1Bit~regout\ & (!\CircuitoControl_i|estado_actual.EnviaStart~regout\))) # 
-- (!\CircuitoControl_i|estado_actual.Reposo~regout\ & (((!\DetectorFlanco_i|estado_act.Pulso~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000011111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CircuitoControl_i|estado_actual.Espera1Bit~regout\,
	datab => \CircuitoControl_i|estado_actual.EnviaStart~regout\,
	datac => \CircuitoControl_i|estado_actual.Reposo~regout\,
	datad => \DetectorFlanco_i|estado_act.Pulso~regout\,
	combout => \CircuitoControl_i|Selector2~2_combout\);

-- Location: LCCOMB_X46_Y24_N16
\CircuitoControl_i|Selector2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CircuitoControl_i|Selector2~0_combout\ = (!\CircuitoControl_i|estado_actual.Reposo~regout\ & \DetectorFlanco_i|estado_act.Pulso~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CircuitoControl_i|estado_actual.Reposo~regout\,
	datad => \DetectorFlanco_i|estado_act.Pulso~regout\,
	combout => \CircuitoControl_i|Selector2~0_combout\);

-- Location: LCCOMB_X46_Y24_N14
\CircuitoControl_i|Selector2~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \CircuitoControl_i|Selector2~3_combout\ = (!\CircuitoControl_i|Selector2~1_combout\ & (!\CircuitoControl_i|Selector2~2_combout\ & (!\CircuitoControl_i|estado_actual.Registra~regout\ & !\CircuitoControl_i|Selector2~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CircuitoControl_i|Selector2~1_combout\,
	datab => \CircuitoControl_i|Selector2~2_combout\,
	datac => \CircuitoControl_i|estado_actual.Registra~regout\,
	datad => \CircuitoControl_i|Selector2~0_combout\,
	combout => \CircuitoControl_i|Selector2~3_combout\);

-- Location: LCFF_X46_Y24_N15
\CircuitoControl_i|estado_actual.Registra\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CircuitoControl_i|Selector2~3_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CircuitoControl_i|estado_actual.Registra~regout\);

-- Location: LCCOMB_X47_Y24_N6
\ContadorM10_i|contador[0]~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \ContadorM10_i|contador[0]~3_combout\ = !\ContadorM10_i|contador\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ContadorM10_i|contador\(0),
	combout => \ContadorM10_i|contador[0]~3_combout\);

-- Location: LCCOMB_X46_Y24_N20
\CircuitoControl_i|Selector4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CircuitoControl_i|Selector4~0_combout\ = (\CircuitoControl_i|estado_actual.Registra~regout\ & !\ContadorM10_i|s~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CircuitoControl_i|estado_actual.Registra~regout\,
	datad => \ContadorM10_i|s~combout\,
	combout => \CircuitoControl_i|Selector4~0_combout\);

-- Location: LCFF_X47_Y24_N7
\ContadorM10_i|contador[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \ContadorM10_i|contador[0]~3_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \CircuitoControl_i|Selector4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ContadorM10_i|contador\(0));

-- Location: LCCOMB_X46_Y24_N10
\ContadorM10_i|contador[2]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \ContadorM10_i|contador[2]~1_combout\ = \ContadorM10_i|contador\(2) $ (((\CircuitoControl_i|Selector4~0_combout\ & (\ContadorM10_i|contador\(1) & \ContadorM10_i|contador\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CircuitoControl_i|Selector4~0_combout\,
	datab => \ContadorM10_i|contador\(1),
	datac => \ContadorM10_i|contador\(2),
	datad => \ContadorM10_i|contador\(0),
	combout => \ContadorM10_i|contador[2]~1_combout\);

-- Location: LCFF_X46_Y24_N11
\ContadorM10_i|contador[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \ContadorM10_i|contador[2]~1_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ContadorM10_i|contador\(2));

-- Location: LCCOMB_X47_Y24_N8
\ContadorM10_i|contador~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ContadorM10_i|contador~0_combout\ = (\ContadorM10_i|contador\(0) & ((\ContadorM10_i|contador\(1) & (\ContadorM10_i|contador\(3) $ (\ContadorM10_i|contador\(2)))) # (!\ContadorM10_i|contador\(1) & (\ContadorM10_i|contador\(3) & 
-- \ContadorM10_i|contador\(2))))) # (!\ContadorM10_i|contador\(0) & (((\ContadorM10_i|contador\(3)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ContadorM10_i|contador\(0),
	datab => \ContadorM10_i|contador\(1),
	datac => \ContadorM10_i|contador\(3),
	datad => \ContadorM10_i|contador\(2),
	combout => \ContadorM10_i|contador~0_combout\);

-- Location: LCFF_X47_Y24_N9
\ContadorM10_i|contador[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \ContadorM10_i|contador~0_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \CircuitoControl_i|Selector4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ContadorM10_i|contador\(3));

-- Location: LCCOMB_X47_Y24_N22
\ContadorM10_i|contador~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \ContadorM10_i|contador~2_combout\ = (\ContadorM10_i|contador\(0) & (!\ContadorM10_i|contador\(1) & ((\ContadorM10_i|contador\(2)) # (!\ContadorM10_i|contador\(3))))) # (!\ContadorM10_i|contador\(0) & (((\ContadorM10_i|contador\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ContadorM10_i|contador\(0),
	datab => \ContadorM10_i|contador\(3),
	datac => \ContadorM10_i|contador\(1),
	datad => \ContadorM10_i|contador\(2),
	combout => \ContadorM10_i|contador~2_combout\);

-- Location: LCFF_X47_Y24_N23
\ContadorM10_i|contador[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \ContadorM10_i|contador~2_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \CircuitoControl_i|Selector4~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ContadorM10_i|contador\(1));

-- Location: LCCOMB_X46_Y24_N28
\ContadorM10_i|Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ContadorM10_i|Equal0~0_combout\ = (!\ContadorM10_i|contador\(2) & (!\ContadorM10_i|contador\(1) & (\ContadorM10_i|contador\(3) & \ContadorM10_i|contador\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ContadorM10_i|contador\(2),
	datab => \ContadorM10_i|contador\(1),
	datac => \ContadorM10_i|contador\(3),
	datad => \ContadorM10_i|contador\(0),
	combout => \ContadorM10_i|Equal0~0_combout\);

-- Location: LCCOMB_X46_Y24_N6
\ContadorM10_i|s\ : cycloneii_lcell_comb
-- Equation(s):
-- \ContadorM10_i|s~combout\ = (!\ContadorM10_i|s~combout\ & (\CircuitoControl_i|estado_actual.Registra~regout\ & \ContadorM10_i|Equal0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ContadorM10_i|s~combout\,
	datac => \CircuitoControl_i|estado_actual.Registra~regout\,
	datad => \ContadorM10_i|Equal0~0_combout\,
	combout => \ContadorM10_i|s~combout\);

-- Location: LCCOMB_X46_Y24_N24
\CircuitoControl_i|Selector0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \CircuitoControl_i|Selector0~2_combout\ = (!\ContadorM10_i|s~combout\) # (!\CircuitoControl_i|estado_actual.Registra~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CircuitoControl_i|estado_actual.Registra~regout\,
	datad => \ContadorM10_i|s~combout\,
	combout => \CircuitoControl_i|Selector0~2_combout\);

-- Location: LCCOMB_X45_Y24_N8
\TemporizadorUnBit_i|Add0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorUnBit_i|Add0~2_combout\ = (\TemporizadorUnBit_i|contador\(1) & (!\TemporizadorUnBit_i|Add0~1\)) # (!\TemporizadorUnBit_i|contador\(1) & ((\TemporizadorUnBit_i|Add0~1\) # (GND)))
-- \TemporizadorUnBit_i|Add0~3\ = CARRY((!\TemporizadorUnBit_i|Add0~1\) # (!\TemporizadorUnBit_i|contador\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \TemporizadorUnBit_i|contador\(1),
	datad => VCC,
	cin => \TemporizadorUnBit_i|Add0~1\,
	combout => \TemporizadorUnBit_i|Add0~2_combout\,
	cout => \TemporizadorUnBit_i|Add0~3\);

-- Location: LCCOMB_X44_Y24_N0
\CircuitoControl_i|en_contador_un_bit~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CircuitoControl_i|en_contador_un_bit~0_combout\ = (!\CircuitoControl_i|estado_actual.Registra~regout\ & \CircuitoControl_i|estado_actual.Reposo~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \CircuitoControl_i|estado_actual.Registra~regout\,
	datad => \CircuitoControl_i|estado_actual.Reposo~regout\,
	combout => \CircuitoControl_i|en_contador_un_bit~0_combout\);

-- Location: LCFF_X45_Y24_N9
\TemporizadorUnBit_i|contador[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \TemporizadorUnBit_i|Add0~2_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \CircuitoControl_i|en_contador_un_bit~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TemporizadorUnBit_i|contador\(1));

-- Location: LCCOMB_X45_Y24_N10
\TemporizadorUnBit_i|Add0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorUnBit_i|Add0~4_combout\ = (\TemporizadorUnBit_i|contador\(2) & (\TemporizadorUnBit_i|Add0~3\ $ (GND))) # (!\TemporizadorUnBit_i|contador\(2) & (!\TemporizadorUnBit_i|Add0~3\ & VCC))
-- \TemporizadorUnBit_i|Add0~5\ = CARRY((\TemporizadorUnBit_i|contador\(2) & !\TemporizadorUnBit_i|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TemporizadorUnBit_i|contador\(2),
	datad => VCC,
	cin => \TemporizadorUnBit_i|Add0~3\,
	combout => \TemporizadorUnBit_i|Add0~4_combout\,
	cout => \TemporizadorUnBit_i|Add0~5\);

-- Location: LCCOMB_X45_Y24_N12
\TemporizadorUnBit_i|Add0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorUnBit_i|Add0~6_combout\ = (\TemporizadorUnBit_i|contador\(3) & (!\TemporizadorUnBit_i|Add0~5\)) # (!\TemporizadorUnBit_i|contador\(3) & ((\TemporizadorUnBit_i|Add0~5\) # (GND)))
-- \TemporizadorUnBit_i|Add0~7\ = CARRY((!\TemporizadorUnBit_i|Add0~5\) # (!\TemporizadorUnBit_i|contador\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \TemporizadorUnBit_i|contador\(3),
	datad => VCC,
	cin => \TemporizadorUnBit_i|Add0~5\,
	combout => \TemporizadorUnBit_i|Add0~6_combout\,
	cout => \TemporizadorUnBit_i|Add0~7\);

-- Location: LCCOMB_X44_Y24_N28
\TemporizadorUnBit_i|contador~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorUnBit_i|contador~3_combout\ = (\TemporizadorUnBit_i|Add0~6_combout\ & (((!\TemporizadorUnBit_i|Equal0~2_combout\) # (!\TemporizadorUnBit_i|Equal0~1_combout\)) # (!\TemporizadorUnBit_i|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TemporizadorUnBit_i|Equal0~0_combout\,
	datab => \TemporizadorUnBit_i|Equal0~1_combout\,
	datac => \TemporizadorUnBit_i|Add0~6_combout\,
	datad => \TemporizadorUnBit_i|Equal0~2_combout\,
	combout => \TemporizadorUnBit_i|contador~3_combout\);

-- Location: LCFF_X44_Y24_N29
\TemporizadorUnBit_i|contador[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \TemporizadorUnBit_i|contador~3_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \CircuitoControl_i|en_contador_un_bit~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TemporizadorUnBit_i|contador\(3));

-- Location: LCCOMB_X44_Y24_N30
\TemporizadorUnBit_i|contador~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorUnBit_i|contador~4_combout\ = (\TemporizadorUnBit_i|Add0~4_combout\ & (((!\TemporizadorUnBit_i|Equal0~2_combout\) # (!\TemporizadorUnBit_i|Equal0~1_combout\)) # (!\TemporizadorUnBit_i|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TemporizadorUnBit_i|Equal0~0_combout\,
	datab => \TemporizadorUnBit_i|Equal0~1_combout\,
	datac => \TemporizadorUnBit_i|Add0~4_combout\,
	datad => \TemporizadorUnBit_i|Equal0~2_combout\,
	combout => \TemporizadorUnBit_i|contador~4_combout\);

-- Location: LCFF_X44_Y24_N31
\TemporizadorUnBit_i|contador[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \TemporizadorUnBit_i|contador~4_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \CircuitoControl_i|en_contador_un_bit~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TemporizadorUnBit_i|contador\(2));

-- Location: LCCOMB_X44_Y24_N6
\TemporizadorUnBit_i|Equal0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorUnBit_i|Equal0~2_combout\ = (!\TemporizadorUnBit_i|contador\(0) & (\TemporizadorUnBit_i|contador\(3) & (!\TemporizadorUnBit_i|contador\(1) & \TemporizadorUnBit_i|contador\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TemporizadorUnBit_i|contador\(0),
	datab => \TemporizadorUnBit_i|contador\(3),
	datac => \TemporizadorUnBit_i|contador\(1),
	datad => \TemporizadorUnBit_i|contador\(2),
	combout => \TemporizadorUnBit_i|Equal0~2_combout\);

-- Location: LCCOMB_X45_Y24_N4
\TemporizadorUnBit_i|contador~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorUnBit_i|contador~2_combout\ = (\TemporizadorUnBit_i|Add0~10_combout\ & (((!\TemporizadorUnBit_i|Equal0~0_combout\) # (!\TemporizadorUnBit_i|Equal0~2_combout\)) # (!\TemporizadorUnBit_i|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TemporizadorUnBit_i|Add0~10_combout\,
	datab => \TemporizadorUnBit_i|Equal0~1_combout\,
	datac => \TemporizadorUnBit_i|Equal0~2_combout\,
	datad => \TemporizadorUnBit_i|Equal0~0_combout\,
	combout => \TemporizadorUnBit_i|contador~2_combout\);

-- Location: LCFF_X45_Y24_N5
\TemporizadorUnBit_i|contador[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \TemporizadorUnBit_i|contador~2_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \CircuitoControl_i|en_contador_un_bit~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TemporizadorUnBit_i|contador\(5));

-- Location: LCCOMB_X45_Y24_N14
\TemporizadorUnBit_i|Add0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorUnBit_i|Add0~8_combout\ = (\TemporizadorUnBit_i|contador\(4) & (\TemporizadorUnBit_i|Add0~7\ $ (GND))) # (!\TemporizadorUnBit_i|contador\(4) & (!\TemporizadorUnBit_i|Add0~7\ & VCC))
-- \TemporizadorUnBit_i|Add0~9\ = CARRY((\TemporizadorUnBit_i|contador\(4) & !\TemporizadorUnBit_i|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \TemporizadorUnBit_i|contador\(4),
	datad => VCC,
	cin => \TemporizadorUnBit_i|Add0~7\,
	combout => \TemporizadorUnBit_i|Add0~8_combout\,
	cout => \TemporizadorUnBit_i|Add0~9\);

-- Location: LCFF_X45_Y24_N15
\TemporizadorUnBit_i|contador[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \TemporizadorUnBit_i|Add0~8_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \CircuitoControl_i|en_contador_un_bit~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TemporizadorUnBit_i|contador\(4));

-- Location: LCCOMB_X45_Y24_N18
\TemporizadorUnBit_i|Add0~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorUnBit_i|Add0~12_combout\ = (\TemporizadorUnBit_i|contador\(6) & (\TemporizadorUnBit_i|Add0~11\ $ (GND))) # (!\TemporizadorUnBit_i|contador\(6) & (!\TemporizadorUnBit_i|Add0~11\ & VCC))
-- \TemporizadorUnBit_i|Add0~13\ = CARRY((\TemporizadorUnBit_i|contador\(6) & !\TemporizadorUnBit_i|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \TemporizadorUnBit_i|contador\(6),
	datad => VCC,
	cin => \TemporizadorUnBit_i|Add0~11\,
	combout => \TemporizadorUnBit_i|Add0~12_combout\,
	cout => \TemporizadorUnBit_i|Add0~13\);

-- Location: LCFF_X45_Y24_N19
\TemporizadorUnBit_i|contador[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \TemporizadorUnBit_i|Add0~12_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \CircuitoControl_i|en_contador_un_bit~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TemporizadorUnBit_i|contador\(6));

-- Location: LCCOMB_X46_Y24_N8
\TemporizadorUnBit_i|Equal0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorUnBit_i|Equal0~1_combout\ = (!\TemporizadorUnBit_i|contador\(7) & (!\TemporizadorUnBit_i|contador\(6) & (\TemporizadorUnBit_i|contador\(5) & !\TemporizadorUnBit_i|contador\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TemporizadorUnBit_i|contador\(7),
	datab => \TemporizadorUnBit_i|contador\(6),
	datac => \TemporizadorUnBit_i|contador\(5),
	datad => \TemporizadorUnBit_i|contador\(4),
	combout => \TemporizadorUnBit_i|Equal0~1_combout\);

-- Location: LCCOMB_X45_Y24_N30
\TemporizadorUnBit_i|contador~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorUnBit_i|contador~1_combout\ = (\TemporizadorUnBit_i|Add0~18_combout\ & (((!\TemporizadorUnBit_i|Equal0~0_combout\) # (!\TemporizadorUnBit_i|Equal0~2_combout\)) # (!\TemporizadorUnBit_i|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TemporizadorUnBit_i|Add0~18_combout\,
	datab => \TemporizadorUnBit_i|Equal0~1_combout\,
	datac => \TemporizadorUnBit_i|Equal0~2_combout\,
	datad => \TemporizadorUnBit_i|Equal0~0_combout\,
	combout => \TemporizadorUnBit_i|contador~1_combout\);

-- Location: LCFF_X45_Y24_N31
\TemporizadorUnBit_i|contador[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \TemporizadorUnBit_i|contador~1_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \CircuitoControl_i|en_contador_un_bit~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TemporizadorUnBit_i|contador\(9));

-- Location: LCCOMB_X45_Y24_N22
\TemporizadorUnBit_i|Add0~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorUnBit_i|Add0~16_combout\ = (\TemporizadorUnBit_i|contador\(8) & (\TemporizadorUnBit_i|Add0~15\ $ (GND))) # (!\TemporizadorUnBit_i|contador\(8) & (!\TemporizadorUnBit_i|Add0~15\ & VCC))
-- \TemporizadorUnBit_i|Add0~17\ = CARRY((\TemporizadorUnBit_i|contador\(8) & !\TemporizadorUnBit_i|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \TemporizadorUnBit_i|contador\(8),
	datad => VCC,
	cin => \TemporizadorUnBit_i|Add0~15\,
	combout => \TemporizadorUnBit_i|Add0~16_combout\,
	cout => \TemporizadorUnBit_i|Add0~17\);

-- Location: LCFF_X45_Y24_N23
\TemporizadorUnBit_i|contador[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \TemporizadorUnBit_i|Add0~16_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \CircuitoControl_i|en_contador_un_bit~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TemporizadorUnBit_i|contador\(8));

-- Location: LCCOMB_X45_Y24_N26
\TemporizadorUnBit_i|Add0~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorUnBit_i|Add0~20_combout\ = (\TemporizadorUnBit_i|contador\(10) & (\TemporizadorUnBit_i|Add0~19\ $ (GND))) # (!\TemporizadorUnBit_i|contador\(10) & (!\TemporizadorUnBit_i|Add0~19\ & VCC))
-- \TemporizadorUnBit_i|Add0~21\ = CARRY((\TemporizadorUnBit_i|contador\(10) & !\TemporizadorUnBit_i|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \TemporizadorUnBit_i|contador\(10),
	datad => VCC,
	cin => \TemporizadorUnBit_i|Add0~19\,
	combout => \TemporizadorUnBit_i|Add0~20_combout\,
	cout => \TemporizadorUnBit_i|Add0~21\);

-- Location: LCFF_X45_Y24_N27
\TemporizadorUnBit_i|contador[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \TemporizadorUnBit_i|Add0~20_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \CircuitoControl_i|en_contador_un_bit~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TemporizadorUnBit_i|contador\(10));

-- Location: LCCOMB_X45_Y24_N28
\TemporizadorUnBit_i|Add0~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorUnBit_i|Add0~22_combout\ = \TemporizadorUnBit_i|Add0~21\ $ (\TemporizadorUnBit_i|contador\(11))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \TemporizadorUnBit_i|contador\(11),
	cin => \TemporizadorUnBit_i|Add0~21\,
	combout => \TemporizadorUnBit_i|Add0~22_combout\);

-- Location: LCCOMB_X45_Y24_N0
\TemporizadorUnBit_i|contador~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorUnBit_i|contador~0_combout\ = (\TemporizadorUnBit_i|Add0~22_combout\ & (((!\TemporizadorUnBit_i|Equal0~2_combout\) # (!\TemporizadorUnBit_i|Equal0~0_combout\)) # (!\TemporizadorUnBit_i|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TemporizadorUnBit_i|Equal0~1_combout\,
	datab => \TemporizadorUnBit_i|Equal0~0_combout\,
	datac => \TemporizadorUnBit_i|Equal0~2_combout\,
	datad => \TemporizadorUnBit_i|Add0~22_combout\,
	combout => \TemporizadorUnBit_i|contador~0_combout\);

-- Location: LCFF_X45_Y24_N1
\TemporizadorUnBit_i|contador[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \TemporizadorUnBit_i|contador~0_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \CircuitoControl_i|en_contador_un_bit~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TemporizadorUnBit_i|contador\(11));

-- Location: LCCOMB_X46_Y24_N30
\TemporizadorUnBit_i|Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorUnBit_i|Equal0~0_combout\ = (\TemporizadorUnBit_i|contador\(9) & (!\TemporizadorUnBit_i|contador\(10) & (\TemporizadorUnBit_i|contador\(11) & !\TemporizadorUnBit_i|contador\(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TemporizadorUnBit_i|contador\(9),
	datab => \TemporizadorUnBit_i|contador\(10),
	datac => \TemporizadorUnBit_i|contador\(11),
	datad => \TemporizadorUnBit_i|contador\(8),
	combout => \TemporizadorUnBit_i|Equal0~0_combout\);

-- Location: LCCOMB_X46_Y24_N2
\TemporizadorUnBit_i|Equal0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorUnBit_i|Equal0~3_combout\ = (\TemporizadorUnBit_i|Equal0~0_combout\ & (\TemporizadorUnBit_i|Equal0~1_combout\ & \TemporizadorUnBit_i|Equal0~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \TemporizadorUnBit_i|Equal0~0_combout\,
	datac => \TemporizadorUnBit_i|Equal0~1_combout\,
	datad => \TemporizadorUnBit_i|Equal0~2_combout\,
	combout => \TemporizadorUnBit_i|Equal0~3_combout\);

-- Location: LCCOMB_X46_Y24_N0
\CircuitoControl_i|Selector0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \CircuitoControl_i|Selector0~3_combout\ = (\CircuitoControl_i|estado_actual.Registra~regout\) # ((\CircuitoControl_i|estado_actual.Reposo~regout\ & ((\TemporizadorUnBit_i|Equal0~3_combout\))) # (!\CircuitoControl_i|estado_actual.Reposo~regout\ & 
-- (\DetectorFlanco_i|estado_act.Pulso~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DetectorFlanco_i|estado_act.Pulso~regout\,
	datab => \CircuitoControl_i|estado_actual.Registra~regout\,
	datac => \CircuitoControl_i|estado_actual.Reposo~regout\,
	datad => \TemporizadorUnBit_i|Equal0~3_combout\,
	combout => \CircuitoControl_i|Selector0~3_combout\);

-- Location: LCFF_X46_Y24_N25
\CircuitoControl_i|estado_actual.Reposo\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CircuitoControl_i|Selector0~2_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \CircuitoControl_i|Selector0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CircuitoControl_i|estado_actual.Reposo~regout\);

-- Location: LCCOMB_X45_Y24_N2
\CircuitoControl_i|Selector2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CircuitoControl_i|Selector2~1_combout\ = (\CircuitoControl_i|estado_actual.Reposo~regout\ & (((!\TemporizadorUnBit_i|Equal0~0_combout\) # (!\TemporizadorUnBit_i|Equal0~1_combout\)) # (!\TemporizadorUnBit_i|Equal0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CircuitoControl_i|estado_actual.Reposo~regout\,
	datab => \TemporizadorUnBit_i|Equal0~2_combout\,
	datac => \TemporizadorUnBit_i|Equal0~1_combout\,
	datad => \TemporizadorUnBit_i|Equal0~0_combout\,
	combout => \CircuitoControl_i|Selector2~1_combout\);

-- Location: LCCOMB_X46_Y24_N18
\CircuitoControl_i|Selector1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \CircuitoControl_i|Selector1~0_combout\ = (\CircuitoControl_i|estado_actual.EnviaStart~regout\ & ((\CircuitoControl_i|Selector2~2_combout\) # (\CircuitoControl_i|Selector2~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CircuitoControl_i|estado_actual.EnviaStart~regout\,
	datac => \CircuitoControl_i|Selector2~2_combout\,
	datad => \CircuitoControl_i|Selector2~1_combout\,
	combout => \CircuitoControl_i|Selector1~0_combout\);

-- Location: LCCOMB_X46_Y24_N26
\CircuitoControl_i|Selector1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \CircuitoControl_i|Selector1~1_combout\ = (!\CircuitoControl_i|estado_actual.Registra~regout\ & ((\CircuitoControl_i|Selector1~0_combout\) # ((\DetectorFlanco_i|estado_act.Pulso~regout\ & !\CircuitoControl_i|estado_actual.Reposo~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \CircuitoControl_i|estado_actual.Registra~regout\,
	datab => \DetectorFlanco_i|estado_act.Pulso~regout\,
	datac => \CircuitoControl_i|estado_actual.Reposo~regout\,
	datad => \CircuitoControl_i|Selector1~0_combout\,
	combout => \CircuitoControl_i|Selector1~1_combout\);

-- Location: LCFF_X46_Y24_N27
\CircuitoControl_i|estado_actual.EnviaStart\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \CircuitoControl_i|Selector1~1_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CircuitoControl_i|estado_actual.EnviaStart~regout\);

-- Location: PIN_B20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\e_p[0]~I\ : cycloneii_io
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
	padio => ww_e_p(0),
	combout => \e_p~combout\(0));

-- Location: LCCOMB_X47_Y24_N0
\RegParSer_i|registro~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \RegParSer_i|registro~1_combout\ = (\CircuitoControl_i|estado_actual.EnviaStart~regout\ & ((\e_p~combout\(0)))) # (!\CircuitoControl_i|estado_actual.EnviaStart~regout\ & (\RegParSer_i|registro\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegParSer_i|registro\(2),
	datab => \CircuitoControl_i|estado_actual.EnviaStart~regout\,
	datad => \e_p~combout\(0),
	combout => \RegParSer_i|registro~1_combout\);

-- Location: LCCOMB_X46_Y24_N12
\Mux3a1_i|Mux0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux3a1_i|Mux0~1_combout\ = (\CircuitoControl_i|estado_actual.EnviaStart~regout\) # ((\CircuitoControl_i|estado_actual.Registra~regout\ & !\ContadorM10_i|s~combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CircuitoControl_i|estado_actual.EnviaStart~regout\,
	datac => \CircuitoControl_i|estado_actual.Registra~regout\,
	datad => \ContadorM10_i|s~combout\,
	combout => \Mux3a1_i|Mux0~1_combout\);

-- Location: LCFF_X47_Y24_N1
\RegParSer_i|registro[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \RegParSer_i|registro~1_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \Mux3a1_i|Mux0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \RegParSer_i|registro\(1));

-- Location: LCCOMB_X47_Y24_N20
\RegParSer_i|registro~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \RegParSer_i|registro~0_combout\ = (!\CircuitoControl_i|estado_actual.EnviaStart~regout\ & \RegParSer_i|registro\(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \CircuitoControl_i|estado_actual.EnviaStart~regout\,
	datad => \RegParSer_i|registro\(1),
	combout => \RegParSer_i|registro~0_combout\);

-- Location: LCFF_X47_Y24_N21
\RegParSer_i|registro[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \RegParSer_i|registro~0_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \Mux3a1_i|Mux0~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \RegParSer_i|registro\(0));

-- Location: LCFF_X46_Y24_N17
\CircuitoControl_i|estado_actual.Espera1Bit\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \CircuitoControl_i|Selector4~0_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	sload => VCC,
	ena => \CircuitoControl_i|Selector0~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CircuitoControl_i|estado_actual.Espera1Bit~regout\);

-- Location: LCCOMB_X47_Y24_N10
\Mux3a1_i|Mux0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \Mux3a1_i|Mux0~0_combout\ = (\CircuitoControl_i|Selector4~0_combout\ & (\RegParSer_i|registro\(0))) # (!\CircuitoControl_i|Selector4~0_combout\ & ((\CircuitoControl_i|estado_actual.Espera1Bit~regout\ & (\RegParSer_i|registro\(0))) # 
-- (!\CircuitoControl_i|estado_actual.Espera1Bit~regout\ & ((!\CircuitoControl_i|estado_actual.EnviaStart~regout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010100011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \RegParSer_i|registro\(0),
	datab => \CircuitoControl_i|estado_actual.EnviaStart~regout\,
	datac => \CircuitoControl_i|Selector4~0_combout\,
	datad => \CircuitoControl_i|estado_actual.Espera1Bit~regout\,
	combout => \Mux3a1_i|Mux0~0_combout\);

-- Location: PIN_B19,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\s_s~I\ : cycloneii_io
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
	datain => \Mux3a1_i|Mux0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_s_s);
END structure;


