# **EV Battery Optimization with Fuzzy Logic and Neural Network**

<p align="justify">
&emsp;&emsp;The outcomes of this research demonstrate the successful implementation of a neural network model in recognizing battery charging patterns and predicting the state of charge (SOC) value, as well as the final charging temperature, based on the duration parameter at different current levels within the MCC charging method. The results of this study showcase the achievement of an SOC value of 83% within a charging duration of 43 minutes, while maintaining the battery temperature at an optimal level of approximately 35.85°C. Comparatively, this method yields a 3.38% increase in SOC compared to the conventional constant current-constant voltage (CC-CV) method, with a marginal temperature rise of 0.41oC.
</p>

## **Technical Specifications**
<div align="center">
  
| Technical Index | Value |
|-----------------|:-----:|
| **`Battery Specifications`** |
| Number of battery cells | 192 |
| Battery configuration | 96s2p |
| Nominal capacity | 40 kWh |
| Nominal voltage | 350 V |
| Number of battery modules | 24 |
| **`Battery cell size`** |
| Width | 261 mm |
| Length | 216 mm |
| Thickness | 7.9 mm |
| **`Fast charging capability`** |
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

| Battery Initial Temp (°C) | Room Temp (°C) | t1 (s) | t2 (s) | t3 (s) | t4 (s) | Final Battery SOC (%) | Final Battery Temp (°C) |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
| 25.66 | 28.12 | 1989.83 | 2484.47 | 2542.12 | 2576.31 | 0.85 | 317.30 |
| 29.56 | 30.14 | 2423.81 | 2577.48 | 2579.01 | 2579.66 | 0.88 | 310.02 |
| 30.12 | 32.78 | 1146.96 | 1646.36 | 1827.81 | 2462.77 | 0.78 | 310.98 |

<p align="justify">
&emsp;&emsp;The table above is an example of the dataset required during the final project development process. Variables such as roomTemperature, initialBatteryTemperature, t1, t2, t3, and t4 are parameters used in running the Simulink simulation and also serve as features in the machine learning process. On the other hand, lastSOC and lastTemperature are values generated from the simulation process and will be used as targets in machine learning model creation.
</p>

| Variable            | Description                                                                  |
|:------------------------|:-----------------------------------------------------------------------------|
| `Room Temp`     | This variable represents the room temperature in Kelvin (K) during the simulation. It serves as an environmental factor affecting the battery charging process. |
| `Battery Initial Temp` | This variable indicates the initial temperature of the battery in Kelvin (K) before the charging process begins. It is an important parameter as it influences the charging behavior. |
| `t1`, `t2`, `t3`, `t4` | These are the time durations in seconds (s) for the different steps in the charging process. |
| `Last SOC`      | This variable indicates the State of Charge (SOC) of the battery as a percentage (%) at the end of the charging process. SOC represents the amount of charge stored in the battery. |
| `Last Temp`     | This variable represents the temperature of the battery in Kelvin (K) at the conclusion of the charging process. It reflects the final temperature of the battery after charging. |

<p align="justify">
&emsp;&emsp;Based on the dataset collected in this experiment, the following is a summary of the data statistics that will be used to build the neural network model.
</p>

|                           | Battery Initial Temp | Room Temp | t1  | t2  | t3  | t4  | Final SOC | Final Battery Temp |
|--------------------------|:--------------------------------:|:------------------------------:|:-------:|:-------:|:-------:|:-------:|:-------------:|:----------------------------:|
| **Count**                 | 149                              | 149                            | 149     | 149     | 149     | 149     | 149           | 149                          |
| **Mean**                  | 28.58                            | 28.31                          | 1300    | 1926    | 2251    | 2413    | 77.78         | 37.65                        |
| **Standard Deviation**    | 2.04                             | 2.06                           | 757     | 567     | 355     | 219     | 0.09          | 3.44                         |
| **Minimum**               | 25.06                            | 25.03                          | 0.88    | 198     | 917     | 1721    | 48.66         | 31.33                        |
| **25th Percentile**       | 26.85                            | 26.30                          | 647     | 1571    | 2096    | 2367    | 72.06         | 35.65                        |
| **Median (50th Percentile)** | 28.69                          | 28.19                          | 1257    | 2063    | 2391    | 2518    | 79.80         | 37.46                        |
| **75th Percentile**       | 30.25                            | 30.15                          | 1922    | 2393    | 2527    | 2562    | 84.38         | 38.67                        |
| **Maximum**               | 31.90                            | 31.91                          | 2573    | 2579    | 2580    | 2580    | 89.43         | 51.57                        |

<p align="justify">
&emsp;&emsp; Here is also a representation of the correlation between variables in the data distribution. Based on the heatmap graph, it can be observed that each step duration correlates positively with SOC and the final temperature in the MCC battery charging process. However, in subsequent durations, the correlation with the target variables decreases. Nevertheless, the magnitude of the correlation values indicates the capability of the feature variables for prediction.
</p>

<div align="center">
    <img src="https://github.com/rhamdansyahrulm/EV-Battery-Charge-Optimization-with-Fuzzy-Logic-and-Neural-Network/assets/141615487/90860284-452b-4a6c-ab0d-2b7c0362aba1" width="65%">
</div>

<p align="justify">
&emsp;&emsp; The image above displays the pattern of data distribution between feature variables and the target. Based on the graph, it's evident that the correlation is not optimal due to the presence of outliers affecting the correlation results. Therefore, data preprocessing to handle outliers is necessary before training the neural network model.
</p>

<div align="center">
    <img src="https://github.com/rhamdansyahrulm/EV-Battery-Charge-Optimization-with-Fuzzy-Logic-and-Neural-Network/assets/141615487/9a011046-ff60-4585-a3cc-3382ab19c52c" width="65%">
</div>

<p align="justify">
&emsp;&emsp; The distribution of outlier values in the target variable can be seen in the histogram graph above. Outlier detection in this graph is performed using the standard deviation method. Based on the calculations, it is determined that there are 2 outliers in the lastSOC variable and 7 outliers in the lastTemp variable.
</p>

<div align="center">
    <img src="https://github.com/rhamdansyahrulm/EV-Battery-Charge-Optimization-with-Fuzzy-Logic-and-Neural-Network/assets/141615487/b812c914-a840-4226-8c6e-146057be516a" width="65%">
</div>
