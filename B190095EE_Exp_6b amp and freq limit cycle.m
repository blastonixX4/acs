clc
clear all

z=[];
p=[-1 -2 -3];
k=120;
G=zpk(z,p,k)

[Gm,Pm,Wcg,Wcp] = margin(G);
[mag,phase] = bode(G,Wcg);
figure(1)
nyquist(G)
mag
Wcg

if mag<=1
    A=mag;
else
    A=1/mag;
end
A
figure(2)
t = 0:0.01:10;
u = A*sin(Wcg*t);
plot(t,u)

figure(3)
t = 0:0.01:10;
y = (4/pi)*sin(Wcg*t);
plot(t,y)