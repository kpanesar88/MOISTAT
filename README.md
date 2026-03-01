# MOISTAT

**Soil Moisture Monitoring & Irrigation Control System**  
Java · MATLAB · Arduino · Firmata · I2C OLED

---

## Overview

MOISTAT is a real-time soil moisture monitoring and irrigation control system built using an Arduino Uno and dual software implementations in Java and MATLAB.

The system acquires analog moisture sensor data, converts 10-bit ADC readings into voltage, applies calibrated threshold-based classification, and actuates a DC water pump through MOSFET control. Moisture trends are visualized live, and classified soil states are displayed via an I2C OLED interface.

This project demonstrates embedded sensing, hardware–software communication, real-time visualization, and closed-loop control design.

---

## System Architecture

### Hardware
- Arduino Uno  
- Capacitive soil moisture sensor (A0)  
- MOSFET-driven DC water pump (D2)  
- SSD1306 I2C OLED display (0x3C)

### Software
- Java (Firmata4j + JSSC)  
- MATLAB (.m script implementation)  
- Real-time plotting (StdDraw & animatedline)

---

## Key Features

- Real-time 10-bit ADC acquisition and voltage conversion  
- Sensor characterization across 0.1V–2.0V operating range  
- Calibrated threshold-based three-state classification  
- Serial communication using Firmata4j (Java ↔ Arduino)  
- I2C OLED display for live classified soil states  
- Dual real-time control implementations in MATLAB and Java  
- MOSFET-based pump actuation for safe current handling  

---

## Control Logic

Moisture readings are converted from raw ADC values (0–1023) into voltage:
