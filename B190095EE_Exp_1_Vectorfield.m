%Vector Field of Van der Pole equation (2D Nonlinear)
function [t,x]=VdP_vector_field(~)
clc;clear all;close all;
[x, y]= meshgrid(-4:0.2:4, -4:0.4:4);
global mu; mu=1;
px=y;
py=-x+mu*(1-x.*x).*y;
%plot the results (phase space)
quiver(x,y,px,py,3);
grid on
xlabel('x');ylabel('y');
title('Vector Field of Van der Pol Equation');

tspan = [0 100]';%tspan=[t_start t_final];the interval of integration
x0 = [3 3]';%Intial Condition
[t,xx]=ode45(@vdp,tspan,x0);
%Van der Pole equation (in 2 1st order equations) in the form y' = f(t,y)
function dx=vdp(t,x)
dx=[x(2); -x(1)+mu*(1-x(1)*x(1))*x(2)];
end
%plot the results (phase space)
figure(2),plot(xx(:,1),xx(:,2),'r*');
grid on
xlabel('x');ylabel('y');
title('Phase space of Van der Pol Equation');
end