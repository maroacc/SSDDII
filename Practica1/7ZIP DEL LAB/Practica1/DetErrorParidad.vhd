
--Detector de errores de paridad
--Comprueba que el número de 1 recibidos sea igual que el indicado en el bit de CalcParidad
--Tan solo se puede saber si el número es par o impar, falla si hay 2 errores
--Bit de paridad: 0 par, 1 impar

library ieee;
	 use ieee. std_logic_1164 .all;
	 use ieee.numeric_std.all;

entity DetErrorParidad is
port (
  clk : in std_logic;
  reset_n : in std_logic;
  clear_n   : in std_logic; --resetea el valor de la señal paridad desde la unidad de control
  e_s : in std_logic;    -- Entrada serie
  en : in std_logic; 	   -- Enable para la suma parcial
  comprobar : in std_logic;     -- Enable para comprobar si hay un error de paridad
  error : out std_logic );  -- 1 incorrecto 0 correcto

end DetErrorParidad;

architecture behavioral of DetErrorParidad is

signal paridad : std_logic;
begin

CalcParidad : process (clk,reset_n,en)
	begin
	if reset_n = '0' then
		paridad <= '0';
	elsif clk'event and clk = '1' then
		if clear_n = '0' then
			paridad <= '0';
		elsif en = '1' then
				paridad <= paridad xor e_s;
		end if;
	end if;
end process CalcParidad;

ComprobarParidad : process (clk, reset_n, comprobar)
  begin
    if reset_n = '0' then
      error <= '0';
    elsif clk'event and clk = '1' then
      if comprobar = '1' then
        if ((paridad xor e_s) = '0') then
          error <= '1';
        end if;
      end if;
    end if;
  end process ComprobarParidad;
 

  end behavioral;