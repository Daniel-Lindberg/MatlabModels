%Daniel Lindberg
%Lab 5
clc; close all; clear all;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Preliminary Inputs
g = -9.81;                      %gravity
Ho = 2070;                      %initial height
dt = 0.1;                       %change in time
t = 0:dt:50;                    %time vector
A = ones(size(t))*(-9.81);      %acceleration vector
V = zeros(size(t));             %velocity vector
H = zeros(size(t));             %height vector
H(1) = Ho;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Part A
z = 1;
%Calculate Velocity and Height using Trapezoidal Rule   
while H(z) >= 0
        z = z+1;
        V(z) = V(z-1)+ 0.5*(A(z-1)+ A(z))*dt;
        H(z) = H(z-1)+ 0.5*(V(z-1)+V(z))*dt;
end


V=V(1:z);
H=H(1:z);
T = t(1:z);

figure;
plot(T,V)
figure;
plot(T,H);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Part B

load AccelerationVersusTime;                   %load acceleration
Vdrag = zeros(size(acceleration));             %velocity vector 2
Hdrag = zeros(size(acceleration));             %height vector
Hdrag(1) = Ho;

%Calculate Velocity and Height with Drag Acceleration using Trapezoidal Rule  
z = 1;

while Hdrag(z) > 0 
    z = z+1;
        Vdrag(z) = Vdrag(z-1)+ 0.5*(acceleration(z-1)+ acceleration(z))*dt;
        Hdrag(z) = Hdrag(z-1)+ 0.5*(Vdrag(z-1)+Vdrag(z))*dt;
end
Tdrag = t(1:length(acceleration)); 
figure;
plot(T,V,Tdrag,Vdrag); xlabel('time (s)'); ylabel('Velocity(m/s)'); title('Velocity vs. Time');
figure;
plot(T,H,Tdrag,Hdrag); xlabel('time (s)'); ylabel('Height(m)'); title('Height vs. Time');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Part C
m = 50;                          %mass of object (kg)
F = m*acceleration;              %calculate Force
figure;
plot(Tdrag,F)
W = zeros(size(acceleration));

%Calculate Work with respect to Height using Trapezoidal Rule   
for z = 2:length(acceleration)
        W(z) = W(z-1)+ 0.5*(F(z-1)+ F(z))*(Hdrag(z)-Hdrag(z-1));
end

fprintf('The total work of the falling object is %0.2f Nm \n',W(end));

