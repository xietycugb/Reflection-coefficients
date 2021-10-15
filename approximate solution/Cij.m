function c=Cij(lamla,miu,e1,e2,phi1,phi2)
% e1=e1*0.01;
% e2=e2*0.01;
g=miu/(lamla+2*miu);
delta1=(16*e1)/(16*e1+3*(3-2*g));
delta2=(16*e2)/(16*e2+3*(3-2*g));
% kt1=D1
D1=delta1/(miu*(1-delta1));
D2=delta2/(miu*(1-delta2));

F1=(0.5*(D1+D2)+1/miu+0.5*D1*cosd(4*phi1)+0.5*D2*cosd(4*phi2));
F2=(1/miu+0.5*D1*(1-cosd(2*phi1))+0.5*D2*(1-cosd(2*phi2)));
F3=(1/miu+0.5*D1*(1+cosd(2*phi1))+0.5*D2*(1+cosd(2*phi2)));
F4=0.25*D1*sind(4*phi1)+0.25*D2*sind(4*phi2);
F5=0.5*D1*sind(2*phi1)+0.5*D2*sind(2*phi2);

S2=-lamla/(2*miu*(3*lamla+2*miu))-(D1*(1-cosd(4*phi1)))/8-(D2*(1-cosd(4*phi2)))/8;

S1=(lamla+2*miu)/(2*miu*(3*lamla+2*miu))-S2;

R2=-lamla^2/(4*miu^2*(3*lamla+2*miu)^2)+(lamla+miu)*S2/(miu*(3*lamla+2*miu));

R1=-lamla^2/(4*miu^2*(3*lamla+2*miu)^2)+(lamla+miu)*S1/(miu*(3*lamla+2*miu));

J=1/(4*miu^2*(3*lamla+2*miu))+(D1*(1-cosd(4*phi1))+D2*(1-cosd(4*phi2)))/(8*miu*(3*lamla+2*miu));

M=(lamla+miu)/(miu*(3*lamla+2*miu))*(1/miu^2+(D1+D2)/miu+D1*D2*sind(phi1-phi2)^2);

C1=(lamla+2*miu)*F4/(2*miu*(3*lamla+2*miu));

C2=-F4/(2*miu*(3*lamla+2*miu));

T1=F2*F3-F5^2;     
T2=F1*J+2*F4*C2;   

c(1,1)=(F1*R1*T1-M*F4^2)/(T1*T2);
c(2,2)=c(1,1);
c(1,2)=-(F1*R2*T1+M*F4^2)/(T1*T2);
c(1,6)=-C2/T2;
c(2,6)=-c(1,6);
c(6,6)=J/T2;
c(4,4)=F3/T1;
c(4,5)=-F5/T1;
c(5,5)=F2/T1;
c(1,3)=lamla;
c(2,3)=c(1,3);
c(3,3)=(F1*(S1^2-S2^2)-2*F4*C1)/T2;
c(3,6)=0;
c(6,1)=c(1,6);
c(6,2)=c(2,6);
c(6,3)=c(3,6);
c(2,1)=c(1,2);
c(3,1)=c(1,3);
c(3,2)=c(2,3);
c(5,4)=c(4,5);



