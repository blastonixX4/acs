clear all
clc
num=input('Enter the numerator: ');
den=input('Enter the denominator: ');
T=tf(num,den)
[numd,dend]=bilinear(num,den,0.5);
Z=tf(numd,dend,2)
hold on;
step(T)
stepz(numd,dend)