-- Unidad de control

library ieee;
use ieee.std_logic_1164.all;

entity UnidadControl is

port (	sel : in std_logic_vector (2 downto 0); -- Indica la función seleccionda
		sel_s : out std_logic_vector (1 downto 0); -- Indica internamente la función 00 suma 01 mult. 10 logica 11 less than
		s_r : out std_logic; -- 0 Suma. 1 Resta.
		signo : out std_logic; --signo multiplicacion
		sel_log : out std_logic_vector (1 downto 0) --Selecciona la funcion lógica
		control_z : out std_logic --Indica si activar el multiplexor de salida a cero del sumador
											--restador o del multiplicador
		);

end UnidadControl;

architecture behavioral of UnidadControl is

begin

	with sel select
		sel_s <= "00" when "0000",
				 "00" when "0001",
				 "01" when "0010",
				 "01" when "0011",
				 "10" when "0100",
				 "10" when "0101",
				 "10" when "0110",
				 "10" when "0111",
				 "11" when "0100",
				 "00" when others;

	with sel select
		s_r <= '0' when "0000",
			   '1' when "0001",
			   '-' when others;

	with sel select
		signo <= '1' when "0010",
			   		 '0' when "0011",
			   		 '-' when others;

	with sel select
		control_z <= '0' when "0000", --sumador/restador
								 '0' when "0001", --sumador/restador
			   		 		 '1' when "0010", --multiplicador
								 '1' when "0011", --multiplicador
			   		 		 '-' when others;

	with sel select
		sel_log <=	"00" when "0100", --nand
					"01" when "0101", --desplaza a la izquierda
					"10" when "0110", --desp. derecha aritmetico
					"11" when "0111", --desp. derecha logico
					"--" when others;

	with sel select
	control_z <='0' when "0000",
					'0' when "0001",
					'1' when "0010",
					'1' when "0111",
					"--" when others;

end behavioral;
