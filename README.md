# **EV Battery Optimization with Fuzzy Logic and Neural Network**

<p align="justify">
&emsp;&emsp;The outcomes of this research demonstrate the successful implementation of a neural network model in recognizing battery charging patterns and predicting the state of charge (SOC) value, as well as the final charging temperature, based on the duration parameter at different current levels within the MCC charging method. The results of this study showcase the achievement of an SOC value of 83% within a charging duration of 43 minutes, while maintaining the battery temperature at an optimal level of approximately 35.85°C. Comparatively, this method yields a 3.38% increase in SOC compared to the conventional constant current-constant voltage (CC-CV) method, with a marginal temperature rise of 0.41oC.
</p>

## **Technical Specifications**
<div align="center">
  
| Technical Index | Value |
|-----------------|-------|
| **Battery Specifications** |
| Number of battery cells | 192 |
| Battery configuration | 96s2p |
| Nominal capacity | 40 kWh |
| Nominal voltage | 350 V |
| Number of battery modules | 24 |
|=======================|=======================|
| **Battery cell size** |
| Width | 261 mm |
| Length | 216 mm |
| Thickness | 7.9 mm |
|=======================|=======================|
| **Fast charging capability** |
| Maximum power | 46 kW |
| Average power | 40 kW |
| Battery temperature tolerance | 45°C to 60°C |
| Charging time (10% to 80%) | 43 minutes |
  
</div>

## **Workflow Steps**
<p align="justify">
&emsp;&emsp;In its execution, there are several processes involved, including planning, simulation design, machine learning model creation, testing, and evaluation. Here are the steps taken in the process:
</p>

### **1. Database Creation and Management**
<p align="justify">
&emsp;&emsp;The table above is an example of the dataset required during the final project development process. Variables such as roomTemperature, initialBatteryTemperature, t1, t2, t3, and t4 are parameters used in running the Simulink simulation and also serve as features in the machine learning process. On the other hand, lastSOC and lastTemperature are values generated from the simulation process and will be used as targets in machine learning model creation.
</p>
