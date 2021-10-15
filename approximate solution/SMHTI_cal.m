function C = SMHTI_cal(vp,vs,rho,epsilonv,deltav,gama)

C(3,3) = vp^2*rho;
C(4,4) = vs^2*rho;
C(2,2) = C(3,3);
C(2,3) = C(3,3)-2*C(4,4);
C(3,2) = C(2,3);
C(1,1) = (2*epsilonv+1)*C(3,3);

C(5,5)=C(4,4)/(2*gama+1);
C(6,6) = C(5,5);
C(1,3) = (2*deltav*C(3,3)*(C(3,3)-C(5,5))  +  (C(3,3)-C(5,5))^2  )^0.5-C(5,5);
C(1,2) = C(1,3);
C(3,1) = C(1,3);
C(2,1) = C(1,3);





