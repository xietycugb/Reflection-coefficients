% Model 3    9 HTImodel     exact solution

vp1=3600; vs1=1882; rho1=2400;         % upper medium

%lower medium
vp2=1373; vs2=723;  rho2=1887;         %-70%     relative impedance contrast
% vp2=4164; vs2=2350; rho2=2490;         %20
% vp2=5759; vs2=3281; rho2=2701;         %80

RPP=zeros(35,1);  
RPS=zeros(35,1); 

% phi=30;   %qP
phi=0.0000001;    %qS  [x1,x3] plane

epsilonv_1=0;    deltav_1=0;       gama_1=0;
gama_2=0.15;  deltav_2=0.24;  epsilonv_2=-0.3;       %strong anisotropy
% gama_2=0.06;  deltav_2=-0.04;  epsilonv_2=-0.05;     %weak anisotropy
% gama_2=0.15;  deltav_2=-0.24;  epsilonv_2=-0.05;       %moderate anisotropy

c_U = SMHTI_cal(vp1,vs1,rho1,epsilonv_1,deltav_1,gama_1);
c_L = SMHTI_cal(vp2,vs2,rho2,epsilonv_2,deltav_2,gama_2);

  A_1= Aijkl_Cij_cal(c_U);     A_2= Aijkl_Cij_cal(c_L);   
  A_1=A_1/rho1;               A_2=A_2/rho2;     a1=c_U/rho1;   a2=c_L/rho2;

  for theta=1:1:35
   Ni=[sind(theta)*cosd(phi),sind(theta)*sind(phi),cosd(theta)];
 Rj= RefandTra_cal(a1,a2,c_U,c_L,A_1,A_2,Ni);
 RPP(theta)=(Rj(1));
 RPS(theta)=(Rj(3));      %[x1,x3] plane
  end
  
headline={'RPPexact-70%°„S','RPPexact20%°„S','RPPexact80%°„S'};     sheet=1;
 xlswrite('F:\\C\\3',headline,sheet,'A1:C1')                %strong anisotropy
%  xlswrite('F:\\C\\3',RPP,sheet,'A2:A36')                     %-70%  
%  xlswrite('F:\\C\\3',RPP,sheet,'B2:B36')                     %20%
%  xlswrite('F:\\C\\3',RPP,sheet,'C2:C36')                     %80%

 %weak anisotropy
headline={'RPPexact-70%°„W','RPPexact20%°„W','RPPexact80%°„W'};     sheet=1;      
 xlswrite('F:\\C\\3',headline,sheet,'I1:K1')
% xlswrite('F:\\C\\3',RPP,sheet,'I2:I36')                    %-70%        
% xlswrite('F:\\C\\3',RPP,sheet,'J2:J36')                    %20%
% xlswrite('F:\\C\\3',RPP,sheet,'K2:K36')                    %80%

%moderate 
headline={'RPPexact-70%°„M','RPPexact20%°„M','RPPexact80%°„M'};     sheet=1;      
 xlswrite('F:\\C\\3',headline,sheet,'Y1:AA1')
%  xlswrite('F:\\C\\3',RPP,sheet,'Y2:Y36')                %-70%
%  xlswrite('F:\\C\\3',RPP,sheet,'Z2:Z36')                %20%
%  xlswrite('F:\\C\\3',RPP,sheet,'AA2:AA36')              %80%



%----------------------------- RPS
   headline={'RPSexact-70%°„S','RPSexact20%°„S','RPSexact80%°„S'};     sheet=2;      
 xlswrite('F:\\C\\3',headline,sheet,'A1:C1')                %strong anisotropy
 xlswrite('F:\\C\\3',RPS,sheet,'A2:A36')                     %-70%  
%  xlswrite('F:\\C\\3',RPS,sheet,'B2:B36')                     %20%
%  xlswrite('F:\\C\\3',RPS,sheet,'C2:C36')                     %80%

 %weak anisotropy
 headline={'RPSexact-70%°„W','RPSexact20%°„W','RPSexact80%°„W'};     sheet=2;      
 xlswrite('F:\\C\\3',headline,sheet,'I1:K1')
% xlswrite('F:\\C\\3',RPS,sheet,'I2:I36')                    %-70%        
% xlswrite('F:\\C\\3',RPS,sheet,'J2:J36')                    %20%
% xlswrite('F:\\C\\3',RPS,sheet,'K2:K36')                    %80%

%moderate 
 headline={'RPSexact-70%°„M','RPSexact20%°„M','RPSexact80%°„M'};     sheet=2;     
 xlswrite('F:\\C\\3',headline,sheet,'Y1:AA1')
%  xlswrite('F:\\C\\3',RPS,sheet,'Y2:Y36')                %-70%
%  xlswrite('F:\\C\\3',RPS,sheet,'Z2:Z36')                %20%
%  xlswrite('F:\\C\\3',RPS,sheet,'AA2:AA36')              %80%

