# Use this run.do file to run this example.
# Either bring up ModelSim and type the following at the "ModelSim>" prompt:
#     do run.do
# or, to run from a shell, type the following at the shell prompt:
#     vsim -do run.do -c
# (omit the "-c" to see the GUI while running from the shell)

onbreak {resume}

# create library
if [file exists work] {
    vdel -all
}
vlib work

# compile source files
vlog *.sv

# start and run simulation
vsim -novopt work.mux2_testbench

view list
view wave

######################################
#             Wave Forms             #
######################################

add wave -noupdate -divider -height 32 "Clock"
add wave -hex /mux2_testbench/clk

add wave -noupdate -divider -height 32 "Input"
add wave -hex /mux2_testbench/dut/select
add wave -hex /mux2_testbench/dut/A
add wave -hex /mux2_testbench/dut/B

add wave -noupdate -divider -height 32 "Output"
add wave -hex /mux2_testbench/dut/out

add list -hex -r /mux2_testbench/*
add log -r /*

-- Set Wave Output Items
TreeUpdate [SetDefaultTree]
WaveRestoreZoom {0 ps} {75 ns}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2

-- Run the Simulation
run 250
