clear all;clc;
load epa3.mat;

epa3min=min(epa3);
epa3max=max(epa3);
x=linspace(epa3min,epa3max,10);
counters = hist(epa3,x);
counters = counters/2000;

load fittedmodel;
Fonts=18;
fig1=figure(1);
set(fig1, 'Position', [0 0 1000 350]); 
set(fig1, 'PaperSize', [29.7000 21.0000]); 
set(fig1,'PaperPosition',[1 1 21 7]);
bar(x,counters,'FaceColor',[0.6941 0.8902 0.9765],'EdgeColor','w');hold on;
h = plot(fittedmodel);
h.LineWidth =2;
h.Color = 'b';
hold off;
set(gca,'FontSize',Fonts);
l1=xlabel('Errors in pendulum angle (m)');
l2=ylabel('Frequency');
l3=legend('Statistical data','Fitted curve');
set(l1,'Interpreter','latex');
set(l2,'Interpreter','latex');
set(l3,'Interpreter','latex','Location','NorthEast');
saveas(fig1,'figA2','pdf');