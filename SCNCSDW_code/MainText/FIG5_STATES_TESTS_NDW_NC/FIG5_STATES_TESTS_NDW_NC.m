clear all;clc;
Data = importdata('KF_nor_EDDW.txt');
k_nor_EDDW=Data.data(:,1);
pos_nor_EDDW=Data.data(:,2);
ang_nor_EDDW=Data.data(:,3);
inc11_nor_EDDW=Data.data(:,4);
inc12_nor_EDDW=Data.data(:,5);
inc2_nor_EDDW=Data.data(:,6);
Data = importdata('KF_EDDW_FDIAI.txt');
k_FDIAI_EDDW=Data.data(:,1);
pos_FDIAI_EDDW=Data.data(:,2);
ang_FDIAI_EDDW=Data.data(:,3);
inc11_FDIAI_EDDW=Data.data(:,4);
inc12_FDIAI_EDDW=Data.data(:,5);
inc2_FDIAI_EDDW=Data.data(:,6);

inc11_thd=zeros(1,149);
inc12_thd=zeros(1,149);
inc2_thd=zeros(1,149);
for i=1:149
   inc11_thd(i)=7e-4;
   inc12_thd(i)=7e-4;
   inc2_thd(i)=7e-4;
end

Fonts=18;

k=1:149;
fig1=figure(1);
set(fig1, 'Position', [0 0 1000 350]); 
set(fig1, 'PaperSize', [29.7000 21.0000]); 
set(fig1,'PaperPosition',[1 1 21 7]);
plot(k,pos_nor_EDDW(k),'b','LineWidth',2);hold on;
plot(k,pos_FDIAI_EDDW(k),'--r','LineWidth',2);hold on;
le11=xlabel('$k$');
le12=ylabel('$\alpha$ (m)');
set(gca,'FontSize',Fonts);
set(le11,'Interpreter','latex');
set(le12,'Interpreter','latex');
hold on;
t21=text(135,pos_FDIAI_EDDW(140),'OFF');
set(t21,'Interpreter','latex','FontSize',Fonts);
hold off;
saveas(fig1,'EDDW11','pdf');

fig2=figure(2);
set(fig2, 'Position', [0 0 1000 350]); 
set(fig2, 'PaperSize', [29.7000 21.0000]); 
set(fig2,'PaperPosition',[1 1 21 7]);
plot(k,ang_nor_EDDW(k),'b','LineWidth',2);hold on;
plot(k,ang_FDIAI_EDDW(k),'--r','LineWidth',2);hold on;
le11=xlabel('$k$');
le12=ylabel('$\theta$ (rad)');
ylim([-0.8 0.21]);
set(gca,'FontSize',Fonts);
set(le11,'Interpreter','latex');
set(le12,'Interpreter','latex');
hold on;
t21=text(135,ang_FDIAI_EDDW(140)-0.23,'OFF');
set(t21,'Interpreter','latex','FontSize',Fonts);
hold off;
saveas(fig2,'EDDW12','pdf');

fig3=figure(3);
set(fig3, 'Position', [0 0 1000 350]); 
set(fig3, 'PaperSize', [29.7000 21.0000]); 
set(fig3,'PaperPosition',[1 1 21 7]);
subplot(1,2,1)
plot(k,inc11_thd(k),'--k','LineWidth',2);hold on;
plot(k,inc11_nor_EDDW(k),'b','LineWidth',2);hold on;
plot(k,inc11_FDIAI_EDDW(k),'--r','LineWidth',2);hold off;
le11=xlabel('$k$');
le12=ylabel('$\varphi_{1,1}(k)$');
ylim([-0.5e-3 2e-3]);
set(gca,'FontSize',Fonts);
set(le11,'Interpreter','latex');
set(le12,'Interpreter','latex');
subplot(1,2,2)
plot(k,inc12_thd(k),'--k','LineWidth',2);hold on;
plot(k,inc12_nor_EDDW(k),'b','LineWidth',2);hold on;
plot(k,inc12_FDIAI_EDDW(k),'--r','LineWidth',2);hold off;
le11=xlabel('$k$');
le12=ylabel('$\varphi_{1,2}(k)$');
ylim([-0.5e-3 2e-3]);
set(gca,'FontSize',Fonts);
set(le11,'Interpreter','latex');
set(le12,'Interpreter','latex');
saveas(fig3,'EDDW13','pdf');

fig4=figure(4);
set(fig4, 'Position', [0 0 1000 350]); 
set(fig4, 'PaperSize', [29.7000 21.0000]); 
set(fig4,'PaperPosition',[1 1 21 7]);
plot(k,inc2_thd(k),'--k','LineWidth',2);hold on;
plot(k,inc2_nor_EDDW(k),'b','LineWidth',2);hold on;
plot(k,inc2_FDIAI_EDDW(k),'--r','LineWidth',2);hold off;
le11=xlabel('$k$');
le12=ylabel('$\varphi_2(k)$');
ylim([-0.005 0.015]);
set(gca,'FontSize',Fonts);
set(le11,'Interpreter','latex');
set(le12,'Interpreter','latex');
saveas(fig4,'EDDW14','pdf');