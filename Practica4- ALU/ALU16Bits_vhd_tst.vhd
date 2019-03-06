
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY ALU16Bits_vhd_tst IS
END ALU16Bits_vhd_tst;
ARCHITECTURE ALU16Bits_arch OF ALU16Bits_vhd_tst IS
CONSTANT g_data_w : integer := 5;
-- constants
-- signals
SIGNAL a : STD_LOGIC_VECTOR(g_data_w -1 DOWNTO 0);
SIGNAL b : STD_LOGIC_VECTOR(g_data_w -1 DOWNTO 0);
SIGNAL co : STD_LOGIC;
SIGNAL ov : STD_LOGIC;
SIGNAL s : STD_LOGIC_VECTOR(g_data_w -1 DOWNTO 0);
SIGNAL sel : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL z : STD_LOGIC;
COMPONENT ALU16Bits
  generic (g_data_w : integer := 16);
	PORT (
	a : IN STD_LOGIC_VECTOR(g_data_w -1 DOWNTO 0);
	b : IN STD_LOGIC_VECTOR(g_data_w -1 DOWNTO 0);
	co : OUT STD_LOGIC;
	ov : OUT STD_LOGIC;
	s : OUT STD_LOGIC_VECTOR(g_data_w -1 DOWNTO 0);
	sel : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	z : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : ALU16Bits
  generic map (g_data_w => g_data_w)
	PORT MAP (
-- list connections between master ports and signals
	a => a,
	b => b,
	co => co,
	ov => ov,
	s => s,
	sel => sel,
	z => z
	);

always : PROCESS
-- optional sensitivity list
-- (        )
-- variable declarations
BEGIN

  a <= (others => '0');
  b <= (others => '0');
  sel <= (others => '0');
  wait for 10 ns;


  for i in -16 to 15 loop
    a <= std_logic_vector(to_signed(i, 5));
    for j in -16 to 15 loop
      b <= std_logic_vector(to_signed(j, 5));
      for n in 0 to 15 loop
        sel <= std_logic_vector(to_signed(n, 4));
        wait for 10 ns;

        if sel = "0000" then
  				if (i + j) = 0 then
  					assert z = '1'
  					report "No se activa la salida Z en la suma"
  					severity failure;
  				end if;

  				assert s = std_logic_vector(signed(a) + signed(b))
      		report "Error en la suma"
      		severity failure;
			  end if;

			if sel = "0001" then
				if (i - j) = 0 then
					assert z = '1'
					report "No se activa la salida Z en la resta"
					severity failure;
				end if;

				assert s = std_logic_vector(signed(a) - signed(b))
    		report "Error en la resta"
    		severity failure;
			end if;

      -- if sel = "0010" then
      --   if (i * j) = 0 then
      --     assert z = '1'
      --     report "No se activa la salida Z en la multiplicacion con signo"
      --     severity failure;
      --   end if;
      --
      --   if (i*j) >= -16 and (i*j) <16 then
      --     assert s = std_logic_vector(to_signed(i*j, 5));
      --     report "Error en la multiplicacion con signo"
      --     severity failure;
      --
      --     assert ov = '0'
      --     report "Se enciende ov cuando no hay desbordamiento"
      --     severity failure;
      --   else
      --     assert ov = '1'
      --     report "No se enciende ov cuando hay desbordamiento"
      --     severity failure;
      --   end if;
      -- end if;

      end loop;
    end loop;
  end loop;


    for i in 0 to 31 loop
      a <= std_logic_vector(to_unsigned(i, 5));
      for j in 0 to 31 loop
        b <= std_logic_vector(to_unsigned(j, 5));
        for n in 0 to 15 loop
          sel <= std_logic_vector(to_signed(n, 4));
          wait for 10 ns;


        if sel = "0010" then
          if (i * j) = 0 then
            assert z = '1'
            report "No se activa la salida Z en la multiplicacion sin signo"
            severity failure;
          end if;

          if (i*j) >= 0 and (i*j) <31 then
            assert s = std_logic_vector(to_unsigned(i*j, 5))
            report "Error en la multiplicacion sin signo"
            severity failure;

            --assert ov = '0'
            --report "Se enciende ov cuando no hay desbordamiento"
            --severity failure;
          --else
            --assert ov = '1'
            --report "No se enciende ov cuando hay desbordamiento"
            --severity failure;


          end if;
        end if;

        if sel = "0100" then
          assert s= a nand b
          report "No fuenciona la funcion NAND"
          severity failure;
        end if;

        end loop;
      end loop;
    end loop;

  assert false
  report "Fin de la simulacion"
  severity failure;


WAIT;
END PROCESS always;
END ALU16Bits_arch;
