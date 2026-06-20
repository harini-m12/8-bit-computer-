# 8-Bit Computer Architecture on Boolean FPGA Board

## Overview

This project implements a complete 8-Bit Computer Architecture using Verilog HDL on the Boolean FPGA Board (Xilinx Spartan-7). The processor follows the Von Neumann Architecture and demonstrates the fundamental concepts of computer organization, instruction execution, memory interfacing, ALU operations, and bus-based communication.

The design is developed entirely in hardware and includes additional debugging and monitoring features such as a Trace Recorder and Bus Bottleneck Detection System.

---

## Features

- 8-bit Data Path Architecture
- 4-bit Address Bus
- 16 × 8 RAM Memory
- Program Counter (PC)
- Memory Address Register (MAR)
- Instruction Register (IR)
- Control Unit
- A Register (Accumulator)
- B Register
- Arithmetic Logic Unit (ALU)
- Flag Register
- Output Register
- Shared 8-bit System Bus
- Seven Segment Display Output
- Trace Recorder for Debugging
- Bus Bottleneck Detection with Alert LED

---

## Architecture

The processor consists of the following blocks:

### Program Counter (PC)
Stores the address of the next instruction to be executed.

### Memory Address Register (MAR)
Holds the memory address used for RAM access.

### RAM
Stores both instructions and data according to the Von Neumann Architecture.

### Instruction Register (IR)
Stores the current instruction and separates it into Opcode and Operand fields.

### Control Unit
Generates all control signals required for the Fetch–Decode–Execute cycle.

### A Register
Primary accumulator used by the ALU.

### B Register
Stores the second operand for ALU operations.

### Arithmetic Logic Unit (ALU)
Performs:
- ADD
- SUB
- AND
- XOR

### Flag Register
Stores:
- Carry Flag
- Zero Flag

### Output Register
Stores the final result and sends it to the display.

---

## Special Features

### Trace Recorder

The Trace Recorder captures processor activity during execution and stores:

- Program Counter Value
- Instruction Register Value
- Register Values
- Bus Values

This enables post-execution debugging and instruction flow analysis.

### Bus Bottleneck Detection

Since instructions and data share a common bus, bus contention may occur when multiple modules attempt to access the bus simultaneously.

The Bus Bottleneck Detection Unit:

- Monitors bus activity
- Detects contention conditions
- Activates an Alert LED
- Assists in hardware debugging

---

## Processor Specifications

| Parameter | Value |
|------------|---------|
| Data Width | 8-bit |
| Address Width | 4-bit |
| Memory Size | 16 × 8 RAM |
| Architecture | Von Neumann |
| FPGA Board | Boolean FPGA Board |
| HDL | Verilog HDL |
| Output | Seven Segment Display |

---

## Instruction Set

| Opcode | Mnemonic | Description |
|----------|----------|-------------|
| 0001 | LDA | Load Data to A Register |
| 0010 | ADD | Add Memory Data to A |
| 0011 | SUB | Subtract Memory Data from A |
| 0100 | OUT | Send Result to Output Register |
| 0101 | JMP | Jump to Address |
| 0110 | JZ | Jump if Zero Flag = 1 |
| 1111 | HLT | Halt Processor |

---

## Fetch – Decode – Execute Cycle

### Fetch

PC → MAR → RAM → IR

### Decode

Control Unit decodes the opcode and operand.

### Execute

Data transfers between RAM, Registers, ALU, and Output Register according to the instruction.

---

## Project Highlights

- Complete FPGA-based CPU Design
- Register Transfer Level (RTL) Implementation
- Modular Verilog Architecture
- Hardware Debugging Support
- Educational Computer Architecture Platform
- Real-Time Execution Monitoring

---

## Future Improvements

- UART Communication
- Extended Instruction Set
- Larger RAM
- Stack Pointer Support
- Interrupt Handling
- Pipeline Architecture
- Performance Monitoring Unit

---

## Tools Used

- Verilog HDL
- Vivado Design Suite
- Boolean FPGA Board (Xilinx Spartan-7)
- ModelSim Simulator

---

## Author

**Harini M**

Electronics and Communication Engineering

FPGA-Based 8-Bit Computer Architecture Project

---

## Repository Structure

```
8-bit-computer/
│
├── pc.v
├── mar.v
├── ram.v
├── IR.v
├── control_unit.v
├── a_reg.v
├── b_reg.v
├── alu.v
├── flagreg.v
├── out_reg.v
├── isa.v
├── architecture.png
└── README.md
```

---

.
