transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Maroa/Documents/ICAI/Sistemas Digitales/SISTEMAS DIGITALES II/Practica2/ContadorM10.vhd}
vcom -93 -work work {C:/Users/Maroa/Documents/ICAI/Sistemas Digitales/SISTEMAS DIGITALES II/Practica2/transmisorserie.vhd}
vcom -93 -work work {C:/Users/Maroa/Documents/ICAI/Sistemas Digitales/SISTEMAS DIGITALES II/Practica2/detectorflanco.vhd}
vcom -93 -work work {C:/Users/Maroa/Documents/ICAI/Sistemas Digitales/SISTEMAS DIGITALES II/Practica2/circuitocontrol.vhd}
vcom -93 -work work {C:/Users/Maroa/Documents/ICAI/Sistemas Digitales/SISTEMAS DIGITALES II/Practica2/regparser.vhd}
vcom -93 -work work {C:/Users/Maroa/Documents/ICAI/Sistemas Digitales/SISTEMAS DIGITALES II/Practica2/temporizadorunbit.vhd}
vcom -93 -work work {C:/Users/Maroa/Documents/ICAI/Sistemas Digitales/SISTEMAS DIGITALES II/Practica2/generabitparidad.vhd}
vcom -93 -work work {C:/Users/Maroa/Documents/ICAI/Sistemas Digitales/SISTEMAS DIGITALES II/Practica2/mux3a1.vhd}

vcom -93 -work work {C:/Users/Maroa/Documents/ICAI/Sistemas Digitales/SISTEMAS DIGITALES II/Practica2/simulation/modelsim/TransmisorSerie.vht}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneii -L rtl_work -L work -voptargs="+acc"  TransmisorSerie_vhd_tst

add wave *
view structure
view signals
run -all
