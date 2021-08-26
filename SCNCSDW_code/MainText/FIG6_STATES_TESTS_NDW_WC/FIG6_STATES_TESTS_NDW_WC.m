clear all;clc;
Data = importdata('KF_EDDW_FDIAII_WC5.txt');
pos_EDDW_WC=Data.data(:,2);
ang_EDDW_WC=Data.data(:,3);
inc11_EDDW_WC=Data.data(:,4);
inc12_EDDW_WC=Data.data(:,5);
inc2_EDDW_WC=Data.data(:,6);
Data = importdata('KF_EDDW_FDIAII_NC5.txt');
pos_EDDW_NC=Data.data(:,2);
ang_EDDW_NC=Data.data(:,3);
inc11_EDDW_NC=Data.data(:,4);
inc12_EDDW_NC=Data.data(:,5);
inc2_EDDW_NC=Data.data(:,6);

inc11_thd=zeros(1,140);
inc12_thd=zeros(1,140);
inc2_thd=zeros(1,140);
for i=1:140
   inc11_thd(i)=7e-4;
   inc12_thd(i)=7e-4;
   inc2_thd(i)=7e-4;
end

Fonts=18;
k=1:140;
fig1=figure(1);
set(fig1, 'Position', [0 0 1000 350]); 
set(fig1, 'PaperSize', [29.7000 21.0000]); 
set(fig1,'PaperPosition',[1 1 21 7]);
plot(k,pos_EDDW_NC(k),'r','LineWidth',2);hold on;
plot(k,pos_EDDW_WC(k),'--g','LineWidth',2);hold on;
le11=xlabel('$k$');
le12=ylabel('$\alpha$ (m)');
ylim([-0.2 0.05]);
set(gca,'FontSize',Fonts);
set(le11,'Interpreter','latex');
set(le12,'Interpreter','latex');
hold on;
t21=text(120,pos_EDDW_NC(125),'BACK');
set(t21,'Interpreter','latex','FontSize',Fonts);
hold off;
saveas(fig1,'EDDW31','pdf');

fig2=figure(2);
set(fig2, 'Position', [0 0 1000 350]); 
set(fig2, 'PaperSize', [29.7000 21.0000]); 
set(fig2,'PaperPosition',[1 1 21 7]);
plot(k,ang_EDDW_NC(k),'r','LineWidth',2);hold on;
plot(k,ang_EDDW_WC(k),'--g','LineWidth',2);hold on;
le11=xlabel('$k$');
le12=ylabel('$\theta$ (rad)');
set(gca,'FontSize',Fonts);
set(le11,'Interpreter','latex');
set(le12,'Interpreter','latex');
hold on;
t21=text(120,ang_EDDW_NC(125)-0.05,'BACK');
set(t21,'Interpreter','latex','FontSize',Fonts);
hold off;
saveas(fig2,'EDDW32','pdf');

fig3=figure(3);
set(fig3, 'Position', [0 0 1000 350]); 
set(fig3, 'PaperSize', [29.7000 21.0000]); 
set(fig3,'PaperPosition',[1 1 21 7]);
subplot(1,2,1)
plot(k,inc11_EDDW_NC(k),'r','LineWidth',2);hold on;
plot(k,inc11_EDDW_WC(k),'--g','LineWidth',2);hold on;
plot(k,inc11_thd(k),'--k','LineWidth',2);hold off;
le11=xlabel('$k$');
le12=ylabel('$\varphi_{1,1}(k)$');
xlim([0 140]);
set(gca,'xtick',0:28:140)
ylim([-0.005 0.02]);
set(gca,'FontSize',Fonts);
set(le11,'Interpreter','latex');
set(le12,'Interpreter','latex');
subplot(1,2,2)
plot(k,inc12_EDDW_NC(k),'r','LineWidth',2);hold on;
plot(k,inc12_EDDW_WC(k),'--g','LineWidth',2);hold on;
plot(k,inc12_thd(k),'--k','LineWidth',2);hold off;
le11=xlabel('$k$');
le12=ylabel('$\varphi_{1,2}(k)$');
xlim([0 140]);
set(gca,'xtick',0:28:140)
ylim([-0.01 0.03]);
set(gca,'FontSize',Fonts);
set(le11,'Interpreter','latex');
set(le12,'Interpreter','latex');
saveas(fig3,'EDDW33','pdf');

fig4=figure(4);
set(fig4, 'Position', [0 0 1000 350]); 
set(fig4, 'PaperSize', [29.7000 21.0000]); 
set(fig4,'PaperPosition',[1 1 21 7]);
plot(k,inc2_EDDW_NC(k),'r','LineWidth',2);hold on;
plot(k,inc2_EDDW_WC(k),'--g','LineWidth',2);hold on;
plot(k,inc2_thd(k),'--k','LineWidth',2);hold off;
le11=xlabel('$k$');
le12=ylabel('$\varphi_2(k)$');
ylim([-5 15]);
set(gca,'FontSize',Fonts);
set(le11,'Interpreter','latex');
set(le12,'Interpreter','latex');
saveas(fig4,'EDDW34','pdf');