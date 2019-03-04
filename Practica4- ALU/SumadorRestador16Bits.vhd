-- Sumador restador para números de 16 bits.
--Lo diseñaremos conectando en serie 16 sumadores de 1 bit

library ieee;
use ieee.std_logic_1164.all;

entity SumaResta16Bits is
	port(
		a, b : in std_logic_vector(4 downto 0); --Entradas
		s_r : in std_logic;
		s : out std_logic_vector(15 downto 0); --Salida
		ov : out std_logic); --Acarreo de salida

end SumaResta16Bits;

architecture structural of SumaResta16Bits is
	signal c : std_logic_vector(5 downto 0); --(acarr. intermed.)
	signal b_i : std_logic_vector (15 downto 0);

component Sumador1Bit
		port(
			a_i, b_i  :  in std_logic;
			c_i  :  in std_logic;
			s_i  :  out std_logic;
			c_i_mas_1 : out std_logic);
	end component;

begin --(structural)
	c(0) <= s_r;
	ov <= c(16) xor c(15);

	b_i <= b xor s_r&s_r&s_r&s_r&s_r;

	GenSum : for i in 0 to 15 generate
		i_Sumador1Bit : Sumador1Bit
			port map(
				a_i => a(i),
				b_i => b_i(i),
				c_i => c(i),
				s_i => s(i),
				c_i_mas_1 => c(i+1));
	end generate GenSum;
end structural;
