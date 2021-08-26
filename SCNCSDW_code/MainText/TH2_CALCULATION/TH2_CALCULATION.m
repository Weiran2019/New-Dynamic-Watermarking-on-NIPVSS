clc;clear all;

A=[0,0,1,0;
    0,0,0,1;
    0,0,0,0;
    0,29.4311,0,0;];
B=[0;0;1;3.0001];
C=[1,0,0,0;0,1,0,0];

h=0.01;
[Ad,Bd]=c2d(A,B,h);
Q=[10,0,0,0;0,10,0,0;0,0,10,0;0,0,0,10];
R=1;
[Kd,S,~]=dlqr(Ad,Bd,Q,R,0);
Kd=-Kd;
sigma_n1=1e-5;
sigma_n2=1e-5;
QN=[sigma_n1,0;
    0,sigma_n2];
sigma_v1=2.7e-7;
sigma_v2=5.5e-6;
RN=[sigma_v1,0;
    0,sigma_v2];
Bn=[0,0;0,0;1,0;0,1];
[~,P,~]=dlqr(Ad',C',Bn*QN*Bn',RN,0);
Sigma_ro=C*P*C'+RN;
Ld=P*C'*inv(C*P*C'+RN);

Aa=[0.1,0,0,0;0,0.1,0,0;0,0,0.1,0;0,0,0,0.1];
H=[-Bd*Kd*(eye(4,4)+Ld*C),Bd*Kd];
Xi=[(Ad+Bd*Kd)*(eye(4,4)-Ld*C),Aa-(Ad+Bd*Kd);zeros(4,4),Aa];
A0=[A,H;zeros(8,4),Xi];
A1=[Ad+Bd*Kd*Ld*C,-Bd*Kd*(eye(4,4)-Ld*C),zeros(4,4);
    -(Ad+Bd*Kd)*Ld*C,(Ad+Bd*Kd)*(eye(4,4)-Ld*C),zeros(4,4);
    zeros(4,4),zeros(4,4),zeros(4,4)];
[P0,D0]=eig(A0);
[P1,D1]=eig(A1);
S0=svd(P0);
S1=svd(P1);
lamda0=sqrt(real(max(max(D0)))*real(max(max(D0)))+imag(max(max(D0)))*imag(max(max(D0))))
lamda1=sqrt(real(max(max(D1)))*real(max(max(D1)))+imag(max(max(D1)))*imag(max(max(D1))))
g0=log(max(S0)/min(S0))/log(lamda1)
g1=log(max(S1)/min(S1))/log(lamda1)
g=max([g0,g1]);

lamdastar=2e-10;
lamdatag=1e-10;
inf_T1T0=(log(lamda0)-log(lamda1)*lamdastar)/((lamdastar-1)*log(lamda1))
ADT=g/(lamdatag-lamdastar);
alp=(2-141/ADT)*g;
lamda1^(floor(alp)+g);