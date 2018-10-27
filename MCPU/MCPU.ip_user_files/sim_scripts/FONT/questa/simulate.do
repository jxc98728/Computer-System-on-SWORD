onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib FONT_opt

do {wave.do}

view wave
view structure
view signals

do {FONT.udo}

run -all

quit -force
