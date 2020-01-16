% ALL DATA GIVEN FROM TASK, MAPS, CHARTS AND ETC

%Transmitter antenna data
%width [m]
D_t=1.5;
%efficiency
n_t=0.75;
%Ouput power in [W]
Pw_t=30;
%Output power in [dbW]=10*log10(Pw_t)
Pdb_t=10*log10(Pw_t);
% ratio of gain to noise temperature [dB/K]
G_T_t=25;
% latitude, minutes doesn;t take properely-1minute=60 it takes that minute
% equals 100
latitude_t=43;
% longitute
longitude_t=7;
% height over see level[m]
height_t=52;
% average rainfall per year [mm/h] from chart
rain_t=50;
%  get At_r from chart/La, value for given E-elevation angle
At_t=0.15;
% get attenuation constant from chart for given frequnecy and rain [dB/km] 
lr_u=2.5;

% wave lenght in uplink direction
l_t=0.02;


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
G_T_r=20;
% latitude
latitude_r=54;
% longitute
longitude_r=18.38;
% height over see level[m]
height_r=31;
% average rainfall per year [mm/h] from chart
rain=20;
% get At_r from chart/La, value for given E-elevation angle
At_r=0.17;
% get attenuation constant from chart for given frequnecy and rain [dB/km]
lr_d=0.6;
% wave lenght in downlink direction
l_r=0.0248;      

% satellite [if west give minus]
longitude_s=7;
% work point
OBO_s=-1;
% bandwidth
% TODO
% Ku_s=0;
% ratio of gain to noise temperature [dB/K] from EUROSTAT MAP
G_T_u=5;
% ratio of gain to noise temperature [dB/K] from EUROSTAT MAP
G_T_d=5;
% effective radiated isotropic power of the satellite [dBW] from EUROSTAT MAP
EIRP_s=50;

% Other transmission data
% elementary error rate
BER=1e-6;
% modulation efficincy
% TODO
% for 0 QPSK=2[bit/sHz]
O_QPSK=2;
% correction code with gain [dB]
code_gain=4;
%availability [%]
availability=99.992;
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






