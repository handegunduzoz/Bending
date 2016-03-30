



clc
clear all
close all

syms ri Sf 

%Known Values
h = 200e-3;               %[mm] Thickness of the wafer
F = [100,50,25,15,5];     %[N] Possible breaking loads
d = 20;                   %[mm] Cross section of wafer
%S = 900;                  %[MPa] Fracture Strength

%Unknown Parameters
ro = ri + h;              %[mm] 
A = h*d;                  %Area
rc = h/2 + ri;            %Central Axis
rn = h/(log(ro)-log(ri)); %Neutral axis
co = ro-rn;               %Outer region is more critical
e = rc-rn;

n=length(F);

%Stress Calculation

for i=1:n
    Sy(i) = ((2*F(i)*rc*(ro-rn))-(3*F(i)*(rc-rn)*ro))/(2*A*(rc-rn)*ro);
    S_y(i) = vpa(Sy(i));
    
end
 S_y


ezplot(S_y(i),ri)
% Format the figure window by adding grid lines, figure title and legend.
title('Radius of curvature vs Fracture stress')
legend('Radius of curvature','Fracture Stress', 'Location', 'South');
xlabel('ri[mm]');
ylabel('Sf[MPa]');
grid on


