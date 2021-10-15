% Model 3    9 HTImodel

vp1=3600; vs1=1882; rho1=2400;         %upper medium

%lower medium
% vp2=1373; vs2=723;  rho2=1887;         %-70%    relative impedance contrast
% vp2=4164; vs2=2350; rho2=2490;         %20
vp2=5759; vs2=3281; rho2=2701;         %80

RPP=zeros(35,1);  
RPS=zeros(35,1); 
    
phi=30;    

epsilonv_1=0;    deltav_1=0;       gama_1=0;
gama_2=0.15;  deltav_2=0.24;  epsilonv_2=-0.3;           %strong anisotropy
% gama_2=0.06;  deltav_2=-0.04;  epsilonv_2=-0.05;       %weak anisotropy
% gama_2=0.15;  deltav_2=-0.24;  epsilonv_2=-0.05;         %moderate anisotropy


for theta=1:1:35

  R= RugerHTI_cal(vp1,vs1,rho1,vp2,vs2,rho2,epsilonv_1,epsilonv_2,gama_1,gama_2,deltav_1,deltav_2,theta,phi);
    RPP(theta)=(R(1));
    RPS(theta)=(R(3));   %[x1,x3] plane
end


 headline={'RPPruger-70%°„S','RPPruger20%°„S','RPPruger80%°„S'};     sheet=1;      %RugerHTI
 xlswrite('F:\\C\\3',headline,sheet,'E1:G1')                %strong anisotropy
%  xlswrite('F:\\C\\3',RPP,sheet,'E2:E36')                     %-70%  
%  xlswrite('F:\\C\\3',RPP,sheet,'F2:F36')                     %20%
%  xlswrite('F:\\C\\3',RPP,sheet,'G2:G36')                     %80%

 %weak anisotropy
 headline={'RPPruger-70%°„W','RPPruger20%°„W','RPPruger80%°„W'};     sheet=1;      %RugerHTI
 xlswrite('F:\\C\\3',headline,sheet,'M1:O1')
% xlswrite('F:\\C\\3',RPP,sheet,'M2:M36')                    %-70%        
% xlswrite('F:\\C\\3',RPP,sheet,'N2:N36')                    %20%
% xlswrite('F:\\C\\3',RPP,sheet,'O2:O36')                    %80%

%moderate 
 headline={'RPPruger-70%°„M','RPPruger20%°„M','RPPruger80%°„M'};     sheet=1;      %RugerHTI
 xlswrite('F:\\C\\3',headline,sheet,'AC1:AE1')
%  xlswrite('F:\\C\\3',RPP,sheet,'AC2:AC36')                %-70%
%  xlswrite('F:\\C\\3',RPP,sheet,'AD2:AD36')                %20%
%  xlswrite('F:\\C\\3',RPP,sheet,'AE2:AE36')                  %80

  
%----------------------------- RPS
 headline={'RPSruger-70%°„S','RPSruger20%°„S','RPSruger80%°„S'};     sheet=2;      %RugerHTI
 xlswrite('F:\\C\\3',headline,sheet,'E1:G1')                     %strong anisotropy
%  xlswrite('F:\\C\\3',RPS,sheet,'E2:E36')                     %-70% 
%  xlswrite('F:\\C\\3',RPS,sheet,'F2:F36')                     %20%
 xlswrite('F:\\C\\3',RPS,sheet,'G2:G36')                     %80%

%weak anisotropy
 headline={'RPSruger-70%°„W','RPSruger20%°„W','RPSruger80%°„W'};     sheet=2;      %RugerHTI
 xlswrite('F:\\C\\3',headline,sheet,'M1:O1')
% xlswrite('F:\\C\\3',RPS,sheet,'M2:M36')                      %-70%
% xlswrite('F:\\C\\3',RPS,sheet,'N2:N36')                      %20%
% xlswrite('F:\\C\\3',RPS,sheet,'O2:O36')                      %80%

%moderate 
 headline={'RPSruger-70%°„M','RPSruger20%°„M','RPSruger80%°„M'};     sheet=2;      %RugerHTI
 xlswrite('F:\\C\\3',headline,sheet,'AC1:AE1')
%  xlswrite('F:\\C\\3',RPS,sheet,'AC2:AC36')                  %-70%
%  xlswrite('F:\\C\\3',RPS,sheet,'AD2:AD36')                  %20%
%  xlswrite('F:\\C\\3',RPS,sheet,'AE2:AE36')                  %80%

