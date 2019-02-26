--Transmisor serie RS-232 para enviar datos en serie desde una tarjeta DE1
--a un PC

library ieee;
use ieee.std_logic_1164.all;

entity TransmisorSerie is
  port ( clk, reset_n            : in std_logic;
         e_p                     : in std_logic_vector(7 downto 0); --Entrada paralelo
         pulsador                : in std_logic; --Activa la transmisión
         s_s                     : out std_logic); --Salida serie

end TransmisorSerie;

architecture structural of TransmisorSerie is

  signal contador_un_bit_i, contador_M10_i, en_contador_un_bit_i, not_pulsador_i, pulsador_i : std_logic;
  signal en_contador_M10_i, en_registro_i, en_calc_paridad_i, bit_paridad_i : std_logic;
  signal carga_i, salida_reg_i : std_logic;
  signal e_p_registro_i : std_logic_vector(8 downto 0);
  signal s_multiplex_i : std_logic_vector(1 downto 0);
  
	component DetectorFlanco
	port (
		e : in std_logic;
		reset : in std_logic;
		clk : in std_logic;
		s : out std_logic);

	end component;

  component CircuitoControl
    port (clk                     : in std_logic;
          reset_n                 : in std_logic;
          pulsador                : in std_logic;  --Activa la transmisión
          contador_un_bit         : in std_logic;  --Fin contador M2604
          contador_M10             : in std_logic;  --1 al terminar los 8 bits de la señal
			 carga 						  : out std_logic;
          s_multiplex             : out std_logic_vector(1 downto 0) ; --Señal enviada al multiplexor que controla la salida del transmisor
          en_contador_un_bit      : out std_logic; --Enable
          en_contador_M10          : out std_logic; --Enable
          en_registro             : out std_logic; --Enable registro de desplazamiento
          en_calc_paridad         : out std_logic); --Enable suma parcial del detector de error de paridad
  end component;

  component RegParSer
    port (clk                     : in std_logic;
          reset_n                 : in std_logic;
			 carga    					 : in std_logic;
          desplaza                : in std_logic; -- activa el desplazamiento en el registro
          e_p                     : in std_logic_vector(8 downto 0);  --Entrada en paralelo
          s_s                     : out std_logic); -- Salida serie

  end component;

  component GeneraBitParidad
  	port (
    	clk : in std_logic;
    	reset_n : in std_logic;
    	e_p : in std_logic_vector(7 downto 0);    -- Entrada en paralelo
    	en : in std_logic; 	   -- Enable para calcular la paridad
    	bit_paridad : out std_logic );

  end component;

  component ContadorM10
    port (
  	clk, reset_n 	: in std_logic;
            	en           		: in std_logic;   --Enable. 1 cuenta 0 mantiene
            	s            		: out std_logic); --Salida. 1 al acabar la cuenta
  end component;

  component TemporizadorUnBit
    port (  clk, reset_n : in std_logic;
            en           : in std_logic;   --Enable. 1 cuenta 0 mantiene
            s            : out std_logic); --Salida. 1 al acabar la cuenta
  end component;

  component Mux3a1
    port(e2, e1, e0   : in std_logic;
        sel           : in std_logic_vector(1 downto 0);
        s             : out std_logic);
  end component;

begin --structural

not_pulsador_i <= not(pulsador);
e_p_registro_i <= bit_paridad_i & e_p;

DetectorFlanco_i : DetectorFlanco
	port map(
		e => not_pulsador_i,
		reset => reset_n,
		clk => clk,
		s => pulsador_i);
		
CircuitoControl_i : CircuitoControl
port map (
      clk => clk,
      reset_n => reset_n,
      pulsador => pulsador_i,
      contador_un_bit => contador_un_bit_i, --(Señal de fin de cuenta)
      contador_M10 => contador_M10_i,
		carga => carga_i,
      s_multiplex => s_multiplex_i,
      en_contador_un_bit => en_contador_un_bit_i,
      en_contador_M10 => en_contador_M10_i,
      en_registro => en_registro_i,
      en_calc_paridad => en_calc_paridad_i);

RegParSer_i : RegParSer
    port map (
          clk => clk,
          reset_n => reset_n,
			 carga => carga_i,
          desplaza => en_registro_i,
          e_p => e_p_registro_i,
          s_s => salida_reg_i);

TemporizadorUnBit_i : TemporizadorUnBit
  port map (
					clk => clk,
          reset_n => reset_n,
          en => en_contador_un_bit_i,
          s => contador_un_bit_i);

ContadorM10_i : ContadorM10
  port map (
          clk => clk,
          reset_n => reset_n,
          en => en_contador_M10_i,
          s => contador_M10_i);

GeneraBitParidad_i : GeneraBitParidad
  port map (
    	   clk => clk,
    	   reset_n => reset_n,
    	   e_p => e_p,
    	   en => en_calc_paridad_i,
    	   bit_paridad => bit_paridad_i);


Mux3a1_i : Mux3a1
  port map( e2 => '0',
        e1 => salida_reg_i,
        e0 => '1',
        sel => s_multiplex_i,
        s => s_s);

end structural;


