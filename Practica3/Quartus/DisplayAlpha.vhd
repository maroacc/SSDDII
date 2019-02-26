-- DisplayAlpha
-- Muestra en un Display de 17 segmentos un mensaje fijo introducido

library ieee;
 use ieee. std_logic_1164 .all;

 entity DisplayAlpha is
   port ( clk                            : in std_logic;
          reset_n                        : in std_logic;
          dig_led 								: out std_logic_vector(16 downto 0);
			 digito									: out std_logic_vector(7 downto 0)
          );
 end entity;

 architecture behavioral of DisplayAlpha is


   --Conversor de ASCII a Display 17 segmentos
   component AsciiA16Seg
       port (
         clk : in  std_logic;
         e   : in  std_logic_vector(7 downto 0);
         s   : out std_logic_vector(16 downto 0)
       );
   end component AsciiA16Seg;

   --Contador de modulo 8
   --Indica cuándo activar cada Digito del DisplayAlpha
   --Indica qué registro llevar al conversor de ASCII a 16 Seg
   component ContadorM8
      port (
        reset_n : in  std_logic;
        en      : in  std_logic;
        s       : out std_logic_vector(2 downto 0)
      );
    end component ContadorM8;

    --Guarda los valores de los dígitos introducidos
    component RegistroEn
      port (
        clk     : in  std_logic;
        reset_n : in  std_logic;
        e       : in  std_logic_vector(7 downto 0);
        s       : out std_logic_vector(7 downto 0)
      );
    end component RegistroEn;

    --Activa el contadorM8 al acabar la cuenta
    component ContadorM400000
      port (
        reset_n : in  std_logic;
        s       : out std_logic
      );
      end component ContadorM400000;

    --Multiplexador para escoger el registro en ASCII que será
    --traducido a 17 segmentos
    component MuxRegistroAASCII
      port (
        e_registro0 : in  std_logic_vector(7 downto 0);
        e_registro1 : in  std_logic_vector(7 downto 0);
        e_registro2 : in  std_logic_vector(7 downto 0);
        e_registro3 : in  std_logic_vector(7 downto 0);
        e_registro4 : in  std_logic_vector(7 downto 0);
        e_registro5 : in  std_logic_vector(7 downto 0);
        e_registro6 : in  std_logic_vector(7 downto 0);
        e_registro7 : in  std_logic_vector(7 downto 0);
        sel         : in  std_logic_vector (2 downto 0);
        s           : out std_logic_vector(7 downto 0)
      );
      end component MuxRegistroAASCII;

    --Selecciona el dígito que será mostrado en el Display
    component SelectorDigito
      port (
        clk     : in  std_logic;
        reset_n : in  std_logic;
        x       : in  std_logic_vector(2 downto 0);
        s       : out std_logic_vector(7 downto 0)
      );
      end component SelectorDigito;

		signal s_reg0, s_reg1, s_reg2, s_reg3, s_reg4, s_reg5, s_reg6, s_reg7 : std_logic_vector (7 downto 0);
		signal en_cnt_i : std_logic;
		signal s_cnt_i : std_logic_vector(2 downto 0);
		signal ascii_i : std_logic_vector(7 downto 0);

 begin

   AsciiA16Seg_i : AsciiA16Seg
      port map (
        clk => clk,
        e   => ascii_i,
        s   => dig_led
      );

   ContadorM8_i : ContadorM8
    port map (
		clk     => clk,
      reset_n => reset_n,
      en      => en_cnt_i,
      s       => s_cnt_i
    );


     RegistroEn_0 : RegistroEn
      port map (
        clk     => clk,
        reset_n => reset_n,
        e       => "00010000",
        s       => s_reg0
      );

     RegistroEn_1 : RegistroEn
      port map (
        clk     => clk,
        reset_n => reset_n,
        e       => "00010001",
        s       => s_reg1
      );

     RegistroEn_2 : RegistroEn
      port map (
        clk     => clk,
        reset_n => reset_n,
        e       => "00010010",
        s       => s_reg2
      );

     RegistroEn_3 : RegistroEn
      port map (
        clk     => clk,
        reset_n => reset_n,
        e       => "00010011",
        s       => s_reg3
      );

     RegistroEn_4 : RegistroEn
      port map (
        clk     => clk,
        reset_n => reset_n,
        e       => "00010100",
        s       => s_reg4
      );

     RegistroEn_5 : RegistroEn
      port map (
        clk     => clk,
        reset_n => reset_n,
        e       => "00010101",
        s       => s_reg5
      );

     RegistroEn_6 : RegistroEn
      port map (
        clk     => clk,
        reset_n => reset_n,
        e       => "00010110",
        s       => s_reg6
      );

		RegistroEn_7 : RegistroEn
      port map (
        clk     => clk,
        reset_n => reset_n,
        e       => "00010111",
        s       => s_reg7
      );


  ContadorM400000_i : ContadorM400000
    port map (
      reset_n => reset_n,
      s       => en_cnt_i
    );

  MuxRegistroAASCII_i : MuxRegistroAASCII
    port map (
      e_registro0 => s_reg0,
      e_registro1 => s_reg1,
      e_registro2 => s_reg2,
      e_registro3 => s_reg3,
      e_registro4 => s_reg4,
      e_registro5 => s_reg5,
      e_registro6 => s_reg6,
      e_registro7 => s_reg7,
      sel         => s_cnt_i,
      s           => ascii_i
    );

  SelectorDigito_i : SelectorDigito
    port map (
      clk     => clk,
      reset_n => reset_n,
      x       => s_cnt_i,
      s       => digito
    );


 end architecture;
