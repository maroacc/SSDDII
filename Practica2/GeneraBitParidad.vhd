--Bloque que genera el bit de paridad
--Si la paridad del byte que se va a enviar es impar, el bit de paridad
--ha de valer '0' para mantener la paridad impar
--Si la paridad es par, el bit de paridad ha de valer '1' para que la paridad
--de todo el conjunto sea impar

library ieee;
	 use ieee. std_logic_1164 .all;
	 use ieee.numeric_std.all;

entity GeneraBitParidad is
	port (
  	clk : in std_logic;
  	reset_n : in std_logic;
  	e_p : in std_logic_vector(7 downto 0);    -- Entrada en paralelo
  	en : in std_logic; 	   -- Enable para calcular la paridad
  	bit_paridad : out std_logic );

end GeneraBitParidad;

architecture behavioral of GeneraBitParidad is

signal paridad : std_logic;
begin

CalcParidad : process (clk,reset_n,en)
	begin
	if reset_n = '0' then
		paridad <= '0';
	elsif clk'event and clk = '1' then
		if en = '1' then
			paridad <= (e_p(7) xor e_p(6)) xor (e_p(5) xor e_p(4)) xor (e_p(3) xor e_p(2)) xor (e_p(1) xor e_p(0));
		end if;
	end if;
end process CalcParidad;

GeneraBit : process (clk, reset_n, paridad)
  begin
    if reset_n = '0' then
      bit_paridad <= '1'; -- (si se activa el reset, paridad valdrá '0')
    elsif clk'event and clk = '1' then
      if paridad = '1' then
        bit_paridad <= '0';
			elsif paridad = '0' then
				bit_paridad <= '1';
    	end if;
    end if;
  end process GeneraBit;

  end behavioral;



