function [ Ps1,Ps2 ] = Polarization_FeqS_cal( Pp )
Ptmp = zeros(3,1);

P = abs(real(Pp(3)));  %real
if (abs(P-1) < 1*10^(-7))
    Ps1(1) = 1;
    Ps1(2) = 0;
    Ps1(3) = 0;
    Ps2(1) = 0;
    Ps2(2) = 1;
    Ps2(3) = 0;
else
    Ps1(1) = -Pp(2)/sqrt(Pp(1)*Pp(1) + Pp(2)*Pp(2));
    Ps1(2) = Pp(1)/sqrt(Pp(1)*Pp(1) + Pp(2)*Pp(2));
    Ps1(3) = 0;
    
    Ptmp(1) = Ps1(2)*Pp(3);
    Ptmp(2) = -Ps1(1)*Pp(3);
    Ptmp(3) = Ps1(1)*Pp(2) - Ps1(2)*Pp(1);
    
    Ps2(1) = Ptmp(1)/sqrt(Ptmp(1)*Ptmp(1) + Ptmp(2)*Ptmp(2) + Ptmp(3)*Ptmp(3));
    Ps2(2) = Ptmp(2)/sqrt(Ptmp(1)*Ptmp(1) + Ptmp(2)*Ptmp(2) + Ptmp(3)*Ptmp(3));
    Ps2(3) = Ptmp(3)/sqrt(Ptmp(1)*Ptmp(1) + Ptmp(2)*Ptmp(2) + Ptmp(3)*Ptmp(3));
end
end

