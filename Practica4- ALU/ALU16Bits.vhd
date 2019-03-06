-- ALU 16 Bits
--falta ter,inar de declarar componenteds, instanciar y test be3ncjh

library ieee;
	use ieee.std_logic_1164.all;

entity ALU16Bits is
	generic (g_data_w : integer := 16);
	port ( a, b : in std_logic_vector (4 downto 0);			--Entradas
			sel : in std_logic_vector (2 downto 0);		--Selector de operación
			s   : out std_logic_vector (4 downto 0);		--Salida
			ov  : out std_logic);				--Overflow

end ALU16Bits;

architecture structural of ALU16Bits is

	component UnidadControl
		port (	sel : in std_logic_vector (2 downto 0); -- Indica la función seleccionda
			sel_s : out std_logic_vector (1 downto 0); -- Indica internamente la función
			-- (00 suma 01 mult. 10 logica 11 less than)
			s_r : out std_logic; -- 0 Suma. 1 Resta.
			signo : out std_logic; --signo multiplicacion
			control_z : out std_logic;
			sel_log : out std_logic_vector (1 downto 0)); --Selecciona la funcion lógica

	end component;

	component UnidadFuncionesLogicas

		generic(
			g_data_w : integer);
		port ( a, b : in std_logic_vector (g_data_w - 1 downto 0);
		   sel_log : in std_logic_vector (1 downto 0);
			s : out std_logic_vector (g_data_w - 1 downto 0));

	end component;

	component SumadorRestador16Bits
	 generic (g_data_w : integer);
	 port (
	 a : in std_logic_vector (g_data_w - 1 downto 0);
	 b : in std_logic_vector (g_data_w - 1 downto 0); -- Entradas
	 sr : in std_logic; -- 0 suma 1 resta
	 s : out std_logic_vector (g_data_w - 1 downto 0); -- Salida
	 z : out std_logic;
	 co : out std_logic); -- Acarreo de salida

 end component;

	component Multiplicador16Bits

		generic(
			g_data_w : integer);
		port ( a, b : in std_logic_vector (g_data_w - 1 downto 0); --Entradas
				signo : in std_logic; --(si es 0: sin signo; si es 1: con signo)
				p : out std_logic_vector (g_data_w - 1 downto 0); --Salida
				z : out std_logic;
				ov : out std_logic --Overflow
		);

	end component;

	component SetOnLessThan
		generic(
			g_data_w : integer);
		port ( a, b : in std_logic_vector (g_data_w - 1 downto 0);
			s : out std_logic_vector (g_data_w - 1 downto 0));

	end component;

	component MuxSalidas
		generic (g_data_w : integer);
		port ( e0, e1, e2, e3		: in std_logic_vector (g_data_w - 1 downto 0); --Entradas
			sel 		: in std_logic_vector (1 downto 0); 	--Entradas Control
			s 			: out std_logic_vector (g_data_w - 1 downto 0));		    --Salida
	end component;

	component MuxZero
		generic (g_data_w : integer);
		port ( e0, e1		: in std_logic; --Entradas
			sel 		: in std_logic_vector (1 downto 0); 	--Entradas Control
			s 			: out std_logic);		    --Salida
	end component;

	signal sel_s_i, sel_log_i : std_logic_vector (1 downto 0);
	signal  s_r_i, control_z_i, signo_i, z_mul_i, z_sumres_i : std_logic;
	signal s_log_i, s_mul_i, s_sumres_i, s_less_than_i : std_logic_vector (g_data_w - 1 downto 0);

begin --structural

	i_UnidadControl : UnidadControl

		port map (	sel => sel, -- Selector de funcion
					sel_s => sel_s_i, -- señal que se envia al multiplexor que controla la salida
					s_r  => s_r_i, -- indica si sumar o restar
					signo  => signo_i, -- multiplicacion con signo o sin signo
					control_z => control_z_i, -- Señal enviada al multiplexor que controla la salida z
					sel_log => sel_log_i); -- Selecciona la funcion logica a realizar

	i_UnidadFuncionesLogicas : UnidadFuncionesLogicas
		generic map(g_data_w => g_data_w);
		port map ( a => a,
				   b => b,
				   sel_log => sel_log_i,
				   s => s_log_i); -- s_log_i recoge la salida de la unidad de funciones logicas

	i_Multiplicador16Bits : Multiplicador16Bits
		generic map(g_data_w => g_data_w);
		port map ( a => a,
				   b => b,
					 signo => signo_i,
					 p => s_mul_i, --s_mul_i recoge el producto de la multiplicacion
					 z => z_mul_i -- z_mul_i recoge el valor de z de la multiplicacion
				   ov => ov); -- overflow

	i_SumadorRestador16Bits : SumadorRestador16Bits
		generic map(g_data_w => g_data_w);
		port map ( a => a,
				   b => b,
				   sr => s_r_i, -- suma o resta
				   s => s_sumres_i, --s_sumres_i recoge el resultado de la suma/resta
					 z => z_sumres_i --z_mul_i recoge el valor de z de la suma/resta
				   co => co); -- acarreo

	i_SetOnLessThan : SetOnLessThan
		generic map(
					g_data_w => g_data_w)
		port map( a => a,
							b => b,
							s => s_less_than_i); --salida del bloque SetOnLessThan

	i_MuxSalidas : MuxSalidas
		generic map(g_data_w => g_data_w);
		port map( e0 => s_sumres_i,
					e1 => s_mul_i,
					e2 => s_log_i,
					e3 => s_less_than_i,
					sel => sel_s_i,
					s => s);		    --Salida

	i_MuxZero : MuxZero
		generic map(g_data_w => g_data_w);
		port map( e0 => z_mul_i,
				e1 => z_sumres_i,
				sel => control_z_i, -- controla la salida z 
				s => z);

 end structural;


