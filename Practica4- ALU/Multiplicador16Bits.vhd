-- Multiplicador 16 Bits con o sin signo

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity Multiplicador16Bits is
	generic(
		g_data_w : integer := 16);
	port ( a, b : in std_logic_vector (g_data_w - 1 downto 0); --Entradas
			signo : in std_logic; --(si es 0: sin signo; si es 1: con signo)
			z     : out std_logic; --se activa cuando el resultado es cero
			p : out std_logic_vector (g_data_w - 1 downto 0); --Salida
			ov : out std_logic --Overflow
	);

end Multiplicador16Bits;

architecture behavioral of Multiplicador16Bits is
	signal p_i : std_logic_vector (2*g_data_w - 1 downto 0);

	begin --behavioral

	p_i <= std_logic_vector(unsigned(a)*unsigned(b)) when signo = '0' else
					std_logic_vector(signed(a)*signed(b));
	p <= p_i (g_data_w - 1 downto 0);
	--Nota: para determinar si hay overflow o no, se comprueba si todos los bits superiores al bit donde se trunca
	--tienen el mismo valor que el bit mas significtivo que se enviará a la salida (representan el signo)
	ov <= '0' when (p_i(2*g_data_w - 1 downto g_data_w - 1) = std_logic_vector(to_unsigned(0,g_data_w + 1))
						or (p_i(2*g_data_w - 1 downto g_data_w - 1)) = std_logic_vector(to_unsigned(2**g_data_w ,g_data_w + 1))) else
			'1';
	z <= '0' when p_i = std_logic_vector(to_unsigned(0,2*g_data_w-1)) else
			'1';
end behavioral;
