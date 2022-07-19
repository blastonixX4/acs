clc;
clear all;
fprintf('for Poles & Zeroes click: 1 \nfor transfer function click: 2\n');
Choice=input(' ');
if Choice==1
zeroes=input('Enter zeros: ');
poles=input('Enter poles: ');
gain=input('Enter gain: ');
T=zpk(zeroes,poles,gain)
num=poly(zeroes);
den= poly(poles);
[A,B,C,D]=tf2ss(num,den)
S=ss(A,B,C,D);
elseif Choice==2
    num=input('Enter the numerator: ')
    den=input('Enter the denominator: ')
    if (length(den)-1)==2
        P=[0 1;1 0];
    elseif (length(den)-1)==3
       P=[0 0 1; 0 1 0;1 0 0];
    end
[A,B,C,D]=tf2ss(num,den)
A=inv(P)*A*P;
B=inv(P)*B;
C=C*P;
S=ss(A,B,C,D);
end

%Stability
Eigen=eig(A)
if Eigen==-1
    disp('System is Stable');
else
    disp('System is unstable')
end

%Controllabilty
C=ctrb(A,B);
RANK_1=rank(C);
if (length(A)==RANK_1)
    disp('System is Controllable');
else 
    disp('System is Not Controllable');
end

%Observability
O=obsv(A,C);
RANK_2=rank(O);
if (length(A)==RANK_2)
    disp('System is Observable')
else
    disp('System is Not Observable');
end
step(S)
hold on;
impulse(S)