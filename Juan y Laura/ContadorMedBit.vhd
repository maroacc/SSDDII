library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ContadorMedBit is
	port(
		enable			: in std_logic;
		clk, reset_n	: in std_logic;
		salida			: out std_logic
	);
end ContadorMedBit;
architecture behavioural of ContadorMedBit is
	signal cuenta : unsigned(10 downto 0);
begin
	process(clk, reset_n)
	begin
		if reset_n='0' then
			cuenta<= (others=>'0');
		elsif clk'event and clk='1' then
			if enable = '1' and cuenta< to_unsigned(1301,12) then
				cuenta <= cuenta + 1;
			else
				cuenta<= (others=>'0');
			end if;
		end if;
	end process;
	salida<='1' when cuenta=to_unsigned(1301,12)and enable = '1' else
				'0';
end behavioural;
