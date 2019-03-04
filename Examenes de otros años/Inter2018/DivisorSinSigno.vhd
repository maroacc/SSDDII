library ieee;
use ieee. std_logic_1164 .all;
use ieee. numeric_std .all;

entity DivisorSinSigno is

port (
clk : in std_logic ;
dvd : in std_logic_vector (7 downto 0); -- dividendo
dvs : in std_logic_vector (3 downto 0); -- divisor
coc : out std_logic_vector (3 downto 0); -- cociente
res : out std_logic_vector (3 downto 0); -- resto
ov : out std_logic ; -- Overflow
div_z : out std_logic ); -- Error div. 0
end entity;

entity ROM is
port(
      clk: in std_logic ; -- La ROM es s@í@ncrona
      en: in std_logic ; -- Y tiene un enable
      dir: in std_logic_vector (7 downto 0); -- Bus de direcciones
      dat: out std_logic_vector (7 downto 0) ); -- Salida de datos
end ROM;

architecture Behavioural of ROM is

type mem_t is array (0 to 4095) of std_logic_vector (12 downto 0);

signal salidas : std_logic_vector(6 downto 0);

signal memoria : mem_t := (
16#000# => X"0" & '0' & '0' & '1',
16#012# => X"0" & '1' & '0' & '0',
16#105# => X"f" & '1' & '0' & '0',
16#FF2# => X"0" & '0' & '1' & '0',
16#FFF# => X"0" & '0' & '1' & '0',
);

begin

mem_rom: process(clk)
  begin
    if clk 'event and clk = '1' then
      salidas <= memoria( to_integer ( unsigned(dvd & dvs)));
    end if;
end process mem_rom;

coc <= salidas(6 downto 3);
res <= salidas(2);
ov  <= salidas(1);
div_z <= salidas(0);

end architecture Behavioural ;
