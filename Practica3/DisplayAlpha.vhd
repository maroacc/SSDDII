-- DisplayAlpha
-- Muestra en un Display de 17 segmentos un mensaje fijo introducido

library ieee;
 use ieee. std_logic_1164 .all;

 entity DisplayAlpha is
   port ( clk                            : in std_logic;
          reset_n                        : in std_logic;
          d7, d6, d5, d4, d3, d2, d1, d0 : out std_logic_vector(16 downto 0)
          );
 end entity;

 architecture behavioral of DisplayAlpha is

   signal


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
        s       : out std_logic(2 downto 0)
      );
    end component ContadorM8;

    --Guarda los valores de los dígitos introducidos
    component RegistroEn
      port (
        clk     : in  std_logic;
        reset_n : in  std_logic;
        en      : in  std_logic;
        e       : in  std_logic_vector(7 downto 0);
        s       : out std_logic_vector(7 downto 0)
      );
    end component RegistroEn;

    --Activa el contadorM8 al acabar la cuenta
    component ContadorM400000
      port (
        reset_n : in  std_logic;
        en      : in  std_logic;
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
        s       : out std_logic_vector(7 downto)
      );
      end component SelectorDigito;







 begin

   AsciiA16Seg_i : AsciiA16Seg
      port map (
        clk => clk,
        e   => e,
        s   => s
      );

   ContadorM8_i : ContadorM8
    port map (
      reset_n => reset_n,
      en      => en,
      s       => s
    );

  for i in 0 to 8 generate
     RegistroEn_i : RegistroEn
      port map (
        clk     => clk,
        reset_n => reset_n,
        en      => en,
        e       => e,
        s       => s
      );
  end generate;

  ContadorM400000_i : ContadorM400000
    port map (
      reset_n => reset_n,
      en      => en,
      s       => s
    );

  MuxRegistroAASCII_i : MuxRegistroAASCII
    port map (
      e_registro0 => e_registro0,
      e_registro1 => e_registro1,
      e_registro2 => e_registro2,
      e_registro3 => e_registro3,
      e_registro4 => e_registro4,
      e_registro5 => e_registro5,
      e_registro6 => e_registro6,
      e_registro7 => e_registro7,
      sel         => sel,
      s           => s
    );

  SelectorDigito_i : SelectorDigito
    port map (
      clk     => clk,
      reset_n => reset_n,
      x       => x,
      s       => s
    );








 end architecture;
