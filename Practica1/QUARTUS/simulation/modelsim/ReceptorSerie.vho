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

-- DATE "01/27/2019 20:08:15"

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

ENTITY 	ReceptorSerie IS
    PORT (
	clk : IN std_logic;
	reset_n : IN std_logic;
	e_s : IN std_logic;
	s_p : OUT std_logic_vector(7 DOWNTO 0);
	led_error_paridad : OUT std_logic;
	led_error_trama : OUT std_logic
	);
END ReceptorSerie;

-- Design Ports Information
-- s_p[0]	=>  Location: PIN_B14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- s_p[1]	=>  Location: PIN_A11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- s_p[2]	=>  Location: PIN_A13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- s_p[3]	=>  Location: PIN_B13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- s_p[4]	=>  Location: PIN_B11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- s_p[5]	=>  Location: PIN_H11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- s_p[6]	=>  Location: PIN_A10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- s_p[7]	=>  Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- led_error_paridad	=>  Location: PIN_D11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- led_error_trama	=>  Location: PIN_G11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- e_s	=>  Location: PIN_E11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- clk	=>  Location: PIN_M1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- reset_n	=>  Location: PIN_M2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF ReceptorSerie IS
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
SIGNAL ww_e_s : std_logic;
SIGNAL ww_s_p : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_led_error_paridad : std_logic;
SIGNAL ww_led_error_trama : std_logic;
SIGNAL \clk~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \reset_n~clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \TemporizadorUnBit_i|Add0~14_combout\ : std_logic;
SIGNAL \UnidadControl_i|estado_actual.CompruebaStop~regout\ : std_logic;
SIGNAL \UnidadControl_i|Selector6~1_combout\ : std_logic;
SIGNAL \UnidadControl_i|estado_actual.Reposo~regout\ : std_logic;
SIGNAL \UnidadControl_i|Selector1~0_combout\ : std_logic;
SIGNAL \UnidadControl_i|Selector6~2_combout\ : std_logic;
SIGNAL \DetErrorParidad_i|paridad~regout\ : std_logic;
SIGNAL \UnidadControl_i|Selector8~0_combout\ : std_logic;
SIGNAL \UnidadControl_i|Selector0~1_combout\ : std_logic;
SIGNAL \UnidadControl_i|Selector0~2_combout\ : std_logic;
SIGNAL \UnidadControl_i|Selector2~1_combout\ : std_logic;
SIGNAL \DetErrorParidad_i|ComprobarParidad~0_combout\ : std_logic;
SIGNAL \ContadorM8_i|contador[0]~2_combout\ : std_logic;
SIGNAL \clk~combout\ : std_logic;
SIGNAL \clk~clkctrl_outclk\ : std_logic;
SIGNAL \e_s~combout\ : std_logic;
SIGNAL \RegDesplIzq_i|reg[0]~feeder_combout\ : std_logic;
SIGNAL \reset_n~combout\ : std_logic;
SIGNAL \reset_n~clkctrl_outclk\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~0_combout\ : std_logic;
SIGNAL \ContadorM8_i|contador[1]~1_combout\ : std_logic;
SIGNAL \ContadorM8_i|contador[2]~0_combout\ : std_logic;
SIGNAL \UnidadControl_i|Selector4~0_combout\ : std_logic;
SIGNAL \UnidadControl_i|Selector4~1_combout\ : std_logic;
SIGNAL \UnidadControl_i|estado_actual.EsperaBitParidad~regout\ : std_logic;
SIGNAL \UnidadControl_i|Selector5~0_combout\ : std_logic;
SIGNAL \UnidadControl_i|estado_actual.CompruebaParidad~regout\ : std_logic;
SIGNAL \DetErrorParidad_i|error~0_combout\ : std_logic;
SIGNAL \DetErrorParidad_i|error~regout\ : std_logic;
SIGNAL \UnidadControl_i|Selector7~0_combout\ : std_logic;
SIGNAL \DetectorFlanco_i|estado_act.Esp1~0_combout\ : std_logic;
SIGNAL \DetectorFlanco_i|estado_act.Esp1~regout\ : std_logic;
SIGNAL \DetectorFlanco_i|Selector1~0_combout\ : std_logic;
SIGNAL \DetectorFlanco_i|estado_act.Pulso~regout\ : std_logic;
SIGNAL \TemporizadorMedioBit_i|Add0~1\ : std_logic;
SIGNAL \TemporizadorMedioBit_i|Add0~2_combout\ : std_logic;
SIGNAL \TemporizadorMedioBit_i|contador~4_combout\ : std_logic;
SIGNAL \TemporizadorMedioBit_i|Add0~0_combout\ : std_logic;
SIGNAL \TemporizadorMedioBit_i|Add0~3\ : std_logic;
SIGNAL \TemporizadorMedioBit_i|Add0~4_combout\ : std_logic;
SIGNAL \TemporizadorMedioBit_i|contador~3_combout\ : std_logic;
SIGNAL \TemporizadorMedioBit_i|Add0~5\ : std_logic;
SIGNAL \TemporizadorMedioBit_i|Add0~6_combout\ : std_logic;
SIGNAL \TemporizadorMedioBit_i|Equal0~2_combout\ : std_logic;
SIGNAL \TemporizadorMedioBit_i|Add0~7\ : std_logic;
SIGNAL \TemporizadorMedioBit_i|Add0~8_combout\ : std_logic;
SIGNAL \TemporizadorMedioBit_i|contador~2_combout\ : std_logic;
SIGNAL \TemporizadorMedioBit_i|Add0~9\ : std_logic;
SIGNAL \TemporizadorMedioBit_i|Add0~10_combout\ : std_logic;
SIGNAL \TemporizadorMedioBit_i|Add0~11\ : std_logic;
SIGNAL \TemporizadorMedioBit_i|Add0~12_combout\ : std_logic;
SIGNAL \TemporizadorMedioBit_i|Add0~13\ : std_logic;
SIGNAL \TemporizadorMedioBit_i|Add0~14_combout\ : std_logic;
SIGNAL \TemporizadorMedioBit_i|Equal0~1_combout\ : std_logic;
SIGNAL \TemporizadorMedioBit_i|Add0~15\ : std_logic;
SIGNAL \TemporizadorMedioBit_i|Add0~16_combout\ : std_logic;
SIGNAL \TemporizadorMedioBit_i|contador~1_combout\ : std_logic;
SIGNAL \TemporizadorMedioBit_i|Add0~17\ : std_logic;
SIGNAL \TemporizadorMedioBit_i|Add0~19\ : std_logic;
SIGNAL \TemporizadorMedioBit_i|Add0~20_combout\ : std_logic;
SIGNAL \TemporizadorMedioBit_i|contador~0_combout\ : std_logic;
SIGNAL \TemporizadorMedioBit_i|Add0~21\ : std_logic;
SIGNAL \TemporizadorMedioBit_i|Add0~22_combout\ : std_logic;
SIGNAL \TemporizadorMedioBit_i|Add0~18_combout\ : std_logic;
SIGNAL \TemporizadorMedioBit_i|Equal0~0_combout\ : std_logic;
SIGNAL \UnidadControl_i|Selector1~1_combout\ : std_logic;
SIGNAL \UnidadControl_i|Selector1~2_combout\ : std_logic;
SIGNAL \UnidadControl_i|estado_actual.Espera0Start~regout\ : std_logic;
SIGNAL \UnidadControl_i|Selector6~3_combout\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~1\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~2_combout\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~3\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~4_combout\ : std_logic;
SIGNAL \TemporizadorUnBit_i|contador~4_combout\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~5\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~7\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~9\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~10_combout\ : std_logic;
SIGNAL \TemporizadorUnBit_i|contador~2_combout\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~11\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~12_combout\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~8_combout\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Equal0~1_combout\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Equal0~3_combout\ : std_logic;
SIGNAL \UnidadControl_i|Selector0~0_combout\ : std_logic;
SIGNAL \UnidadControl_i|Selector6~4_combout\ : std_logic;
SIGNAL \UnidadControl_i|estado_actual.EsperaStop~regout\ : std_logic;
SIGNAL \UnidadControl_i|Selector2~0_combout\ : std_logic;
SIGNAL \UnidadControl_i|Selector2~2_combout\ : std_logic;
SIGNAL \UnidadControl_i|estado_actual.Espera1Bit~regout\ : std_logic;
SIGNAL \UnidadControl_i|WideOr1~0_combout\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~6_combout\ : std_logic;
SIGNAL \TemporizadorUnBit_i|contador~3_combout\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Equal0~2_combout\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~13\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~15\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~16_combout\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~17\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~18_combout\ : std_logic;
SIGNAL \TemporizadorUnBit_i|contador~1_combout\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~19\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~20_combout\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~21\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Add0~22_combout\ : std_logic;
SIGNAL \TemporizadorUnBit_i|contador~0_combout\ : std_logic;
SIGNAL \TemporizadorUnBit_i|Equal0~0_combout\ : std_logic;
SIGNAL \UnidadControl_i|Selector3~0_combout\ : std_logic;
SIGNAL \UnidadControl_i|estado_actual.Registra~regout\ : std_logic;
SIGNAL \RegDesplIzq_i|reg[1]~feeder_combout\ : std_logic;
SIGNAL \RegDesplIzq_i|reg[2]~feeder_combout\ : std_logic;
SIGNAL \RegDesplIzq_i|reg[3]~feeder_combout\ : std_logic;
SIGNAL \RegDesplIzq_i|reg[4]~feeder_combout\ : std_logic;
SIGNAL \RegDesplIzq_i|reg[5]~feeder_combout\ : std_logic;
SIGNAL \RegDesplIzq_i|reg[6]~feeder_combout\ : std_logic;
SIGNAL \UnidadControl_i|Selector6~0_combout\ : std_logic;
SIGNAL \UnidadControl_i|estado_actual.ErrorParidad~regout\ : std_logic;
SIGNAL \UnidadControl_i|Selector9~0_combout\ : std_logic;
SIGNAL \UnidadControl_i|estado_actual.ErrorTrama~regout\ : std_logic;
SIGNAL \TemporizadorMedioBit_i|contador\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \TemporizadorUnBit_i|contador\ : std_logic_vector(11 DOWNTO 0);
SIGNAL \ContadorM8_i|contador\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \RegDesplIzq_i|reg\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \ALT_INV_reset_n~clkctrl_outclk\ : std_logic;

