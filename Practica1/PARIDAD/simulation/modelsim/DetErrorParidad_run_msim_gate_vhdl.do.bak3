transcript on
if {[file exists gate_work]} {
	vdel -lib gate_work -all
}
vlib gate_work
vmap work gate_work

vcom -93 -work work {DetErrorParidad.vho}

vcom -93 -work work {C:/Users/Maroa/Documents/ICAI/Sistemas Digitales/SISTEMAS DIGITALES II/Practica1/PARIDAD/simulation/modelsim/DetErrorParidad.vht}

vsim -t 1ps +transport_int_delays +transport_path_delays -sdftyp /i1=DetErrorParidad_vhd.sdo -L cycloneii -L gate_work -L work -voptargs="+acc"  DetErrorParidad_vhd_tst

add wave *
view structure
view signals
run -all
