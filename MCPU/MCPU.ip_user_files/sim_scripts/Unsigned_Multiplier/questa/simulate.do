onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib Unsigned_Multiplier_opt

do {wave.do}

view wave
view structure
view signals

do {Unsigned_Multiplier.udo}

run -all

quit -force
