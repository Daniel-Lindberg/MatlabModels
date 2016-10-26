clear all; close all;

deltaT = input('input DeltaT  ');
Tf = 10;
Th1_start = 158.4578;
K = [-0.0053; 0.1317; -0.8781];

t = 0:deltaT:Tf;

Th1 = Th1_start + K(1)*t.^5 + K(2)*t.^4 + K(3)*t.^3;


% Estimate velocity using 2-PT Estimate
% Option 1: Create for loop
Vel_2PT = zeros(1,length(Th1));
for m = 2:length(Th1);
 Vel_2PT(m) = (Th1(m)-Th1(m-1))/deltaT;
end
% Option 2: Don't really need a for loop:
 %Vel_2PT = zeros(1,N);
 %Vel_2PT(2:N) = (Th1(2:N) - Th1(1:N-1))/deltaT;

Error_2PT = abs(Vel_2PT - (K(1)*5*t.^4 + K(2)*4*t.^3 + K(3)*3*t.^2));

t2 = 0:deltaT/100:Tf;
Th2 = Th1_start + K(1)*t2.^5 + K(2)*t2.^4 + K(3)*t2.^3;
N = length(Th2);

Vel_2PT2 = zeros(1,N);
for m = 2:N;
 Vel_2PT2(m) = (Th2(m)-Th2(m-1))/(deltaT/100);
end
%figure;
%subplot(2,1,1);
%plot(t,Vel_2PT,'*r',t2,Vel_2PT2,'b');
%subplot(2,1,2);
%plot(t,Error_2PT,'*');


%%%%%%%%%%%%%%%
%%Three point%%
N = length(Th1);

Vel_3PT = zeros(1,N);
for m = 2:(N-1);
 Vel_3PT(m) = (Th1(m+1)-Th1(m-1))/(2*deltaT);
end

N = length(Th2);


Vel_3PT2 = zeros(1,N);
for m = 2:(N-1);
 Vel_3PT2(m) = (Th2(m+1)-Th2(m-1))/(2*deltaT/100);
end

Error_3PT = abs(Vel_3PT - (K(1)*5*t.^4 + K(2)*4*t.^3 + K(3)*3*t.^2));

figure;

subplot(2,1,1);
plot(t,Vel_2PT,'*r',t2,Vel_2PT2,'r',t,Vel_3PT,'*b');
subplot(2,1,2);
plot(t,Error_2PT,'r*',t,Error_3PT,'b*');


%%%%%%%%%%%%%%%
%%accell%%
N = length(Th1);

Vel_Accel = zeros(1,N);
for m = 2:(N-1);
 Vel_Accel(m) = (Th1(m+1)+Th1(m-1)-2*Th1(m))/(deltaT^2);
end

N = length(Th2);
Vel_Accel2 = zeros(1,N);
for m = 2:(N-1);
 Vel_Accel2(m) = (Th2(m+1)-2*Th2(m)+Th2(m-1))/((deltaT/100)^2);
end

Error_Accel = abs(Vel_Accel - (K(1)*20*t.^3 + K(2)*12*t.^2 + K(3)*6*t.^1));

figure;

subplot(2,1,1);
plot(t,Vel_Accel,'*r',t2,Vel_Accel2,'r');
subplot(2,1,2);
plot(t,Error_Accel,'r*');

