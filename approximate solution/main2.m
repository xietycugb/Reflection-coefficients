%Model 2  approximate reflection coefficients
% For values with very small reflection coefficients, we take three or four decimal places

RPP=zeros(32,1); 
RPS1=zeros(32,1); 
RPS2=zeros(32,1); 

vp1=3600; vs1=1882; rho1=2400;      % upper media
theta=20;  phi=70;
Ni=[sind(theta)*cosd(phi),sind(theta)*sind(phi),cosd(theta)];
   
% lower media
%  vp2=1373; vs2=723; rho2=1887;   %-70%      Relative impedance contrast
% vp2=1729; vs2=931; rho2=1999;    %-60%
% vp2=2067; vs2=228; rho2=2090;   %-50%
% vp2=2391; vs2=1317; rho2=2168;   %-40%
% vp2=2705; vs2=1500; rho2=2236;   %-30%
% vp2=3010; vs2=1678; rho2=2296;   %-20%
% vp2=3308; vs2=1851; rho2=2351;   %-10%

% vp2=3884; vs2=2187; rho2=2447;         %10
% vp2=4164; vs2=2350; rho2=2490;         %20
% vp2=4439; vs2=252; rho2=2530;         %30
% vp2=4710; vs2=2669; rho2=2568;         %40
% vp2=4977; vs2=2825; rho2=2604;         %50
% vp2=5241; vs2=2979; rho2=2638;         %60
% vp2=5501; vs2=3131; rho2=2670;         %70
% vp2=5759; vs2=3281; rho2=2701;         %80
% vp2=6013; vs2=3429; rho2=2730;         %90
vp2=6265; vs2=3576; rho2=2758;         %100


% e1_U=0.05;   e2_U=0.15;
e1_L=0.05;   e2_L=0.15; 

phi1_U=40;  phi2_U=20;  phi1_L=50;  phi2_L=10;
miu_U=rho1*(vs1^2);    lamla_U=rho1*(vp1^2)-2*miu_U;    
miu_L=rho2*(vs2^2);    lamla_L=rho2*(vp2^2)-2*miu_L;

   for i=1:1:32
% e1_L=0.62:-0.02:0;        % lower media
% e2_L=0:0.02:0.62;         % set the contrasts of the two fracture densities from 0.62 to -0.62   
% c_U = Cij(lamla_U,miu_U,e1_U,e2_U,phi1_U,phi2_U);
% c_L = Cij(lamla_L,miu_L,e1_L(i),e2_L(i),phi1_L,phi2_L);      
       
       
e1_U=0.62:-0.02:0;          % upper media
e2_U=0:0.02:0.62;          
c_U = Cij(lamla_U,miu_U,e1_U(i),e2_U(i),phi1_U,phi2_U);
c_L = Cij(lamla_L,miu_L,e1_L,e2_L,phi1_L,phi2_L);


A_1= Aijkl_Cij_cal(c_U);     A_1=A_1/rho1;     a1=c_U/rho1;
A_2= Aijkl_Cij_cal(c_L);     A_2=A_2/rho2;     a2=c_L/rho2;

 Rj= RefandTra_cal(a1,a2,c_U,c_L,A_1,A_2,Ni,vs1,vs2);
 RPP(i)=(Rj(1));
 RPS1(i)=(Rj(2));
 RPS2(i)=(Rj(3));
   end

  headline={'Rpp1_APP','Rps1_APP','Rps2_APP'}; 
  
%  sheet=1;   %e1_U=0.05;   e2_U=0.15;
 
 sheet=2;   % e1_L=0.05;   e2_L=0.15; 
 
  xlswrite('F:\\C\\2',headline,sheet,'G1:I1')
%   xlswrite('F:\\C\\2',RPP,sheet,'G2:G33')              %-70%
%  xlswrite('F:\\C\\2',RPS1,sheet,'H2:H33')
%  xlswrite('F:\\C\\2',RPS2,sheet,'I2:I33')
 
%  xlswrite('F:\\C\\2',RPP,sheet,'G34:G65')                %-60%
%  xlswrite('F:\\C\\2',RPS1,sheet,'H34:H65')
%  xlswrite('F:\\C\\2',RPS2,sheet,'I34:I65')
 
