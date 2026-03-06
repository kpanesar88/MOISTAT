# MOISTAT

**Soil Moisture Monitoring & Automated Irrigation System**  
Java · MATLAB · Arduino · Firmata · I2C OLED

---

## Overview

MOISTAT is a real-time soil moisture monitoring and irrigation control system built using an **Arduino Uno**, with monitoring and control interfaces implemented in **Java** and **MATLAB**.

The system reads **10-bit analog soil moisture data**, converts ADC values to voltage, classifies soil moisture using calibrated thresholds, and activates a **MOSFET-driven water pump** when irrigation is required. Moisture levels are visualized in real time and the soil state is displayed on an **I2C OLED screen**.

---

## System Architecture

Sensor → Arduino ADC → Serial Communication → Java / MATLAB Monitoring → Pump Control → OLED Display

1. The capacitive moisture sensor outputs an analog voltage.
2. The Arduino reads the signal through its **10-bit ADC**.
3. Data is transmitted via **Firmata serial communication**.
4. Java and MATLAB applications process and visualize the readings.
5. Soil state is classified and irrigation is triggered if needed.
6. The OLED display provides real-time feedback.

---

## Technical Highlights

- Real-time **10-bit ADC data acquisition**
- Conversion of ADC values to **voltage-based moisture readings**
- Sensor characterization across a **0.1V – 2.0V operating range**
- **Three-state soil classification logic** for irrigation decisions
- **Serial communication** between Arduino and host applications
- **Live data visualization** in MATLAB and Java
- **I2C OLED display** for soil moisture status
- **MOSFET-based pump control** for safe switching of the DC pump

---

## Hardware Components

- **Arduino Uno**
- **Capacitive Soil Moisture Sensor** (Analog input A0)
- **MOSFET-driven DC Water Pump** (Digital output D2)
- **SSD1306 I2C OLED Display**
- External power supply for pump

---

## Software Stack

### Embedded System
- Arduino Firmware
- Analog sensor sampling
- Digital pump control
- I2C communication with OLED display

### Java Application
- **Firmata4j** for Arduino communication
- **JSSC (Java Simple Serial Connector)** for serial interface
- Real-time data acquisition and visualization

### MATLAB Interface
- MATLAB Arduino Support Package
- Real-time plotting using `animatedline`
- Sensor data processing and monitoring

---

## Control Logic

1. Read soil moisture sensor value from Arduino ADC.
2. Convert ADC reading (0–1023) to voltage.
3. Classify soil moisture level using calibrated thresholds.
4. Display soil state on OLED screen.
5. Activate pump when soil moisture falls below defined thresholds.

### Soil State Classification

| Voltage Range | Soil Condition | Action |
|---------------|---------------|--------|
| Low Voltage   | Dry Soil      | Pump Activated |
| Medium Voltage| Moderate Moisture | Monitor |
| High Voltage  | Sufficient Moisture | Pump Off |

---

## Key Learning Outcomes

- Embedded system design using **microcontrollers**
- **Hardware–software integration**
- Sensor calibration and signal interpretation
- Serial communication protocols
- Real-time data visualization and monitoring
- Safe power control using **MOSFET switching**

---

## Future Improvements

- Wireless monitoring via WiFi or Bluetooth
- Mobile dashboard for irrigation monitoring
- Data logging for long-term soil analysis
- Automated irrigation scheduling
