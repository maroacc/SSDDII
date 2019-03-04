-- Sumador para números de N bits.
-- Se usa una descripcion en alto nivel usando el
-- operador suma con tipos signed.

library ieee;
use ieee. std_logic_1164 .all;
use ieee. numeric_std .all;

entity SumadorRestador16Bits is
 generic (g_data_w : integer := 16);
 port (
 a : in std_logic_vector (g_data_w - 1 downto 0);
 b : in std_logic_vector (g_data_w - 1 downto 0); -- Entradas
 sr : in std_logic; -- 0 suma 1 resta
 s : out std_logic_vector (g_data_w - 1 downto 0); -- Salida
 co : out std_logic ); -- Acarreo de salida

end entity ;

 architecture behavioral of SumadorRestador16Bits is
 signal s_int : signed (g_data_w downto 0);
 begin -- behavioral

 s_int <= signed (a(15) & a)+ signed (b(15) & b) when sr = '0'
          else signed ( a(15) & a) - signed ( b(15) & b);
 s <= std_logic_vector (s_int (g_data_w - 1 downto 0));
 co <= s_int (g_data_w);

 end behavioral ;
