--Temporizador tiempo de medio Bit para una transmisión de 19200 baudios
--y un reloj de 50MHz
--Contador Módulo 1302 con habilitador de la cuenta

library ieee;
	 use ieee. std_logic_1164 .all;
	 use ieee.numeric_std.all;

entity TemporizadorMedioBit is
  port (
					clk, reset_n : in std_logic;
          en           : in std_logic;   --Enable. 1 cuenta 0 mantiene
          s            : out std_logic); --Salida. 1 al acabar la cuenta
end TemporizadorMedioBit;

architecture behavioral of TemporizadorMedioBit is

  signal contador : unsigned(11 downto 0);

  begin --Behavioral

    ContadorM1302 : process(clk, reset_n, en)
      begin --process ContadorM1302
        if reset_n = '0' then
          contador <= (others => '0');
        elsif clk'event and clk = '1' then
          if en = '1' then
            if contador = to_unsigned(1301, 12) then
              --Cuando llega a 1302 vuelve a ponerse a 0
              contador <= (others => '0');
            else
              contador <= contador + 1;
            end if;
          end if;
        end if;
    end process ContadorM1302;

    s <= '1' when contador = to_unsigned(1301, 12) and en = '1' else
         '0';

end behavioral;
