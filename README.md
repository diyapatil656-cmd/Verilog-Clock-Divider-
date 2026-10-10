# Verilog-Clock-Divider-
# Synchronous Frequency Clock Divider (Verilog RTL)

## Project Overview
This repository features a parameterized **Synchronous Clock Divider** designed using Verilog RTL. The hardware block monitors an incoming high-speed clock domain and divides its cycles down to safely drive slower internal IP blocks without causing timing violations.

## Architectural Features
* **Dynamic Parameterization:** Built using configurable bit parameters (`DIVIDE_LIMIT`) allowing fast scaling across diverse target boards.
* **Balanced Duty Cycles:** Generates clean, symmetrical square waves suitable for downstream sequential registers.
* **Asynchronous Safety Protections:** Outfitted with an active-low master reset (`rst_n`) to safely park the clock edge on reset.

## File Navigation Structure
* `/clk_divider.v` : Core RTL design file establishing the toggle tracking counter.
* `/clk_divider_tb.v` : Verification testbench validating timeline metrics.