%   xlswrite('F:\\C\\2',RPP,sheet,'G66:G97')                %-50%
%  xlswrite('F:\\C\\2',RPS1,sheet,'H66:H97')
%  xlswrite('F:\\C\\2',RPS2,sheet,'I66:I97')

%  xlswrite('F:\\C\\2',RPP,sheet,'G98:G129')                %-40%
%  xlswrite('F:\\C\\2',RPS1,sheet,'H98:H129')
%  xlswrite('F:\\C\\2',RPS2,sheet,'I98:I129')

%  xlswrite('F:\\C\\2',RPP,sheet,'G130:G161')                %-30%
%  xlswrite('F:\\C\\2',RPS1,sheet,'H130:H161')
%  xlswrite('F:\\C\\2',RPS2,sheet,'I130:I161')

%  xlswrite('F:\\C\\2',RPP,sheet,'G162:G193')                %-20%
%  xlswrite('F:\\C\\2',RPS1,sheet,'H162:H193')
%  xlswrite('F:\\C\\2',RPS2,sheet,'I162:I193')

%  xlswrite('F:\\C\\2',RPP,sheet,'G194:G225')                %-10%
%  xlswrite('F:\\C\\2',RPS1,sheet,'H194:H225')
%  xlswrite('F:\\C\\2',RPS2,sheet,'I194:I225')

%   xlswrite('F:\\C\\2',RPP,sheet,'G226:G257')                %10%
%  xlswrite('F:\\C\\2',RPS1,sheet,'H226:H257')
%  xlswrite('F:\\C\\2',RPS2,sheet,'I226:I257')

%  xlswrite('F:\\C\\2',RPP,sheet,'G258:G289')                %20%
%  xlswrite('F:\\C\\2',RPS1,sheet,'H258:H289')
%  xlswrite('F:\\C\\2',RPS2,sheet,'I258:I289')

%  xlswrite('F:\\C\\2',RPP,sheet,'G290:G321')                %30%
%  xlswrite('F:\\C\\2',RPS1,sheet,'H290:H321')
%  xlswrite('F:\\C\\2',RPS2,sheet,'I290:I321')

%  xlswrite('F:\\C\\2',RPP,sheet,'G322:G353')                %40%
%  xlswrite('F:\\C\\2',RPS1,sheet,'H322:H353')
%  xlswrite('F:\\C\\2',RPS2,sheet,'I322:I353')

%  xlswrite('F:\\C\\2',RPP,sheet,'G354:G385')                %50%
%  xlswrite('F:\\C\\2',RPS1,sheet,'H354:H385')
%  xlswrite('F:\\C\\2',RPS2,sheet,'I354:I385')

%  xlswrite('F:\\C\\2',RPP,sheet,'G386:G417')                %60%
%  xlswrite('F:\\C\\2',RPS1,sheet,'H386:H417')
%  xlswrite('F:\\C\\2',RPS2,sheet,'I386:I417')

%  xlswrite('F:\\C\\2',RPP,sheet,'G418:G449')                %70%
%  xlswrite('F:\\C\\2',RPS1,sheet,'H418:H449')
%  xlswrite('F:\\C\\2',RPS2,sheet,'I418:I449')

%  xlswrite('F:\\C\\2',RPP,sheet,'G450:G481')                %80%
%  xlswrite('F:\\C\\2',RPS1,sheet,'H450:H481')
%  xlswrite('F:\\C\\2',RPS2,sheet,'I450:I481')

%  xlswrite('F:\\C\\2',RPP,sheet,'G482:G513')                %90%
%  xlswrite('F:\\C\\2',RPS1,sheet,'H482:H513')
%  xlswrite('F:\\C\\2',RPS2,sheet,'I482:I513')

 xlswrite('F:\\C\\2',RPP,sheet,'G514:G545')                %100%
 xlswrite('F:\\C\\2',RPS1,sheet,'H514:H545')
 xlswrite('F:\\C\\2',RPS2,sheet,'I514:I545')

