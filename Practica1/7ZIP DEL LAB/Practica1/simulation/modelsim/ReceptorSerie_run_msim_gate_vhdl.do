transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vcom -93 -work work {ReceptorSerie.vho}

vcom -93 -work work {D:/AlfonsoMariajoDig/Practica1/simulation/modelsim/ReceptorSerie.vht}

vsim -t 1ps +transport_int_delays +transport_path_delays -sdftyp /i1=ReceptorSerie_vhd.sdo -L cycloneii -L gate_work -L work -voptargs="+acc"  ReceptorSerie_vhd_tst

add wave *
view structure
view signals
run -all
