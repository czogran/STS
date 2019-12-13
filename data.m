% ALL DATA GIVEN FROM TASK, MAPS, CHARTS AND ETC

%Transmitter antenna data
%width [m]
D_t=2;
%efficiency
n_t=0.75;
%Ouput power in [W]
Pw_t=20;
%Output power in [dbW]=10*log10(Pw_t)
Pdb_t=13.01;
% ratio of gain to noise temperature [dB/K]
G_T_t=15;
% latitude
latitude_t=43+36/60;
% longitute
longitude_t=1.26;
% height over see level[m]
height_t=50;
% average rainfall per year [mm/h] from chart
rain_t=38;
%  get At_r from chart/La, value for given E-elevation angle
At_t=0.12;
% get attenuation constant from chart for given frequnecy and rain [dB/km] 
lr_u=1.8;

% wave lenght in uplink direction
l_t=0.021391;


%Receiver antenna data
%width [m]
D_r=1.5;
%efficiency
n_r=0.75;
%Ouput power in [W]
Pw_r=20;
%Output power in [dbW]
Pdb_r=13.01;
% ratio of gain to noise temperature [dB/K]
G_T_r=15;
% latitude
latitude_r=52.31;
% longitute
longitude_r=13.24;
% height over see level[m]
height_r=100;
% average rainfall per year [mm/h] from chart
rain=35;
% get At_r from chart/La, value for given E-elevation angle
At_r=0.14;
% wave lenght in downlink direction
l_r=0.023953;

% get attenuation constant from chart for given frequnecy and rain [dB/km]
lr_d=1.5;
        

% satellite [if west give minus]
longitude_s=-8;
% work point
OBO_s=-4;
% bandwidth
% TODO
Ku_s=0;
% ratio of gain to noise temperature [dB/K] from EUROSTAT MAP
G_T_u=8;
% ratio of gain to noise temperature [dB/K] from EUROSTAT MAP
G_T_d=15;
% effective radiated isotropic power of the satellite [dBW] from EUROSTAT MAP
EIRP_s=54;

% Other transmission data
% elementary error rate
BER=1e-6;
% modulation efficincy
% TODO
% for 0 QPSK=2[bit/sHz]
O_QPSK=2;
% correction code with gain [dB]
code_gain=3.5;
%availability [%]
availability=99.999;
% implementation margin [dB]
margin=0.5;

% other
% sun speed [m/s]
c=3e8;
% Boltman constant [dB]
K=-228.6;
% earth radius [km]
Re=6378;
% satallite distance from equator
Ro=35786;






