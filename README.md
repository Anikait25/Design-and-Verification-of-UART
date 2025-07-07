
# UART Design and Verification

## Overview

This project implements the **Universal Asynchronous Receiver/Transmitter (UART)** protocol in Verilog, including both design and comprehensive SystemVerilog-based verification using UVM-style methodology. The UART includes features such as FIFO buffers, baud rate generation, and interrupt handling, modeled after the TI KeyStone (TL16C550) architecture.

---

## Table of Contents

- [Overview](#overview)
- [Design Features](#design-features)
- [Directory Structure](#directory-structure)
- [Verification Components](#verification-components)
- [How to Run](#how-to-run)
- [Results](#results)
- [Tools Used](#tools-used)
- [Author](#author)

---

## Design Features

- UART Transmitter and Receiver
- Configurable baud rate generator
- FIFO support for TX and RX
- Interrupt generation on:
  - TX empty
  - RX full
  - Overrun error
- Fully synchronous design using single clock
- Clean modular RTL using FSMs

---

## Directory Structure

```

UART/
├── rtl/
│   ├── uart\_tx.v
│   ├── uart\_rx.v
│   ├── baud\_gen.v
│   ├── fifo.v
│   ├── uart\_top.v
├── sim/
│   ├── interface.sv
│   ├── transaction.sv
│   ├── generator.sv
│   ├── driver.sv
│   ├── monitor\_in.sv
│   ├── monitor\_out.sv
│   ├── scoreboard.sv
│   ├── env.sv
│   ├── test.sv
│   └── testbench\_top.sv
├── docs/
│   └── README.md

```

---

## Verification Components

The verification environment follows a layered UVM-style testbench structure:

- **interface.sv**: Contains virtual interface signals shared across components.
- **transaction.sv**: Defines the UART transaction class.
- **generator.sv**: Generates randomized or constrained transactions.
- **driver.sv**: Drives input stimulus to DUT based on transactions.
- **monitor_in.sv**: Monitors inputs to DUT and forwards to scoreboard.
- **monitor_out.sv**: Captures DUT outputs for comparison.
- **scoreboard.sv**: Compares expected vs actual results.
- **env.sv**: Instantiates and connects all verification components.
- **test.sv**: Creates specific test scenarios.
- **testbench_top.sv**: Top-level testbench that instantiates DUT and environment.

---

## How to Run

### Using ModelSim

1. Open ModelSim or QuestaSim
2. Compile the RTL and simulation files:
```

vlog rtl/*.v sim/*.sv

```
3. Run simulation:
```

vsim work.testbench\_top
run -all

```

### Using Vivado (Simulation Only)

1. Create a new project with the Verilog and SystemVerilog files.
2. Add all files under `rtl/` and `sim/`.
3. Set `testbench_top.sv` as the top module.
4. Run behavioral simulation.

---

## Results

- Verified UART transmission and reception for multiple byte streams.
- Randomized test cases with edge conditions (FIFO full, overrun, etc.)
- All assertions and scoreboard checks passed.

You may also attach waveform screenshots or log output here.

---

## Tools Used

- **Language**: Verilog, SystemVerilog
- **Simulator**: ModelSim / QuestaSim
- **Synthesis**: (Optional) Intel Quartus or Xilinx Vivado
- **Target FPGA**: (Optional) Intel MAX10 / ZedBoard (if hardware test done)

---

## Author

**Anikait Sarkar**  
RSA SEIP VLSI Trainee  
Email: *[your_email@example.com]*

---

## License

This project is for educational purposes only. Feel free to fork or contribute under an MIT-style license.

```

---
