transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {D:/AlfonsoMariajoDig/Practica1/ContadorM8.vhd}
vcom -93 -work work {D:/AlfonsoMariajoDig/Practica1/DetectorFlanco.vhd}
vcom -93 -work work {D:/AlfonsoMariajoDig/Practica1/DetErrorParidad.vhd}
vcom -93 -work work {D:/AlfonsoMariajoDig/Practica1/ReceptorSerie.vhd}
vcom -93 -work work {D:/AlfonsoMariajoDig/Practica1/RegDesplDcha.vhd}
vcom -93 -work work {D:/AlfonsoMariajoDig/Practica1/TemporizadorMedioBit.vhd}
vcom -93 -work work {D:/AlfonsoMariajoDig/Practica1/TemporizadorUnBit.vhd}
vcom -93 -work work {D:/AlfonsoMariajoDig/Practica1/UnidadControl.vhd}

vcom -93 -work work {D:/AlfonsoMariajoDig/Practica1/simulation/modelsim/ReceptorSerie.vht}

vsim -t 1ps -L altera -L lpm -L sgate -L altera_mf -L altera_lnsim -L cycloneii -L rtl_work -L work -voptargs="+acc"  ReceptorSerie_vhd_tst

add wave *
view structure
view signals
run -all
