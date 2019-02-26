
-- Registro de desplazamiento con entrada serie y salida
-- paralelo de N bits hacia la dcha

library ieee;
use ieee. std_logic_1164 .all;

entity RegDesplDcha is

generic (
	g_n_bits : integer := 8); -- Número de bits del registro

port (
	clk : in std_logic ; -- Reloj
	reset_n : in std_logic ; -- Reset asíncrono
	ent_ser : in std_logic ; -- Entrada Serie
	enable : in std_logic ; -- Enable para despl.
	-- salida paralelo
	sal_par : out std_logic_vector (g_n_bits -1 downto 0));

end RegDesplDcha;

architecture behavioral of RegDesplDcha is
signal reg : std_logic_vector (g_n_bits -1 downto 0);
begin -- behavioral

	Registro : process (clk , reset_n)
	begin
	if reset_n = '0' then
	reg <= (others => '0');
	elsif clk 'event and clk = '1' then
		if enable = '1' then
		reg (7) <= ent_ser;
		reg(g_n_bits -2 downto 0) <= reg(g_n_bits -1 downto 1);
		end if;
	end if;
	end process Registro;

-- Copiamos el registro a la salida
sal_par <= reg;

end behavioral;