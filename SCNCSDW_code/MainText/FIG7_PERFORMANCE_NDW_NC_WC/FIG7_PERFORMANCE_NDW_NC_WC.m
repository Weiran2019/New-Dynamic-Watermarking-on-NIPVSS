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
fig3=figure(3);
set(fig3, 'Position', [0 0 1000 350]); 
set(fig3, 'PaperSize', [29.7000 21.0000]); 
set(fig3,'PaperPosition',[1 1 21 7]);
plot(k,epn(k)/0.0077,'r','LineWidth',2);hold on;
plot(k,ep(k)/0.0077,'--g','LineWidth',2);hold off;
le11=xlabel('$k$');
le12=ylabel('$\mathcal{E}_T(k)/0.0077$');
ylim([-2000 8000]);
set(gca,'FontSize',Fonts);
set(le11,'Interpreter','latex');
set(le12,'Interpreter','latex');
axes('position',[0.3 0.55 0.3 0.2]);
plot(k,epn(k)/0.0077,'r','LineWidth',2);hold on;
plot(k,ep(k)/0.0077,'--g','LineWidth',2);hold off;
set(gca,'FontSize',Fonts);
ylim([-0.005 0.02]);
saveas(fig3,'EDDW37','pdf')
