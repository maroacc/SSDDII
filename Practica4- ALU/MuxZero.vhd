-- Multiplexor entre lógica, multiplicación o suma/resta

library ieee;

use ieee.std_logic_1164.all;

entity MuxZero is

	generic (g_data_w : integer := 16);
	port ( e0		: in std_logic; --z del multiplicador
			 	 e1		: in std_logic;   --z del sumador restador
				 sel 		: in std_logic; 	--Entradas Control
				 s 			: out std_logic);		    --Salida
	end MuxZero;

architecture behavioral of MuxZero is

begin --behavioral

with sel select

	s <= e0 when '0',
		 	 e1 when '1',
		 	 '0' when others;

end behavioral;
