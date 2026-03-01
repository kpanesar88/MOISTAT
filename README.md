# MOISTAT

**Soil Moisture Monitoring & Irrigation Control System**  
Java · MATLAB · Arduino · Firmata · I2C OLED

---

## Overview

MOISTAT is a real-time soil moisture monitoring and irrigation control system built using an Arduino Uno with dual software implementations in Java and MATLAB.

The system acquires 10-bit analog moisture data, converts ADC readings to voltage, applies calibrated threshold-based classification, and actuates a MOSFET-driven water pump. Moisture trends are visualized live, and classified soil states are displayed via an I2C OLED interface.

---

## Technical Highlights

- Real-time 10-bit ADC acquisition and voltage conversion  
- Sensor characterization across 0.1V–2.0V operating range  
- Calibrated three-state soil classification logic  
- Serial communication using Firmata4j (Java ↔ Arduino)  
- I2C OLED display for live soil state feedback  
- Dual real-time control implementations in MATLAB and Java  
- MOSFET-based pump actuation for safe current handling  

---

## Hardware

- Arduino Uno  
- Capacitive soil moisture sensor (A0)  
- MOSFET-driven DC pump (D2)  
- SSD1306 I2C OLED display  

---

## Software

- Java (Firmata4j, JSSC)  
- MATLAB with Arduino Support Package  
- Real-time visualization (StdDraw / animatedline)  

---

## Core Control Logic

ADC readings (0–1023) are converted to voltage:

Voltage thresholds classify soil into:

- A LOT MORE (Dry)  
- A LITTLE MORE (Moderate)  
- ENOUGH (Sufficient Moisture)  

Pump activation is triggered based on classification.
