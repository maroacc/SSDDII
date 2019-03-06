-- Multiplexor entre lógica, multiplicación o suma/resta

library ieee;

use ieee.std_logic_1164.all;

entity MuxSalidas is

	generic (g_data_w : integer := 16);
	port ( e0, e1, e2		: in std_logic_vector (g_data_w - 1 downto 0); --Entradas
		sel 		: in std_logic_vector (1 downto 0); 	--Entradas Control
		s 			: out std_logic_vector (g_data_w - 1 downto 0));		    --Salida
	end MuxSalidas;

architecture behavioral of MuxSalidas is

begin --behavioral

with sel select

	s <= e0 when "00",
		 e1 when "01",
		 e2 when "10",
		 e3 when "11",
		 (others => '0') when others;

end behavioral;