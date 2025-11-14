Traffic Light Controller - Assignment_10

Overview
- This folder contains a simple traffic-light controller example in Verilog.
- The design is partitioned into three main modules:
  - `light_cont.v`  : State machine that sequences which road has green lights.
  - `timer.v`       : Simple timer module that produces a pulse when a count
    completes (used to time green intervals).

Testbenches
- `light_cont_tb.v`            : Testbench for the `light_cont` controller (produces VCD waveform).

Simulation (Icarus Verilog)
- Install Icarus Verilog (iverilog) and GTKWave to view waveforms.
- From PowerShell in this folder run (example):

```powershell

# Compile and run light controller testbench (includes timer and lights)
iverilog -o light_cont_tb.exe light_cont.v timer.v light_cont_tb.v 
vvp .\light_cont_tb.exe
gtkwave light_cont_tb.vcd
```

Notes and Known Issues
- The code in this folder has been documented but not functionally changed.
- If you find mismatches in expected behavior, check the 16-bit packing in
  `light_cont.v` vs. the bit assignments in `lights.v`.

Possible Improvements :
- Ensure all state encodings use explicit Verilog widths, e.g. `2'b00`.
- Keep pattern literals explicitly sized, e.g. `16'b0111_1000_1000_0000`.
- Validate that `timer.v`'s `MAX_COUNT` value matches the desired clock


