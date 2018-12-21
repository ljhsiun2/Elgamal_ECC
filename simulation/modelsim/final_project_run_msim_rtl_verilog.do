transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/Lucas/Documents/ece385/ecc/sha2-verilog {C:/Users/Lucas/Documents/ece385/ecc/sha2-verilog/sha256.v}
vlog -sv -work work +incdir+C:/Users/Lucas/Documents/ece385/ecc/sha2-verilog {C:/Users/Lucas/Documents/ece385/ecc/sha2-verilog/sha2.v}
vlog -sv -work work +incdir+C:/Users/Lucas/Documents/ece385/ecc/components {C:/Users/Lucas/Documents/ece385/ecc/components/elliptic_curve_structs.sv}
vlog -sv -work work +incdir+C:/Users/Lucas/Documents/ece385/ecc/rng {C:/Users/Lucas/Documents/ece385/ecc/rng/quarter_round.sv}
vlog -sv -work work +incdir+C:/Users/Lucas/Documents/ece385/ecc/components {C:/Users/Lucas/Documents/ece385/ecc/components/reg_256.sv}
vlog -sv -work work +incdir+C:/Users/Lucas/Documents/ece385/ecc/primitives/ecdsa/verify {C:/Users/Lucas/Documents/ece385/ecc/primitives/ecdsa/verify/ecdsa_verify_control.sv}
vlog -sv -work work +incdir+C:/Users/Lucas/Documents/ece385/ecc/rng {C:/Users/Lucas/Documents/ece385/ecc/rng/chacha.sv}
vlog -sv -work work +incdir+C:/Users/Lucas/Documents/ece385/ecc/primitives/modular_operations {C:/Users/Lucas/Documents/ece385/ecc/primitives/modular_operations/multiplier.sv}
vlog -sv -work work +incdir+C:/Users/Lucas/Documents/ece385/ecc/primitives/modular_operations {C:/Users/Lucas/Documents/ece385/ecc/primitives/modular_operations/modular_inverse.sv}
vlog -sv -work work +incdir+C:/Users/Lucas/Documents/ece385/ecc/primitives/modular_operations {C:/Users/Lucas/Documents/ece385/ecc/primitives/modular_operations/add.sv}
vlog -sv -work work +incdir+C:/Users/Lucas/Documents/ece385/ecc/primitives/ecdsa/sign {C:/Users/Lucas/Documents/ece385/ecc/primitives/ecdsa/sign/ecdsa_sign_control.sv}
vlog -sv -work work +incdir+C:/Users/Lucas/Documents/ece385/ecc/primitives/point_operations {C:/Users/Lucas/Documents/ece385/ecc/primitives/point_operations/point_double.sv}
vlog -sv -work work +incdir+C:/Users/Lucas/Documents/ece385/ecc/primitives/point_operations {C:/Users/Lucas/Documents/ece385/ecc/primitives/point_operations/point_add.sv}
vlog -sv -work work +incdir+C:/Users/Lucas/Documents/ece385/ecc/primitives/point_operations {C:/Users/Lucas/Documents/ece385/ecc/primitives/point_operations/gen_point.sv}
vlog -sv -work work +incdir+C:/Users/Lucas/Documents/ece385/ecc/primitives/ecdsa/verify {C:/Users/Lucas/Documents/ece385/ecc/primitives/ecdsa/verify/ecdsa_verify_datapath.sv}
vlog -sv -work work +incdir+C:/Users/Lucas/Documents/ece385/ecc/primitives/ecdsa/sign {C:/Users/Lucas/Documents/ece385/ecc/primitives/ecdsa/sign/ecdsa_sign_datapath.sv}
vlog -sv -work work +incdir+C:/Users/Lucas/Documents/ece385/ecc/primitives/ecdsa/verify {C:/Users/Lucas/Documents/ece385/ecc/primitives/ecdsa/verify/ecdsa_verify.sv}
vlog -sv -work work +incdir+C:/Users/Lucas/Documents/ece385/ecc/primitives/ecdsa/sign {C:/Users/Lucas/Documents/ece385/ecc/primitives/ecdsa/sign/ecdsa_sign.sv}
vlog -sv -work work +incdir+C:/Users/Lucas/Documents/ece385/ecc {C:/Users/Lucas/Documents/ece385/ecc/final_top.sv}

vlog -sv -work work +incdir+C:/Users/Lucas/Documents/ece385/ecc/testbenches {C:/Users/Lucas/Documents/ece385/ecc/testbenches/top_level_testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclone10lp_ver -L rtl_work -L work -voptargs="+acc"  top_level_testbench

add wave *
view structure
view signals
run -all
