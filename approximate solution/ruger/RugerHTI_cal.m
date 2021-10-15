function R= RugerHTI_cal(vp1,vs1,rho1,vp2,vs2,rho2,epv1,epv2,gama1,gama2,deltav1,deltav2,theta,phi)

beta=asind(sind(theta)*vs1/vp1);

deltarho=(rho2-rho1);
averho=(rho1+rho2)/2;

Z1=rho1*vp1;   Z2=rho2*vp2;          G1=rho1*vs1^2;    G2=rho2*vs2^2;
deltaZ=(Z2-Z1);  aveZ=(Z1+Z2)/2;         deltaG=(G2-G1);   aveG=(G1+G2)/2;

deltavp=(vp2-vp1);  avevp=(vp1+vp2)/2;
deltavs=(vs2-vs1);  avevs=(vs1+vs2)/2;

deltadeltav=(deltav2-deltav1);
deltagama=(gama2-gama1);
deltaepv=(epv2-epv1);

%RugerHTI 2002
Rpp=0.5*deltaZ/aveZ+0.5*(deltavp/avevp-(2*avevs/avevp)^2*deltaG/aveG+(deltadeltav+2*(2*avevs/avevp)^2*deltagama)*(cosd(phi)).^2)*(sind(theta)).^2 ...
+0.5*(deltavp/avevp+deltaepv*(cosd(phi)).^4+deltadeltav*(sind(phi)).^2*(cosd(phi)).^2)*(sind(theta)).^2*(tand(theta)).^2;
R(1,1)=Rpp;

%[x2,x3] plane
Rps1=-0.5*(deltarho/averho)*(sind(theta)/cosd(beta))-avevs/avevp*(deltarho/averho+2*deltavs/avevs)*sind(theta)*cosd(theta) ...
    +(avevs/avevp)^2*(2*deltavs/avevs+deltarho/averho)*(sind(theta)).^3/cosd(beta);
R(1,2)=Rps1;

%[x1,x3] plane
Rps2=-0.5*(deltarho/averho)*(sind(theta)/cosd(beta))-(avevs/avevp)*(deltarho/averho+2*(deltavs/avevs+gama1-gama2))*sind(theta)*cosd(theta) ...
    +(avevs/avevp)^2*(2*(deltavs/avevs+gama1-gama2)+deltarho/averho)*(sind(theta)).^3/cosd(beta)...
    +(((avevp)^2/((2*((avevp)^2-(avevs)^2))*cosd(beta)))-((avevp*avevs*cosd(theta))/(2*((avevp)^2-(avevs)^2))))*(deltav2-deltav1)*sind(theta) ...
    +((avevp*avevs*cosd(theta))/((avevp)^2-(avevs)^2))*(deltav2-deltav1+epv1-epv2)*(sind(theta)).^3 ...
    -((avevp^2)/(((avevp)^2-(avevs)^2)*cosd(beta)))*(deltav2-deltav1+epv1-epv2)*(sind(theta)).^3+...
    ((avevs^2)/(2*((avevp)^2-(avevs)^2)*cosd(beta)))*(deltav1-deltav2)*(sind(theta)).^3 ...
    +((avevs^2)/(((avevp)^2-(avevs)^2)*cosd(beta)))*(deltav2-deltav1+epv1-epv2)*(sind(theta)).^5;
R(1,3)=Rps2;
    
    

