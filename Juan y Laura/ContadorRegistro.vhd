library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ContadorRegistro is
	  port(
		 en, reset_n, clk : in  std_logic; -- en = enable
		 finCuenta      : out std_logic
	  );
end ContadorRegistro;

architecture behavioural of ContadorRegistro is
  signal cuenta : unsigned(2 downto 0);
begin
  process(clk, reset_n)
	begin
		if reset_n='0' then
			cuenta<= (others=>'0');
		elsif clk'event and clk='1' then
			if en = '1' and cuenta < to_unsigned(7,3) then
				cuenta <= cuenta + 1;
			end if;
		end if;
	end process;

  finCuenta <= '1' when cuenta = to_unsigned(7,3) else
               '0';
end behavioural;
