transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Maroa/Documents/ICAI/Sistemas Digitales/SISTEMAS DIGITALES II/Juan y Laura/emisorserie.vhd}
vcom -93 -work work {C:/Users/Maroa/Documents/ICAI/Sistemas Digitales/SISTEMAS DIGITALES II/Juan y Laura/detectorflanco.vhd}
vcom -93 -work work {C:/Users/Maroa/Documents/ICAI/Sistemas Digitales/SISTEMAS DIGITALES II/Juan y Laura/contadorregistro.vhd}
vcom -93 -work work {C:/Users/Maroa/Documents/ICAI/Sistemas Digitales/SISTEMAS DIGITALES II/Juan y Laura/contador1bit.vhd}
vcom -93 -work work {C:/Users/Maroa/Documents/ICAI/Sistemas Digitales/SISTEMAS DIGITALES II/Juan y Laura/control.vhd}
vcom -93 -work work {C:/Users/Maroa/Documents/ICAI/Sistemas Digitales/SISTEMAS DIGITALES II/Juan y Laura/regdesp.vhd}
vcom -93 -work work {C:/Users/Maroa/Documents/ICAI/Sistemas Digitales/SISTEMAS DIGITALES II/Juan y Laura/calcparidad.vhd}
vcom -93 -work work {C:/Users/Maroa/Documents/ICAI/Sistemas Digitales/SISTEMAS DIGITALES II/Juan y Laura/muxemi.vhd}

vcom -93 -work work {C:/Users/Maroa/Documents/ICAI/Sistemas Digitales/SISTEMAS DIGITALES II/Juan y Laura/simulation/modelsim/EmisorSerie.vht}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneii -L rtl_work -L work -voptargs="+acc"  EmisorSerie_vhd_tst

add wave *
view structure
view signals
run -all
