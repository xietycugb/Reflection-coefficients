
RPP=zeros(90,1);  
RPS1=zeros(90,1); 
RPS2=zeros(90,1); 

% vp1=5677; vs1=2939; rho_U=2800;                 %  the upper medium is isotropic, the lower medium is monoclinic
% vp2=2705; vs2=1500; rho_L=2236;        
% e1_U=0;      e2_U=0;       phi1_U=0;    phi2_U=0;      
% e1_L=0.05;   e2_L=0.15;    phi1_L=80;   phi2_L=-40;



vp1=3600; vs1=1882; rho_U=2400;      %MON
vp2=6013; vs2=3429; rho_L=2730;
e1_U=0.05;   e2_U=0.15;    phi1_U=40;  phi2_U=20;  
e1_L=0.36;   e2_L=0.26;    phi1_L=50;  phi2_L=10; 

miu_U=rho_U*(vs1^2);    lamla_U=rho_U*(vp1^2)-2*miu_U;    
miu_L=rho_L*(vs2^2);    lamla_L=rho_L*(vp2^2)-2*miu_L;    
c_U = Cij(lamla_U,miu_U,e1_U,e2_U,phi1_U,phi2_U);
c_L = Cij(lamla_L,miu_L,e1_L,e2_L,phi1_L,phi2_L);
A_1= Aijkl_Cij_cal(c_U);  A_1=A_1/rho_U;   a1=c_U/rho_U;
A_2= Aijkl_Cij_cal(c_L);  A_2=A_2/rho_L;   a2=c_L/rho_L;
                   
% phi=89.9999999; 

phi=40;

% for theta=1:1:90
for theta=1:1:35
  N=[sind(theta)*cosd(phi),sind(theta)*sind(phi),cosd(theta)];
Rj= RefandTra_cal(a1,a2,c_U,c_L,A_1,A_2,N,vs1,vs2);

RPP(theta)= (Rj(1));
RPS1(theta)=(Rj(2));
RPS2(theta)=(Rj(3));
end

%  headline={'RPP_APP','RPS1_APP','RPS2_APP'};     sheet=5;
%  xlswrite('F:\\C\\1',headline,sheet,'E1:G1')
%  xlswrite('F:\\C\\1',RPP,sheet,'E2:E91') 
%  xlswrite('F:\\C\\1',RPS1,sheet,'F2:F91') 
%  xlswrite('F:\\C\\1',RPS2,sheet,'G2:G91') 
 
 headline={'RPP_APP','RPS1_APP','RPS2_APP'};     sheet=6;
 xlswrite('F:\\C\\1',headline,sheet,'E1:G1')
 xlswrite('F:\\C\\1',RPP,sheet,'E2:E36') 
 xlswrite('F:\\C\\1',RPS1,sheet,'F2:F36') 
 xlswrite('F:\\C\\1',RPS2,sheet,'G2:G36') 
 
 
 
 
 