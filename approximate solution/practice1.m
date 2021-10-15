%calculate approximate phase velocities      fracture densities e1, e2:  0.02-1

vp=5677; vs=2939; rho=2800; phi1=80;  phi2=-40;   

miu=rho*(vs^2);  lamla=rho*(vp^2)-2*miu;      theta=40;  

% phi=110;    %%qs1 

phi=90;    %qp,qs2


qP=zeros(2500,1);  qS1=zeros(2500,1);  qS2=zeros(2500,1);

 for e1=2:2:100          %fracture densities e1,e2 in the Cij script needs to be divided by 100
      for e2=2:2:100
          C= Cij(lamla,miu,e1,e2,phi1,phi2);
A= Aijkl_Cij_cal(C);
A=A/rho;  a=C/rho; 

    Ni=[sind(theta)*cosd(phi),sind(theta)*sind(phi),cosd(theta)];
     [PHI,B]=phi_cal(A,Ni,vs);
  V=phasepv(A,Ni,vs,a);
      qP(e1,e2)=V(1);
%    qS1(e1,e2)=V(2);
     qS2(e1,e2)=V(3);
      end
 end

 allqP=zeros(2500,1);  %qP
  k=1;
  for i=2:2:100
      for j=2:2:100
          allqP(k)=(qP(i,j));
          k=k+1;
      end
  end
  
alle1=zeros(2500,1);
p=1; 
for i=2:2:100
  for j=2:2:100
    alle1(p)=j;
    p=p+1;
  end
end

alle2=zeros(2500,1);
q=1;
for i=2:2:100
    for j=2:2:100
        alle2(q)=i;
        q=q+1;
    end
end   

 allqS2=zeros(2500,1);  %qS2
  k=1;
  for i=2:2:100
      for j=2:2:100
          allqS2(k)=(qS2(i,j));
          k=k+1;
      end
  end
  
alle1=zeros(2500,1);
p=1; 
for i=2:2:100
  for j=2:2:100
    alle1(p)=j;
    p=p+1;
  end
end

alle2=zeros(2500,1);
q=1; %
for i=2:2:100
    for j=2:2:100
        alle2(q)=i;
        q=q+1;
    end
end 

%  allqS1=zeros(2500,1);  %qS1
%   k=1;
%   for i=2:2:100
%       for j=2:2:100
%           allqS1(k)=(qS1(i,j));
%           k=k+1;
%       end
%   end
%   
% alle1=zeros(2500,1);
% p=1; 
% for i=2:2:100
%   for j=2:2:100
%     alle1(p)=j;
%     p=p+1;
%   end
% end
% 
% alle2=zeros(2500,1);
% q=1; 
% for i=2:2:100
%     for j=2:2:100
%         alle2(q)=i;
%         q=q+1;
%     end
% end 

headline={'VP_APP'};     sheet=2;
 xlswrite('F:\\C\\1',headline,sheet,'H1')
 xlswrite('F:\\C\\1',allqP,sheet,'H2:H2501') 

% headline={'qS1_APP'};     sheet=2;
%  xlswrite('F:\\C\\1',headline,sheet,'I1')
%  xlswrite('F:\\C\\1',allqS1,sheet,'I2:I2501') 
 
headline={'VS2_APP'};     sheet=2;
 xlswrite('F:\\C\\1',headline,sheet,'J1')
 xlswrite('F:\\C\\1',allqS2,sheet,'J2:J2501') 

