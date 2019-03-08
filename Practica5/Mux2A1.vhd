--Multiplexor 2 a 1

library ieee;
 use ieee. std_logic_1164 .all;

 entity Mux2A1 is
 port ( e0          : in std_logic_vector(16 downto 0);
        e1          : in std_logic_vector(16 downto 0);
        sel          : in std_logic;
        s            : out std_logic_vector(16 downto 0) );
 end Mux2A1;

 architecture behavioral of Mux2A1 is
 begin -- behavioral

 with sel select
 s <= e0 when '0',
      e1 when '1',
      '0' when others;

 end behavioral ;
