# LED Peripheral - Assignment 11

This folder contains a simple Verilog LED peripheral, a testbench, and related project files.

Files
- `led_peripheral.v` - The LED peripheral module (`led_peri`).
  - Provides a byte-addressable register interface to control a 16-bit `led` output.
  - Registers:
    - `CTRL_WRITE` (address 0x01): control byte. `LED_control[0]` is the drive enable.
    - `LED_MSB_WRITE` (address 0x02): upper byte (MSB) of the 16-bit LED value.
    - `LED_LSB_WRITE` (address 0x03): lower byte (LSB) of the 16-bit LED value.

- `led_peri_tb.v` - Testbench for the `led_peri` module.
  - Generates a 10 ns clock and a reset.
  - Performs single-cycle writes (asserts `wr_en` for one clock period) to the control,
    MSB and LSB registers to demonstrate operation.

- `led_peri_stonks.v` - (Present in folder) Other design file - inspect if needed.
- `microcintroller_by_FPGA.v` - (Present in folder) Other design file - inspect if needed.
- `sample.xdc` - Sample constraints file for Basys 3 version D(Only for switches and output nothing timing based).

Running simulation (Icarus Verilog)

Open a PowerShell prompt and run:

```powershell
# From this folder (where the files live):
iverilog -o led_sim led_peripheral.v led_peri_tb.v
vvp led_sim
```

- `iverilog` compiles the Verilog sources into an executable simulation (here `led_sim`).
- `vvp` runs the simulation. Use waveform dumps (`$dumpfile/$dumpvars`) in the testbench if you want a VCD file.

Using ModelSim/Questa

- Compile both files in your project and run the `led_peri_tb` testbench. Use the simulator GUI or transcript commands to view signals.

Vivado/FPGA Flow

- Add `led_peripheral.v` and other RTL files to your Vivado project.
- Use `sample.xdc` as a starting constraint file.

Notes
- The testbench asserts `wr_en` using time delays (`#10 wr_en = 1; #10 wr_en = 0;`) so each write remains asserted for one clock period in the testbench's timing configuration (10 ns clock).
- The module logic assumes `wr_en` and `addr/din` are stable at the rising edge of `clk` when `wr_en` is asserted.

If you'd like, I can:
- Add VCD dump statements to `led_peri_tb.v` so you can view waveforms with GTKWave.
- Modify the testbench to align `wr_en` changes exactly to clock edges (use `@(posedge clk)`), or convert delays to edge-driven stimulus.
- Add a small Makefile or PowerShell script to run simulations automatically.
