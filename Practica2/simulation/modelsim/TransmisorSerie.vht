LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY TransmisorSerie_vhd_tst IS
END TransmisorSerie_vhd_tst;

ARCHITECTURE TransmisorSerie_arch OF TransmisorSerie_vhd_tst IS
-- constants
	constant c_clk_semiperiod : time := 10ns;
-- signals
SIGNAL clk : STD_LOGIC := '0';
SIGNAL e_p : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL pulsador : STD_LOGIC;
SIGNAL reset_n : STD_LOGIC;
SIGNAL s_s : STD_LOGIC;
SIGNAL paridad_i, bit_par_i : STD_LOGIC;

COMPONENT TransmisorSerie
	PORT (
	clk : IN STD_LOGIC;
	e_p : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	pulsador : IN STD_LOGIC;
	reset_n : IN STD_LOGIC;
	s_s : OUT STD_LOGIC
	);
END COMPONENT;

BEGIN --architecture

	i1 : TransmisorSerie
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	e_p => e_p,
	pulsador => pulsador,
	reset_n => reset_n,      6
	s_s => s_s
	);

	clk <= not clk after c_clk_semiperiod;

always : PROCESS
-- optional sensitivity list
-- (        )
-- variable declarations
BEGIN
	--InicializaciÃ³n de las variables
	e_p <= "00000000";

	--Acctivamos el reset durante 100 ns
  reset_n <= '0';
  pulsador <= '1';
  wait for 100 ns;
  reset_n <= '1';
  wait for 5 ns;

  for i in 0 to 255 loop
	e_p <= std_logic_vector(to_unsigned(i, 8));
	--e_p <= "01010101";
	wait for 10 ns;

	pulsador <= '0';
	wait for 26041 ns;
	pulsador <= '1';

	assert s_s = '0'
		report "Error en el bit de Start"
		severity failure;
	wait for 52083.3 ns;

	for j in 0 to 7 loop
		assert s_s = e_p(j)
			report "Error la transmision"
			severity warning;
		wait for 52083.3 ns;

	end loop;

	paridad_i <= (e_p(7) xor e_p(6)) xor (e_p(5) xor e_p(4)) xor (e_p(3) xor e_p(2)) xor (e_p(1) xor e_p(0));
	wait for 1 ns;
	bit_par_i <= not(paridad_i); -- (para paridad correcta)
	wait for 1 ns;

	assert s_s = bit_par_i
			report "Error paridad"
			severity failure;
	wait for 52083.3 ns;

	assert s_s = '1'
			report "Error bit stop"
			severity failure;
	end loop;

assert false
  report "Fin de la simulacion."
  severity failure;

WAIT;
END PROCESS always;
END TransmisorSerie_arch;
