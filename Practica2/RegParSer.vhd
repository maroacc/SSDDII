-- Registro de desplazamiento
-- (Entrada paralelo y salida serie)

library ieee;
  use ieee.std_logic_1164.all;

entity RegParSer is
  port (clk                 : in std_logic;
        reset_n             : in std_logic;
		  carga 					 : in std_logic;
        desplaza            : in std_logic; -- activa el desplazamiento en el registro
        e_p                 : in std_logic_vector(8 downto 0);  --Entrada en paralelo
        s_s                 : out std_logic); -- Salida serie

end RegParSer;

architecture behavioral of RegParSer is
  signal registro : std_logic_vector(9 downto 0);
begin --behavioral
  Registra : process (clk, reset_n)
  begin
    if reset_n = '0' then
      registro <= (others => '0');
    elsif clk'event and clk = '1' then
		if carga = '1' then
			registro <= e_p & '0';
      elsif desplaza = '1' then
        registro(9) <= '0';
        registro(8 downto 0) <= registro(9 downto 1);
      end if;
    end if;
  end process Registra;

  s_s <= registro(0); -- (Sale el bit menos significativo)

end behavioral;

