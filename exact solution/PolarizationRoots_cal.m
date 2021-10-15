function X = PolarizationRoots_cal(M)
%This subroutine solves MX =0; and Xl^2 + X2^2 + X3^2 = 1
%M(i,k) is Hik in equ.(29)

% X = zeros(3,1);
% r = rank(double(M))
% et = null(double(M),'r')   
% X = et/norm(et)         


% [x,y,z] = solve('M(1,1)*x+M(1,2)*y+M(1,3)*z=0','M(2,1)*x+M(2,2)*y+M(2,



X = zeros(3,1);
D = zeros(9,2,3);
DD = zeros(9,1);

%colum do not change, in the order of M
%No.1 & 2 equ  
for i = 1:2
    for j = 1:3
        D(1,i,j) = M(i,j);
    end
end
%No.2 & 3 equ
for i = 1:2
    for j = 1:3
        D(2,i,j) = M(i+1,j);
    end
end
%No.1 & 3 equ
for i = 1:2
    for j = 1:3
        D(3,i,j) = M(2*i-1,j);
    end
end

%colum change from 123 to 312
%No.1 & 2 equ
for i = 1:2
    D(4,i,1) = M(i,3);
    D(4,i,2) = M(i,1);
    D(4,i,3) = M(i,2);
end
%No.2 & 3 equ
for i = 1:2
    D(5,i,1) = M(i+1,3);
    D(5,i,2) = M(i+1,1);
    D(5,i,3) = M(i+1,2);
end
%No.1 & 3 equ
for i = 1:2
    D(6,i,1) = M(2*i-1,3);
    D(6,i,2) = M(2*i-1,1);
    D(6,i,3) = M(2*i-1,2);
end

%colum change from 123 to 231
%No.1 & 2 equ
for i = 1:2
    D(7,i,1) = M(i,2);
    D(7,i,2) = M(i,3);
    D(7,i,3) = M(i,1);
end
%No.2 & 3 equ
for i = 1:2
    D(8,i,1) = M(i+1,2);
    D(8,i,2) = M(i+1,3);
    D(8,i,3) = M(i+1,1);
end
%No.1 & 3 equ
for i = 1:2
    D(9,i,1) = M(2*i-1,2);
    D(9,i,2) = M(2*i-1,3);
    D(9,i,3) = M(2*i-1,1);
end

B = 0;
for i = 1:9
    DD(i) = D(i,2,3)*D(i,1,2) - D(i,1,3)*D(i,2,2);  
    if (abs(DD(i))>abs(B))
        B = DD(i);  
        k = i;
    end
end

A1 = (D(k,1,1)*D(k,2,2) - D(k,1,2)*D(k,2,1))/B;      %equation 28
A2 = -(D(k,1,1)*D(k,2,3) - D(k,2,1)*D(k,1,3))/B;         

if (k<=3)
    X(1) = sqrt(1/(1+A1*A1+A2*A2));
    X(2) = A2*X(1);
    X(3) = A1*X(1);
 
elseif (k>3 && k<=6)
    X(3) = sqrt(1/(1+A1*A1+A2*A2));
    X(1) = A2*X(3);
    X(2) = A1*X(3);
    
elseif (k>6 && k<=9)
    X(2) = sqrt(1/(1+A1*A1+A2*A2));
    X(3) = A2*X(2);
    X(1) = A1*X(2);
end

end

