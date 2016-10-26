clc;
clear;

xg_start = input('Enter X coord for start gripper');
yg_start = input('Enter Y coord for start gripper');
xg_end = input('Enter X coord for end gripper');
yg_end = input('Enter Y coord for end gripper');
L1 = input('Enter link 1 length');
L2 = input('Enter Link 2 length');
Tf = input('Enter number of seconds');

if (L1 + L2) < sqrt(xg_start^2 + yg_start^2) || (L1+L2) < sqrt(xg_end^2 + yg_end^2)
    error('position longer than arm reaches')
elseif (L1 - L2) > sqrt(xg_start^2 + yg_start^2) || (L1-L2) > sqrt(xg_end^2 + yg_end^2)
    error('position shorter than arm reaches')
end

f1 = sym('xg_end = L1*cos(Th1) + L2*cos(Th1 + Th2)');    
f2 = sym('yg_end = L1*sin(Th1) + L2*sin(Th1 + Th2)');

f1 = subs(f1);
f2 = subs(f2);

result = solve(f1,f2,'Th1','Th2');

Th1 = double(result.Th1(1))*180/pi;
Th2 = double(result.Th2(1))*180/pi;

xj = L1*cosd(Th1(1));
yj = L1*sind(Th1(1));

xg = L1*cosd(Th1(1)) + L2*cosd(Th1(1) + Th2(1));
yg = L1*cosd(Th1(1)) + L2*cosd(Th1(1) + Th2(1));

plot([0 xj], [0 yj], 'k-o' , [xj xg], [yj yg], 'k-o' ,'LineWidth',4)

f1s = sym('xg_start = L1*cos(Th1s) + L2*cos(Th1s + Th2s)');
f2s = sym('yg_start = L1*sin(Th1s) + L2*sin(Th1s + Th2s)');

f1s = subs(f1s);
f2s = subs(f2s);

results = solve(f1s,f2s,'Th1s','Th2s');

Th1s = double(results.Th1s(1))*180/pi
Th2s = double(results.Th2s(1))*180/pi


A = [Tf^5 Tf^4 Tf^3 ; 5*Tf^4 4*Tf^3 3*Tf^2; 20*Tf^3 12*Tf^2 6*Tf];
K = inv(A)*[Th1-Th1s; 0; 0]
A = [Tf^5 Tf^4 Tf^3 ; 5*Tf^4 4*Tf^3 3*Tf^2; 20*Tf^3 12*Tf^2 6*Tf];
C = inv(A)*[Th2-Th2s; 0; 0]


t= 0:Tf/100:Tf;