BEGIN

ww_clk <= clk;
ww_reset_n <= reset_n;
ww_e_s <= e_s;
s_p <= ww_s_p;
led_error_paridad <= ww_led_error_paridad;
led_error_trama <= ww_led_error_trama;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \clk~combout\);

\reset_n~clkctrl_INCLK_bus\ <= (gnd & gnd & gnd & \reset_n~combout\);
\ALT_INV_reset_n~clkctrl_outclk\ <= NOT \reset_n~clkctrl_outclk\;

-- Location: LCCOMB_X24_Y26_N16
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

-- Location: LCFF_X23_Y26_N9
\UnidadControl_i|estado_actual.CompruebaStop\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \UnidadControl_i|Selector8~0_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \UnidadControl_i|estado_actual.CompruebaStop~regout\);

-- Location: LCCOMB_X23_Y26_N10
\UnidadControl_i|Selector6~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \UnidadControl_i|Selector6~1_combout\ = (\UnidadControl_i|estado_actual.CompruebaStop~regout\) # ((\UnidadControl_i|estado_actual.Registra~regout\) # (\UnidadControl_i|estado_actual.CompruebaParidad~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \UnidadControl_i|estado_actual.CompruebaStop~regout\,
	datac => \UnidadControl_i|estado_actual.Registra~regout\,
	datad => \UnidadControl_i|estado_actual.CompruebaParidad~regout\,
	combout => \UnidadControl_i|Selector6~1_combout\);

-- Location: LCFF_X22_Y26_N5
\UnidadControl_i|estado_actual.Reposo\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \UnidadControl_i|Selector0~2_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \UnidadControl_i|estado_actual.Reposo~regout\);

-- Location: LCCOMB_X22_Y26_N6
\UnidadControl_i|Selector1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \UnidadControl_i|Selector1~0_combout\ = (\UnidadControl_i|estado_actual.ErrorParidad~regout\) # ((\UnidadControl_i|estado_actual.ErrorTrama~regout\) # (!\UnidadControl_i|estado_actual.Reposo~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \UnidadControl_i|estado_actual.ErrorParidad~regout\,
	datac => \UnidadControl_i|estado_actual.Reposo~regout\,
	datad => \UnidadControl_i|estado_actual.ErrorTrama~regout\,
	combout => \UnidadControl_i|Selector1~0_combout\);

-- Location: LCCOMB_X22_Y26_N24
\UnidadControl_i|Selector6~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \UnidadControl_i|Selector6~2_combout\ = (\UnidadControl_i|Selector6~1_combout\) # ((!\UnidadControl_i|estado_actual.Espera0Start~regout\ & (\DetectorFlanco_i|estado_act.Pulso~regout\ & \UnidadControl_i|Selector1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UnidadControl_i|estado_actual.Espera0Start~regout\,
	datab => \DetectorFlanco_i|estado_act.Pulso~regout\,
	datac => \UnidadControl_i|Selector6~1_combout\,
	datad => \UnidadControl_i|Selector1~0_combout\,
	combout => \UnidadControl_i|Selector6~2_combout\);

-- Location: LCFF_X24_Y26_N17
\TemporizadorUnBit_i|contador[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \TemporizadorUnBit_i|Add0~14_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \UnidadControl_i|WideOr1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TemporizadorUnBit_i|contador\(7));

-- Location: LCFF_X25_Y26_N27
\DetErrorParidad_i|paridad\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \DetErrorParidad_i|ComprobarParidad~0_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \UnidadControl_i|estado_actual.Registra~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DetErrorParidad_i|paridad~regout\);

