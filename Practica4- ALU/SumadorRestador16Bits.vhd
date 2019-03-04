-- Sumador para números de N bits.
-- Se usa una descripcion en alto nivel usando el
-- operador suma con tipos signed.

library ieee;
use ieee. std_logic_1164 .all;
use ieee. numeric_std .all;

entity Sumador4BitsAN is
 generic (g_data_w : integer := 16);
 port (
 a, b : in std_logic_vector (g_data_w - 1 downto 0); -- Entradas
 s : out std_logic_vector (g_data_w - 1 downto 0); -- Salida
 co : out std_logic ); -- Acarreo de salida

 end Sumador4BitsAN ;

 architecture behavioral of Sumador4BitsAN is
 signal s_int : signed (g_data_w downto 0);
 begin -- behavioral

 s_int <= signed ('0'& a)+ signed ('0'&b);
 s <= std_logic_vector (s_int (g_data_w - 1 downto 0));
 co <= s_int (g_data_w);

 end behavioral ;
