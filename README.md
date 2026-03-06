# Scan-Based DFT Flow on Pipelined ALU

![Status](https://img.shields.io/badge/Status-Complete-brightgreen)
![Language](https://img.shields.io/badge/Language-Verilog%20HDL-blue)
![Tool](https://img.shields.io/badge/Tool-Cadence%20Modus-orange)

---

## Overview

This project implements a **scan-based Design for Testability (DFT)** flow on an 
8-bit pipelined ALU designed in Verilog HDL. The goal is to improve circuit 
controllability and observability using scan chain insertion and ATPG-based 
fault simulation.

---

## Block Diagram
```
         +-------------+     +------------------+     +-------------+
 A,B ---?¦  Pipeline   ¦----?¦   8-bit ALU      ¦----?¦  Pipeline   ¦--? Result
         ¦  Register   ¦     ¦  (add/sub/and..) ¦     ¦  Register   ¦
         +-------------+     +------------------+     +-------------+
               ¦                                              ¦
         scan_in --? [scan_dff] --? [scan_dff] --? ... --? scan_out
```

---

## Features

- 8-bit pipelined ALU supporting 7 operations
- MUX-based scan flip-flops replacing standard DFFs
- Single scan chain through all pipeline registers
- ATPG test pattern generation using Cadence Modus
- Stuck-at and transition fault analysis

---

## Supported ALU Operations

| op code | Operation |
|---------|-----------|
| 3'b000  | Addition (A + B) |
| 3'b001  | Subtraction (A - B) |
| 3'b010  | Bitwise AND |
| 3'b011  | Bitwise OR |
| 3'b100  | Bitwise XOR |
| 3'b101  | Left Shift |
| 3'b110  | Right Shift |

---

## Repository Structure
```
scan-dft-pipelined-alu/
¦
+-- rtl/
¦   +-- alu.v                  # 8-bit ALU datapath
¦   +-- pipeline_register.v    # D flip-flop pipeline stage
¦   +-- scan_dff.v             # MUX-based scan flip-flop
¦   +-- scan_chain.v           # Parameterized scan chain
¦
+-- testbench/
¦   +-- tb_alu.v               # ALU functional verification
¦   +-- tb_scan_chain.v        # Scan shift/capture verification
¦
+-- scripts/
¦   +-- run_simulation.tcl     # Vivado automation script
¦
+-- results/
¦   +-- fault_coverage_report.txt  # ATPG fault coverage summary
¦
+-- docs/
¦   +-- architecture_notes.md  # Design and DFT flow notes
¦
+-- README.md
```

---

## DFT Implementation Flow
```
Step 1: RTL Design       ?  Write ALU and pipeline in Verilog
Step 2: Synthesis        ?  Synthesize using Cadence Genus
Step 3: Scan Insertion   ?  Replace DFFs with scan_dff using Cadence Modus
Step 4: ATPG             ?  Generate stuck-at and transition fault patterns
Step 5: Simulation       ?  Verify scan shift and capture operations
Step 6: Coverage Report  ?  Analyze fault coverage and area overhead
```

---

## Results

| Metric | Value |
|--------|-------|
| Stuck-At Fault Coverage | 95.16% |
| Transition Fault Coverage | 90.32% |
| Total Faults | 248 |
| Scan Cells | 24 |
| Scan Chains | 1 |
| Area Overhead | ~12% |
| Clock Frequency | 200 MHz |
| Worst Negative Slack (WNS) | -0.18 ns |

---

## Tools Used

| Tool | Purpose |
|------|---------|
| Verilog HDL | RTL Design |
| Cadence Genus | Logic Synthesis |
| Cadence Modus | Scan Insertion and ATPG |
| Xilinx Vivado | Simulation and Verification |

---

## How to Simulate

**Using Vivado:**
```bash
# Open Vivado TCL console and run:
source scripts/run_simulation.tcl
```

**Using iverilog (free simulator):**
```bash
iverilog -o sim rtl/scan_dff.v rtl/scan_chain.v testbench/tb_scan_chain.v
vvp sim
```

---

## Key Concepts Demonstrated

- **Scan Chain Insertion** — replacing standard flip-flops with scan-enabled ones
- **ATPG** — Automatic Test Pattern Generation for stuck-at and transition faults
- **Fault Coverage** — percentage of detectable faults covered by test patterns
- **Area Overhead** — additional logic introduced by scan logic (~12%)
- **Controllability & Observability** — core DFT principles

---

## Author

**Satish Kumar**  
M.Tech — VLSI Design and Embedded Systems  
National Institute of Technology Rourkela  

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue)](https://linkedin.com/in/satishkumar2002)
[![GitHub](https://img.shields.io/badge/GitHub-Follow-black)](https://github.com/Satish37-art)