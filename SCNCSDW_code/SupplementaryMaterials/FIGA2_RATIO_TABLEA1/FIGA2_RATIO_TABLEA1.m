clear all;clc;
Data = importdata('KF_EDDW_FDIA_timecom.txt');
timeo=Data.data(:,7);
timen=Data.data(:,8);

sumo=0;
sumn=0;
for i=1:148
   sumo=sumo+timeo(i); 
   sumn=sumn+timen(i);
end

x=4;
z=zeros(1,12);
for y=1:12
    z(y)=(y*y)/(x*y+x*x);
end
Fonts=18;
k=1:12;
fig1=figure(1);
set(fig1, 'Position', [0 0 1000 350]); 
set(fig1, 'PaperSize', [29.7000 21.0000]); 
set(fig1,'PaperPosition',[1 1 21 7]);
plot(k,z(k),'g','LineWidth',2);hold on;
plot(7,1.1136,'or','LineWidth',2);hold on;
arr1=annotation('textarrow',[0.59 0.7],[0.7 0.7]);hold on;
set(arr1,'string','new DW Tests have less time complexity','fontsize',15,'Interpreter','latex');
arr2=annotation('textarrow',[0.585 0.47],[0.35 0.35]);hold on;
set(arr2,'string','more time complexity','fontsize',15,'Interpreter','latex');
le11=xlabel('$m_y$($m_x=4$)');
le12=ylabel('ratio $\wp$');
set(gca,'FontSize',Fonts);
set(le11,'Interpreter','latex');
set(le12,'Interpreter','latex');
saveas(fig1,'ratio','pdf');

sumo
sumn
