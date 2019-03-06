-- Unidad de Funciones Lógicas

-- (Bloque diseñado a partir de los diagramas e indicaciones que se nos
--ofrecieron en el enunciado de una práctica similar a esta realizada el
--anterior cuatrimestre)

library ieee;
	use ieee.std_logic_1164.all;

entity UnidadFuncionesLogicas is
  generic(
		g_data_w : integer := 16);
	port ( a, b : in std_logic_vector (g_data_w - 1 downto 0);
		   		sel_log : in std_logic_vector (1 downto 0);
					s : out std_logic_vector (g_data_w - 1 downto 0));

end UnidadFuncionesLogicas;

architecture behavioral of UnidadFuncionesLogicas is
	signal a_izq_i : std_logic_vector(g_data_w - 1 downto 0);
	signal a_der_aritmetico_i : std_logic_vector(g_data_w - 1 downto 0);
	signal a_der_logico_i : std_logic_vector(g_data_w - 1 downto 0);
begin --behavioral

a_izq_i(g_data_w - 1 downto 1) <= a(g_data_w - 2 downto 0);
a_izq_i(0) <= '0';

a_der_aritmetico_i(g_data_w - 2 downto 0) <= a(g_data_w - 1 downto 1);
a_der_aritmetico_i(g_data_w - 1) <= a(g_data_w - 1);

a_der_logico_i(g_data_w - 2 downto 0) <= a(g_data_w - 1 downto 1);
a_der_logico_i(g_data_w - 1) <= '0';

with sel_log select
	s <= a nand b when "00",
		 a_izq_i when "01",
		 a_der_aritmetico_i when "10",
		 a_der_logico_i when "11",
		 (others => '0') when others;

end behavioral;
