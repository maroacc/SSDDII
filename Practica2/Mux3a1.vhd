library ieee;
  use ieee.std_logic_1164.all;

entity Mux3a1 is
  port(e2, e1, e0   : in std_logic;
      sel           : in std_logic_vector(1 downto 0);
      s             : out std_logic);
end Mux3a1;

architecture behavioral of Mux3a1 is
begin
  with sel select
    s <=  e0  when "00",
          e1  	when "01",
          e2  when "11",
          '1'	when others;

end behavioral;


