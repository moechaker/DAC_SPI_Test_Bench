# DAC_SPI_Test_Bench

This repository contains a SystemVerilog test bench and related files to verify the functionality of a DAC (Digital-to-Analog Converter) interfaced via SPI (Serial Peripheral Interface). The test bench is designed to validate the DAC's behavior, ensuring its correct operation and compliance with the SPI protocol.


## Introduction

The DAC Verification on SPI project aims to ensure the accuracy and reliability of a DAC design when connected to an SPI interface. The test bench utilizes the power of SystemVerilog and constrained randomization to generate a wide range of random test scenarios to ensure comprehensive verification coverage. This methodology allows for the detection of potential design flaws, edge cases, and corner-case scenarios.


## Important Notes
- PLEASE NOTE THAT I HAVE NOT WRITTEN THE DESIGN, I HAVE ONLY VERIFIED IT
- design.sv IS NOT WRITTEN BY ME
- EVERYTHING ELSE IS DONE BY ME
- sorry for shouting that out lol, I just wanted it to be seen

## Design Notes
- The design only implements MOSI and does not implement MISO
- This design is written for learning purposes and that's the reason why MOSI is only implemented
- A master in this case is outputting data to a DAC, and the DAC is reading the data

## Usage

To run the DAC-SPI verification test bench, perform the following steps:

1. Visit this link https://www.edaplayground.com/x/wkuM
2. Top right, hit login and create an account
3. Eda Playground might open a new playground for you, so go ahead and click on my link again to open my playground
4. On the left, click on "Open EPWave after run" under Tools & Simulators if you wish to analyze the waveforms
5. hit Run

During the simulation, the test bench will drive the SPI signals and communicate with the DAC. The design's responses will be monitored and compared against expected behavior, detecting any discrepancies or issues.
