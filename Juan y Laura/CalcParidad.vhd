library ieee;
use ieee.std_logic_1164.all;

entity CalcParidad is
    port(
        reg        : in std_logic_vector(7 downto 0);
        paridad    : out std_logic;
        reset_n, clk    : in std_logic
    );
end CalcParidad;
architecture behavioural of CalcParidad is
    signal parid_impar : std_logic;
begin
    process(clk,reset_n)
    begin
        if reset_n='0' then
            parid_impar <='1';
        elsif clk'event and clk='1' then
             parid_impar<= (reg(0) xor reg(1) xor reg(2) xor reg(3) xor reg(4) xor reg(5) xor reg(6) xor reg(7));
		  end if;
    end process;
    paridad <= parid_impar;
end behavioural;
