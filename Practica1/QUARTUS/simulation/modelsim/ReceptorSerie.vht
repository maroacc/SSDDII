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

variable paridad : std_logic;


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

--function CalcParidad (dato_in : std_logic_vector)
	--return std_logic is
	--variable resultado : std_logic;
    --begin --function

    --resultado := '0';
    --for i in 0 to dato_in'length -1 loop
	  --resultado := resultado xor dato_in(i);
    --end loop;
	 
	 --resultado:= dato_in(0) xor dato_in(1) xor dato_in(2) xor dato_in(3) xor dato_in(4) xor dato_in(5) xor dato_in(6) xor dato_in(7) xor dato_in(8);
	 
    --return resultado;
--end CalcParidad;

begin --process always

  --Inicialización de las variables
	e_s <= '1';

	--Acctivamos el reset durante 100 ns
  reset_n <= '0';

  wait for 100 ns;
  reset_n <= '1';
  wait for 5 ns;


    --Añadimos los Bits de Start y Stop
    dato <= "00000000011";
    wait for 1 ps;
    --Mandamos el dato en serie
    SendSerial(e_s, dato);

    --Comprobamos que la salida en paralelo es la correcta
    assert s_p = dato(9 downto 2)
    report "Error: salida del registro errónea"
    severity failure;
    
    --Calculamos la paridad de la señal enviada
    --paridad := CalcParidad(dato(9 downto 1));
	 
	 paridad := dato(2) xor dato(3) xor dato(4) xor dato(5) xor dato(6) xor dato(7) xor dato(8) xor dato(9);
	 
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


  assert false
  report "Fin de la simulación."
  severity failure;


WAIT;
END PROCESS always;
END ReceptorSerie_arch;