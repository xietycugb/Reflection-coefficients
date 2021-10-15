  % contrast of qs1 and qs2 phase velocities for Model 1
vp1=5677; vs1=2939; rho_U=2800; 
   e1_U=0.05;   e2_U=0.1;    phi1_U=80;  phi2_U=-40;   

miu_U=rho_U*(vs1^2);  lamla_U=rho_U*(vp1^2)-2*miu_U;       
C= Cij(lamla_U,miu_U,e1_U,e2_U,phi1_U,phi2_U);
A= Aijkl_Cij_cal(C);
A=A/rho_U;

  qS1=zeros(360,1);  qS2=zeros(360,1); qS=zeros(360,1);

for theta= 1:1:90
 for phi=1:1:90
    Ni=[sind(theta)*cosd(phi),sind(theta)*sind(phi),cosd(theta)];
V=phasevelocity_MD(A,Ni);
 qS1(theta,phi)=V(2);
 qS2(theta,phi)=V(3);
 
 end
end

  R_allqs1=zeros(8100,1);  
  k=1;
  for i=1:1:90
      for j=1:1:90
          R_allqs1(k)=(qS1(i,j));
          k=k+1;
      end
  end
  
    R_allqs2=zeros(8100,1);  
  k=1;
  for i=1:1:90
      for j=1:1:90
          R_allqs2(k)=(qS2(i,j));
          k=k+1;
      end
  end
  
phi_allpp=zeros(8100,1);
p=1; 
for i=1:1:90
  for j=1:1:90
    phi_allpp(p)=j;
    p=p+1;
  end
end

theta_allpp=zeros(8100,1);
q=1; 
for i=1:1:90
    for j=1:1:90
        theta_allpp(q)=i;
        q=q+1;
    end
end

 headline={'theta','phi','VS1_EXA','VS2_EXA'};     sheet=3;
xlswrite('F:\\C\\1',headline,sheet,'A1:D1')
xlswrite('F:\\C\\1', theta_allpp, sheet,'A2:A8101') %qP  
xlswrite('F:\\C\\1',  phi_allpp, sheet,'B2:B8101') 
xlswrite('F:\\C\\1', R_allqs1, sheet,'C2:C8101') 
xlswrite('F:\\C\\1', R_allqs2, sheet,'D2:D8101') 