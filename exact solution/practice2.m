
% vp1=5677; vs1=2939; rho_U=2800;     %  the upper medium is isotropic, the lower medium is monoclinic
% vp2=2705; vs2=1500; rho_L=2236;        
% e1_U=0;      e2_U=0;        phi1_U=0;   phi2_U=0;
% e1_L=0.05;   e2_L=0.15;     phi1_L=80;  phi2_L=-40;   
 

vp1=3600; vs1=1882; rho_U=2400;      %MON    relative impedance contrast 0.9
vp2=6013; vs2=3429; rho_L=2730;
e1_U=0.05;   e2_U=0.15;    phi1_U=40;  phi2_U=20;        
e1_L=0.36;   e2_L=0.26;    phi1_L=50;  phi2_L=10;       %fracture density contrast 0.1

miu_U=rho_U*(vs1^2);    lamla_U=rho_U*(vp1^2)-2*miu_U;    
miu_L=rho_L*(vs2^2);    lamla_L=rho_L*(vp2^2)-2*miu_L; 

RPP=zeros(90,1);  
RPS1=zeros(90,1); 
RPS2=zeros(90,1); 

c_U = Cij(lamla_U,miu_U,e1_U,e2_U,phi1_U,phi2_U);
c_L = Cij(lamla_L,miu_L,e1_L,e2_L,phi1_L,phi2_L); 
A_1= Aijkl_Cij_cal(c_U);   A_1=A_1/rho_U;   a1=c_U/rho_U;
A_2= Aijkl_Cij_cal(c_L);   A_2=A_2/rho_L;   a2=c_L/rho_L;   
  
%   phi=89.9999999;
     phi=40;

 for theta=1:1:90
     
 Ni=[sind(theta)*cosd(phi),sind(theta)*sind(phi),cosd(theta)];
 Rj= RefandTra_cal(a1,a2,c_U,c_L,A_1,A_2,Ni);
 RPP(theta)=(Rj(1));
 RPS1(theta)=(Rj(2));
 RPS2(theta)=(Rj(3));
 end
 
%  headline={'RPP_EXA','RPS1_EXA','RPS2_EXA'};     sheet=5;
%  xlswrite('F:\\C\\1',headline,sheet,'A1:C1')
%  xlswrite('F:\\C\\1',RPP,sheet,'A2:A91') 
%  xlswrite('F:\\C\\1',RPS1,sheet,'B2:B91') 
%  xlswrite('F:\\C\\1',RPS2,sheet,'C2:C91') 
 
headline={'RPP_EXA','RPS1_EXA','RPS2_EXA'};  sheet=6;
 xlswrite('F:\\C\\1',headline,sheet,'A1:C1')   
 xlswrite('F:\\C\\1',RPP,sheet,'A2:A36') 
 xlswrite('F:\\C\\1',RPS1,sheet,'B2:B36') 
 xlswrite('F:\\C\\1',RPS2,sheet,'C2:C36') 
 

 


