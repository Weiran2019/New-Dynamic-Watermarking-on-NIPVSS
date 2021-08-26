clear all;clc;
load ecp3.mat;

ecp3min=min(ecp3);
ecp3max=max(ecp3);
x=linspace(ecp3min,ecp3max,10);
counters = hist(ecp3,x);
counters = counters/2000;

load fittedmodel;
Fonts=18;
fig1=figure(1);
set(fig1, 'Position', [0 0 1000 350]); 
set(fig1, 'PaperSize', [29.7000 21.0000]); 
set(fig1,'PaperPosition',[1 1 21 7]);
bar(x,counters,'FaceColor',[0.2,1,0.75],'EdgeColor','w');hold on;
h = plot(fittedmodel);
h.LineWidth = 2;
h.Color = 'm';
hold off;
set(gca,'FontSize',Fonts);
l1=xlabel('Errors in cart position (m)');
l2=ylabel('Frequency');
l3=legend('Statistical data','Fitted curve');
set(l1,'Interpreter','latex');
set(l2,'Interpreter','latex');
set(l3,'Interpreter','latex','Location','NorthEast');
saveas(fig1,'figA1','pdf');