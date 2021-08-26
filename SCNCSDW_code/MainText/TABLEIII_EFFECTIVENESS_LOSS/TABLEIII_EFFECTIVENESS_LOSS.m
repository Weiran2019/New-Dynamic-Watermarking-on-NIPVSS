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

sigma_wu=0.0001;
Ewr_dw=norm(sigma_wu*Ld*C*Bd,'fro');
Phi=(Ad+Bd*Kd)*(eye(4,4)+Ld*C);
M=dlyap(Phi,sigma_wu*(Bd*Bd'));
Err_dw=abs(trace(Ld*C*M*C'*Ld'));
Err_dw_ideal=abs(trace(Ld*Sigma_ro*Ld'));
J0=trace(S*Bn*QN*Bn')+trace((Ad'*S*Ad+Q-S)*(P-Ld*C*P));
d_J=trace(sigma_wu*(Bd'*S*Bd+R));
con_loss=d_J/J0;

sigma_wy=0.0001;
Ewr1_eddw=norm(sigma_wy*Ld(:,1),'fro');
Ewr2_eddw=norm(sigma_wy*Ld(:,2),'fro');
N=dlyap(Phi,sigma_wy*((Ad+Bd*Kd)*Ld*((Ad+Bd*Kd)*Ld)'));
Err_eddw=abs(trace(Ld*(C*N*C'+sigma_wy*eye(2,2))*Ld'));

TABLEIII=[0,Ewr_dw;
        Err_dw_ideal,Err_dw;
        con_loss,inf;
        0,Ewr1_eddw;
        0,Ewr2_eddw;
        Err_dw_ideal,Err_eddw;
        0,inf];
save TABLEIII.mat TABLEIII;