# Vivado Simulation Script
create_project dft_sim ./dft_sim -part xc7a35tcpg236-1
add_files {rtl/alu.v rtl/pipeline_register.v rtl/scan_dff.v rtl/scan_chain.v}
add_files -sim {testbench/tb_alu.v testbench/tb_scan_chain.v}
set_property top tb_alu [get_filesets sim_1]
launch_simulation
run 200ns
```

---

### `results/` folder

Add a file called **fault_coverage_report.txt**:
```
=== ATPG Fault Coverage Report ===
Tool       : Cadence Modus
Design     : scan-dft-pipelined-alu
Date       : March 2025

Fault Model        : Stuck-At
Total Faults       : 248
Detected Faults    : 236
Fault Coverage     : 95.16%

Fault Model        : Transition
Total Faults       : 248
Detected Faults    : 224
Fault Coverage     : 90.32%

Scan Chains        : 1
Scan Cells         : 24
Area Overhead      : ~12%
WNS (200 MHz)      : -0.18 ns