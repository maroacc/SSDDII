--Multiplexor para pasar el registro nª X
--al descodificador de AsciiA16Seg

library ieee;
 use ieee. std_logic_1164 .all;

 entity MuxRegistroAASCII is
 port ( e_registro0 : in std_logic_vector(7 downto 0); --Entradas de los rregistros
        e_registro1 : in std_logic_vector(7 downto 0);
        e_registro2 : in std_logic_vector(7 downto 0);
        e_registro3 : in std_logic_vector(7 downto 0);
        e_registro4 : in std_logic_vector(7 downto 0);
        e_registro5 : in std_logic_vector(7 downto 0);
        e_registro6 : in std_logic_vector(7 downto 0);
        e_registro7 : in std_logic_vector(7 downto 0);
       sel          : in std_logic_vector (2 downto 0); --selector
       s            : out std_logic_vector(7 downto 0) ); -- Salida hacia el decodificador
 end MuxRegistroAASCII;

 architecture behavioral of MuxRegistroAASCII is
 begin -- behavioral

 with sel select
 s <= e_registro0 when "000",
      e_registro1 when "001",
      e_registro2 when "010",
      e_registro3 when "011",
      e_registro4 when "100",
      e_registro5 when "101",
      e_registro6 when "110",
      e_registro7 when "111",

      "00000000" when others;

 end behavioral ;
