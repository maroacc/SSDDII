-- Unidad de control para el transmisor serie


library ieee;
	 use ieee. std_logic_1164 .all;
	 use ieee.numeric_std.all;

entity CircuitoControl is
  port (clk                     : in std_logic;
        reset_n                 : in std_logic;
        pulsador                : in std_logic;  --Activa la transmisión
        contador_un_bit         : in std_logic;  --Fin contador M2604
        contador_M10             : in std_logic;  --1 al terminar los 8 bits de la señal
		  carga 							: out std_logic;  --carga el registro
        s_multiplex             : out std_logic_vector(1 downto 0); --Señal enviada al multiplexor que controla la salida del transmisor
        en_contador_un_bit      : out std_logic; --Enable
        en_contador_M10         : out std_logic; --Enable
        en_registro             : out std_logic; --Enable registro de desplazamiento
        en_calc_paridad         : out std_logic); --Enable suma parcial del detector de error de paridad
end entity;

architecture behavioral of CircuitoControl is

--Reposo          : espera el flanco de bajada que determina el comienzo del bit de Espera0Start
--EnviaStart      : espera confirmar el bit de Start para asegurar que no hubo un parpadeo
--Registra        : el registro de desplazamiento envía 1 bit
--Espera1Bit      : espera el tiempo de un bit para la transmisión de los datos

 type t_estados is (Reposo, EnviaStart, Registra, Espera1Bit);
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

     TransicioEstados : process (estado_actual, pulsador, contador_un_bit, contador_M10)
      begin --process TransicioEstados
        estado_siguiente <= estado_actual;

        case estado_actual is
          when Reposo =>
            if pulsador = '1' then
              estado_siguiente <= EnviaStart;
            end if;
          when EnviaStart =>
            if contador_un_bit = '1' then
              estado_siguiente <= Registra;
            end if;
          when Registra =>
            if contador_M10 = '1' then
              estado_siguiente <= Reposo;
            else
              estado_siguiente <= Espera1Bit;
            end if;
          when Espera1Bit =>
            if contador_un_bit = '1' then
              estado_siguiente <= Registra;
            end if;
          when others =>
            estado_siguiente <= Reposo;
        end case;
end process TransicioEstados;

Salidas : process(estado_actual)
  begin --process Salidas
  s_multiplex <= "00";
  en_contador_un_bit <= '0';
  en_contador_M10 <= '0';
  en_registro <= '0';
  en_calc_paridad <= '0';
  carga <= '0';


  case estado_actual is
    when Reposo =>
      s_multiplex <= "00";
    when EnviaStart =>
      s_multiplex <= "11";
      en_calc_paridad <= '1';
      en_contador_un_bit <= '1';
		carga <= '1';
    when Registra =>
      if contador_M10 = '0' then
        s_multiplex <= "01";
        en_registro <= '1';
        en_contador_M10 <= '1';
      end if;
    when Espera1Bit =>
      s_multiplex <= "01";
      en_contador_un_bit <= '1';
    when others => null;
    end case;
end process Salidas;

end architecture;


