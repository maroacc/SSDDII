transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vcom -93 -work work {TransmisorSerie.vho}

vcom -93 -work work {C:/Users/Maroa/Documents/ICAI/Sistemas Digitales/SISTEMAS DIGITALES II/Practica2/simulation/modelsim/TransmisorSerie.vht}

vsim -t 1ps +transport_int_delays +transport_path_delays -sdftyp /i1=TransmisorSerie_vhd.sdo -L cycloneii -L gate_work -L work -voptargs="+acc"  TransmisorSerie_vhd_tst

add wave *
view structure
view signals
run -all
