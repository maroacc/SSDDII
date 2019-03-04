-- Sumador para números de 4 bits.
-- Se usa una descripci ón en alto nivel usando el
-- operador suma con tipos unsigned.

library ieee;
use ieee. std_logic_1164 .all;
use ieee. numeric_std .all;

entity Sumador4BitsAN is
 port (
 a, b : in std_logic_vector (15 downto 0); -- Entradas
 s : out std_logic_vector (15 downto 0); -- Salida
 co : out std_logic ); -- Acarreo de salida

 end Sumador4BitsAN ;

 architecture behavioral of Sumador4BitsAN is
 signal s_int : signed (16 downto 0);
 begin -- behavioral

 s_int <= signed ('0'& a)+ signed ('0'&b);
 s <= std_logic_vector (s_int (15 downto 0));
 co <= s_int (16);

 end behavioral ;
