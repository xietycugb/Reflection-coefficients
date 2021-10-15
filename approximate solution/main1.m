
alpha=5677; belta=2939;  rho=2800;   e1=0.05;e2=0.1; phi1=80;phi2=-40;     %Model 1
miu=rho*(belta^2);     lamla=rho*(alpha^2)-2*miu;

VP=zeros(360,1);  VS1=zeros(360,1);  VS2=zeros(360,1);

C= Cij(lamla,miu,e1,e2,phi1,phi2);
a=C/rho;
A= Aijkl_Cij_cal(C);
A=A/rho;

phi=90;
for theta=1:1:90

%     theta=40; 
%  for phi=1:1:360
    
    N=[cosd(phi)*sind(theta),sind(phi)*sind(theta),cosd(theta)];
    V=phasepv(A,N,belta,a);
   
VP(theta)=V(1);
VS1(theta)=V(2);
VS2(theta)=V(3);
end

% headline={'VP_APP','VS1_APP','VS2_APP'};     sheet=1;
% xlswrite('F:\\C\\1',headline,sheet,'E1:G1')
%  xlswrite('F:\\C\\1', VP, sheet,'E2:E361') 
%  xlswrite('F:\\C\\1', VS1, sheet,'F2:F361')
%  xlswrite('F:\\C\\1', VS2, sheet,'G2:G361')


headline={'VP_APP','VS1_APP','VS2_APP'};     sheet=4;
xlswrite('F:\\C\\1',headline,sheet,'E1:G1')
 xlswrite('F:\\C\\1', VP, sheet,'E2:E91') 
 xlswrite('F:\\C\\1', VS1, sheet,'F2:F91')
 xlswrite('F:\\C\\1', VS2, sheet,'G2:G91')

