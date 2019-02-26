
--TestBench del Receptor Serie RS-232 para recibir datos de un PC

LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY ReceptorSerie_vhd_tst IS
END ReceptorSerie_vhd_tst;

ARCHITECTURE ReceptorSerie_arch OF ReceptorSerie_vhd_tst IS
  -- constants
	constant c_clk_semiperiod : time := 10ns;
  -- signals
  SIGNAL clk : STD_LOGIC := '0';
  SIGNAL e_s : STD_LOGIC;
  SIGNAL led_error_paridad : STD_LOGIC;
  SIGNAL led_error_trama : STD_LOGIC;
  SIGNAL reset_n : STD_LOGIC;
  SIGNAL s_p : STD_LOGIC_VECTOR(7 DOWNTO 0);

COMPONENT ReceptorSerie
	PORT (
	clk : IN STD_LOGIC;
	e_s : IN STD_LOGIC;
	led_error_paridad : OUT STD_LOGIC;
	led_error_trama : OUT STD_LOGIC;
	reset_n : IN STD_LOGIC;
	s_p : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

signal dato : std_logic_vector(10 downto 0); --8 Bits + paridad
signal paridad : std_logic;

 BEGIN --architecture

	i1 : ReceptorSerie
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	e_s => e_s,
	led_error_paridad => led_error_paridad,
	led_error_trama => led_error_trama,
	reset_n => reset_n,
	s_p => s_p
	);

clk <= not clk after c_clk_semiperiod;

always : PROCESS


  procedure SendSerial (
		signal serie_out: out std_logic; -- Salida serie
   	signal dato_env : in std_logic_vector(10 downto 0)) is
      begin
        for i in 10 downto 0 loop -- Desplaza a izq
         	-- Enviamos el bit correspondiente a la salida
         	serie_out <= dato_env(i);
          wait for 52083 ns;
         end loop; -- i
   end SendSerial;

begin --process always

	e_s <= '1';
	paridad <= '1'; --señal interna para verificar la paridad

	--Acctivamos el reset durante 100 ns
  reset_n <= '0';

  wait for 100 ns;
  reset_n <= '1';
  wait for 100 ns;
  
    --Inicialización de las variables



    --Añadimos los Bits de Start y Stop
	 for i in 0 to 511 loop
		 dato <= '0'& std_logic_vector(to_unsigned(i, 9))& '1';
		 wait for 1 ps;
		 --Mandamos el dato en serie
		 SendSerial(e_s, dato);
		
		 --Comprobamos que la salida en paralelo es la correcta
		 assert s_p = std_logic_vector(to_unsigned(i, 9));
		 report "Error: salida del registro errónea"
		 severity warning;

	  --Calculamos la paridad de la señal enviada
		  paridad <= dato(1) xor dato(2) xor dato(3) xor dato(4) xor dato(5) xor dato(6) xor dato(7) xor dato(8) xor dato(9);
		  wait for 100 ns;
		  
		 if paridad = '0' then
			assert led_error_paridad = '1'
			report "Error. No se enciende el Led de error de paridad"
			severity failure;
		 else
			assert led_error_paridad = '0'
			report "Error. Se enciende el Led de error de paridad cuando no debería"
			severity failure;
		 end if;

		 if dato(0) = '1' then
			assert led_error_trama = '0'
			report "Error. Se enciende el LED de error de trama cuando no debería"
			severity failure;
		 else
			assert led_error_trama = '1'
			report "Error. No se enciende el LED de error de trama cuando debería"
			severity failure;
		 end if;
	end loop;
  assert false
  report "Fin de la simulación."
  severity failure;


WAIT;
END PROCESS always;
END ReceptorSerie_arch;