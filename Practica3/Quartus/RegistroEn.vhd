--Registro con control de carga para almacenar el código ASCII
-- del carácter a representar en cada uno de los dígitos

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity RegistroEn is
  port ( clk     : in std_logic;
         reset_n : in std_logic;
         e       : in  std_logic_vector(7 downto 0);    -- Entrada en ASCII
         s       : out std_logic_vector(7 downto 0));   -- Salida en ASCII
end RegistroEn;

architecture behavioral of RegistroEn is

  begin --architecture

    process(clk, reset_n)
      begin --process

      if reset_n = '0' then
        s <= (others => '0');
      elsif clk'event and clk = '1' then
         s <= e;
      end if;

    end process;
end behavioral;
