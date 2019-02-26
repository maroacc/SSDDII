-- Sumador para números de N bits.
-- Se usa una descripci ón en alto nivel usando el
-- operador suma con tipos unsigned.

 library ieee;
 use ieee. std_logic_1164 .all;
 use ieee. numeric_std .all;

 entity SumadorNBits is
	 
	 generic ( g_data_w : integer := 32);
	 
	 port (a, b : in std_logic_vector (g_data_w -1 downto 0); -- Entradas
			 s : out std_logic_vector (g_data_w -1 downto 0); -- Salida
			 c_out : out std_logic ); -- Acarreo de salida

 end SumadorNBits ;

 architecture behavioral of SumadorNBits is
 signal s_int : unsigned (g_data_w downto 0);

 begin -- behavioral

 s_int <= unsigned ('0'& a)+ unsigned ('0' & b);
 s <= std_logic_vector (s_int (g_data_w -1 downto 0));
 c_out <= s_int (g_data_w);

 end behavioral ;
