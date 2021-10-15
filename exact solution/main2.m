%Model 2  exact reflection coefficients
% For values with very small reflection coefficients, we take three or four decimal places

RPP=zeros(32,1);                  
RPS1=zeros(32,1); 
RPS2=zeros(32,1); 

vp1=3600; vs1=1882; rho1=2400;      % upper media
theta=20;  phi=70;
Ni=[sind(theta)*cosd(phi),sind(theta)*sind(phi),cosd(theta)];

% lower media
vp2=1373; vs2=723; rho2=1887;    %-70%    Relative impedance contrast
% vp2=1729; vs2=931; rho2=1999;    %-60%
% vp2=2067; vs2=228; rho2=2090;    %-50%
% vp2=2391; vs2=1317; rho2=2168;   %-40%
% vp2=2705; vs2=1500; rho2=2236;   %-30%
% vp2=3010; vs2=1678; rho2=2296;   %-20%
% vp2=3308; vs2=1851; rho2=2351;   %-10%

% vp2=3884; vs2=2187; rho2=2447;         %10
% vp2=4164; vs2=2350; rho2=2490;         %20
% vp2=4439; vs2=252; rho2=2530;          %30
% vp2=4710; vs2=2669; rho2=2568;         %40
% vp2=4977; vs2=2825; rho2=2604;         %50
% vp2=5241; vs2=2979; rho2=2638;         %60
% vp2=5501; vs2=3131; rho2=2670;         %70
% vp2=5759; vs2=3281; rho2=2701;         %80
% vp2=6013; vs2=3429; rho2=2730;         %90
% vp2=6265; vs2=3576; rho2=2758;         %100


e1_U=0.05;   e2_U=0.15;
% e1_L=0.05;   e2_L=0.15; 

phi1_U=40;  phi2_U=20;  phi1_L=50;  phi2_L=10;
miu_U=rho1*(vs1^2);    lamla_U=rho1*(vp1^2)-2*miu_U;
miu_L=rho2*(vs2^2); lamla_L=rho2*(vp2^2)-2*miu_L;    

for i=1:1:32
    e1_L=0.62:-0.02:0;        % lower media
    e2_L=0:0.02:0.62;         % set the contrasts of the two fracture densities from 0.62 to -0.62   
    c_U = Cij(lamla_U,miu_U,e1_U,e2_U,phi1_U,phi2_U);
    c_L = Cij(lamla_L,miu_L,e1_L(i),e2_L(i),phi1_L,phi2_L);
    
     
%     e1_U=0.62:-0.02:0;        % upper media
%     e2_U=0:0.02:0.62;         
%     c_U = Cij(lamla_U,miu_U,e1_U(i),e2_U(i),phi1_U,phi2_U);
%     c_L = Cij(lamla_L,miu_L,e1_L,e2_L,phi1_L,phi2_L);
    
    
    A_1= Aijkl_Cij_cal(c_U);     A_1=A_1/rho1;   a1=c_U/rho1;
    A_2= Aijkl_Cij_cal(c_L);     A_2=A_2/rho2;   a2=c_L/rho2;
    
 Rj= RefandTra_cal(a1,a2,c_U,c_L,A_1,A_2,Ni);
 RPP(i)=(Rj(1)); 
 RPS1(i)=(Rj(2)); 
 RPS2(i)=(Rj(3));
end
  

 headline={'Rpp1_EXA','Rps1_EXA','Rps2_EXA'};     
 sheet=1;   %e1_U=0.05;   e2_U=0.15;
 
 %sheet=2;   % e1_L=0.05;   e2_L=0.15; 
 
 
 xlswrite('F:\\C\\2',headline,sheet,'C1:E1')
 xlswrite('F:\\C\\2',RPP,sheet,'C2:C33')              %-70%
 xlswrite('F:\\C\\2',RPS1,sheet,'D2:D33')
 xlswrite('F:\\C\\2',RPS2,sheet,'E2:E33')
 
%  xlswrite('F:\\C\\2',RPP,sheet,'C34:C65')                %-60%
%  xlswrite('F:\\C\\2',RPS1,sheet,'D34:D65')
%  xlswrite('F:\\C\\2',RPS2,sheet,'E34:E65')
 
