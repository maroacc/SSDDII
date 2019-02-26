library ieee;
use ieee.std_logic_1164.all;

entity MuxEmi is
    port(
        sel     : in  std_logic_vector(1 downto 0);
        start   : in  std_logic;
        datos   : in  std_logic;
        paridad : in  std_logic;
        stop_sal: in  std_logic;
        salida  : out std_logic
    );
end MuxEmi;

architecture behavioural of MuxEmi is
begin
    with sel select
    salida <=
        start   when "00",
        datos   when "01",
        paridad when "10",
        stop_sal when "11",
        '0'     when others;
end behavioural;
