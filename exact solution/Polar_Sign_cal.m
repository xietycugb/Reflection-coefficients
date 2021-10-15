function Pjc = Polar_Sign_cal( Mic,Pic )
% This subroutine selects the right sign for each input polarization.

Pjc = zeros(3,3);
Mi = zeros(3,3); %real
Pi = zeros(3,3); %real
Nrml = zeros(2,3); %real
dotP = zeros(3,1); %real

for i = 1:3
    for j = 1:3
        Mi(i,j) = real(Mic(i,j));
        Pi(i,j) = real(Pic(i,j));
    end
end

dotP(1) = Mi(1,1)*Pi(1,1) + Mi(1,2)*Pi(1,2) + Mi(1,3)*Pi(1,3);

if (dotP(1)>=0)
    for i = 1:3
        Pjc(1,i) = Pic(1,i);
    end
elseif (dotP(1)<0)
    for i = 1:3
        Pjc(1,i) = - Pic(1,i);
    end
end

if (Mi(2,1)==0 && Mi(2,2)==0)
    Nrml(1,1) = 0;
    Nrml(1,2) = 0;
    Nrml(1,3) = 1;
else
    Nrml(1,1) = -Mi(2,2)/sqrt(Mi(2,1)*Mi(2,1) + Mi(2,2)*Mi(2,2));
    Nrml(1,2) = Mi(2,1)/sqrt(Mi(2,1)*Mi(2,1) + Mi(2,2)*Mi(2,2));
    Nrml(1,3) = 0;
end

if (Mi(3,1)==0 && Mi(3,2)==0)
    Nrml(2,1) = 0;
    Nrml(2,2) = 0;
    Nrml(2,3) = 1;
else
    Nrml(2,1) = -Mi(3,2)/sqrt(Mi(3,1)*Mi(3,1) + Mi(3,2)*Mi(3,2));
    Nrml(2,2) = Mi(3,1)/sqrt(Mi(3,1)*Mi(3,1) + Mi(3,2)*Mi(3,2));
    Nrml(2,3) = 0;
end

dotP(2) = Nrml(1,1)*Pi(2,1) + Nrml(1,2)*Pi(2,2) + Nrml(1,3)*Pi(2,3);
dotP(3) = Nrml(2,1)*Pi(3,1) + Nrml(2,2)*Pi(3,2) + Nrml(2,3)*Pi(3,3);

dot2 = abs(dotP(2));
dot3 = abs(dotP(3));

if (dot2 == 0 && dot3 == 0)
    for i = 2:3
        for j = 1:3
            Pjc(i,j) = Pic(i,j);
        end
    end
else
    if(dot2 <= dot3)
        
        if(Pi(2,2) >= 0)
            for i =1:3
                Pjc(2,i) = Pic(2,i);
            end
        elseif(Pi(2,2) < 0)
            for i = 1:3
                Pjc(2,i) = -Pic(2,i);
            end
        end
        
         if(Pi(3,3) <= 0)
            for i =1:3
                Pjc(3,i) = Pic(3,i);
            end
        elseif(Pi(3,3) > 0)
            for i = 1:3
                Pjc(3,i) = -Pic(3,i);
            end
         end
        
    elseif(dot2 > dot3)
        
        if(Pi(2,3) <= 0)
            for i =1:3
                Pjc(2,i) = Pic(2,i);
            end
        elseif(Pi(2,3) > 0)
            for i = 1:3
                Pjc(2,i) = -Pic(2,i);
            end
        end
        
         if(Pi(3,2) >= 0)
            for i =1:3
                Pjc(3,i) = Pic(3,i);
            end
        elseif(Pi(3,2) < 0)
            for i = 1:3
                Pjc(3,i) = -Pic(3,i);
            end
         end
    end
end


end

