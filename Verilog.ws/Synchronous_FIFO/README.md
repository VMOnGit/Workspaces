# Assignment_09 — Producer / FIFO / Consumer Example

This folder contains a small Verilog project that demonstrates a producer -> FIFO -> consumer datapath, along with testbenches for simulation.

Files
- `fifo_8x32.v`  : Parameterized FIFO implementation (DWIDTH, DEPTH). Contains write/read/counter logic and `full`/`empty` flags.
- `producer.v`   : Producer finite-state machine that generates data bursts and asserts `wr_en` to write into the FIFO.
- `consumer.v`   : Consumer finite-state machine that requests reads (`rd_en`) from the FIFO and captures `dout`.
- `topper.v`     : Top-level wrapper connecting `producer` -> `fifo` -> `consumer` and exposing the consumer output.

Testbenches
- `fifo_8x32_tb.v`: Testbench that exercises writes, reads, simultaneous read/writes, full/empty cases and prints monitors.
- `producer_tb.v`  : Testbench for the `producer` module (drives `full`, observes `wr_en`, `din` and FSM state).
- `topper_tb.v`    : End-to-end testbench instantiating the top-level design and checking interactions across components.

Notes / Known issues
- `fifo_8x32.v` contains a reference to an undeclared signal `d_in` in the counter update logic. That was left unchanged from the supplied source but appears to be a bug — the intended name was likely `din` or the condition should simply be `wr_en && !full`. If you plan to simulate or synthesize, you may want to correct this.

Quick simulation (Icarus Verilog)
Open a PowerShell in this directory and run:

```powershell
# Compile
iverilog -o simulation.exe fifo_8x32.v producer.v consumer.v topper.v fifo_8x32_tb.v topper_tb.v producer_tb.v

# Run one of the testbenches (example: top-level)
vvp simulation.exe

# If a VCD file was produced (e.g. topper_tb.vcd), open with GTKWave:
# (install gtkwave separately)
gtkwave topper_tb.vcd
```

If using ModelSim/Questa or another simulator, compile and run the desired testbench accordingly.

If you'd like, I can:
- Fix the `d_in` bug in `fifo_8x32.v` and add unit checks to validate FIFO behavior.
- Add a short README with example waveform screenshots or expected traces.
- Extend the testbenches with directed checks for data ordering.
