 clc
clear all
z=[];
p=[-1 -1 -1];
k=3;
G=zpk(z,p,k) %transfer function
[Gm,Pm,Wcg,Wcp] = margin(G);
[mag,phase] = bode(G,Wcg);
A=(mag*4)/pi; %amplitude of the limit cycle
figure(1)
nyquist(G)
figure(2)
syms x
fplot(y);
xlabel('Input')
ylabel('Output')
figure(3)
t = 0:0.01:10;
u = A*sin(Wcg*t); %input signal
y = (4/pi)*sin(Wcg*t); %output signal
hold on
plot(t,u);
plot(t,y);
xlabel('t')
ylabel('u,y')
clc
clear all
z=[];
p=[-1 -2 -3];
k=120;
G=zpk(z,p,k)
[Gm,Pm,Wcg,Wcp] = margin(G);
[mag,phase] = bode(G,Wcg);
Wcg %frequecy of the limit cycle
if mag<=1 %amplitude of limit cycle
 A=mag;
else
 A=1/mag;
end
syms x
figure(1)
fplot(y);
xlabel('Input')
ylabel('Output')
syms a
figure(2)
saturation non-linearity
fplot(Na)
xlabel('A')
ylabel('N(A)')
