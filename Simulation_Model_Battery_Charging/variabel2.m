%% Parameters for Lithium-Ion Battery Pack with DC Fast Charging example
% DC fast charging example setup and workspace variables

% Copyright 2020 The MathWorks, Inc.

loc_data = "D:\Tugas Akhir\simulasi\data.xlsx";
data = readtable(loc_data);
column_name = data.Properties.VariableNames;

result_predict = readtable('result_predict.csv');
result_predict.tempReal = zeros(size(result_predict, 1), 1);
result_predict.socReal = zeros(size(result_predict, 1), 1);

%% General
cellInitialSOC=0.1; % All cell initial SOC [-]
auxLoad=3500;    % Auxillary power load (chiller/heater) [W]
% 
%% Lookup Table Points
T_vec=[273.15, 298.15, 323.15];             % Temperature vector T [K]
AH= 56.3;                                     % Cell capacity AH [Ahr]
SOC_vec=[0, .25, .75, 1];                   % Cell state of charge vector SOC [-]
Flowrate_vec=[0 0.01 0.02 0.03 0.04 0.05];  % Flowrate vector L [kg/s]
%
%% Cell Electrical
V0_mat=[3.00, 3.08, 3.04; 3.58, 3.65, 3.61; 3.59, 3.65, 3.61; 4.00, 4.217, 4.13];    % V0=f(SOC,T), cell OCV [V]
R0_mat=[.03, .015, .002; .04, .017, .008; .039, .012, .006; .027, .013, .021];  % R0=f(SOC,T), cell Ohmic Resistance [Ohm]
R1_mat=[.089, .076, .01; .042, .022, .099; .019, .007, .002; .051, .043, .029]; % R1=f(SOC,T), cell 1st RC pair Resistance [Ohm]
Tau1_mat=[44, 148, 235; 93, 110, 1000; 19, 27, 133; .5, 22, 3];                 % Tau1=f(SOC,T), cell 1st RC pair time constant [s]
R2_mat=[.014, .382, .407; .028, .006, .007; .014, .007, .006; .333, .956, .912];% R2=f(SOC,T), cell 2nd RC pair Resistance [Ohm]
Tau2_mat=[1, 44, 5644; 11, 24, 506; 2, 14, 330; 3310, 13419, 30216];            % Tau2=f(SOC,T), cell 2nd RC pair time constant [s]
Ndisc=100;delV0=0;delR0=0;delR1=0;delR2=0;delAH=0;                              % No change with cycling, not used in simulation

%
%% Cell Thermal
MdotCp=50000; % Cell thermal mass (mass times specific heat [J/K])
K_cell=100; % Cell thermal conductivity [W/(m*K)]
h_cell=1500;   % Heat transfer coefficient to ambient [W/(m^2*K)]
%

%% Module Electrical
cell_H=261;       % Cell height [mm]
cell_W=216;       % Cell width [mm]
cell_T=7.9;       % Cell thickness [mm]
    % Module A
    Ns=4;       % Number of series connected cells in module A
    Np=2;        % Number of parallel connected cells in module A
    Rext=3e-3;   % Additional resistance - busbars, cables, cell tabs [Ohm]
%

%% Module Thermal
    % Module A
    coolantQ=zeros(3,6,Ns*Np); % Module A cooling [W/K]; vector of size (T,L,Ns_A*Np_A)
    for cell_num=1:Ns*Np
        coolantQ(:,:,cell_num)=1.07*[0 .3 .6 .9 1.2 1.5;0 .3 .6 .9 1.2 1.5;0 .3 .6 .9 1.2 1.5];
    end
    extHeat=zeros(1,Ns*Np);
%
%% Cell-to-Cell Variation
    AhrVar=0.08; % max 3% variation in cell to cell capacity
    % Module A
    AhrVar_A=ones(1,Ns*Np);
    cellSOC_ini=cellInitialSOC*ones(1,Ns*Np);  % Initial cell SOC (-)
    for i=1:Ns*Np
        AhrVar_A(1,i)=0.920000000000000;
    end