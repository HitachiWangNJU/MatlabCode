function Robustacc = RobustACC(InputMartix)
%RobustACC - Description
%
% Syntax: Robustacc = RobustACC(InputMartix)
%
% This function is used to calculte ROBUST by each point
% 
% ROBUST = mean(ACC(i-1,j),ACC(i+1,j),ACC(i,j-1),ACC(i,j+1));

SIZE      = size(InputMartix);
Robustacc = zeros(SIZE(1),SIZE(2));

for i = 2,SIZE(1) - 1
    for j = 2,SIZE(2) -1

        r = corrcoef(InputMartix(i,j,:),InputMartix(i-1,j,:));
        ACC1 = r(1,2);
        r = corrcoef(InputMartix(i,j,:),InputMartix(i+1,j,:));
        ACC2 = r(1,2);
        r = corrcoef(InputMartix(i,j,:),InputMartix(i,j-1,:));
        ACC3 = r(1,2);
        r = corrcoef(InputMartix(i,j,:),InputMartix(i,j+1,:));
        ACC4 = r(1,2);

        Robustacc(i,j) = mean([ACC1 ACC2 ACC3 ACC4]);

    end
end

j = 1;
for i = 2,SIZE(1) - 1
    r = corrcoef(InputMartix(i,j,:),InputMartix(i-1,j,:));
    ACC1 = r(1,2);
    r = corrcoef(InputMartix(i,j,:),InputMartix(i+1,j,:));
    ACC2 = r(1,2);
    r = corrcoef(InputMartix(i,j,:),InputMartix(i,j+1,:));
    ACC3 = r(1,2);
    Robustacc(i,j) = mean([ACC1 ACC2 ACC3]);
end

j = SIZE(2);
for i = 2,SIZE(1) - 1
    r = corrcoef(InputMartix(i,j,:),InputMartix(i-1,j,:));
    ACC1 = r(1,2);
    r = corrcoef(InputMartix(i,j,:),InputMartix(i+1,j,:));
    ACC2 = r(1,2);
    r = corrcoef(InputMartix(i,j,:),InputMartix(i,j-1,:));
    ACC3 = r(1,2);
    Robustacc(i,j) = mean([ACC1 ACC2 ACC3]);
end

i = 1;
for j = 2,SIZE(2) - 1
    r = corrcoef(InputMartix(i,j,:),InputMartix(i+1,j,:));
    ACC1 = r(1,2);
    r = corrcoef(InputMartix(i,j,:),InputMartix(i,j-1,:));
    ACC2 = r(1,2);
    r = corrcoef(InputMartix(i,j,:),InputMartix(i,j-1,:));
    ACC3 = r(1,2);
    Robustacc(i,j) = mean([ACC1 ACC2 ACC3]);
end

i = SIZE(1);
for j = 2,SIZE(2) - 1
    r = corrcoef(InputMartix(i,j,:),InputMartix(i-1,j,:));
    ACC1 = r(1,2);
    r = corrcoef(InputMartix(i,j,:),InputMartix(i,j-1,:));
    ACC2 = r(1,2);
    r = corrcoef(InputMartix(i,j,:),InputMartix(i,j-1,:));
    ACC3 = r(1,2);
    Robustacc(i,j) = mean([ACC1 ACC2 ACC3]);
end

i = 1;
j = 1;
r = corrcoef(InputMartix(i,j,:),InputMartix(i+1,j,:));
ACC1 = r(1,2);
r = corrcoef(InputMartix(i,j,:),InputMartix(i,j+1,:));
ACC2 = r(1,2);
Robustacc(i,j) = mean([ACC1 ACC2]);

i = 1;
j = SIZE(2);
r = corrcoef(InputMartix(i,j,:),InputMartix(i+1,j,:));
ACC1 = r(1,2);
r = corrcoef(InputMartix(i,j,:),InputMartix(i,j-1,:));
ACC2 = r(1,2);
Robustacc(i,j) = mean([ACC1 ACC2]);

i = SIZE(1);
j = 1;
r = corrcoef(InputMartix(i,j,:),InputMartix(i-1,j,:));
ACC1 = r(1,2);
r = corrcoef(InputMartix(i,j,:),InputMartix(i,j+1,:));
ACC2 = r(1,2);
Robustacc(i,j) = mean([ACC1 ACC2]);

i = SIZE(1);
j = SIZE(2);
r = corrcoef(InputMartix(i,j,:),InputMartix(i-1,j,:));
ACC1 = r(1,2);
r = corrcoef(InputMartix(i,j,:),InputMartix(i,j-1,:));
ACC2 = r(1,2);
Robustacc(i,j) = mean([ACC1 ACC2]);

end