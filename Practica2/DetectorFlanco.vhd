--Detector de flanco (mediante una máquina de Moore)

library ieee;
use ieee.std_logic_1164.all;

entity DetectorFlanco is
	port (
		e : in std_logic;
		reset : in std_logic;
		clk : in std_logic;
		s : out std_logic);

end DetectorFlanco;

architecture behavioral of DetectorFlanco is

type t_estados is (Esp1, Pulso, Esp0);
signal estado_act, estado_sig : t_estados;

begin --(behavioral)

	TransicionEstados : process (estado_act, e)
	begin
estado_sig <= estado_act; --(por defecto el estado siguiente permaneze igual al actual)

case estado_act is
	when Esp1 =>
		if e = '1' then
			estado_sig <= Pulso;
		end if; --(y en caso de que e <= '0'; se queda en lo fijado por defecto)
			when Pulso =>
				if e = '1' then
					estado_sig <= Esp0;
				else
					estado_sig <= Esp1;
				end if;
			when Esp0 =>
				if e = '0' then
					estado_sig <= Esp1;
				end if;
			when others =>
				estado_sig <= Esp1;
		end case;
	end process TransicionEstados;

	VariablesEstado : process (clk)
	begin
		if reset = '0' then
			estado_act <= Esp1;
elsif clk'event and clk = '1' then
			estado_act <= estado_sig;
		end if;
	end process VariablesEstado;

	Salidas : process (estado_act)
	begin
		s <= '0'; -- (ponemos la salida a '0' por defecto)
		case estado_act is
			when Esp1 =>
				s <= '0';
			when Pulso =>
				s <= '1';
			when Esp0 =>
				s <= '0';
			when others =>
				null;
		end case;
	end process Salidas;

end behavioral;