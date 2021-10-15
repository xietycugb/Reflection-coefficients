% M.D.Sharma(2006) method

     function V=phasevelocity_MD(A,Ni)
 V = zeros (3,1);
 L = zeros (3,3);

for i = 1:3
    for k = 1:3
        
        L(i,k) = 0;
        for j = 1:3
            for l = 1:3
                L(i,k) = L(i,k) + A(i,j,k,l)*Ni(j)*Ni(l);
            end
        end
        
    end
end

b=-(L(1,1)+L(2,2)+L(3,3));
c=L(1,1)*L(3,3)+L(2,2)*L(3,3)+L(1,1)*L(2,2)-L(1,2)^2-L(1,3)^2-L(2,3)^2;
d=-(L(1,1)*L(2,2)*L(3,3)+2*L(1,2)*L(1,3)*L(2,3)-L(3,3)*L(1,2)^2-L(2,2)*L(1,3)^2-L(1,1)*L(2,3)^2);

H = (b^2)/9-c/3;
K=(9*b*c-27*d-2*b^3)/54;
delta = (H^3 - K^2)^0.5;
psi=atan(delta/K);

V7 = real(2*(H^0.5)*cos(psi/3)-b/3);          %qp square
V8 = real(2*(H^0.5)*cos((psi+2*pi)/3)-b/3);   %qs2...
V9 = real(2*(H^0.5)*cos((psi+4*pi)/3)-b/3);   %qs1...

V(1) = (V7)^0.5;    %qp
V(2) = (V9)^0.5;    %qs1
V(3) = (V8)^0.5;    %qs2

