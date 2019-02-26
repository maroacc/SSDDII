--Contador Módulo 400000 Ascendente con habilitador de la cuenta

library ieee;
	 use ieee. std_logic_1164 .all;
	 use ieee.numeric_std.all;

entity ContadorM400000 is
  port (
					clk, reset_n : in std_logic;
          s            : out std_logic); --Salida. 1 al acabar la cuenta
end ContadorM400000;

architecture behavioral of ContadorM400000 is

  signal contador : unsigned(3 downto 0);

  begin --Behavioral

    ContadorM400000Asc : process(clk, reset_n)
      begin --process ContadorM400000Asc
        if reset_n = '0' then
          contador <= (others => '0');
        elsif clk'event and clk = '1' then
            if contador = to_unsigned(399999, 4) then
              contador <= (others => '0');
            else
              contador <= contador + 1;
            end if;
        end if;
    end process ContadorM400000Asc;

    s <= '1' when contador = to_unsigned(399999, 4) else
         '0';

end behavioral;