%   xlswrite('F:\\C\\2',RPP,sheet,'C66:C97')                %-50%
%  xlswrite('F:\\C\\2',RPS1,sheet,'D66:D97')
%  xlswrite('F:\\C\\2',RPS2,sheet,'E66:E97')

%  xlswrite('F:\\C\\2',RPP,sheet,'C98:C129')                %-40%
%  xlswrite('F:\\C\\2',RPS1,sheet,'D98:D129')
%  xlswrite('F:\\C\\2',RPS2,sheet,'E98:E129')

%  xlswrite('F:\\C\\2',RPP,sheet,'C130:C161')                %-30%
%  xlswrite('F:\\C\\2',RPS1,sheet,'D130:D161')
%  xlswrite('F:\\C\\2',RPS2,sheet,'E130:E161')

%  xlswrite('F:\\C\\2',RPP,sheet,'C162:C193')                %-20%
%  xlswrite('F:\\C\\2',RPS1,sheet,'D162:D193')
%  xlswrite('F:\\C\\2',RPS2,sheet,'E162:E193')

%  xlswrite('F:\\C\\2',RPP,sheet,'C194:C225')                %-10%
%  xlswrite('F:\\C\\2',RPS1,sheet,'D194:D225')
%  xlswrite('F:\\C\\2',RPS2,sheet,'E194:E225')

%   xlswrite('F:\\C\\2',RPP,sheet,'C226:C257')                %10%
%  xlswrite('F:\\C\\2',RPS1,sheet,'D226:D257')
%  xlswrite('F:\\C\\2',RPS2,sheet,'E226:E257')

%  xlswrite('F:\\C\\2',RPP,sheet,'C258:C289')                %20%
%  xlswrite('F:\\C\\2',RPS1,sheet,'D258:D289')
%  xlswrite('F:\\C\\2',RPS2,sheet,'E258:E289')

%  xlswrite('F:\\C\\2',RPP,sheet,'C290:C321')                %30%
%  xlswrite('F:\\C\\2',RPS1,sheet,'D290:D321')
%  xlswrite('F:\\C\\2',RPS2,sheet,'E290:E321')

%  xlswrite('F:\\C\\2',RPP,sheet,'C322:C353')                %40%
%  xlswrite('F:\\C\\2',RPS1,sheet,'D322:D353')
%  xlswrite('F:\\C\\2',RPS2,sheet,'E322:E353')

%  xlswrite('F:\\C\\2',RPP,sheet,'C354:C385')                %50%
%  xlswrite('F:\\C\\2',RPS1,sheet,'D354:D385')
%  xlswrite('F:\\C\\2',RPS2,sheet,'E354:E385')

%  xlswrite('F:\\C\\2',RPP,sheet,'C386:C417')                %60%
%  xlswrite('F:\\C\\2',RPS1,sheet,'D386:D417')
%  xlswrite('F:\\C\\2',RPS2,sheet,'E386:E417')

%  xlswrite('F:\\C\\2',RPP,sheet,'C418:C449')                %70%
%  xlswrite('F:\\C\\2',RPS1,sheet,'D418:D449')
%  xlswrite('F:\\C\\2',RPS2,sheet,'E418:E449')

%  xlswrite('F:\\C\\2',RPP,sheet,'C450:C481')                %80%
%  xlswrite('F:\\C\\2',RPS1,sheet,'D450:D481')
%  xlswrite('F:\\C\\2',RPS2,sheet,'E450:E481')

%  xlswrite('F:\\C\\2',RPP,sheet,'C482:C513')                %90%
%  xlswrite('F:\\C\\2',RPS1,sheet,'D482:D513')
%  xlswrite('F:\\C\\2',RPS2,sheet,'E482:E513')

%  xlswrite('F:\\C\\2',RPP,sheet,'C514:C545')                %100%
%  xlswrite('F:\\C\\2',RPS1,sheet,'D514:D545')
%  xlswrite('F:\\C\\2',RPS2,sheet,'E514:E545')


