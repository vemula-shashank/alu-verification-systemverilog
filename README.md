# ALU Verification using SystemVerilog

## Project Overview
Functional verification of an 8-bit ALU using a 
SystemVerilog testbench environment.

## ALU Operations
### Arithmetic (mode = 0)
| sel | Operation |
|-----|-----------|
| 00  | ADD       |
| 01  | SUB       |
| 10  | MUL       |
| 11  | DIV       |

### Logical (mode = 1)
| sel | Operation |
|-----|-----------|
| 00  | AND       |
| 01  | OR        |
| 10  | XOR       |
| 11  | NOT A     |

## Testbench Environment
- Transaction  : Random stimulus with constraints
- Generator    : Creates random transactions
- Driver       : Drives DUT inputs
- Monitor      : Observes DUT outputs
- Scoreboard   : Checks expected vs actual
- Environment  : Connects all components

## Tools Used
- Cadence Xcelium / EDA Playground
- SystemVerilog (IEEE 1800)
