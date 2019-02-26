library ieee;
use ieee.std_logic_1164.all;

entity Control is
	port (
		reset_n, clk 								: in  std_logic;
		fin_cnt, fin_cnt_reg, pulso   		: in  std_logic;
		cero_start, uno_stop, cargar 			: out std_logic;
		en_cnt,  en_reg						   : out std_logic;
		sel_mux										: out std_logic_vector(1 downto 0)
	);
end Control;

architecture behavioural of Control is
	type t_estados is (Rep,BitStart,EsperaBit,ActivaReg,Paridad,BitStop);
	signal estado_act,estado_sig : t_estados;
begin
	VarEstado: process(clk,reset_n)
	begin
		if reset_n = '0' then
			estado_act <= Rep;
		elsif clk' event and clk = '0' then
			estado_act <= estado_sig;
		end if;
	end process VarEstado;
	
	TransEstado : process(Pulso,fin_cnt,fin_cnt_reg,clk,reset_n,estado_act)
	begin
		estado_sig <= estado_act;
		case estado_act is
			when Rep		=>
				if pulso = '1' then
					estado_sig <= BitStart;
				end if;
			when BitStart =>
				if fin_cnt = '1' then
					estado_sig <= EsperaBit;
				end if;
			when EsperaBit =>
				if fin_cnt = '1' then
					if fin_cnt_reg = '1' then
						estado_sig <= Paridad;
					else 
						estado_sig <= ActivaReg;
					end if;
				end if;
			when ActivaReg =>
				estado_sig <= EsperaBit;
			when Paridad =>
				if fin_cnt = '1' then
					estado_sig <= BitStop;
				end if;
			when BitStop => 
				if fin_cnt = '1' then
					estado_sig <= Rep;
				end if;
			when others =>
				estado_sig <= Rep;
		end case;
	end process TransEstado;
	
	Salidas : process(estado_act)
	begin
		sel_mux <= "11";
		en_cnt <= '0';
		en_reg <= '0';
		cargar <= '0';
		case estado_act is
			when Rep		=>
				null;
			when BitStart =>
				sel_mux <= "00";
				en_cnt <= '1';
				cargar <= '1';
			when EsperaBit =>
				sel_mux <= "01";
				en_cnt <= '1';
			when ActivaReg =>
				sel_mux <= "01";
				en_reg <= '1';
			when Paridad =>
				sel_mux <= "10";
				en_cnt <= '1';
			when BitStop => 
				sel_mux <= "11";
				en_cnt <= '1';
			when others =>
				null;
		end case;
	end process Salidas;
	cero_start <= '0'; 
	uno_stop <= '1';
end behavioural;
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		