function Pi = Polarization_cal(Aij,Mi)

Pi = zeros(3,1);
D = zeros(3,3);

for i = 1:3
    for k = 1:3
        for j = 1:3
            for l = 1:3
                D(i,k) = D(i,k) + Aij(i,j,k,l)*Mi(j)*Mi(l);
            end
        end
    end
end

D(1,1) = D(1,1) - 1;
D(2,2) = D(2,2) - 1;
D(3,3) = D(3,3) - 1;

%D(i,k) is equivalent to Hik in equ.(29) of the thesis
Pi = PolarizationRoots_cal(D);

end

