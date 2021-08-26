clear all;clc;
Data = importdata('KF_nor_DW.txt');
k_nor_DW=Data.data(:,1);
pos_nor_DW=Data.data(:,2);
ang_nor_DW=Data.data(:,3);
inc1_nor_DW=Data.data(:,4);
inc2_nor_DW=Data.data(:,5);
Data = importdata('KF_DW_FDIAI_400.txt');
k_FDIAI_DW=Data.data(:,1);
pos_FDIAI_DW=Data.data(:,2);
ang_FDIAI_DW=Data.data(:,3);
inc1_FDIAI_DW=Data.data(:,4);
inc2_FDIAI_DW=Data.data(:,5);

inc1_thd=zeros(1,566);
inc2_thd=zeros(1,566);
for i=1:566
   inc1_thd(i)=2e-4;
   inc2_thd(i)=1.5e-3;
end

Fonts=18;

k=1:566;
fig1=figure(1);
set(fig1, 'Position', [0 0 1000 350]); 
set(fig1, 'PaperSize', [29.7000 21.0000]); 
set(fig1,'PaperPosition',[1 1 21 7]);
plot(k,pos_nor_DW(k),'b','LineWidth',2);hold on;
plot(k,pos_FDIAI_DW(k),'--r','LineWidth',2);hold on;
le11=xlabel('$k$');
le12=ylabel('$\alpha$ (m)');
set(gca,'FontSize',Fonts);
set(le11,'Interpreter','latex');
set(le12,'Interpreter','latex');
hold on;
t21=text(566-20,pos_FDIAI_DW(566),'OFF');
set(t21,'Interpreter','latex','FontSize',Fonts);
hold off;
saveas(fig1,'dwm11_400','pdf');

fig2=figure(2);
set(fig2, 'Position', [0 0 1000 350]); 
set(fig2, 'PaperSize', [29.7000 21.0000]); 
set(fig2,'PaperPosition',[1 1 21 7]);
plot(k,ang_nor_DW(k),'b','LineWidth',2);hold on;
plot(k,ang_FDIAI_DW(k),'--r','LineWidth',2);hold on;
le11=xlabel('$k$');
le12=ylabel('$\theta$ (rad)');
ylim([-1.0 1.0]);
set(gca,'FontSize',Fonts);
set(le11,'Interpreter','latex');
set(le12,'Interpreter','latex');
hold on;
t21=text(566-20,ang_FDIAI_DW(566),'OFF');
set(t21,'Interpreter','latex','FontSize',Fonts);
hold off;
saveas(fig2,'dwm12_400','pdf');

fig3=figure(3);
set(fig3, 'Position', [0 0 1000 350]); 
set(fig3, 'PaperSize', [29.7000 21.0000]); 
set(fig3,'PaperPosition',[1 1 21 7]);
plot(k,inc1_thd(k),'--k','LineWidth',2);hold on;
plot(k,inc1_nor_DW(k),'b','LineWidth',2);hold on;
plot(k,inc1_FDIAI_DW(k),'--r','LineWidth',2);hold off;
le11=xlabel('$k$');
le12=ylabel('$\varphi_{d,1}(k)$');
ylim([-1e-4 3e-4]);
set(gca,'FontSize',Fonts);
set(le11,'Interpreter','latex');
set(le12,'Interpreter','latex');
saveas(fig3,'dwm13_400','pdf');

fig4=figure(4);
set(fig4, 'Position', [0 0 1000 350]); 
set(fig4, 'PaperSize', [29.7000 21.0000]); 
set(fig4,'PaperPosition',[1 1 21 7]);
plot(k,inc2_thd(k),'--k','LineWidth',2);hold on;
plot(k,inc2_nor_DW(k),'b','LineWidth',2);hold on;
plot(k,inc2_FDIAI_DW(k),'--r','LineWidth',2);hold off;
le11=xlabel('$k$');
le12=ylabel('$\varphi_{d,2}(k)$');
ylim([-0.5e-3 2e-3]);
set(gca,'FontSize',Fonts);
set(le11,'Interpreter','latex');
set(le12,'Interpreter','latex');
saveas(fig4,'dwm14_400','pdf');