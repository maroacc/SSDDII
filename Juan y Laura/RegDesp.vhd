library ieee;
use ieee.std_logic_1164.all;

entity RegDesp is 
	port(
		enable, clk, reset_n 			: in 	std_logic;
		cargar 								: in  std_logic;
		carga									: in  std_logic_vector(7 downto 0);
		salida 								: out	std_logic
	);
end RegDesp;

architecture behavioural of RegDesp is
	signal desp_int : std_logic_vector (7 downto 0);
begin
	process(clk, reset_n)
	begin
		if reset_n='0' then
			desp_int<= (others=>'0');
		elsif clk' event and clk='1' then
			if cargar = '1' then
					desp_int <= carga;
			end if;
			if enable='1' then
					desp_int(7) <= '0';
					desp_int(6 downto 0) <= desp_int(7 downto 1);
			end if;
		end if;
	end process;
	salida<=desp_int(0);	
end behavioural;