-- Location: LCCOMB_X23_Y26_N8
\UnidadControl_i|Selector8~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \UnidadControl_i|Selector8~0_combout\ = (\TemporizadorUnBit_i|Equal0~2_combout\ & (\TemporizadorUnBit_i|Equal0~0_combout\ & (\UnidadControl_i|estado_actual.EsperaStop~regout\ & \TemporizadorUnBit_i|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TemporizadorUnBit_i|Equal0~2_combout\,
	datab => \TemporizadorUnBit_i|Equal0~0_combout\,
	datac => \UnidadControl_i|estado_actual.EsperaStop~regout\,
	datad => \TemporizadorUnBit_i|Equal0~1_combout\,
	combout => \UnidadControl_i|Selector8~0_combout\);

-- Location: LCCOMB_X22_Y26_N16
\UnidadControl_i|Selector0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \UnidadControl_i|Selector0~1_combout\ = (\UnidadControl_i|estado_actual.CompruebaStop~regout\ & ((\e_s~combout\) # ((!\DetectorFlanco_i|estado_act.Pulso~regout\ & !\UnidadControl_i|estado_actual.Reposo~regout\)))) # 
-- (!\UnidadControl_i|estado_actual.CompruebaStop~regout\ & (!\DetectorFlanco_i|estado_act.Pulso~regout\ & (!\UnidadControl_i|estado_actual.Reposo~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UnidadControl_i|estado_actual.CompruebaStop~regout\,
	datab => \DetectorFlanco_i|estado_act.Pulso~regout\,
	datac => \UnidadControl_i|estado_actual.Reposo~regout\,
	datad => \e_s~combout\,
	combout => \UnidadControl_i|Selector0~1_combout\);

-- Location: LCCOMB_X22_Y26_N4
\UnidadControl_i|Selector0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \UnidadControl_i|Selector0~2_combout\ = (!\UnidadControl_i|Selector0~1_combout\ & ((!\UnidadControl_i|Selector0~0_combout\) # (!\e_s~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000101010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UnidadControl_i|Selector0~1_combout\,
	datab => \e_s~combout\,
	datad => \UnidadControl_i|Selector0~0_combout\,
	combout => \UnidadControl_i|Selector0~2_combout\);

-- Location: LCFF_X25_Y26_N21
\ContadorM8_i|contador[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \ContadorM8_i|contador[0]~2_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \UnidadControl_i|estado_actual.Registra~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ContadorM8_i|contador\(0));

-- Location: LCCOMB_X23_Y26_N26
\UnidadControl_i|Selector2~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \UnidadControl_i|Selector2~1_combout\ = (\UnidadControl_i|estado_actual.Espera1Bit~regout\ & (((!\TemporizadorUnBit_i|Equal0~1_combout\) # (!\TemporizadorUnBit_i|Equal0~2_combout\)) # (!\TemporizadorUnBit_i|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UnidadControl_i|estado_actual.Espera1Bit~regout\,
	datab => \TemporizadorUnBit_i|Equal0~0_combout\,
	datac => \TemporizadorUnBit_i|Equal0~2_combout\,
	datad => \TemporizadorUnBit_i|Equal0~1_combout\,
	combout => \UnidadControl_i|Selector2~1_combout\);

-- Location: LCCOMB_X25_Y26_N26
\DetErrorParidad_i|ComprobarParidad~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \DetErrorParidad_i|ComprobarParidad~0_combout\ = \DetErrorParidad_i|paridad~regout\ $ (\e_s~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \DetErrorParidad_i|paridad~regout\,
	datad => \e_s~combout\,
	combout => \DetErrorParidad_i|ComprobarParidad~0_combout\);

-- Location: LCCOMB_X25_Y26_N20
\ContadorM8_i|contador[0]~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \ContadorM8_i|contador[0]~2_combout\ = !\ContadorM8_i|contador\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ContadorM8_i|contador\(0),
	combout => \ContadorM8_i|contador[0]~2_combout\);

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

-- Location: PIN_E11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\e_s~I\ : cycloneii_io
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
	padio => ww_e_s,
	combout => \e_s~combout\);

-- Location: LCCOMB_X25_Y26_N12
\RegDesplIzq_i|reg[0]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \RegDesplIzq_i|reg[0]~feeder_combout\ = \e_s~combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \e_s~combout\,
	combout => \RegDesplIzq_i|reg[0]~feeder_combout\);

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

-- Location: LCCOMB_X24_Y26_N2
\TemporizadorUnBit_i|Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorUnBit_i|Add0~0_combout\ = \TemporizadorUnBit_i|contador\(0) $ (VCC)
-- \TemporizadorUnBit_i|Add0~1\ = CARRY(\TemporizadorUnBit_i|contador\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \TemporizadorUnBit_i|contador\(0),
	datad => VCC,
	combout => \TemporizadorUnBit_i|Add0~0_combout\,
	cout => \TemporizadorUnBit_i|Add0~1\);

-- Location: LCCOMB_X25_Y26_N22
\ContadorM8_i|contador[1]~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \ContadorM8_i|contador[1]~1_combout\ = \ContadorM8_i|contador\(1) $ (((\ContadorM8_i|contador\(0) & \UnidadControl_i|estado_actual.Registra~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ContadorM8_i|contador\(0),
	datac => \ContadorM8_i|contador\(1),
	datad => \UnidadControl_i|estado_actual.Registra~regout\,
	combout => \ContadorM8_i|contador[1]~1_combout\);

-- Location: LCFF_X25_Y26_N23
\ContadorM8_i|contador[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \ContadorM8_i|contador[1]~1_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ContadorM8_i|contador\(1));

-- Location: LCCOMB_X25_Y26_N0
\ContadorM8_i|contador[2]~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ContadorM8_i|contador[2]~0_combout\ = \ContadorM8_i|contador\(2) $ (((\ContadorM8_i|contador\(0) & (\ContadorM8_i|contador\(1) & \UnidadControl_i|estado_actual.Registra~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ContadorM8_i|contador\(0),
	datab => \ContadorM8_i|contador\(1),
	datac => \ContadorM8_i|contador\(2),
	datad => \UnidadControl_i|estado_actual.Registra~regout\,
	combout => \ContadorM8_i|contador[2]~0_combout\);

-- Location: LCFF_X25_Y26_N1
\ContadorM8_i|contador[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \ContadorM8_i|contador[2]~0_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ContadorM8_i|contador\(2));

-- Location: LCCOMB_X25_Y26_N24
\UnidadControl_i|Selector4~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \UnidadControl_i|Selector4~0_combout\ = (\ContadorM8_i|contador\(0) & (\ContadorM8_i|contador\(1) & (\UnidadControl_i|estado_actual.Registra~regout\ & \ContadorM8_i|contador\(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ContadorM8_i|contador\(0),
	datab => \ContadorM8_i|contador\(1),
	datac => \UnidadControl_i|estado_actual.Registra~regout\,
	datad => \ContadorM8_i|contador\(2),
	combout => \UnidadControl_i|Selector4~0_combout\);

-- Location: LCCOMB_X23_Y26_N18
\UnidadControl_i|Selector4~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \UnidadControl_i|Selector4~1_combout\ = (\UnidadControl_i|Selector4~0_combout\) # ((!\TemporizadorUnBit_i|Equal0~3_combout\ & \UnidadControl_i|estado_actual.EsperaBitParidad~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TemporizadorUnBit_i|Equal0~3_combout\,
	datac => \UnidadControl_i|estado_actual.EsperaBitParidad~regout\,
	datad => \UnidadControl_i|Selector4~0_combout\,
	combout => \UnidadControl_i|Selector4~1_combout\);

-- Location: LCFF_X23_Y26_N19
\UnidadControl_i|estado_actual.EsperaBitParidad\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \UnidadControl_i|Selector4~1_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \UnidadControl_i|estado_actual.EsperaBitParidad~regout\);

-- Location: LCCOMB_X23_Y26_N22
\UnidadControl_i|Selector5~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \UnidadControl_i|Selector5~0_combout\ = (\TemporizadorUnBit_i|Equal0~1_combout\ & (\TemporizadorUnBit_i|Equal0~0_combout\ & (\TemporizadorUnBit_i|Equal0~2_combout\ & \UnidadControl_i|estado_actual.EsperaBitParidad~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TemporizadorUnBit_i|Equal0~1_combout\,
	datab => \TemporizadorUnBit_i|Equal0~0_combout\,
	datac => \TemporizadorUnBit_i|Equal0~2_combout\,
	datad => \UnidadControl_i|estado_actual.EsperaBitParidad~regout\,
	combout => \UnidadControl_i|Selector5~0_combout\);

-- Location: LCFF_X23_Y26_N23
\UnidadControl_i|estado_actual.CompruebaParidad\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \UnidadControl_i|Selector5~0_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \UnidadControl_i|estado_actual.CompruebaParidad~regout\);

-- Location: LCCOMB_X22_Y26_N0
\DetErrorParidad_i|error~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \DetErrorParidad_i|error~0_combout\ = (\DetErrorParidad_i|error~regout\) # ((\UnidadControl_i|estado_actual.CompruebaParidad~regout\ & (\DetErrorParidad_i|paridad~regout\ $ (!\e_s~combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \DetErrorParidad_i|paridad~regout\,
	datab => \e_s~combout\,
	datac => \DetErrorParidad_i|error~regout\,
	datad => \UnidadControl_i|estado_actual.CompruebaParidad~regout\,
	combout => \DetErrorParidad_i|error~0_combout\);

-- Location: LCFF_X22_Y26_N1
\DetErrorParidad_i|error\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \DetErrorParidad_i|error~0_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DetErrorParidad_i|error~regout\);

-- Location: LCCOMB_X22_Y26_N20
\UnidadControl_i|Selector7~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \UnidadControl_i|Selector7~0_combout\ = (!\DetErrorParidad_i|error~regout\ & \UnidadControl_i|estado_actual.CompruebaParidad~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \DetErrorParidad_i|error~regout\,
	datad => \UnidadControl_i|estado_actual.CompruebaParidad~regout\,
	combout => \UnidadControl_i|Selector7~0_combout\);

-- Location: LCCOMB_X22_Y26_N2
\DetectorFlanco_i|estado_act.Esp1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \DetectorFlanco_i|estado_act.Esp1~0_combout\ = !\e_s~combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \e_s~combout\,
	combout => \DetectorFlanco_i|estado_act.Esp1~0_combout\);

-- Location: LCFF_X22_Y26_N3
\DetectorFlanco_i|estado_act.Esp1\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \DetectorFlanco_i|estado_act.Esp1~0_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DetectorFlanco_i|estado_act.Esp1~regout\);

-- Location: LCCOMB_X22_Y26_N14
\DetectorFlanco_i|Selector1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \DetectorFlanco_i|Selector1~0_combout\ = (!\DetectorFlanco_i|estado_act.Esp1~regout\ & !\e_s~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \DetectorFlanco_i|estado_act.Esp1~regout\,
	datad => \e_s~combout\,
	combout => \DetectorFlanco_i|Selector1~0_combout\);

-- Location: LCFF_X22_Y26_N15
\DetectorFlanco_i|estado_act.Pulso\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \DetectorFlanco_i|Selector1~0_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \DetectorFlanco_i|estado_act.Pulso~regout\);

-- Location: LCCOMB_X20_Y26_N6
\TemporizadorMedioBit_i|Add0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorMedioBit_i|Add0~0_combout\ = \TemporizadorMedioBit_i|contador\(0) $ (VCC)
-- \TemporizadorMedioBit_i|Add0~1\ = CARRY(\TemporizadorMedioBit_i|contador\(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TemporizadorMedioBit_i|contador\(0),
	datad => VCC,
	combout => \TemporizadorMedioBit_i|Add0~0_combout\,
	cout => \TemporizadorMedioBit_i|Add0~1\);

-- Location: LCCOMB_X20_Y26_N8
\TemporizadorMedioBit_i|Add0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorMedioBit_i|Add0~2_combout\ = (\TemporizadorMedioBit_i|contador\(1) & (!\TemporizadorMedioBit_i|Add0~1\)) # (!\TemporizadorMedioBit_i|contador\(1) & ((\TemporizadorMedioBit_i|Add0~1\) # (GND)))
-- \TemporizadorMedioBit_i|Add0~3\ = CARRY((!\TemporizadorMedioBit_i|Add0~1\) # (!\TemporizadorMedioBit_i|contador\(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \TemporizadorMedioBit_i|contador\(1),
	datad => VCC,
	cin => \TemporizadorMedioBit_i|Add0~1\,
	combout => \TemporizadorMedioBit_i|Add0~2_combout\,
	cout => \TemporizadorMedioBit_i|Add0~3\);

-- Location: LCCOMB_X21_Y26_N30
\TemporizadorMedioBit_i|contador~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorMedioBit_i|contador~4_combout\ = (\TemporizadorMedioBit_i|Add0~2_combout\ & (((!\TemporizadorMedioBit_i|Equal0~2_combout\) # (!\TemporizadorMedioBit_i|Equal0~1_combout\)) # (!\TemporizadorMedioBit_i|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TemporizadorMedioBit_i|Equal0~0_combout\,
	datab => \TemporizadorMedioBit_i|Equal0~1_combout\,
	datac => \TemporizadorMedioBit_i|Equal0~2_combout\,
	datad => \TemporizadorMedioBit_i|Add0~2_combout\,
	combout => \TemporizadorMedioBit_i|contador~4_combout\);

-- Location: LCFF_X21_Y26_N31
\TemporizadorMedioBit_i|contador[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \TemporizadorMedioBit_i|contador~4_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \UnidadControl_i|estado_actual.Espera0Start~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TemporizadorMedioBit_i|contador\(1));

-- Location: LCFF_X20_Y26_N7
\TemporizadorMedioBit_i|contador[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \TemporizadorMedioBit_i|Add0~0_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \UnidadControl_i|estado_actual.Espera0Start~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TemporizadorMedioBit_i|contador\(0));

-- Location: LCCOMB_X20_Y26_N10
\TemporizadorMedioBit_i|Add0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorMedioBit_i|Add0~4_combout\ = (\TemporizadorMedioBit_i|contador\(2) & (\TemporizadorMedioBit_i|Add0~3\ $ (GND))) # (!\TemporizadorMedioBit_i|contador\(2) & (!\TemporizadorMedioBit_i|Add0~3\ & VCC))
-- \TemporizadorMedioBit_i|Add0~5\ = CARRY((\TemporizadorMedioBit_i|contador\(2) & !\TemporizadorMedioBit_i|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \TemporizadorMedioBit_i|contador\(2),
	datad => VCC,
	cin => \TemporizadorMedioBit_i|Add0~3\,
	combout => \TemporizadorMedioBit_i|Add0~4_combout\,
	cout => \TemporizadorMedioBit_i|Add0~5\);

-- Location: LCCOMB_X21_Y26_N8
\TemporizadorMedioBit_i|contador~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorMedioBit_i|contador~3_combout\ = (\TemporizadorMedioBit_i|Add0~4_combout\ & (((!\TemporizadorMedioBit_i|Equal0~2_combout\) # (!\TemporizadorMedioBit_i|Equal0~1_combout\)) # (!\TemporizadorMedioBit_i|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TemporizadorMedioBit_i|Equal0~0_combout\,
	datab => \TemporizadorMedioBit_i|Equal0~1_combout\,
	datac => \TemporizadorMedioBit_i|Equal0~2_combout\,
	datad => \TemporizadorMedioBit_i|Add0~4_combout\,
	combout => \TemporizadorMedioBit_i|contador~3_combout\);

-- Location: LCFF_X21_Y26_N9
\TemporizadorMedioBit_i|contador[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \TemporizadorMedioBit_i|contador~3_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \UnidadControl_i|estado_actual.Espera0Start~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TemporizadorMedioBit_i|contador\(2));

-- Location: LCCOMB_X20_Y26_N12
\TemporizadorMedioBit_i|Add0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorMedioBit_i|Add0~6_combout\ = (\TemporizadorMedioBit_i|contador\(3) & (!\TemporizadorMedioBit_i|Add0~5\)) # (!\TemporizadorMedioBit_i|contador\(3) & ((\TemporizadorMedioBit_i|Add0~5\) # (GND)))
-- \TemporizadorMedioBit_i|Add0~7\ = CARRY((!\TemporizadorMedioBit_i|Add0~5\) # (!\TemporizadorMedioBit_i|contador\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TemporizadorMedioBit_i|contador\(3),
	datad => VCC,
	cin => \TemporizadorMedioBit_i|Add0~5\,
	combout => \TemporizadorMedioBit_i|Add0~6_combout\,
	cout => \TemporizadorMedioBit_i|Add0~7\);

-- Location: LCFF_X20_Y26_N13
\TemporizadorMedioBit_i|contador[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \TemporizadorMedioBit_i|Add0~6_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \UnidadControl_i|estado_actual.Espera0Start~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TemporizadorMedioBit_i|contador\(3));

-- Location: LCCOMB_X21_Y26_N16
\TemporizadorMedioBit_i|Equal0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorMedioBit_i|Equal0~2_combout\ = (\TemporizadorMedioBit_i|contador\(2) & (!\TemporizadorMedioBit_i|contador\(1) & (\TemporizadorMedioBit_i|contador\(0) & !\TemporizadorMedioBit_i|contador\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TemporizadorMedioBit_i|contador\(2),
	datab => \TemporizadorMedioBit_i|contador\(1),
	datac => \TemporizadorMedioBit_i|contador\(0),
	datad => \TemporizadorMedioBit_i|contador\(3),
	combout => \TemporizadorMedioBit_i|Equal0~2_combout\);

-- Location: LCCOMB_X20_Y26_N14
\TemporizadorMedioBit_i|Add0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorMedioBit_i|Add0~8_combout\ = (\TemporizadorMedioBit_i|contador\(4) & (\TemporizadorMedioBit_i|Add0~7\ $ (GND))) # (!\TemporizadorMedioBit_i|contador\(4) & (!\TemporizadorMedioBit_i|Add0~7\ & VCC))
-- \TemporizadorMedioBit_i|Add0~9\ = CARRY((\TemporizadorMedioBit_i|contador\(4) & !\TemporizadorMedioBit_i|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \TemporizadorMedioBit_i|contador\(4),
	datad => VCC,
	cin => \TemporizadorMedioBit_i|Add0~7\,
	combout => \TemporizadorMedioBit_i|Add0~8_combout\,
	cout => \TemporizadorMedioBit_i|Add0~9\);

-- Location: LCCOMB_X21_Y26_N24
\TemporizadorMedioBit_i|contador~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorMedioBit_i|contador~2_combout\ = (\TemporizadorMedioBit_i|Add0~8_combout\ & (((!\TemporizadorMedioBit_i|Equal0~2_combout\) # (!\TemporizadorMedioBit_i|Equal0~1_combout\)) # (!\TemporizadorMedioBit_i|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TemporizadorMedioBit_i|Equal0~0_combout\,
	datab => \TemporizadorMedioBit_i|Equal0~1_combout\,
	datac => \TemporizadorMedioBit_i|Equal0~2_combout\,
	datad => \TemporizadorMedioBit_i|Add0~8_combout\,
	combout => \TemporizadorMedioBit_i|contador~2_combout\);

-- Location: LCFF_X21_Y26_N25
\TemporizadorMedioBit_i|contador[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \TemporizadorMedioBit_i|contador~2_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \UnidadControl_i|estado_actual.Espera0Start~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TemporizadorMedioBit_i|contador\(4));

-- Location: LCCOMB_X20_Y26_N16
\TemporizadorMedioBit_i|Add0~10\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorMedioBit_i|Add0~10_combout\ = (\TemporizadorMedioBit_i|contador\(5) & (!\TemporizadorMedioBit_i|Add0~9\)) # (!\TemporizadorMedioBit_i|contador\(5) & ((\TemporizadorMedioBit_i|Add0~9\) # (GND)))
-- \TemporizadorMedioBit_i|Add0~11\ = CARRY((!\TemporizadorMedioBit_i|Add0~9\) # (!\TemporizadorMedioBit_i|contador\(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TemporizadorMedioBit_i|contador\(5),
	datad => VCC,
	cin => \TemporizadorMedioBit_i|Add0~9\,
	combout => \TemporizadorMedioBit_i|Add0~10_combout\,
	cout => \TemporizadorMedioBit_i|Add0~11\);

-- Location: LCFF_X20_Y26_N17
\TemporizadorMedioBit_i|contador[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \TemporizadorMedioBit_i|Add0~10_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \UnidadControl_i|estado_actual.Espera0Start~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TemporizadorMedioBit_i|contador\(5));

-- Location: LCCOMB_X20_Y26_N18
\TemporizadorMedioBit_i|Add0~12\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorMedioBit_i|Add0~12_combout\ = (\TemporizadorMedioBit_i|contador\(6) & (\TemporizadorMedioBit_i|Add0~11\ $ (GND))) # (!\TemporizadorMedioBit_i|contador\(6) & (!\TemporizadorMedioBit_i|Add0~11\ & VCC))
-- \TemporizadorMedioBit_i|Add0~13\ = CARRY((\TemporizadorMedioBit_i|contador\(6) & !\TemporizadorMedioBit_i|Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \TemporizadorMedioBit_i|contador\(6),
	datad => VCC,
	cin => \TemporizadorMedioBit_i|Add0~11\,
	combout => \TemporizadorMedioBit_i|Add0~12_combout\,
	cout => \TemporizadorMedioBit_i|Add0~13\);

-- Location: LCFF_X20_Y26_N19
\TemporizadorMedioBit_i|contador[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \TemporizadorMedioBit_i|Add0~12_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \UnidadControl_i|estado_actual.Espera0Start~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TemporizadorMedioBit_i|contador\(6));

-- Location: LCCOMB_X20_Y26_N20
\TemporizadorMedioBit_i|Add0~14\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorMedioBit_i|Add0~14_combout\ = (\TemporizadorMedioBit_i|contador\(7) & (!\TemporizadorMedioBit_i|Add0~13\)) # (!\TemporizadorMedioBit_i|contador\(7) & ((\TemporizadorMedioBit_i|Add0~13\) # (GND)))
-- \TemporizadorMedioBit_i|Add0~15\ = CARRY((!\TemporizadorMedioBit_i|Add0~13\) # (!\TemporizadorMedioBit_i|contador\(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TemporizadorMedioBit_i|contador\(7),
	datad => VCC,
	cin => \TemporizadorMedioBit_i|Add0~13\,
	combout => \TemporizadorMedioBit_i|Add0~14_combout\,
	cout => \TemporizadorMedioBit_i|Add0~15\);

-- Location: LCFF_X20_Y26_N21
\TemporizadorMedioBit_i|contador[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \TemporizadorMedioBit_i|Add0~14_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \UnidadControl_i|estado_actual.Espera0Start~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TemporizadorMedioBit_i|contador\(7));

-- Location: LCCOMB_X21_Y26_N14
\TemporizadorMedioBit_i|Equal0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorMedioBit_i|Equal0~1_combout\ = (\TemporizadorMedioBit_i|contador\(4) & (!\TemporizadorMedioBit_i|contador\(5) & (!\TemporizadorMedioBit_i|contador\(7) & !\TemporizadorMedioBit_i|contador\(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TemporizadorMedioBit_i|contador\(4),
	datab => \TemporizadorMedioBit_i|contador\(5),
	datac => \TemporizadorMedioBit_i|contador\(7),
	datad => \TemporizadorMedioBit_i|contador\(6),
	combout => \TemporizadorMedioBit_i|Equal0~1_combout\);

-- Location: LCCOMB_X20_Y26_N22
\TemporizadorMedioBit_i|Add0~16\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorMedioBit_i|Add0~16_combout\ = (\TemporizadorMedioBit_i|contador\(8) & (\TemporizadorMedioBit_i|Add0~15\ $ (GND))) # (!\TemporizadorMedioBit_i|contador\(8) & (!\TemporizadorMedioBit_i|Add0~15\ & VCC))
-- \TemporizadorMedioBit_i|Add0~17\ = CARRY((\TemporizadorMedioBit_i|contador\(8) & !\TemporizadorMedioBit_i|Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \TemporizadorMedioBit_i|contador\(8),
	datad => VCC,
	cin => \TemporizadorMedioBit_i|Add0~15\,
	combout => \TemporizadorMedioBit_i|Add0~16_combout\,
	cout => \TemporizadorMedioBit_i|Add0~17\);

-- Location: LCCOMB_X21_Y26_N20
\TemporizadorMedioBit_i|contador~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorMedioBit_i|contador~1_combout\ = (\TemporizadorMedioBit_i|Add0~16_combout\ & (((!\TemporizadorMedioBit_i|Equal0~2_combout\) # (!\TemporizadorMedioBit_i|Equal0~1_combout\)) # (!\TemporizadorMedioBit_i|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TemporizadorMedioBit_i|Equal0~0_combout\,
	datab => \TemporizadorMedioBit_i|Equal0~1_combout\,
	datac => \TemporizadorMedioBit_i|Equal0~2_combout\,
	datad => \TemporizadorMedioBit_i|Add0~16_combout\,
	combout => \TemporizadorMedioBit_i|contador~1_combout\);

-- Location: LCFF_X21_Y26_N21
\TemporizadorMedioBit_i|contador[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \TemporizadorMedioBit_i|contador~1_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \UnidadControl_i|estado_actual.Espera0Start~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TemporizadorMedioBit_i|contador\(8));

-- Location: LCCOMB_X20_Y26_N24
\TemporizadorMedioBit_i|Add0~18\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorMedioBit_i|Add0~18_combout\ = (\TemporizadorMedioBit_i|contador\(9) & (!\TemporizadorMedioBit_i|Add0~17\)) # (!\TemporizadorMedioBit_i|contador\(9) & ((\TemporizadorMedioBit_i|Add0~17\) # (GND)))
-- \TemporizadorMedioBit_i|Add0~19\ = CARRY((!\TemporizadorMedioBit_i|Add0~17\) # (!\TemporizadorMedioBit_i|contador\(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TemporizadorMedioBit_i|contador\(9),
	datad => VCC,
	cin => \TemporizadorMedioBit_i|Add0~17\,
	combout => \TemporizadorMedioBit_i|Add0~18_combout\,
	cout => \TemporizadorMedioBit_i|Add0~19\);

-- Location: LCCOMB_X20_Y26_N26
\TemporizadorMedioBit_i|Add0~20\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorMedioBit_i|Add0~20_combout\ = (\TemporizadorMedioBit_i|contador\(10) & (\TemporizadorMedioBit_i|Add0~19\ $ (GND))) # (!\TemporizadorMedioBit_i|contador\(10) & (!\TemporizadorMedioBit_i|Add0~19\ & VCC))
-- \TemporizadorMedioBit_i|Add0~21\ = CARRY((\TemporizadorMedioBit_i|contador\(10) & !\TemporizadorMedioBit_i|Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \TemporizadorMedioBit_i|contador\(10),
	datad => VCC,
	cin => \TemporizadorMedioBit_i|Add0~19\,
	combout => \TemporizadorMedioBit_i|Add0~20_combout\,
	cout => \TemporizadorMedioBit_i|Add0~21\);

-- Location: LCCOMB_X21_Y26_N10
\TemporizadorMedioBit_i|contador~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorMedioBit_i|contador~0_combout\ = (\TemporizadorMedioBit_i|Add0~20_combout\ & (((!\TemporizadorMedioBit_i|Equal0~2_combout\) # (!\TemporizadorMedioBit_i|Equal0~1_combout\)) # (!\TemporizadorMedioBit_i|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TemporizadorMedioBit_i|Equal0~0_combout\,
	datab => \TemporizadorMedioBit_i|Equal0~1_combout\,
	datac => \TemporizadorMedioBit_i|Equal0~2_combout\,
	datad => \TemporizadorMedioBit_i|Add0~20_combout\,
	combout => \TemporizadorMedioBit_i|contador~0_combout\);

-- Location: LCFF_X21_Y26_N11
\TemporizadorMedioBit_i|contador[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \TemporizadorMedioBit_i|contador~0_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \UnidadControl_i|estado_actual.Espera0Start~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TemporizadorMedioBit_i|contador\(10));

-- Location: LCCOMB_X20_Y26_N28
\TemporizadorMedioBit_i|Add0~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorMedioBit_i|Add0~22_combout\ = \TemporizadorMedioBit_i|Add0~21\ $ (\TemporizadorMedioBit_i|contador\(11))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \TemporizadorMedioBit_i|contador\(11),
	cin => \TemporizadorMedioBit_i|Add0~21\,
	combout => \TemporizadorMedioBit_i|Add0~22_combout\);

-- Location: LCFF_X20_Y26_N29
\TemporizadorMedioBit_i|contador[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \TemporizadorMedioBit_i|Add0~22_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \UnidadControl_i|estado_actual.Espera0Start~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TemporizadorMedioBit_i|contador\(11));

-- Location: LCFF_X20_Y26_N25
\TemporizadorMedioBit_i|contador[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \TemporizadorMedioBit_i|Add0~18_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \UnidadControl_i|estado_actual.Espera0Start~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TemporizadorMedioBit_i|contador\(9));

-- Location: LCCOMB_X21_Y26_N26
\TemporizadorMedioBit_i|Equal0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorMedioBit_i|Equal0~0_combout\ = (\TemporizadorMedioBit_i|contador\(10) & (!\TemporizadorMedioBit_i|contador\(11) & (\TemporizadorMedioBit_i|contador\(8) & !\TemporizadorMedioBit_i|contador\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TemporizadorMedioBit_i|contador\(10),
	datab => \TemporizadorMedioBit_i|contador\(11),
	datac => \TemporizadorMedioBit_i|contador\(8),
	datad => \TemporizadorMedioBit_i|contador\(9),
	combout => \TemporizadorMedioBit_i|Equal0~0_combout\);

-- Location: LCCOMB_X21_Y26_N18
\UnidadControl_i|Selector1~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \UnidadControl_i|Selector1~1_combout\ = (\UnidadControl_i|estado_actual.Espera0Start~regout\ & (((!\TemporizadorMedioBit_i|Equal0~0_combout\) # (!\TemporizadorMedioBit_i|Equal0~1_combout\)) # (!\TemporizadorMedioBit_i|Equal0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TemporizadorMedioBit_i|Equal0~2_combout\,
	datab => \UnidadControl_i|estado_actual.Espera0Start~regout\,
	datac => \TemporizadorMedioBit_i|Equal0~1_combout\,
	datad => \TemporizadorMedioBit_i|Equal0~0_combout\,
	combout => \UnidadControl_i|Selector1~1_combout\);

-- Location: LCCOMB_X22_Y26_N18
\UnidadControl_i|Selector1~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \UnidadControl_i|Selector1~2_combout\ = (\UnidadControl_i|Selector1~1_combout\) # ((\UnidadControl_i|Selector1~0_combout\ & ((\DetectorFlanco_i|estado_act.Pulso~regout\) # (\UnidadControl_i|estado_actual.Espera0Start~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UnidadControl_i|Selector1~0_combout\,
	datab => \DetectorFlanco_i|estado_act.Pulso~regout\,
	datac => \UnidadControl_i|estado_actual.Espera0Start~regout\,
	datad => \UnidadControl_i|Selector1~1_combout\,
	combout => \UnidadControl_i|Selector1~2_combout\);

-- Location: LCFF_X22_Y26_N19
\UnidadControl_i|estado_actual.Espera0Start\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \UnidadControl_i|Selector1~2_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \UnidadControl_i|estado_actual.Espera0Start~regout\);

-- Location: LCCOMB_X22_Y26_N26
\UnidadControl_i|Selector6~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \UnidadControl_i|Selector6~3_combout\ = (!\UnidadControl_i|estado_actual.Espera0Start~regout\ & ((\UnidadControl_i|estado_actual.Espera1Bit~regout\) # ((\UnidadControl_i|estado_actual.EsperaStop~regout\) # 
-- (\UnidadControl_i|estado_actual.EsperaBitParidad~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UnidadControl_i|estado_actual.Espera1Bit~regout\,
	datab => \UnidadControl_i|estado_actual.Espera0Start~regout\,
	datac => \UnidadControl_i|estado_actual.EsperaStop~regout\,
	datad => \UnidadControl_i|estado_actual.EsperaBitParidad~regout\,
	combout => \UnidadControl_i|Selector6~3_combout\);

-- Location: LCCOMB_X24_Y26_N4
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

-- Location: LCFF_X24_Y26_N5
\TemporizadorUnBit_i|contador[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \TemporizadorUnBit_i|Add0~2_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \UnidadControl_i|WideOr1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TemporizadorUnBit_i|contador\(1));

-- Location: LCCOMB_X24_Y26_N6
\TemporizadorUnBit_i|Add0~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorUnBit_i|Add0~4_combout\ = (\TemporizadorUnBit_i|contador\(2) & (\TemporizadorUnBit_i|Add0~3\ $ (GND))) # (!\TemporizadorUnBit_i|contador\(2) & (!\TemporizadorUnBit_i|Add0~3\ & VCC))
-- \TemporizadorUnBit_i|Add0~5\ = CARRY((\TemporizadorUnBit_i|contador\(2) & !\TemporizadorUnBit_i|Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \TemporizadorUnBit_i|contador\(2),
	datad => VCC,
	cin => \TemporizadorUnBit_i|Add0~3\,
	combout => \TemporizadorUnBit_i|Add0~4_combout\,
	cout => \TemporizadorUnBit_i|Add0~5\);

-- Location: LCCOMB_X24_Y26_N28
\TemporizadorUnBit_i|contador~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorUnBit_i|contador~4_combout\ = (\TemporizadorUnBit_i|Add0~4_combout\ & (((!\TemporizadorUnBit_i|Equal0~1_combout\) # (!\TemporizadorUnBit_i|Equal0~2_combout\)) # (!\TemporizadorUnBit_i|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TemporizadorUnBit_i|Equal0~0_combout\,
	datab => \TemporizadorUnBit_i|Equal0~2_combout\,
	datac => \TemporizadorUnBit_i|Equal0~1_combout\,
	datad => \TemporizadorUnBit_i|Add0~4_combout\,
	combout => \TemporizadorUnBit_i|contador~4_combout\);

-- Location: LCFF_X24_Y26_N29
\TemporizadorUnBit_i|contador[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \TemporizadorUnBit_i|contador~4_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \UnidadControl_i|WideOr1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TemporizadorUnBit_i|contador\(2));

-- Location: LCCOMB_X24_Y26_N8
\TemporizadorUnBit_i|Add0~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorUnBit_i|Add0~6_combout\ = (\TemporizadorUnBit_i|contador\(3) & (!\TemporizadorUnBit_i|Add0~5\)) # (!\TemporizadorUnBit_i|contador\(3) & ((\TemporizadorUnBit_i|Add0~5\) # (GND)))
-- \TemporizadorUnBit_i|Add0~7\ = CARRY((!\TemporizadorUnBit_i|Add0~5\) # (!\TemporizadorUnBit_i|contador\(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TemporizadorUnBit_i|contador\(3),
	datad => VCC,
	cin => \TemporizadorUnBit_i|Add0~5\,
	combout => \TemporizadorUnBit_i|Add0~6_combout\,
	cout => \TemporizadorUnBit_i|Add0~7\);

-- Location: LCCOMB_X24_Y26_N10
\TemporizadorUnBit_i|Add0~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorUnBit_i|Add0~8_combout\ = (\TemporizadorUnBit_i|contador\(4) & (\TemporizadorUnBit_i|Add0~7\ $ (GND))) # (!\TemporizadorUnBit_i|contador\(4) & (!\TemporizadorUnBit_i|Add0~7\ & VCC))
-- \TemporizadorUnBit_i|Add0~9\ = CARRY((\TemporizadorUnBit_i|contador\(4) & !\TemporizadorUnBit_i|Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \TemporizadorUnBit_i|contador\(4),
	datad => VCC,
	cin => \TemporizadorUnBit_i|Add0~7\,
	combout => \TemporizadorUnBit_i|Add0~8_combout\,
	cout => \TemporizadorUnBit_i|Add0~9\);

-- Location: LCCOMB_X24_Y26_N12
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

-- Location: LCCOMB_X24_Y26_N0
\TemporizadorUnBit_i|contador~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorUnBit_i|contador~2_combout\ = (\TemporizadorUnBit_i|Add0~10_combout\ & (((!\TemporizadorUnBit_i|Equal0~1_combout\) # (!\TemporizadorUnBit_i|Equal0~2_combout\)) # (!\TemporizadorUnBit_i|Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TemporizadorUnBit_i|Equal0~0_combout\,
	datab => \TemporizadorUnBit_i|Equal0~2_combout\,
	datac => \TemporizadorUnBit_i|Equal0~1_combout\,
	datad => \TemporizadorUnBit_i|Add0~10_combout\,
	combout => \TemporizadorUnBit_i|contador~2_combout\);

-- Location: LCFF_X24_Y26_N1
\TemporizadorUnBit_i|contador[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \TemporizadorUnBit_i|contador~2_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \UnidadControl_i|WideOr1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TemporizadorUnBit_i|contador\(5));

-- Location: LCCOMB_X24_Y26_N14
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

-- Location: LCFF_X24_Y26_N15
\TemporizadorUnBit_i|contador[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \TemporizadorUnBit_i|Add0~12_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \UnidadControl_i|WideOr1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TemporizadorUnBit_i|contador\(6));

-- Location: LCFF_X24_Y26_N11
\TemporizadorUnBit_i|contador[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \TemporizadorUnBit_i|Add0~8_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \UnidadControl_i|WideOr1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TemporizadorUnBit_i|contador\(4));

-- Location: LCCOMB_X24_Y26_N26
\TemporizadorUnBit_i|Equal0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorUnBit_i|Equal0~1_combout\ = (!\TemporizadorUnBit_i|contador\(7) & (\TemporizadorUnBit_i|contador\(5) & (!\TemporizadorUnBit_i|contador\(6) & !\TemporizadorUnBit_i|contador\(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TemporizadorUnBit_i|contador\(7),
	datab => \TemporizadorUnBit_i|contador\(5),
	datac => \TemporizadorUnBit_i|contador\(6),
	datad => \TemporizadorUnBit_i|contador\(4),
	combout => \TemporizadorUnBit_i|Equal0~1_combout\);

-- Location: LCCOMB_X23_Y26_N16
\TemporizadorUnBit_i|Equal0~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorUnBit_i|Equal0~3_combout\ = (\TemporizadorUnBit_i|Equal0~0_combout\ & (\TemporizadorUnBit_i|Equal0~1_combout\ & \TemporizadorUnBit_i|Equal0~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TemporizadorUnBit_i|Equal0~0_combout\,
	datac => \TemporizadorUnBit_i|Equal0~1_combout\,
	datad => \TemporizadorUnBit_i|Equal0~2_combout\,
	combout => \TemporizadorUnBit_i|Equal0~3_combout\);

-- Location: LCCOMB_X22_Y26_N28
\UnidadControl_i|Selector0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \UnidadControl_i|Selector0~0_combout\ = (\TemporizadorMedioBit_i|Equal0~1_combout\ & (\TemporizadorMedioBit_i|Equal0~0_combout\ & (\UnidadControl_i|estado_actual.Espera0Start~regout\ & \TemporizadorMedioBit_i|Equal0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TemporizadorMedioBit_i|Equal0~1_combout\,
	datab => \TemporizadorMedioBit_i|Equal0~0_combout\,
	datac => \UnidadControl_i|estado_actual.Espera0Start~regout\,
	datad => \TemporizadorMedioBit_i|Equal0~2_combout\,
	combout => \UnidadControl_i|Selector0~0_combout\);

-- Location: LCCOMB_X22_Y26_N12
\UnidadControl_i|Selector6~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \UnidadControl_i|Selector6~4_combout\ = (\UnidadControl_i|Selector6~2_combout\) # ((\UnidadControl_i|Selector0~0_combout\) # ((\UnidadControl_i|Selector6~3_combout\ & \TemporizadorUnBit_i|Equal0~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UnidadControl_i|Selector6~2_combout\,
	datab => \UnidadControl_i|Selector6~3_combout\,
	datac => \TemporizadorUnBit_i|Equal0~3_combout\,
	datad => \UnidadControl_i|Selector0~0_combout\,
	combout => \UnidadControl_i|Selector6~4_combout\);

-- Location: LCFF_X22_Y26_N21
\UnidadControl_i|estado_actual.EsperaStop\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \UnidadControl_i|Selector7~0_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \UnidadControl_i|Selector6~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \UnidadControl_i|estado_actual.EsperaStop~regout\);

-- Location: LCCOMB_X25_Y26_N10
\UnidadControl_i|Selector2~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \UnidadControl_i|Selector2~0_combout\ = (\UnidadControl_i|estado_actual.Registra~regout\ & (((!\ContadorM8_i|contador\(2)) # (!\ContadorM8_i|contador\(1))) # (!\ContadorM8_i|contador\(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ContadorM8_i|contador\(0),
	datab => \ContadorM8_i|contador\(1),
	datac => \UnidadControl_i|estado_actual.Registra~regout\,
	datad => \ContadorM8_i|contador\(2),
	combout => \UnidadControl_i|Selector2~0_combout\);

-- Location: LCCOMB_X22_Y26_N10
\UnidadControl_i|Selector2~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \UnidadControl_i|Selector2~2_combout\ = (\UnidadControl_i|Selector2~1_combout\) # ((\UnidadControl_i|Selector2~0_combout\) # ((!\e_s~combout\ & \UnidadControl_i|Selector0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UnidadControl_i|Selector2~1_combout\,
	datab => \e_s~combout\,
	datac => \UnidadControl_i|Selector2~0_combout\,
	datad => \UnidadControl_i|Selector0~0_combout\,
	combout => \UnidadControl_i|Selector2~2_combout\);

-- Location: LCFF_X22_Y26_N11
\UnidadControl_i|estado_actual.Espera1Bit\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \UnidadControl_i|Selector2~2_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \UnidadControl_i|estado_actual.Espera1Bit~regout\);

-- Location: LCCOMB_X23_Y26_N28
\UnidadControl_i|WideOr1~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \UnidadControl_i|WideOr1~0_combout\ = (\UnidadControl_i|estado_actual.EsperaBitParidad~regout\) # ((\UnidadControl_i|estado_actual.EsperaStop~regout\) # (\UnidadControl_i|estado_actual.Espera1Bit~regout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \UnidadControl_i|estado_actual.EsperaBitParidad~regout\,
	datac => \UnidadControl_i|estado_actual.EsperaStop~regout\,
	datad => \UnidadControl_i|estado_actual.Espera1Bit~regout\,
	combout => \UnidadControl_i|WideOr1~0_combout\);

-- Location: LCFF_X24_Y26_N3
\TemporizadorUnBit_i|contador[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \TemporizadorUnBit_i|Add0~0_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \UnidadControl_i|WideOr1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TemporizadorUnBit_i|contador\(0));

-- Location: LCCOMB_X23_Y26_N14
\TemporizadorUnBit_i|contador~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorUnBit_i|contador~3_combout\ = (\TemporizadorUnBit_i|Add0~6_combout\ & (((!\TemporizadorUnBit_i|Equal0~1_combout\) # (!\TemporizadorUnBit_i|Equal0~0_combout\)) # (!\TemporizadorUnBit_i|Equal0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TemporizadorUnBit_i|Equal0~2_combout\,
	datab => \TemporizadorUnBit_i|Equal0~0_combout\,
	datac => \TemporizadorUnBit_i|Add0~6_combout\,
	datad => \TemporizadorUnBit_i|Equal0~1_combout\,
	combout => \TemporizadorUnBit_i|contador~3_combout\);

-- Location: LCFF_X23_Y26_N15
\TemporizadorUnBit_i|contador[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \TemporizadorUnBit_i|contador~3_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \UnidadControl_i|WideOr1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TemporizadorUnBit_i|contador\(3));

-- Location: LCCOMB_X24_Y26_N30
\TemporizadorUnBit_i|Equal0~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorUnBit_i|Equal0~2_combout\ = (!\TemporizadorUnBit_i|contador\(2) & (\TemporizadorUnBit_i|contador\(0) & (\TemporizadorUnBit_i|contador\(1) & \TemporizadorUnBit_i|contador\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TemporizadorUnBit_i|contador\(2),
	datab => \TemporizadorUnBit_i|contador\(0),
	datac => \TemporizadorUnBit_i|contador\(1),
	datad => \TemporizadorUnBit_i|contador\(3),
	combout => \TemporizadorUnBit_i|Equal0~2_combout\);

-- Location: LCCOMB_X24_Y26_N18
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

-- Location: LCFF_X24_Y26_N19
\TemporizadorUnBit_i|contador[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \TemporizadorUnBit_i|Add0~16_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \UnidadControl_i|WideOr1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TemporizadorUnBit_i|contador\(8));

-- Location: LCCOMB_X24_Y26_N20
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

-- Location: LCCOMB_X23_Y26_N6
\TemporizadorUnBit_i|contador~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorUnBit_i|contador~1_combout\ = (\TemporizadorUnBit_i|Add0~18_combout\ & (((!\TemporizadorUnBit_i|Equal0~2_combout\) # (!\TemporizadorUnBit_i|Equal0~0_combout\)) # (!\TemporizadorUnBit_i|Equal0~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TemporizadorUnBit_i|Equal0~1_combout\,
	datab => \TemporizadorUnBit_i|Equal0~0_combout\,
	datac => \TemporizadorUnBit_i|Equal0~2_combout\,
	datad => \TemporizadorUnBit_i|Add0~18_combout\,
	combout => \TemporizadorUnBit_i|contador~1_combout\);

-- Location: LCFF_X23_Y26_N7
\TemporizadorUnBit_i|contador[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \TemporizadorUnBit_i|contador~1_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \UnidadControl_i|WideOr1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TemporizadorUnBit_i|contador\(9));

-- Location: LCCOMB_X24_Y26_N22
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

-- Location: LCFF_X24_Y26_N23
\TemporizadorUnBit_i|contador[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \TemporizadorUnBit_i|Add0~20_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \UnidadControl_i|WideOr1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TemporizadorUnBit_i|contador\(10));

-- Location: LCCOMB_X24_Y26_N24
\TemporizadorUnBit_i|Add0~22\ : cycloneii_lcell_comb
-- Equation(s):
-- \TemporizadorUnBit_i|Add0~22_combout\ = \TemporizadorUnBit_i|contador\(11) $ (\TemporizadorUnBit_i|Add0~21\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \TemporizadorUnBit_i|contador\(11),
	cin => \TemporizadorUnBit_i|Add0~21\,
	combout => \TemporizadorUnBit_i|Add0~22_combout\);

-- Location: LCCOMB_X23_Y26_N4
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

-- Location: LCFF_X23_Y26_N5
\TemporizadorUnBit_i|contador[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \TemporizadorUnBit_i|contador~0_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \UnidadControl_i|WideOr1~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \TemporizadorUnBit_i|contador\(11));

-- Location: LCCOMB_X23_Y26_N24
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

-- Location: LCCOMB_X23_Y26_N20
\UnidadControl_i|Selector3~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \UnidadControl_i|Selector3~0_combout\ = (\TemporizadorUnBit_i|Equal0~2_combout\ & (\TemporizadorUnBit_i|Equal0~0_combout\ & (\TemporizadorUnBit_i|Equal0~1_combout\ & \UnidadControl_i|estado_actual.Espera1Bit~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \TemporizadorUnBit_i|Equal0~2_combout\,
	datab => \TemporizadorUnBit_i|Equal0~0_combout\,
	datac => \TemporizadorUnBit_i|Equal0~1_combout\,
	datad => \UnidadControl_i|estado_actual.Espera1Bit~regout\,
	combout => \UnidadControl_i|Selector3~0_combout\);

-- Location: LCFF_X23_Y26_N21
\UnidadControl_i|estado_actual.Registra\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \UnidadControl_i|Selector3~0_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \UnidadControl_i|estado_actual.Registra~regout\);

-- Location: LCFF_X25_Y26_N13
\RegDesplIzq_i|reg[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \RegDesplIzq_i|reg[0]~feeder_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \UnidadControl_i|estado_actual.Registra~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \RegDesplIzq_i|reg\(0));

-- Location: LCCOMB_X25_Y26_N6
\RegDesplIzq_i|reg[1]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \RegDesplIzq_i|reg[1]~feeder_combout\ = \RegDesplIzq_i|reg\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \RegDesplIzq_i|reg\(0),
	combout => \RegDesplIzq_i|reg[1]~feeder_combout\);

-- Location: LCFF_X25_Y26_N7
\RegDesplIzq_i|reg[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \RegDesplIzq_i|reg[1]~feeder_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \UnidadControl_i|estado_actual.Registra~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \RegDesplIzq_i|reg\(1));

-- Location: LCCOMB_X25_Y26_N28
\RegDesplIzq_i|reg[2]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \RegDesplIzq_i|reg[2]~feeder_combout\ = \RegDesplIzq_i|reg\(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \RegDesplIzq_i|reg\(1),
	combout => \RegDesplIzq_i|reg[2]~feeder_combout\);

-- Location: LCFF_X25_Y26_N29
\RegDesplIzq_i|reg[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \RegDesplIzq_i|reg[2]~feeder_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \UnidadControl_i|estado_actual.Registra~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \RegDesplIzq_i|reg\(2));

-- Location: LCCOMB_X25_Y26_N2
\RegDesplIzq_i|reg[3]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \RegDesplIzq_i|reg[3]~feeder_combout\ = \RegDesplIzq_i|reg\(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \RegDesplIzq_i|reg\(2),
	combout => \RegDesplIzq_i|reg[3]~feeder_combout\);

-- Location: LCFF_X25_Y26_N3
\RegDesplIzq_i|reg[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \RegDesplIzq_i|reg[3]~feeder_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \UnidadControl_i|estado_actual.Registra~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \RegDesplIzq_i|reg\(3));

-- Location: LCCOMB_X25_Y26_N4
\RegDesplIzq_i|reg[4]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \RegDesplIzq_i|reg[4]~feeder_combout\ = \RegDesplIzq_i|reg\(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \RegDesplIzq_i|reg\(3),
	combout => \RegDesplIzq_i|reg[4]~feeder_combout\);

-- Location: LCFF_X25_Y26_N5
\RegDesplIzq_i|reg[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \RegDesplIzq_i|reg[4]~feeder_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \UnidadControl_i|estado_actual.Registra~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \RegDesplIzq_i|reg\(4));

-- Location: LCCOMB_X21_Y26_N12
\RegDesplIzq_i|reg[5]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \RegDesplIzq_i|reg[5]~feeder_combout\ = \RegDesplIzq_i|reg\(4)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \RegDesplIzq_i|reg\(4),
	combout => \RegDesplIzq_i|reg[5]~feeder_combout\);

-- Location: LCFF_X21_Y26_N13
\RegDesplIzq_i|reg[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \RegDesplIzq_i|reg[5]~feeder_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \UnidadControl_i|estado_actual.Registra~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \RegDesplIzq_i|reg\(5));

-- Location: LCCOMB_X21_Y26_N22
\RegDesplIzq_i|reg[6]~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \RegDesplIzq_i|reg[6]~feeder_combout\ = \RegDesplIzq_i|reg\(5)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \RegDesplIzq_i|reg\(5),
	combout => \RegDesplIzq_i|reg[6]~feeder_combout\);

-- Location: LCFF_X21_Y26_N23
\RegDesplIzq_i|reg[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \RegDesplIzq_i|reg[6]~feeder_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \UnidadControl_i|estado_actual.Registra~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \RegDesplIzq_i|reg\(6));

-- Location: LCFF_X21_Y26_N29
\RegDesplIzq_i|reg[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	sdata => \RegDesplIzq_i|reg\(6),
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	sload => VCC,
	ena => \UnidadControl_i|estado_actual.Registra~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \RegDesplIzq_i|reg\(7));

-- Location: LCCOMB_X22_Y26_N8
\UnidadControl_i|Selector6~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \UnidadControl_i|Selector6~0_combout\ = (\DetErrorParidad_i|error~regout\ & \UnidadControl_i|estado_actual.CompruebaParidad~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \DetErrorParidad_i|error~regout\,
	datad => \UnidadControl_i|estado_actual.CompruebaParidad~regout\,
	combout => \UnidadControl_i|Selector6~0_combout\);

-- Location: LCFF_X22_Y26_N9
\UnidadControl_i|estado_actual.ErrorParidad\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \UnidadControl_i|Selector6~0_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	ena => \UnidadControl_i|Selector6~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \UnidadControl_i|estado_actual.ErrorParidad~regout\);

-- Location: LCCOMB_X22_Y26_N22
\UnidadControl_i|Selector9~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \UnidadControl_i|Selector9~0_combout\ = (\UnidadControl_i|estado_actual.CompruebaStop~regout\ & (((!\DetectorFlanco_i|estado_act.Pulso~regout\ & \UnidadControl_i|estado_actual.ErrorTrama~regout\)) # (!\e_s~combout\))) # 
-- (!\UnidadControl_i|estado_actual.CompruebaStop~regout\ & (!\DetectorFlanco_i|estado_act.Pulso~regout\ & (\UnidadControl_i|estado_actual.ErrorTrama~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000010111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \UnidadControl_i|estado_actual.CompruebaStop~regout\,
	datab => \DetectorFlanco_i|estado_act.Pulso~regout\,
	datac => \UnidadControl_i|estado_actual.ErrorTrama~regout\,
	datad => \e_s~combout\,
	combout => \UnidadControl_i|Selector9~0_combout\);

-- Location: LCFF_X22_Y26_N23
\UnidadControl_i|estado_actual.ErrorTrama\ : cycloneii_lcell_ff
PORT MAP (
	clk => \clk~clkctrl_outclk\,
	datain => \UnidadControl_i|Selector9~0_combout\,
	aclr => \ALT_INV_reset_n~clkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \UnidadControl_i|estado_actual.ErrorTrama~regout\);

-- Location: PIN_B14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\s_p[0]~I\ : cycloneii_io
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
	datain => \RegDesplIzq_i|reg\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_s_p(0));

-- Location: PIN_A11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\s_p[1]~I\ : cycloneii_io
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
	datain => \RegDesplIzq_i|reg\(1),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_s_p(1));

-- Location: PIN_A13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\s_p[2]~I\ : cycloneii_io
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
	datain => \RegDesplIzq_i|reg\(2),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_s_p(2));

-- Location: PIN_B13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\s_p[3]~I\ : cycloneii_io
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
	datain => \RegDesplIzq_i|reg\(3),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_s_p(3));

-- Location: PIN_B11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\s_p[4]~I\ : cycloneii_io
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
	datain => \RegDesplIzq_i|reg\(4),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_s_p(4));

-- Location: PIN_H11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\s_p[5]~I\ : cycloneii_io
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
	datain => \RegDesplIzq_i|reg\(5),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_s_p(5));

-- Location: PIN_A10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\s_p[6]~I\ : cycloneii_io
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
	datain => \RegDesplIzq_i|reg\(6),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_s_p(6));

-- Location: PIN_B10,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\s_p[7]~I\ : cycloneii_io
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
	datain => \RegDesplIzq_i|reg\(7),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_s_p(7));

-- Location: PIN_D11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\led_error_paridad~I\ : cycloneii_io
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
	datain => \UnidadControl_i|estado_actual.ErrorParidad~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_led_error_paridad);

-- Location: PIN_G11,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\led_error_trama~I\ : cycloneii_io
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
	datain => \UnidadControl_i|estado_actual.ErrorTrama~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_led_error_trama);
END structure;


