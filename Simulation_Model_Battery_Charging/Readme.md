<p align="justify">
&emsp;&emsp; 
</p>

<div align="center">
    <img src="" width="65%">
</div>

# **A. Battery Charging Circuit Flowchart**

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

# **B. The Configuration of a Simulation Model for an EV Battery Circuit**

<p align="justify">
&emsp;&emsp;The battery cells will be grouped into 24 battery modules, with each module consisting of 4 cells connected in series. These modules will then be connected in parallel, forming a total of 2 parallel connections.
</p>

<div align="center">
    <img src="https://github.com/rhamdansyahrulm/EV-Battery-Charge-Optimization-with-Fuzzy-Logic-and-Neural-Network/assets/141615487/70f113cb-8182-4b33-9818-825d1c741f4b" width="65%">
    <img src="https://github.com/rhamdansyahrulm/EV-Battery-Charge-Optimization-with-Fuzzy-Logic-and-Neural-Network/assets/141615487/29b6ff28-16c4-4875-bc85-67f0513ce467" width="15%">
</div>

<p align="center">
<i>Simulation Model</i>
</p>

<div align="center">
    
| Variable | Function |
|:--------:|:---------|
| S1, S2, …, S24 | These variables represent the outputs from each battery module containing the State of Charge (SOC) values of each module at each time. |
| T1, T2, …, T24 | These variables represent the outputs from each battery module containing the temperature values of each module at each time. |
| FC | This variable is used to select the appropriate flow rate during the simulation. It is used to determine the cooling rate of the battery. |
| FT | This variable is used to control the cooling temperature and ensure that the battery temperature does not exceed a safe limit. |
| T | This variable represents the output containing the maximum and minimum temperature values of a cell within a battery module. |
| SOC | This variable represents the output containing the maximum and minimum SOC values of a cell within a battery module. |
| I | This variable represents the magnitude of the current determined based on the temperature and SOC values of all battery cells. |

<i>The function of variables at each port</i>
</div>

<p align="justify">
&emsp;&emsp;In the simulation, there are several block groups: Cell T min & max, SOC min & max, DC current profile, SOC bound check, and flow control. Input values of SOC and temperature are directed to Cell T min & max and SOC min & max blocks to obtain the maximum and minimum SOC and temperature values for all battery cells, simplifying computations. Then, the current values are determined in the DC current profile block based on the measurement time points.
</p>

<div align="center">
    <img src="https://github.com/rhamdansyahrulm/EV-Battery-Charge-Optimization-with-Fuzzy-Logic-and-Neural-Network/assets/141615487/20329e7d-a14e-4bef-9155-0d87ae5aa603" width="65%"><br>
    <i>Charging Current Control System</i>
</div>

<p align="justify">
&emsp;&emsp; In this experiment, there is a maximum limit of six current levels that can occur in each trial. The initial charging temperature starts at 125 A, and then the current value decreases by 31.25 A at each current level. After obtaining the current value based on temperature, the next step is to verify this current value when performing a check based on SOC, which is carried out in the SOC bound check block.
</p>

<div align="center">
    <img src="https://github.com/rhamdansyahrulm/EV-Battery-Charge-Optimization-with-Fuzzy-Logic-and-Neural-Network/assets/141615487/d3c5dfc6-bb1e-45dd-b8e2-c7a9dfd9de2e" width="65%"><br>
    <i>DC Current Profile Circuit</i>
</div>

<p align="justify">
&emsp;&emsp;The validation process for charging current based on the minimum and maximum SOC values in Figure 3.8 is used to reduce the charging current to 0.05 A when the SOC condition is < 0.04 or > 0.97. This is done to prevent overcharging during the charging process. Additionally, very low SOC values have a high internal resistance, which can significantly increase battery temperature and lead to a rapid reduction in battery lifespan.
</p>

<div align="center">
    <img src="https://github.com/rhamdansyahrulm/EV-Battery-Charge-Optimization-with-Fuzzy-Logic-and-Neural-Network/assets/141615487/52c7d2cf-15d4-41dc-a452-6216c6bbf556" width="65%"><br>
    <i>SOC Bound Check Block Circuit</i>
</div>

<p align="justify">
&emsp;&emsp; Next, to help mitigate the high temperature increase during charging, a system is implemented to control the airflow rate, as shown in the image below.
</p>

<div align="center">
    <img src="https://github.com/rhamdansyahrulm/EV-Battery-Charge-Optimization-with-Fuzzy-Logic-and-Neural-Network/assets/141615487/957abfa5-ad5c-4316-8aa1-6310020eb664" width="65%"><br>
    <i>Airflow Control Block Circuit</i>
</div>








