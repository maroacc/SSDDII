--Receptor serie RS-232 para recibir datos de un PC y mostrarlos en ˜
--binario en los LEDs de una tarjeta DE1

--Entrada en serie de 8 Bits más bit de Start, Stop y paridad.

library ieee;
use ieee.std_logic_1164.all;

entity ReceptorSerie is
  port ( clk, reset_n   : in std_logic;
         e_s            : in std_logic;                      --Entrada en serie
         s_p           			   : out std_logic_vector(7 downto 0);  --Salida Paralelo conectada a Leds Verdes
         led_error_paridad       : out std_logic;            --0 correcto 1 incorrecto (Led Rojo0)
         led_error_trama         : out std_logic);           --0 correcto 1 incorrecto (incorrecto si bit Stop = 0) (Led Rojo1)

end ReceptorSerie;

architecture structural of ReceptorSerie is

signal not_e_s, flanco_bajada : std_logic;
signal en_contador_medio_bit_i, en_contador_un_bit_i, en_contador_M8_i : std_logic;
signal contador_medio_bit_i, contador_un_bit_i, contador_M8_i : std_logic;
signal error_paridad_i, en_registro_i, en_det_paridad_i, comprueba_i : std_logic;

component DetectorFlanco
  port (
    e     : in  std_logic;
    reset : in  std_logic;
    clk   : in  std_logic;
    s     : out std_logic
  );
end component DetectorFlanco;

component TemporizadorMedioBit is
  port (  clk, reset_n : in std_logic;
          en           : in std_logic;   --Enable. 1 cuenta 0 mantiene
          s            : out std_logic); --Salida. 1 al acabar la cuenta
end component;

component TemporizadorUnBit is
  port (  clk, reset_n : in std_logic;
          en           : in std_logic;   --Enable. 1 cuenta 0 mantiene
          s            : out std_logic); --Salida. 1 al acabar la cuenta
end component;

component ContadorM8
  port (
					clk, reset_n : in std_logic;
          en           : in std_logic;   --Enable. 1 cuenta 0 mantiene
          s            : out std_logic); --Salida. 1 al acabar la cuenta
end component;


component UnidadControl is
  port (clk                     : in std_logic;
        reset_n                 : in std_logic;
        e_s                     : in std_logic;  --Entrada en serie
        flanco_bajada           : in std_logic;  --Flanco de bajada del comienzo del Bit Start
        contador_medio_bit      : in std_logic;  --Fin contador M1302
        contador_un_bit         : in std_logic;  --Fin contador M2604
        contador_M8             : in std_logic;  --1 al terminar los 8 bits de la señal
        error_paridad           : in std_logic;  --0 correcto 1 incorrecto
        en_contador_medio_bit   : out std_logic; --Enable
        en_contador_un_bit      : out std_logic; --Enable
        en_contador_M8          : out std_logic; --Enable
        en_registro             : out std_logic; --Enable registro de desplazamiento
        en_det_paridad          : out std_logic; --Enable suma parcial del detector de error de paridad
        comprueba               : out std_logic; --Enable comprobar paridad
        led_error_paridad       : out std_logic; --0 correcto 1 incorrecto
        led_error_trama         : out std_logic);--0 correcto 1 incorrecto (incorrecto cuando el bit de stop es 0)

end component;

component DetErrorParidad is

port (
      	 clk 			     : in std_logic ;
      	 reset_n 		   : in std_logic ;
      	 e_s 			     : in std_logic ;    -- Entrada serie
      	 en 		       : in std_logic; 	   -- Enable para la suma parcial
         comprobar     : in std_logic;     -- Enable para comprobar si hay un error de paridad
      	 error 			   : out std_logic );  -- 0 correcto 1 incorrecto

end component;

component RegDesplIzq is
generic (
	g_n_bits : integer := 8); -- Número de bits del registro

port (
	clk : in std_logic ; -- Reloj
	reset_n : in std_logic ; -- Reset asíncrono
	ent_ser : in std_logic ; -- Entrada Serie
	enable : in std_logic ; -- Enable para despl.
	-- salida paralelo
	sal_par : out std_logic_vector (g_n_bits -1 downto 0));

end component;

begin --structural

not_e_s <= not(e_s);

DetectorFlanco_i : DetectorFlanco
port map (
  e     => not_e_s,
  reset => reset_n,
  clk   => clk,
  s     => flanco_bajada
);

TemporizadorMedioBit_i : TemporizadorMedioBit
  port map (
					clk => clk,
          reset_n => reset_n,
          en => en_contador_medio_bit_i,
          s => contador_medio_bit_i);

TemporizadorUnBit_i : TemporizadorUnBit
  port map (
					clk => clk,
          reset_n => reset_n,
          en => en_contador_un_bit_i,
          s => contador_un_bit_i);
ContadorM8_i : ContadorM8
  port map (
  clk => clk,
  reset_n => reset_n,
  en => en_contador_M8_i,
  s => contador_M8_i);

  UnidadControl_i : UnidadControl
    port map (clk => clk,
          reset_n => reset_n,
          e_s => e_s,
          flanco_bajada => flanco_bajada,
          contador_medio_bit => contador_medio_bit_i,
          contador_un_bit => contador_un_bit_i,
          contador_M8 => contador_M8_i,
          error_paridad => error_paridad_i,
          en_contador_medio_bit => en_contador_medio_bit_i,
          en_contador_un_bit => en_contador_un_bit_i,
          en_contador_M8 => en_contador_M8_i,
          en_registro => en_registro_i,
          en_det_paridad => en_det_paridad_i,
          comprueba => comprueba_i,
          led_error_paridad => led_error_paridad,
          led_error_trama => led_error_trama);

DetErrorParidad_i : DetErrorParidad
port map (
    	 clk => clk,
    	 reset_n => reset_n,
    	 e_s => e_s,
    	 en => en_det_paridad_i,
       comprobar => comprueba_i,
    	 error => error_paridad_i);

RegDesplIzq_i : RegDesplIzq

port map (
        clk => clk,
       	reset_n => reset_n,
       	ent_ser => e_s,
       	enable => en_registro_i,
       	sal_par => s_p);

end structural;
