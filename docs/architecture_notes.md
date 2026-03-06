## Architecture Notes

### ALU Design
- 8-bit pipelined ALU with 7 operations
- Pipeline register inserted between stages
- MUX-based scan flip-flops replace standard DFFs

### Scan Chain
- Single scan chain through all flip-flops
- Scan enable signal controls normal vs test mode
- Scan-in/Scan-out ports exposed at top level

### DFT Flow (Cadence Modus)
1. Read synthesized netlist
2. Define scan constraints
3. Insert scan chains
4. Run ATPG
5. Verify fault coverage