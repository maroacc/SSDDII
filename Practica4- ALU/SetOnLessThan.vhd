--Set on Less Than

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;

entity SetOnLessThan is
  generic(
		g_data_w : integer := 16);
	port ( a, b : in std_logic_vector (g_data_w - 1 downto 0);
			s : out std_logic_vector (g_data_w - 1 downto 0));

end SetOnLessThan;
architecture behavioral of SetOnLessThan is
begin

s <= std_logic_vector(to_unsigned(0,g_data_w)) when (unsigned(a) < unsigned(b)) else (others => '0');

end behavioral;