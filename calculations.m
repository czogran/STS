clc;
clear all;
close all;

%Starting data
data


% UPLINK balance
    % EIRP CALCULATION 
        Gt_u=10*log10(pi^2*D_t^2*n_t/l_t^2)

        % isotropically radiated power from ground station [dB]
        EIRPes_u=Pdb_t+Gt_u
            
    % FSL UPLINK BALANCE
        % The difference in longitude of the broadcasting station and the satelite location 
        longitude_diffrence_u=abs(longitude_t-longitude_s)
        % can be wrong
        B_u=acos(cos(latitude_t/180*pi)*cos(longitude_diffrence_u/180*pi))/pi*180

        %distacne from satelitte
        d_u=Ro*sqrt(1+0.4199*(1-cos(B_u/180*pi)))

        % Attenuation in free space towards "uplink"
        FSL_u=20*log10(4*pi*d_u*1000/l_t)

    % ATTENUATION CALCULATION
        % elevation angle
        q_u=Re/(Ro+Re)

        E_u=atan((cos(B_u/180*pi)-q_u)/sin(B_u/180*pi))/pi*180
         
    % OTHER ATTENUATIONS
        if(latitude_t<36)
            hr_u=4;
        else
            hr_u=4-0.075*(latitude_t-36)
        end
        
        % signal distance in rain
        Ls_u=(hr_u-height_t/1000)/sin(E_u/180*pi)
        
        Le_u=Ls_u*90/(90+4*5.10*cos(E_u/180*pi))
        % reduction constant
        r_u=90/(90+4*Ls_u*cos(E_u/180*pi))         
        
        
        Arain_t=lr_u*Ls_u*r_u
        
        % A system availability, for example 99.997% 
        Ap_u=Arain_t*0.12*power((100-availability),-(0.546+0.043*log10(100-availability)))

    % C/N UPLINK
       C_N_u= EIRPes_u-(FSL_u+At_t+Ap_u)+G_T_u-K
              
% DOWNLINK balance            
    % FSL DOWNLINK BALANCE
        % The difference in longitude of the broadcasting station and the satelite location 
        longitude_diffrence_d=abs(longitude_r-longitude_s)
        % can be wrong
        B_d=acos(cos(latitude_r/180*pi)*cos(longitude_diffrence_d/180*pi))/pi*180

        %distacne from satelitte
        d_d=Ro*sqrt(1+0.4199*(1-cos(B_d/180*pi)))

        % Attenuation in free space towards "uplink"
        FSL_d=20*log10(4*pi*d_d*1000/l_r)


    % ATTENUATION CALCULATION
        % elevation angle
        q_d=Re/(Ro+Re)

        E_d=atan((cos(B_d/180*pi)-q_u)/sin(B_d/180*pi))/pi*180
  
     
    % OTHER ATTENUATIONS
        if(latitude_t<36)
            hr_d=4;
        else
            hr_d=4-0.075*(latitude_r-36)
        end
        
       
        % signal distance in rain
        Ls_d=(hr_d-height_r/1000)/sin(E_d/180*pi)
        
        % effective disctance
         Le_d=Ls_d*90/(90+4*5.10*cos(E_d/180*pi))
        % reduction constant
        r_d=90/(90+4*Ls_d*cos(E_d/180*pi))         
        
        
        Arain_r=lr_d*Ls_d*r_d
        
        % A system availability, for example 99.997% 
        Ap_d=Arain_r*0.12*power((100-availability),-(0.546+0.043*log10(100-availability)))

    % C/N DOWNLINK
       C_N_d= EIRP_s-(FSL_d+At_r+Ap_d)+G_T_r-K-abs(OBO_s)

    % C/N TOTAL
    C_N_total=10*log10(inv(1/power(10,C_N_d/10)+1/power(10,C_N_u/10)))
    
% TASK 3
    E_N=10*log10(power(erfcinv(2*BER),2))

    tenlogRb=C_N_total+code_gain-margin-E_N
    Rb=power(10,tenlogRb/10)

    B=Rb/O_QPSK
    
% CHARACTERISTIC OF RECEIVER ANTENNA
    G_r=10*log10(pi^2*D_r^2*n_r/l_r^2)
    % reciever noise temp     
    Ts=G_r-G_T_r
    
    availability_vector=99.9999:-0.00001:99.9995;
%         availability_vector=99.992

     Ap_help_d=0;
     Ap_help_u=0;
     C_N_help_d=0;
     C_N_help_u=0;
     C_N_help_total=0;
     E_N_help=0;
     BER_vector=[];
     pl=[];
    for i=1:length(availability_vector)
        
        
       Ap_help_d=Arain_r*0.12*power((100-availability_vector(i)),-(0.546+0.043*log10(100-availability_vector(i))));
       Ap_help_u=Arain_t*0.12*power((100-availability_vector(i)),-(0.546+0.043*log10(100-availability_vector(i))));
       C_N_help_d= EIRP_s-(FSL_d+At_r+Ap_help_d)+G_T_d-K-abs(OBO_s);
       C_N_help_u= EIRPes_u-(FSL_u+At_t+Ap_help_u)+G_T_u-K;
       C_N_help_total=10*log10(inv(1/power(10,C_N_help_d/10)+1/power(10,C_N_help_u/10)));
       E_N_help=power(10,(C_N_help_total-tenlogRb+code_gain-margin)/10);
       BER_vector(i)=1/2*erfc(sqrt(E_N_help));
       pl(i)=   Ap_help_u;
    end
    figure
    plot(availability_vector,  BER_vector)
    
     
   
    