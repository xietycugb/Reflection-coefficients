function Rj= RefandTra_cal(a1,a2,c_U,c_L,A_1,A_2,Nij)

%Step1 Calculate the slowness of incident wave   
     V_inc = phasevelocity_MD(A_1,Nij);

Minc = zeros(3,1);
Minc(1) = Nij(1)/V_inc(1);
Minc(2) = Nij(2)/V_inc(1);
Minc(3) = Nij(3)/V_inc(1);  

%Step2: Calculate the 3 reflected and 3 transmitted slowness
%reflection
tick = 1;
[Mp1, Mf1, Ms1] = Slowness(a1,Minc,tick);
% temp_U = [Mp1(3);Mf1(3);Ms1(3)]
%transmition
tick = 0;
[Mp2, Mf2, Ms2] = Slowness(a2,Minc,tick);
% temp_L = [Mp2(3);Mf2(3);Ms2(3)]

%Step3: Calculate polarizations for each waves
Pp1 = Polarization_cal(A_1,Mp1);
Pp2 = Polarization_cal(A_2,Mp2);

% polarizations for 3 reflected waves
diff = Mf1(3) - Ms1(3);
adiff = sqrt(real(diff)*real(diff) + imag(diff)*imag(diff));

AvgS = zeros(3,1);
Nijt = zeros(3,1);
Mpt = zeros(3,1);
%M is slowness Pis polarization
if (adiff<1*10^(-10))
    for i = 1:3
        AvgS(i) = (Mf1(i) + Ms1(i)) / 2;
        Mf1(i) = AvgS(i);
        Ms1(i) = AvgS(i);
    end
    
    for i = 1:3
        Nijt(i) = AvgS(i) / sqrt(AvgS(1)*AvgS(1) + AvgS(2)*AvgS(2) + AvgS(3)*AvgS(3));
    end
    
      V_out = phasevelocity_MD(A_1,Nijt);
    for i = 1:3
        Mpt(i) = Nijt(i) / V_out(1);
    end

    Ppt = Polarization_cal(A_1,Mpt);
    [Pf1, Ps1] = Polarization_FeqS_cal(Ppt);
else
    Pf1 = Polarization_cal(A_1,Mf1);
    Ps1 = Polarization_cal(A_1,Ms1);
end

% polarizations for 3 transmitted waves
diff = Mf2(3) - Ms2(3);
adiff = sqrt(real(diff)*real(diff) + imag(diff)*imag(diff));

AvgS = zeros(3,1);
Nijt = zeros(3,1);
Mpt = zeros(3,1);
Min = zeros(3,1);

if (adiff<1*10^(-10))
    for i = 1:3
        AvgS(i) = (Mf2(i) + Ms2(i)) / 2;
        Mf2(i) = AvgS(i);
        Ms2(i) = AvgS(i);
    end
    
    for i = 1:3
        Nijt(i) = AvgS(i) / sqrt(AvgS(1)*AvgS(1) + AvgS(2)*AvgS(2) + AvgS(3)*AvgS(3));
    end
    
      V_out = phasevelocity_MD(A_2,Nijt);
 
    for i = 1:3
        Mpt(i) = Nijt(i) / V_out(1);
    end

    Ppt = Polarization_cal(A_2,Mpt);
    [Pf2, Ps2] = Polarization_FeqS_cal(Ppt);
else
    Pf2 = Polarization_cal(A_2,Mf2);
    Ps2 = Polarization_cal(A_2,Ms2);
end
%////////////////
%change to complex slowness for incident wave
for i = 1:3
    Min(i) = Minc(i); 
end
Pinc = Polarization_cal(A_1,Min);

%Step4: Select signs for polarizations
Ml = zeros(3,3);%upper media
Mm = zeros(3,3);%lower
Pl = zeros(3,3);
Pm = zeros(3,3);
for i = 1:3
    Ml(1,i) = Mp1(i);
    Ml(2,i) = Mf1(i);
    Ml(3,i) = Ms1(i);
    Mm(1,i) = Mp2(i);
    Mm(2,i) = Mf2(i);
    Mm(3,i) = Ms2(i);    
    Pl(1,i) = Pp1(i);
    Pl(2,i) = Pf1(i);
    Pl(3,i) = Ps1(i);
    Pm(1,i) = Pp2(i);
    Pm(2,i) = Pf2(i);
    Pm(3,i) = Ps2(i);
end


Pju =Polar_Sign_cal(Ml,Pl); %upper media
Pjb =Polar_Sign_cal(Mm,Pm); %lower


%Step5: Calculate reflection coefficients
Pk = zeros(7,3);
Mk = zeros(7,3);

for i = 1:3
    Mk(1,i) = Mp1(i);
    Mk(2,i) = Mf1(i);
    Mk(3,i) = Ms1(i);
    Mk(4,i) = Mp2(i);
    Mk(5,i) = Mf2(i);
    Mk(6,i) = Ms2(i);
    Mk(7,i) = Minc(i);
end

for i = 1:3
    Pk(1,i) = Pju(1,i);
    Pk(2,i) = Pju(2,i);
    Pk(3,i) = Pju(3,i);
    Pk(4,i) = Pjb(1,i);
    Pk(5,i) = Pjb(2,i);
    Pk(6,i) = Pjb(3,i);
    Pk(7,i) = Pinc(i);
end

Rj=BndryCondition( c_U,c_L,Mk,Pk );
end

