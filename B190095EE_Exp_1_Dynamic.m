clear all;
clc;
close all;
% Code for Equilibrium point(s),Jacobian Matrix, and Eigenvalues
syms x1 x2
% system is given below 
dx1=x2;
dx2=-x1+x1^3/6-x2;
[X Y]=solve(dx1,dx2); % equilibrium point
P=[X Y];
J=jacobian([dx1,dx2],[x1,x2]);
disp('The equilibrium point followed by Jacobian\n')
for i=1:1:length(X)
    disp('equilibrium point:')
    disp(P(i,:))
    Jacobian=double(subs(J,[x1,x2],P(i,:)))
    disp('Eigenvalues are')
    eigenvalues=eig(Jacobian)
end
