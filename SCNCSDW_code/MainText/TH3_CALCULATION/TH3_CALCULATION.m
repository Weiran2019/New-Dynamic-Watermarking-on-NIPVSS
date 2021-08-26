clc;clear all;

Ac=[0,0,1,0;
    0,0,0,1;
    0,0,0,0;
    0,29.4311,0,0;];
Bc=[0;0;1;3.0001];
C=[1,0,0,0;0,1,0,0];

h=0.01;
[A,B]=c2d(Ac,Bc,h);
QC=[10,0,0,0;0,10,0,0;0,0,10,0;0,0,0,10];
RC=1;
[K,~,~]=dlqr(A,B,QC,RC,0);
K=-K;
sigma_n1=1e-5;
sigma_n2=1e-5;
QN=[sigma_n1,0;
    0,sigma_n2];
sigma_v1=2.7e-7;
sigma_v2=5.5e-6;
RN=[sigma_v1,0;
    0,sigma_v2];
Bn=[0,0;0,0;1,0;0,1];
[~,PN,~]=dlqr(A',C',Bn*QN*Bn',RN,0);
Sigma_ro=C*PN*C'+RN;
L=PN*C'/(C*PN*C'+RN);
I=eye(4,4);
I2=eye(2,2);

A0=[A,B*K*(I-L*C)*(A+B*K);zeros(4,4),(I-L*C)*(A+B*K)];
A1=[B*K*L*C;L*C];
Gama0=[Bn,B*K*L;zeros(4,2),L];
E=[I,zeros(4,4)];
Ec=[zeros(4,4),I];

tau=4;
gamma=2.98e2;

setlmis([]);
P=lmivar(1,[8 1]);
R=lmivar(1,[4 1]);
Q=lmivar(1,[4 1]);
M=lmivar(2,[4 8]);
M3=lmivar(2,[4 4]);
W=lmivar(2,[4 4]);
H1=lmivar(2,[4 4]);
H2=lmivar(2,[8 8]);

lmiterm([1 1 1 M],E',1,'s');
lmiterm([1 1 1 P],-1,1);
lmiterm([1 1 1 Q],E',E);
lmiterm([1 1 2 M3],E',1);
lmiterm([1 1 2 -M],-1,1);
lmiterm([1 1 3 W],E',1);
lmiterm([1 1 4 -M],tau,1);
lmiterm([1 1 5 -H1],tau*(A0-eye(8,8))'*E',1);
lmiterm([1 1 6 0],(C*E-C*Ec*A0)');
lmiterm([1 1 7 -H2],A0',1);

lmiterm([1 2 2 M3],-1,1,'s');
lmiterm([1 2 2 Q],-1,1);
lmiterm([1 2 3 W],-1,1);
lmiterm([1 2 4 -M3],tau,1);
lmiterm([1 2 5 -H1],tau*A1'*E',1);
lmiterm([1 2 6 0],(-C*Ec*A1)');
lmiterm([1 2 7 -H2],A1',1);

lmiterm([1 3 3 0],-gamma*I);
lmiterm([1 3 4 -W],tau,1);
lmiterm([1 3 5 -H1],tau*Gama0'*E',1);
lmiterm([1 3 6 0],(-C*Ec*Gama0)');
lmiterm([1 3 7 -H2],Gama0',1);

lmiterm([1 4 4 R],-tau,1);

lmiterm([1 5 5 R],tau,1);
lmiterm([1 5 5 -H1],-tau,1,'s');

lmiterm([1 6 6 0],-I2);

lmiterm([1 7 7 P],1,1);
lmiterm([1 7 7 -H2],-1,1,'s');

lmiterm([-2 1 1 P],1,1);
lmiterm([-3 1 1 Q],1,1);
lmiterm([-4 1 1 R],1,1);
lmisys=getlmis;

[tmin,xfeas]=feasp(lmisys);

performance=gamma*(sigma_n1+sigma_n2+sigma_v1+sigma_v2)