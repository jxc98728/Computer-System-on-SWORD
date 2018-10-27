onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib Signed_Multiplier_opt

do {wave.do}

view wave
view structure
view signals

do {Signed_Multiplier.udo}

run -all

quit -force
