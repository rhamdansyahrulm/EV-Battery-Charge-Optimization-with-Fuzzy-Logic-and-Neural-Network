# **Machine Learning Model**

## **1. Neural Network**

<p align="justify">
&emsp;&emsp;The neural network model has six input variables (suhuRuangan, suhuAwalBaterai, t1, t2, t3, t4, t5) and two outputs (lastSOC and lastSuhu). It uses ReLU activation for neurons and optimizes weights with the Adam optimizer, aiming to minimize Mean Squared Error (MSE) for improved performance in multilinear regression tasks.
  
&emsp;&emsp;The system will generate random values for the duration variable at each current level 100,000 times. After obtaining the predicted increases in SOC and temperature, the parameters that yield the highest SOC increase and the lowest temperature increase, considering a minimum predicted SOC of 80%, will be used as references in the application of fuzzy logic.
</p>

<div align="center">
  
| Layer | Number of Neurons | Parameters | Activation Function |
|:-----:|:-----------------:|:----------:|:-------------------:|
| 1     | 32                | 224        | ReLU                |
| 2     | 64                | 2112       | ReLU                |
| 3     | 128               | 8320       | ReLU                |
| 4     | 64                | 8256       | ReLU                |
| 5     | 32                | 2080       | ReLU                |
| 6     | 2                 | 66         | ReLU                |

<i>Neural Network Architecture</i>
</div>

<p align="justify">
&emsp;&emsp;In order to validate the results of the training conducted by the neural network model architecture, an evaluation process is required to assess the model's performance in predicting the target variable. The purpose of this evaluation is to ensure that the model has been developed and trained effectively and can be relied upon for real-world use. In this research, model evaluation is calculated using the mean squared error (MSE) loss function. The following is a line graph of the loss values at each iteration of the neural network model training.
</p>

<div align="center">
    <img src="https://github.com/rhamdansyahrulm/EV-Battery-Charge-Optimization-with-Fuzzy-Logic-and-Neural-Network/assets/141615487/99cac54a-15ec-4fc0-af47-281df98bec9b" width="55%">

<i>Lost Function</i>

</div>

<p align="justify">
&emsp;&emsp;Through further analysis, it can be determined that the training process of this model is relatively stable and convergent. This is indicated by the absence of significant fluctuations in the loss function values during the training process. Consistency in the reduction of loss values and good alignment between training and validation data indicate that the model does not encounter major challenges in recognizing patterns within the data.
</p>

<div align="center">
    <img src="https://github.com/rhamdansyahrulm/EV-Battery-Charge-Optimization-with-Fuzzy-Logic-and-Neural-Network/assets/141615487/a72d157a-91f6-4b83-ae73-f4d1ce9c7888" width="65%">

<i>comparing predictions and actual values in SOC (State of Charge) and temperature testing.</i>

</div>

## **2. Fuzzy Logic**

<p align="justify">
&emsp;&emsp;Fuzzy logic is utilized to optimize charging duration while considering SOC and temperature to maximize SOC with minimal temperature increase. The system employs trapezoidal membership functions for three linguistic variables: SOC, temperature, and duration, each having low and high linguistic sets. Fuzzy logic rules are defined using 'if-then' statements, as shown in image and Table below. 
</p>

<div align="center">
    <img src="https://github.com/rhamdansyahrulm/EV-Battery-Charge-Optimization-with-Fuzzy-Logic-and-Neural-Network/assets/141615487/5239a71e-bc9a-4d08-a586-54ba2b50f552" width="50%">

<i>Fuzzy Logic Membership Functions</i>

</div>

<div align="center">

| Final SOC | Final Temperature | Duration  |
|:---------:|:-----------------:|:---------:|
| High      | High              | Long      |
| High      | Low               | Long      |
| Low       | High              | Long      |
| Low       | Low               | Short     |

<i>Fuzzy Rules</i>

</div>

<p align="justify">
&emsp;&emsp;The final step in the fuzzy logic method is the defuzzification process, which involves converting the output results of fuzzy inference into a single concrete value. In this experiment, the defuzzification method employed is the Tsukamoto method, which involves calculating the centroid.
</p>

<div align="center">
    <img src="https://github.com/rhamdansyahrulm/EV-Battery-Charge-Optimization-with-Fuzzy-Logic-and-Neural-Network/assets/141615487/e23e2015-d0ad-4298-aab3-171a5685432a" width="50%">

<i>Tsukamoto Methods for Fuzzy Logic</i>

</div>
