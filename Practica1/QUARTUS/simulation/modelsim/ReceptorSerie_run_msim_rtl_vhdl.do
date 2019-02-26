transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/Maroa/Documents/ICAI/Sistemas Digitales/SISTEMAS DIGITALES II/Practica1/QUARTUS/DetErrorParidad.vhd}
vcom -93 -work work {C:/Users/Maroa/Documents/ICAI/Sistemas Digitales/SISTEMAS DIGITALES II/Practica1/QUARTUS/RegDesplIzq.vhd}
vcom -93 -work work {C:/Users/Maroa/Documents/ICAI/Sistemas Digitales/SISTEMAS DIGITALES II/Practica1/QUARTUS/UnidadControl.vhd}
vcom -93 -work work {C:/Users/Maroa/Documents/ICAI/Sistemas Digitales/SISTEMAS DIGITALES II/Practica1/QUARTUS/TemporizadorUnBit.vhd}
vcom -93 -work work {C:/Users/Maroa/Documents/ICAI/Sistemas Digitales/SISTEMAS DIGITALES II/Practica1/QUARTUS/TemporizadorMedioBit.vhd}
vcom -93 -work work {C:/Users/Maroa/Documents/ICAI/Sistemas Digitales/SISTEMAS DIGITALES II/Practica1/QUARTUS/ContadorM8.vhd}
vcom -93 -work work {C:/Users/Maroa/Documents/ICAI/Sistemas Digitales/SISTEMAS DIGITALES II/Practica1/QUARTUS/DetectorFlanco.vhd}
vcom -93 -work work {C:/Users/Maroa/Documents/ICAI/Sistemas Digitales/SISTEMAS DIGITALES II/Practica1/QUARTUS/ReceptorSerie.vhd}

vcom -93 -work work {C:/Users/Maroa/Documents/ICAI/Sistemas Digitales/SISTEMAS DIGITALES II/Practica1/QUARTUS/simulation/modelsim/ReceptorSerie.vht}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneii -L rtl_work -L work -voptargs="+acc"  ReceptorSerie_vhd_tst

add wave *
view structure
view signals
run -all
