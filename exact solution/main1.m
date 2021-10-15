  vp1=5677; vs1=2939; rho_U=2800;      %Model 1
 
 e1_U=0.05;   e2_U=0.1;    phi1_U=80;  phi2_U=-40;   

miu_U=rho_U*(vs1^2);  lamla_U=rho_U*(vp1^2)-2*miu_U;        
C= Cij(lamla_U,miu_U,e1_U,e2_U,phi1_U,phi2_U);
A= Aijkl_Cij_cal(C);
A=A/rho_U;

qP=zeros(360,1);  qS1=zeros(360,1);  qS2=zeros(360,1);

phi=90;
for theta= 1:1:90
    
% theta=40;
%  for phi=1:1:360
     
    Ni=[sind(theta)*cosd(phi),sind(theta)*sind(phi),cosd(theta)];

V=phasevelocity_MD(A,Ni);
 qP(theta)=V(1);
 qS1(theta)=V(2);
 qS2(theta)=V(3);
 end

%  headline={'VP_EXA','VS1_EXA','VS2_EXA'};     sheet=1;    
%  xlswrite('F:\\C\\1',headline,sheet,'A1:C1')
%  xlswrite('F:\\C\\1',qP,sheet,'A2:A361')  
%  xlswrite('F:\\C\\1',qS1,sheet,'B2:B361') 
%  xlswrite('F:\\C\\1',qS2,sheet,'C2:C361')  

 headline={'VP_EXA','VS1_EXA','VS2_EXA'};     sheet=4;
 xlswrite('F:\\C\\1',headline,sheet,'A1:C1')
 xlswrite('F:\\C\\1',qP,sheet,'A2:A91')  
 xlswrite('F:\\C\\1',qS1,sheet,'B2:B91') 
 xlswrite('F:\\C\\1',qS2,sheet,'C2:C91')  


 
 