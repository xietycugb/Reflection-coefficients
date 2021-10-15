
 function [PHI,B]=phi_cal(A,N,vs)       %PSENCIK&VARYCUK(2002)METHOD
B(1,2)=0; B(1,1)=0;  B(2,2)=0; B(1,3)=0;  B(2,3)=0;

D=sqrt(N(1)^2+N(2)^2);
r1=[N(1)*N(3),N(2)*N(3),N(3)^2-1]/D;
r2=[-N(2),N(1),0]/D;

   for i=1:1:3
         for j=1:1:3
            for k=1:1:3
                for l=1:1:3
                    B(1,2)= B(1,2)+A(i,j,k,l)*N(j)*N(l)*r1(i)*r2(k);
                    B(1,1)= B(1,1)+A(i,j,k,l)*N(j)*N(l)*r1(i)*r1(k)-vs^2;
                    B(2,2)= B(2,2)+A(i,j,k,l)*N(j)*N(l)*r2(i)*r2(k)-vs^2;
                end
            end
         end
   end
   
 PHI=(atand((2* B(1,2))/(B(1,1)-B(2,2))))/2;
     
       