clear all;clc;
Data = importdata('NDW_FD_WC.txt');
inc2u=Data.data(:,12);
ep=Data.data(:,9);

Data = importdata('KF_EDDW_FDIAII_NC5.txt');
epn=Data.data(:,9);

inc2_thd=zeros(1,1000);
for i=1:1000
   inc2_thd(i)=7e-4;
end

E_thd=zeros(1,5688);
for i=1:5688
    E_thd(i)=0.0077;
end

Fonts=18;
k=1:140;
fig1=figure(1);
set(fig1, 'Position', [0 0 1000 350]); 
set(fig1, 'PaperSize', [29.7000 21.0000]); 
set(fig1,'PaperPosition',[1 1 21 7]);
plot(k,inc2u(k),'g','LineWidth',2);hold on;
plot(k,inc2_thd(k),'--k','LineWidth',2);hold on;
le11=xlabel('$k$');
le12=ylabel('$\tilde \varphi_2(k)$');
ylim([-2e-4 8.1e-4]);
set(gca,'FontSize',Fonts);
set(le11,'Interpreter','latex');
set(le12,'Interpreter','latex');
hold off;
saveas(fig1,'EDDW35','pdf')
