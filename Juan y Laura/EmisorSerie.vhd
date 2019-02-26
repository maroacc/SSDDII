library ieee;
use ieee.std_logic_1164.all;

entity EmisorSerie is
	port(
		entrada 					: in  std_logic_vector(7 downto 0);
		boton, clk, reset_n 	: in  std_logic;
		salida 					: out std_logic
	);
end EmisorSerie;

architecture structural of EmisorSerie is
	signal cargar, pulso, en_reg, fin_cnt_reg, en_cnt, fin_cnt : std_logic;
	signal uno_stop, cero_start, reg, bit_pari : std_logic; 
	signal sel_mux : std_logic_vector(1 downto 0);
	component DetectorFlanco
	port(
		e			:	in std_logic;
		reset_n	:	in	std_logic;
		clk		:	in std_logic;
		s			:	out	std_logic);
	end component;
	component ContadorRegistro
	  port(
		 en, reset_n, clk : in  std_logic; -- en = enable
		 finCuenta      : out std_logic
	  );
	end component;
	component Contador1Bit
		port(
			enable			: in std_logic;
			clk, reset_n	: in std_logic;
			salida			: out std_logic
		);
	end component;
	component Control
	port (
			reset_n, clk 								: in  std_logic;
			fin_cnt, fin_cnt_reg, pulso   		: in  std_logic;
			cero_start, uno_stop, cargar 			: out std_logic;
			en_cnt,  en_reg						   : out std_logic;
			sel_mux										: out std_logic_vector(1 downto 0)
		);
	end component;
	component RegDesp 
	port(
		enable, clk, reset_n 			: in 	std_logic;
		cargar 								: in  std_logic;
		carga									: in  std_logic_vector(7 downto 0);
		salida 								: out	std_logic
		);
	end component;
	component CalcParidad
    port(
        reg        : in std_logic_vector(7 downto 0);
        paridad    : out std_logic;
        reset_n, clk   : in std_logic
		 );
	end component;
	component MuxEmi
   port(
       sel     : in  std_logic_vector(1 downto 0);
       start   : in  std_logic;
       datos   : in  std_logic;
       paridad : in  std_logic;
       stop_sal: in  std_logic;
       salida  : out std_logic
		 );
	end component;
begin
	i_1 : DetectorFlanco
	port map(
		e => boton,
		reset_n	=> reset_n,
		clk  => clk,
		s	=> pulso);
	i_2 : ContadorRegistro
	  port map(
		 en => en_reg,
		 reset_n => reset_n, 
		 clk => clk,
		 finCuenta => fin_cnt_reg
	  );
	 i_3 : Contador1Bit
		port map(
			enable => en_cnt,
			clk => clk, 
			reset_n => reset_n,
			salida => fin_cnt
		);
	i_4 : Control
		port map(
			reset_n => reset_n, 
			clk => clk,
			fin_cnt => fin_cnt, 
			fin_cnt_reg => fin_cnt_reg, 
			pulso => pulso, 
			cero_start => cero_start, 
			uno_stop => uno_stop, 
			cargar => cargar,
			en_cnt => en_cnt, 
			en_reg => en_reg, 
			sel_mux => sel_mux
		);
	i_5 : RegDesp 
		port map(
			enable => en_reg, 
			clk => clk, 
			reset_n => reset_n,
			cargar => cargar,
			carga	=> entrada,
			salida => reg
		);
	i_6 : CalcParidad
    port map(
        reg => entrada,
        paridad => bit_pari,
        reset_n => reset_n, 
		  clk => clk
		 );
	i_7 : MuxEmi
		port map(
			 sel  => sel_mux,
			 start => cero_start,
			 datos => reg,
			 paridad => bit_pari,
			 stop_sal => uno_stop,
			 salida => salida
			 );
end structural;



























