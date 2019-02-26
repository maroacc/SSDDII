--Selector que activa una de las señales DigitoX en función del número (X) del contador M8
--Se trata de un Multiplexor en el que x es sel

library ieee;
 use ieee. std_logic_1164 .all;

 entity SelectorDigito is
   port (clk        : in std_logic;
         reset_n    : in std_logic;
         x          : in std_logic_vector(2 downto 0);  -- Salida del Contador
         s          : out std_logic_vector(7 downto) ); -- Nº de dígito que se activaS
 end entity;

 architecture behavioral of SelectorDigito is

 begin

   with x select
    s <= "00000001" when "000",
         "00000010" when "001",
         "00000100" when "010",
         "00001000" when "011",
         "00010000" when "100",
         "00100000" when "101",
         "01000000" when "110",
         "10000000" when "111",



 end architecture;
