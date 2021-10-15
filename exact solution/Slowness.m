function [Sp, Sf, Ss] = Slowness(a,s,tic)

gamm11= 2*a(1,6)*s(1)*s(2) + a(1,1)*s(1)^2 + a(6,6)*s(2)^2-1;
gamm22= 2*a(2,6)*s(1)*s(2) + a(6,6)*s(1)^2 + a(2,2)*s(2)^2-1;
gamm33= 2*a(4,5)*s(1)*s(2) + a(5,5)*s(1)^2 + a(4,4)*s(2)^2-1;
gamm12= (a(1,2)+a(6,6))*s(1)*s(2) + a(1,6)*s(1)^2 + a(2,6)*s(2)^2;
belta13= (a(1,3)+a(5,5))*s(1) + (a(3,6)+a(4,5))*s(2);
belta23= (a(3,6)+a(4,5))*s(1) + (a(2,3)+a(4,4))*s(2);
gamm21= gamm12;
belta31= belta13;
belta32= belta23;

b= (a(5,5)*gamm22*a(3,3) - a(4,5)*gamm12*a(3,3) + gamm11*a(4,4)*a(3,3) - gamm21*a(4,5)*a(3,3) + a(4,5)*belta23*belta31 -a(5,5)*belta32*belta23 + belta31*a(4,5)*belta32 - belta31*a(4,4)*belta13 + a(5,5)*a(4,4)*gamm33 - a(4,5)^2*gamm33)/( a(5,5)*a(4,4)*a(3,3) - a(4,5)^2*a(3,3));
c= (gamm11*gamm22*a(3,3) - gamm21*gamm12*a(3,3) + gamm12*belta23*belta31 - gamm11*belta23*belta32 + belta31*gamm21*belta32 - belta31*gamm22*belta13 + a(5,5)*gamm22*gamm33 - a(4,5)*gamm12*gamm33 + gamm11*a(4,4)*gamm33 - gamm21*a(4,5)*gamm33)/(a(5,5)*a(4,4)*a(3,3) - a(4,5)^2*a(3,3));
d= (gamm11*gamm22*gamm33-gamm21*gamm12*gamm33)/(a(5,5)*a(4,4)*a(3,3) - a(4,5)^2*a(3,3));


r=-b^2/3+c;
H=acos((-2*b^3+9*b*c-27*d)/(2*sqrt((-3*r)^3)));

x1=real(2*(sqrt(-r/3))*cos(H/3+2*pi/3)-b/3);
x2=real(2*(sqrt(-r/3))*cos(H/3+4*pi/3)-b/3);
x3=real(2*(sqrt(-r/3))*cos(H/3)-b/3);

Sp(1) = s(1);
Sp(2) = s(2);
Sf(1) = s(1);
Sf(2) = s(2);
Ss(1) = s(1);
Ss(2) = s(2);
Sp(3)=sqrt(x1);
Sf(3)=sqrt(x2);
Ss(3)=sqrt(x3);

if (tic == 1)
    Sp(3)=-sqrt(x1);
    Sf(3)=-sqrt(x2);
    Ss(3)=-sqrt(x3);
end


