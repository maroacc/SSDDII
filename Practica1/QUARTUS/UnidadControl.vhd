-- Unidad de control para el Receptor en serie


library ieee;
	 use ieee. std_logic_1164 .all;
	 use ieee.numeric_std.all;

entity UnidadControl is
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

end UnidadControl;

architecture behavioral of UnidadControl is

--Reposo            : espera el flanco de bajada que determina el comienzo del bit de Espera0Start
--Espera0Start      : espera confirmar el bit de Start para asegurar que no hubo un parpadeo
--Espera1Bit        : espera el tiempo de un bit para registrar el bit de entrada en su punto medio
--Registra          : registra el valor de la entrada en serie para mostrarlo en el Display
--EsperaBitParidad  : espera la recepción del bit de CalcParidad
--CompruebaParidad  : comprueba que la suma de unos sea par o impar, según se indique en el bit de paridad (0 par 1 impar)
--ErrorParidad      : enciende un led indicando si ha habido un error de paridad
--EsperaStop        : espera la llegada del bit de stop
--CompruebaStop     : comprueba que el bit de Stop sea 1, en caso contrario habría un error de ErrorTrama
--ErrorTrama        : enciende un led en caso de que exista un error de trama

 type t_estados is (Reposo, Espera0Start, Espera1Bit, Registra, EsperaBitParidad, CompruebaParidad, ErrorParidad, EsperaStop, CompruebaStop, ErrorTrama);
 signal estado_actual, estado_siguiente : t_estados;


  begin --architecture

     VarEstados : process(clk, reset_n)
      begin --process VarEstados
        if reset_n = '0' then
          estado_actual <= Reposo;
        elsif clk'event and clk = '1' then
          estado_actual <= estado_siguiente;
        end if;
     end process VarEstados;

     TransicioEstados : process (estado_actual, flanco_bajada, contador_medio_bit, contador_un_bit, contador_M8, error_paridad)
      begin --process TransicioEstados
        estado_siguiente <= estado_actual;

        case estado_actual is
          when Reposo =>
            if flanco_bajada = '1' then
              estado_siguiente <= Espera0Start;
            end if;
          when Espera0Start =>
            if contador_medio_bit = '1' then
              if e_s = '0' then
                estado_siguiente <= Espera1Bit;
              elsif e_s = '1' then
                estado_siguiente <= Reposo;
              end if;
            end if;
          when Espera1Bit =>
            if contador_un_bit = '1' then
              estado_siguiente <= Registra;
            end if;
          when Registra =>
            if contador_M8 = '1' then
              estado_siguiente <= EsperaBitParidad;
            else
              estado_siguiente <= Espera1Bit;
            end if;
          when EsperaBitParidad =>
            if contador_un_bit = '1' then
              estado_siguiente <= CompruebaParidad;
            end if;
          when CompruebaParidad =>
            if error_paridad = '1' then
              estado_siguiente <= ErrorParidad;
            else
              estado_siguiente <= EsperaStop;
            end if;
          when ErrorParidad =>
            if flanco_bajada = '1' then
              estado_siguiente <= Espera0Start;
            end if;
          when EsperaStop =>
           if contador_un_bit = '1' then
             estado_siguiente <= CompruebaStop;
           end if;
          when CompruebaStop =>
           if e_s = '1' then
             estado_siguiente <= Reposo;
           else
             estado_siguiente <= ErrorTrama;
           end if;
          when ErrorTrama =>
           if flanco_bajada = '1' then
             estado_siguiente <= Espera0Start;
           end if;
			 when others =>
				null;
        end case;
end process TransicioEstados;

Salidas : process(estado_actual)
begin --process Salidas
en_contador_medio_bit <= '0';
en_contador_un_bit <= '0';
en_contador_M8 <= '0';
en_registro <= '0';
en_det_paridad <= '0';
comprueba <= '0';
led_error_paridad <= '0';
led_error_trama <= '0';

  case estado_actual is
    when Reposo =>
      null;
    when Espera0Start =>
      en_contador_medio_bit <= '1';
    when Espera1Bit =>
      en_contador_un_bit <= '1';
    when Registra =>
      en_registro <= '1';
      en_det_paridad <= '1';
			en_contador_M8 <= '1';
    when EsperaBitParidad =>
      en_contador_un_bit <= '1';
    when CompruebaParidad =>
      comprueba <= '1';
    when ErrorParidad =>
      led_error_paridad <= '1';
    when EsperaStop =>
      en_contador_un_bit <= '1';
    when CompruebaStop =>
      null;
    when ErrorTrama =>
      led_error_trama <= '1';
	 when others =>
		null;
  end case;
end process Salidas;

end behavioral;
