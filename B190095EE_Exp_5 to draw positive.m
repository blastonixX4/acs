clc;
clear all;
syms x1 x2;
V=(x1^2+x2^2)/2 %Lyapunov Candidate fn %pdf
[X1, X2]=meshgrid(-10:0.1:10,-10:0.1:10);
Z=(X1.^2+X2.^2)./2;
figure
meshc(X1, X2, Z)
xlabel('x1')
ylabel('x2')
zlabel('V(x1,x2)')
hold on

%System
%dx1=x2-x1*(x1^2+x2^2);
%dx2=-x1-x2*(x1^2+x2^2);

%plot of vector field
[x, y]= meshgrid(-10:0.4:10, -10:0.4:10);
px=y-x.*(x.^2+y.^2);
py=-y-x.*(x.^2+y.^2);
quiver(x,y,px,py,1);
grid on
xlabel('x1');ylabel('x2');
hold on

%Animated Solution
f=@(t,P)[P(2)-P(1)*(P(1)^2+P(2)^2);-P(2)-P(1)*(P(1)^2+P(2)^2)];
tspan = [0 100]';
x0=[-10 -10];%IC
%Sol=Solution
[t,Sol]=ode45(f,tspan,x0);
for k=1:1:50
plot(Sol(k,1),Sol(k,2),'r*');
plot3(Sol(k,1),Sol(k,2),subs(V,{x1,x2},{Sol(k,1),Sol(k,2)}),'k*');
pause(0.8);
grid on
xlabel('x1');ylabel('x2');
title('Analysis of Lyapunov Direct method');
end

%Evaluating Vdot
dx1=x2-x1*(x1^2+x2^2);
dx2=-x1-x2*(x1^2+x2^2);
dx=[dx1; dx2];
V=(x1^2+x2^2)/2; %Lyapunov Candidate fn %pdf
dV_dx=jacobian(V,[x1,x2]);
dV_dt=dV_dx*dx;
disp('Directional derivative');
dV_dt=simplify(dV_dt) % Directional derivative

%Definiteness of Vdot
[X1, X2]=meshgrid(-10:0.2:10,-10:0.2:10);
Z=subs(dV_dt,{x1 x2},{X1 X2});
%Z=-(X1.^2 + X2.^2).^2;
figure(2)
meshc(X1, X2, Z)
xlabel('x1')
ylabel('x2')
zlabel('dV/dt')
title('Definiteness of dV/dt')