# PWM-Generator-Using-Verilog
This project implements a Pulse Width Modulation (PWM) generator using Verilog HDL. The circuit generates a PWM signal whose duty cycle can be adjusted using a duty input value. PWM is widely used in digital electronics for controlling power in applications such as motor speed control, LED brightness control, and switching power supplies.

## **WORKING PRINCIPLE:**

- The PWM signal is generated using a counter and comparator.  
- A clock signal drives a 4-bit counter.
- The counter counts from 0 to 9 repeatedly.
- The counter value is compared with the duty cycle input.
- If the counter value is less than the duty value, the output pwm_out is HIGH.
- If the counter value is greater than or equal to the duty value, the output becomes LOW.

This creates a PWM waveform where the width of the HIGH pulse changes depending on the duty cycle value.
For instance: If the duty value is 5, the PWM signal will be HIGH for 5 counts out of 10 counts, which gives a 50% duty cycle.

Example counter and output behavior:

Counter :0 1 2 3 4 5 6 7 8 9                                                                        
PWMval :1 1 1 1 1 0 0 0 0 0

Duty Cycle: 5 / 10 = 50%

## **PROJECT FILES:**

- pwm_generator.v : Contains the Verilog module implementing the PWM generator logic using a counter and comparator.
- tb_pwm.v : Testbench used to simulate the PWM generator. It generates the clock, applies reset, and changes the duty cycle values.
- WAVEFORM.png : Screenshot of the PWM waveform obtained from simulation using GTKWave.
- README.md : Project documentation describing the design, working principle, and simulation process.

## **TOOLS USED:**
- Xilinx Vivado – Synthesis tool for RTL schematics
- Icarus Verilog (iverilog) – Compilation and simulation
- GTKWave – Waveform analysis
- VS Code – Code editing

## **AUTHOR:** 
Krishvika
