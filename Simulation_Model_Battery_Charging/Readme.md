<p align="justify">
&emsp;&emsp; 
</p>

<div align="center">
    <img src="" width="65%">
</div>

# **A. Battery Charging Circuit Design**

<p align="justify">
&emsp;&emsp;The simulation process in this final project is conducted using Matlab software with Simulink for creating the simulation circuit. In the simulation circuit, there are several block groups used as the control system for the lithium-ion battery charging circuit. Figure 3.2 represents the flowchart of the lithium-ion battery charging circuit control system. Based on this figure, the current magnitude will be determined based on the current level's predetermined time and SOC value. 
</p>

<div align="center">
    <img src="https://github.com/rhamdansyahrulm/EV-Battery-Charge-Optimization-with-Fuzzy-Logic-and-Neural-Network/assets/141615487/9abe2f50-c813-40b5-8a14-a6ce3a7e285b" width="65%">
</div>

**1. Based on Current Level Duration**

<p align="justify">
&emsp;&emsp;To determine the current magnitude at a specific time, the initial step is to consider the predetermined current level duration. The current level duration is determined by considering the potential temperature rise and SOC change that may occur at each current level. Therefore, by selecting the appropriate duration for each current level, the fast charging process can proceed at an optimal temperature and within a relatively fast charging time.
</p>

**2. Based on Battery SOC**

<p align="justify">
&emsp;&emsp;The battery cell SOC taken into consideration is the one with the highest SOC value. The SOC value is used to determine the current that should correspond to the calculations or use a trickle current, which is 0.05 A. The use of trickle current in this simulation occurs when the battery's SOCmin is in conditions where SOC < 0.04 or SOC > 0.97.
</p>
