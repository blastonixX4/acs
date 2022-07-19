clear all
clc
close all
A=input('Enter the system matrix: ');
B=input('Enter the input matrix: ');
P=input('Enter the desired poles');
E=eig(A);
if E<0
 disp('System is stable.');
else
 disp('System is unstable');
end
Cm=ctrb(A,B) %controllabilty matrix
Rank=rank(Cm)
if length(A)==Rank
 disp('The system is completely controllable.');
else
 disp('The sytem is uncontrollable.');
end
K=acker(A,B,P) %state feedback gain matrix
A=input('Enter the system matrix: ');
C=input('Enter the output matrix: ');
P=input('Enter the desired poles: ');
E=eig(A);if E<0
 disp('System is stable.');
else
 disp('System is unstable');
end
Om=obsv(A,C) %controllabilty matrix
Rank=rank(Om)
if length(A)==Rank
 disp('The system is completely observable.');
else
 disp('The sytem is unobservable.');
end
for i=2:length(A)
 Aab(i-1)=A(1,i);
 for j=2:length(A)
 Abb(i-1,j-1)=A(i,j);
 end
end
K=acker(Abb',Aab',P)' %state observer gain matrix
