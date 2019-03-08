--Multiplexor 4 a 1

library ieee;
 use ieee. std_logic_1164 .all;

 entity Mux4A1 is
 port ( e0          : in std_logic_vector(2 downto 0);
        e1          : in std_logic_vector(2 downto 0);
        e2          : in std_logic_vector(2 downto 0);
        e3          : in std_logic_vector(2 downto 0);
        sel          : in std_logic_vector (1 downto 0);
        s            : out std_logic_vector(2 downto 0) );
 end Mux4A1;

 architecture behavioral of Mux4A1 is
 begin -- behavioral

 with sel select
 s <= e0 when "00",
      e1 when "01",
      e2 when "10",
      e3 when "11",
      (others => '0') when others;

 end behavioral ;
