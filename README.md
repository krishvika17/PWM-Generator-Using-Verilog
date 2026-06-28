# PWM Generator Using Verilog HDL

This project implements a **4-bit Pulse Width Modulation (PWM) Generator** using **Verilog HDL**. The design generates a PWM signal whose duty cycle can be adjusted using a 4-bit duty cycle input. An additional **enable** signal allows the PWM generation to be paused without resetting the counter.

The project demonstrates the complete digital design workflow, including **RTL design, functional simulation, waveform verification, RTL elaboration, and FPGA synthesis**.

---

# Working Principle

The PWM signal is generated using a **4-bit synchronous counter** and a **comparator**.

* A clock signal drives the 4-bit counter.
* The counter counts from **0 to 15** repeatedly.
* The **enable** signal controls whether the counter increments.
* The counter value is continuously compared with the duty cycle input.
* If the counter value is **less than** the duty value, the PWM output (`pwm_out`) is **HIGH**.
* Otherwise, the PWM output becomes **LOW**.

This comparison changes the width of the HIGH pulse, thereby controlling the duty cycle of the PWM signal.

---

# Example Operation

Suppose the duty cycle is set to **8**.

Counter:

```
0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
```

PWM Output:

```
1 1 1 1 1 1 1 1 0 0  0  0  0  0  0  0
```

Duty Cycle:

```
8 / 16 = 50%
```

Similarly,

| Duty Value | Approximate Duty Cycle |
| ---------- | ---------------------: |
| 0          |                     0% |
| 1          |                  6.25% |
| 4          |                    25% |
| 8          |                    50% |
| 12         |                    75% |
| 15         |                 93.75% |

---

# Features

* 4-bit PWM Generator using Verilog HDL
* Programmable duty cycle (0–15)
* Enable control to pause and resume PWM generation
* Asynchronous reset support
* Functional simulation using Icarus Verilog
* Waveform verification using GTKWave
* RTL elaboration using Xilinx Vivado
* FPGA synthesis using Xilinx Vivado

---

# Project Files

## Project Structure

```text
PWM_Generator/
│
├── README.md
├── LICENSE
├── .gitignore
│
├── src/
│   └── pwm_generator.v
│
├── testbench/
│   └── tb_pwm.v
│
├── screenshots/
│   ├── gtkwave_waveform.png
│   ├── rtl_schematic.png
│   ├── synthesized_schematic.png
│   └── simulation_output.png
│
└── waveforms/
    └── wave.vcd
```

### File Description

* **pwm_generator.v** – Verilog implementation of the PWM generator.
* **tb_pwm.v** – Testbench used to verify different duty cycle values and enable functionality.
* **gtkwave.png** – Functional simulation waveform generated using GTKWave.
* **rtl_elaborated.png** – RTL schematic generated using Xilinx Vivado.
* **synthesized_design.png** – Synthesized FPGA design generated using Xilinx Vivado.

---

# Tools Used

* **Verilog HDL** – Hardware Description Language
* **Icarus Verilog (iverilog)** – Compilation and simulation
* **GTKWave** – Waveform visualization
* **Xilinx Vivado** – RTL elaboration and synthesis
* **Visual Studio Code** – Code editing

---

# Applications

PWM is widely used in digital and embedded systems for:

* LED brightness control
* DC motor speed control
* Servo motor control
* Fan speed control
* Switching power supplies
* Embedded control systems

---

# Simulation Results

The project was verified through:

* Functional simulation using Icarus Verilog
* Waveform analysis using GTKWave
* RTL elaboration in Xilinx Vivado
* FPGA synthesis in Xilinx Vivado

Simulation screenshots are available in the **screenshots** folder.

---

# Learning Outcomes

This project helped in understanding:

* Verilog HDL fundamentals
* Sequential and combinational logic
* Counter-based PWM generation
* Testbench development
* Functional verification
* RTL elaboration
* FPGA synthesis workflow

---

# Author

**Krishvika**
