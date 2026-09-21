%% 1 

%parameters
clc
clear -except linewidth
linewidth=1.2;
FontName="Times";
close all

% x axis
n=0:0.001:2;

% production function
y=n.^(1/3);

%plot
plot(n,y,'LineWidth',linewidth)
xlabel("$n$",'Position',[1 0],'Interpreter','latex','FontSize', 13)
ylabel("$y$",'Interpreter','latex','FontSize', 13)

%text
text(1.6, 1.1, "$y=f(n)$",'Interpreter','latex', 'FontSize', 16);

% No number on the axes
set(gca,'XTick',[])
set(gca,'YTick',[])

%save
print(gcf,'1.png','-dpng','-r500');
print(gcf,'1.eps','-depsc','-tiff','-r500');


%% 2

%parameters

clc
clear -except linewidth
linewidth=1.2;
close all

% x axis
n=0:0.001:2;

% production function
y=n.^(1/3);
plot(n,y,'LineWidth',linewidth)

hold on

% Tangent line
Slope=(1/3).*0.5^(-2/3);
Line=Slope*(n-0.5)+0.5^(1/3);
plot(n,Line,'LineWidth',linewidth)

% Horizontal line
hold on
plot([1.4568,1.8],[1.3,1.3],'LineWidth',linewidth)

% Arc
n_circle=1.552:0.001:1.566;
Circle=1.3+sqrt(0.1^2-(n_circle-1.46568).^2);
hold on
plot(n_circle,Circle,'LineWidth',linewidth-0.2)

% axes
xlabel("$n$",'Position',[1 0],'Interpreter','latex','FontSize', 13);
ylabel("$y$",'Interpreter','latex','FontSize', 13);

text(1.6, 1.34, "$w$", 'Interpreter','latex','Color', 'b', 'FontWeight', 'bold','FontSize', 13);
text(0.46, -0.1, "$n^*$", 'Interpreter','latex','Color', 'b', 'FontWeight', 'bold','FontSize', 13);
text(-0.1, 0.52, "$\Pi$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(0.27, 0.88, "$f'(n)=w$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
scatter([0.5], [0.7937],'filled','MarkerFaceColor','red')

% vertical line
plot([0.5 0.5],[0 0.5^(1/3)],'--','LineWidth',linewidth)
set(gca,'XTick',[])
set(gca,'YTick',[])

%save
print(gcf,'2.png','-dpng','-r500');
print(gcf,'2.eps','-depsc','-tiff','-r500');

%% 2b

%parameters

clc
clear -except linewidth
linewidth=1.2;
close all

% x axis
n=0:0.001:2;

% production function
y=n.^(1/3);
plot(n,y,'LineWidth',linewidth)

hold on

% Tangent line
Slope=(1/3).*0.5^(-2/3);
Line=Slope*(n-0.5)+0.5^(1/3);
plot(n,Line,'LineWidth',linewidth)

% Horizontal line
hold on
plot([1.4568,1.8],[1.3,1.3],'LineWidth',linewidth)

% Arc
n_circle=1.552:0.001:1.566;
Circle=1.3+sqrt(0.1^2-(n_circle-1.46568).^2);
hold on
plot(n_circle,Circle,'LineWidth',linewidth-0.2)

% axes
xlabel("$n$",'Position',[1 0],'Interpreter','latex','FontSize', 13);
ylabel("$y$",'Interpreter','latex','FontSize', 13);

text(1.6, 1.34, "$w$", 'Interpreter','latex','Color', 'b', 'FontWeight', 'bold','FontSize', 13);
text(0.46, -0.1, "$n^*$", 'Interpreter','latex','Color', 'b', 'FontWeight', 'bold','FontSize', 13);
text(-0.1, 0.52, "$\Pi$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);

text(0.95, 0.45, "costs = $wn$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(0.95, 0.95, "revenues = $f(n)$", 'Interpreter','latex','Color', 'b', 'FontWeight', 'bold','FontSize', 13);
text(0.27, 0.88, "$f'(n)=w$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
scatter([0.5], [0.7937],'filled','MarkerFaceColor','red')


hold on
Line2=Slope*(n);
plot(n,Line2,'LineWidth',linewidth)


hold on
annotation('doublearrow',[.315 .315],[.26 .5])
% vertical line
plot([0.5 0.5],[0 0.5^(1/3)],'--','LineWidth',linewidth)
set(gca,'XTick',[])
set(gca,'YTick',[])
xlim([0 2.1])
%save
print(gcf,'2b.png','-dpng','-r500');
print(gcf,'2b.eps','-depsc','-tiff','-r500');

%% 3

% parameters
clc
clear -except linewidth
close all
linewidth=1.2;
FontName="Times";

% x axis
n=0:0.001:1;

% Marginal Product of labor
y=(1/3).*n.^(-2/3);
plot(n(90:end),y(90:end),'LineWidth',linewidth)

hold on

% Horizontal wage
plot([0,1],[0.529,0.529],'LineWidth',linewidth)

hold on 

% Vertical line
plot([0.5 0.5],[0 (1/3)*0.5^(-2/3)],'--','LineWidth',linewidth)

xlabel("$n$",'Position',[0.8 0],'Interpreter','latex','FontSize', 13);

ylabel("$f'(n)$",'Interpreter','latex','FontSize', 13);

% w and n*
text(0.46, -0.1, "$n^*$", 'Interpreter','latex','Color', 'b', 'FontWeight', 'bold','FontSize', 13);
text(-0.05, 0.5, "$w$", 'Interpreter','latex','Color', 'b', 'FontWeight', 'bold','FontSize', 13);

set(gca,'XTick',[])
set(gca,'YTick',[])

% save
print(gcf,'3.png','-dpng','-r500');
print(gcf,'3.eps','-depsc','-tiff','-r500');


%% 4

% parameters

clc
clear
close all
n=0:0.001:1;
linewidth=1.2;
FontName="Times";

% Marginal Rate of Substitution (Leisure vs. Consumption) 
MRS=((1/0.529)*n.^1/1.1).^(-1/2.1);
plot(n(30:end),MRS(30:end),'LineWidth',linewidth)

% MRS Slope
MRS_Slope=diff(MRS)/0.001;

% Tangent Line
Line=MRS(300)+MRS_Slope(300)*(n-n(300));
hold on 
plot(n,Line,'LineWidth',linewidth)


hold on 

% Arc
plot([0.665 0.831],[0.21258 0.21258],'LineWidth',linewidth)
hold on
plot([0.7782 0.777 0.779],[0.21258 0.26 0.32601],'LineWidth',linewidth)
hold on

% Vertical Line
plot([n(300) n(300)],[-0.9 MRS(300)],'--','LineWidth',linewidth)

% Horizontal Line
plot([0 n(300)],[MRS(300) MRS(300)],'--','LineWidth',linewidth)



xlabel("$l$",'Interpreter','latex','FontSize', 13);
ylabel("$c$",'Position',[0 2.8],'Interpreter','latex','FontSize', 13);

% Text
text(0.67, 0.32, "$-w$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(n(300), -1.3, "$l^*$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(-0.05, MRS(300)-0.1, "$c^*$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(0.23, 2.2, "$\frac{\tilde{v}'(l)}{u'(c)}=w$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 23);

set(gca,'XTick',[])
set(gca,'YTick',[])

%save
print(gcf,'4.png','-dpng','-r500');
print(gcf,'4.eps','-depsc','-tiff','-r500');

%% 5

% parameters
clc
clear
close all
linewidth=1.2;

% x axis
n=0:0.001:2;


% Linear Consumption in terms of labor
Slope=(1/3).*0.5^(-2/3);
Line=Slope*(n-0.5)+0.5^(1/3);
plot(n,Line,'LineWidth',linewidth)

hold on

% Arc
plot([1.4568,1.8],[1.3,1.3],'LineWidth',linewidth)
n_circle=1.552:0.001:1.566;
Circle=1.3+sqrt(0.1^2-(n_circle-1.46568).^2);
hold on
plot(n_circle,Circle,'LineWidth',linewidth)

% Text and Axis label
xlabel("$h$",'Interpreter','latex','FontSize', 13);
ylabel("$c$",'Interpreter','latex','FontSize', 13);

text(-0.1,Slope*(-0.5)+0.5^(1/3), "$\Pi$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(0.8,1.2, "$c=wh+\Pi$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(1.6,1.335, "$w$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);


set(gca,'XTick',[])
set(gca,'YTick',[])

% Save
print(gcf,'5.png','-dpng','-r500');
print(gcf,'5.eps','-depsc','-tiff','-r500');

%% 6

%Parameters

clc
clear
close all
n=0:0.001:1;
n_circle=0.7415:0.0001:0.753;
linewidth=1.2;


% Marginal Rate of Substitution (Labor vs. Consumption)  
MRS=((0.529)*(1-n).^1/2).^(-1/0.4);
plot(n(30:end-300),MRS(30:end-300)/500,'LineWidth',linewidth)

% MRS slope
MRS_Slope=diff(MRS/500)/0.001;

% Tangent Line
Line=MRS(400)/500+MRS_Slope(400)*(n-n(400));
hold on 
plot(n,Line,'LineWidth',linewidth)

% Arc
hold on
plot([0.703 0.9],[0.45027 0.45027],'LineWidth',linewidth)
Circle=0.45027+sqrt(0.05^2-(n_circle-0.703).^2);
plot(n_circle,Circle,'LineWidth',linewidth)
 
 
set(gca,'XTick',[])
set(gca,'YTick',[])

%Text
text(0.21, 0.45, "$\frac{v'(h)}{u'(c)}=w$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 20);
text(0.78, 0.49, "$w$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(n(400), -0.26, "$h^*$", 'Interpreter','latex','Color', 'b', 'FontWeight', 'bold','FontSize', 13);
text(-0.05, 0.19851, "$c^*$", 'Interpreter','latex','Color', 'b', 'FontWeight', 'bold','FontSize', 13);

% Vertical Line
hold on 
plot([n(400) n(400)],[-0.2 MRS(400)/500],'--','LineWidth',linewidth)

hold on 
plot([0 0.399],[0.19851 0.19851],'--','LineWidth',linewidth)


% Axis label
xlabel("$h$",'Position',[0.7 -0.2],'Interpreter','latex','FontSize', 13);
ylabel("$c$",'Interpreter','latex','FontSize', 13);

%Save
print(gcf,'6.png','-dpng','-r500');
print(gcf,'6.eps','-depsc','-tiff','-r500');

%% 7 


%Parameters

clc
clear
close all
n=0:0.001:1;
n_circle=0.7415:0.0001:0.753;
linewidth=1.2;

% production function
y=n.^(1/3);

%
% y_prime=(1/3)*n.^(-2/3);
% 
% LOC=y_prime==MRS_Slope;

hold on

plot(n,y,'LineWidth',linewidth)

hold on
% Marginal Rate of Substitution (Labor vs. Consumption)  
MRS=((0.529)*(1-n).^1/2).^(-1/0.4);
plot(n(30:end-300),MRS(30:end-300)/500+0.55,'LineWidth',linewidth)

% MRS slope
MRS_Slope=diff(MRS/500)/0.001;


% production function


%  
set(gca,'XTick',[])
set(gca,'YTick',[])

%Text
text(0.21, 0.45+0.55, "$\frac{v'(n)}{u'(c)}=f^{'}(n)$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 19);
text(n(350), -0.75+0.6, "$n^*$", 'Interpreter','latex','Color', 'b', 'FontWeight', 'bold','FontSize', 13);
text(-0.1 ,MRS(350)/500+0.55 , "$c^*$", 'Interpreter','latex','Color', 'b', 'FontWeight', 'bold','FontSize', 13);


% Vertical Line
hold on 
plot([n(350) n(350)],[0 MRS(350)/500+0.55],'--','LineWidth',linewidth)


% Horizontal Line
hold on 
plot([0 n(350)],[MRS(350)/500+0.55 MRS(350)/500+0.55],'--','LineWidth',linewidth)


% Axis label
xlabel("$n$",'Position',[0.7 0],'Interpreter','latex','FontSize', 13);
ylabel("$c$",'Interpreter','latex','FontSize', 13);

%Save
print(gcf,'7.png','-dpng','-r500');
print(gcf,'7.eps','-depsc','-tiff','-r500');

%% 8



%Parameters

clc
clear
close all
n=0:0.001:1;
n_circle=0.7415:0.0001:0.753;
linewidth=1.2;

% production function
y=n.^(1/3);

hold on

plot(n,y,'LineWidth',linewidth)

hold on

plot(n,1.3*y,'LineWidth',linewidth)

hold on

annotation('arrow',[.8 .8],[.543 .674])
% Texts

text(0.71, 1.1, "$A_1 n^{\alpha}$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 16,'Color', 'red');
text(0.71, 0.83, "$A_0 n^{\alpha}$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 16,'Color', 'b');

set(gca,'XTick',[])
set(gca,'YTick',[])
ylim([0,1.8])
xlabel("$n$",'Position',[0.7 -0],'Interpreter','latex','FontSize', 13);
ylabel("$y$",'Interpreter','latex','FontSize', 13);

%Save
print(gcf,'8.png','-dpng','-r500');
print(gcf,'8.eps','-depsc','-tiff','-r500');
%% 9 


%Parameters

clc
clear
close all
n=0:0.001:1;
n_circle=0.7415:0.0001:0.753;
linewidth=1.2;

% production function
y=n.^(1/3);

hold on

plot(n,y,'LineWidth',linewidth)

hold on

plot(n,1.3*y,'LineWidth',linewidth)

hold on

annotation('arrow',[.8 .8],[.543 .674])
% Texts
hold on

% Marginal Rate of Substitution (Labor vs. Consumption)  
MRS=((0.529)*(1-n).^1/2).^(-1/0.4);
plot(n(30:end-300),MRS(30:end-300)/500+0.55,'LineWidth',linewidth)

text(0.71, 1.1, "$A_1 n^{\alpha}$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 16,'Color', 'red');
text(0.71, 0.83, "$A_0 n^{\alpha}$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 16,'Color', 'b');


set(gca,'XTick',[])
set(gca,'YTick',[])

% Texts
% text(0.21, 0.45+0.55, "$\frac{v'(n)}{u'(c)}=f^{'}(n)$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 19);
text(n(350), -0.75+0.6, "$n_0$", 'Interpreter','latex','Color', 'b', 'FontWeight', 'bold','FontSize', 13);
text(-0.05 ,MRS(350)/500+0.55 , "$c_0$", 'Interpreter','latex','Color', 'b', 'FontWeight', 'bold','FontSize', 13);


% Vertical Line
hold on 
plot([n(350) n(350)],[0 MRS(350)/500+0.55],'--','LineWidth',linewidth)


% Horizontal Line
hold on 
plot([0 n(350)],[MRS(350)/500+0.55 MRS(350)/500+0.55],'--','LineWidth',linewidth)


% Question marks
hold on

scatter([0.271,0.433], [0.841 0.9835],'filled','MarkerFaceColor','red')
scatter([0.349], [0.7125],'filled','MarkerFaceColor','b')

text(0.271-0.01, 0.841+0.08, "$?$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 14);
text(0.433-0.01 ,0.9835+0.08 , "$?$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 14);

xlabel("$n$",'Position',[0.7 -0],'Interpreter','latex','FontSize', 13);
ylabel("$c$",'Interpreter','latex','FontSize', 13);

%Save
print(gcf,'9.png','-dpng','-r500');
print(gcf,'9.eps','-depsc','-tiff','-r500');

%% 10 


%Parameters

clc
clear
close all
n=0:0.001:1;
n_circle=0.7415:0.0001:0.753;
linewidth=1.2;

% production function
y=n.^(1/3);

hold on

plot(n,y,'LineWidth',linewidth)

hold on

plot(n,1.3*y,'LineWidth',linewidth)

hold on

% Texts
hold on

% Marginal Rate of Substitution (Labor vs. Consumption)  
MRS=((0.529)*(1-n).^1/2).^(-1/0.4);
plot(n(30:end-300),MRS(30:end-300)/500+0.55,'LineWidth',linewidth)

text(0.71, 1.1, "$A_1 n^{\alpha}$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 16,'Color', 'red');
text(0.71, 0.83, "$A_0 n^{\alpha}$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 16,'Color', 'b');


set(gca,'XTick',[])
set(gca,'YTick',[])

% Texts
% text(0.21, 0.45+0.55, "$\frac{v'(n)}{u'(c)}=f^{'}(n)$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 19);
text(n(300), -0.75+0.6, "$n_0=n_1$", 'Interpreter','latex','Color', 'b', 'FontWeight', 'bold','FontSize', 13);
text(-0.05 ,MRS(350)/500+0.55 , "$c_0$", 'Interpreter','latex','Color', 'b', 'FontWeight', 'bold','FontSize', 13);
text(-0.05 ,MRS(350)/500+0.75 , "$c_1$", 'Interpreter','latex','Color', 'b', 'FontWeight', 'bold','FontSize', 13);

hold on
annotation('arrow',[0.07 0.07],[.435 .519])

% Vertical Line
hold on 
plot([n(350) n(350)],[0 MRS(350)/500+0.75],'--','LineWidth',linewidth)


% Horizontal Line
hold on 
plot([0 n(350)],[MRS(350)/500+0.55 MRS(350)/500+0.55],'--','LineWidth',linewidth)
plot([0 n(350)],[MRS(350)/500+0.75 MRS(350)/500+0.75],'--','LineWidth',linewidth)


% Question marks
hold on

scatter([0.349], [0.7125],'filled','MarkerFaceColor','b')



%New MRS
hold on 
plot(n(30:end-300)-0.05,MRS(30:end-300)/500+0.72,'LineWidth',linewidth)
hold on

scatter([0.349], [0.91],'filled','MarkerFaceColor','red')

xlabel("$n$",'Position',[0.7 -0],'Interpreter','latex','FontSize', 13);
ylabel("$c$",'Position',[0 1.4],'Interpreter','latex','FontSize', 13);
xlim([0,1])
ylim([0,1.8])

%Save
print(gcf,'10.png','-dpng','-r500');
print(gcf,'10.eps','-depsc','-tiff','-r500');

%% 11 


%Parameters

clc
clear
close all
n=0:0.001:1;
n_circle=0.7415:0.0001:0.753;
linewidth=1.2;

% production function
y=n.^(1/3);

%
% y_prime=(1/3)*n.^(-2/3);
% 
% LOC=y_prime==MRS_Slope;

hold on

plot(n,y,'LineWidth',linewidth)

hold on
% Marginal Rate of Substitution (Labor vs. Consumption)  
MRS=((0.529)*(1-n).^1/2).^(-1/0.4);
plot(n(30:end-300),MRS(30:end-300)/500+0.55,'LineWidth',linewidth)

% MRS slope
MRS_Slope=diff(MRS/500)/0.001;


% production function


%  
set(gca,'XTick',[])
set(gca,'YTick',[])

%Text
text(0.05, 0.45+0.85, "$\frac{v'(n)}{u'(c)}=w$ and $w=f^{'}(n)$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 17);
text(n(350), -0.75+0.6, "$n^*$", 'Interpreter','latex','Color', 'b', 'FontWeight', 'bold','FontSize', 13);
text(-0.1 ,MRS(350)/500+0.55 , "$c^*$", 'Interpreter','latex','Color', 'b', 'FontWeight', 'bold','FontSize', 13);


% Vertical Line
hold on 
plot([n(350) n(350)],[0 MRS(350)/500+0.55],'--','LineWidth',linewidth)


% Horizontal Line
hold on 
plot([0 n(350)],[MRS(350)/500+0.55 MRS(350)/500+0.55],'--','LineWidth',linewidth)

%line

line=0.71256+0.7*(n-0.349);
plot(n,line,'LineWidth',linewidth)

plot([0.859 0.979],[1.0696 1.0696],'LineWidth',linewidth)
hold on
n_circle=0.9:0.001:0.909;
Circle=1.0696+sqrt(0.05^2-(n_circle-0.859).^2);
plot(n_circle,Circle,'LineWidth',linewidth)

text(0.94, 1.1 , "$w$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);

% Axis label
xlabel("$n$",'Position',[0.7 0],'Interpreter','latex','FontSize', 13);
ylabel("$c$",'Interpreter','latex','FontSize', 13);

%Save
print(gcf,'11.png','-dpng','-r500');
print(gcf,'11.eps','-depsc','-tiff','-r500');


%% 12 


%Parameters

clc
clear
close all
n=0:0.001:1;
n_circle=0.7415:0.0001:0.753;
linewidth=1.2;

% production function
y=n.^(1/3);

hold on

plot(n,y,'LineWidth',linewidth)

hold on

plot(n,1.3*y,'LineWidth',linewidth)

hold on

% Texts
hold on

% Marginal Rate of Substitution (Labor vs. Consumption)  
MRS=((0.529)*(1-n).^1/2).^(-1/0.4);
plot(n(30:end-300),MRS(30:end-300)/500+0.55,'LineWidth',linewidth)

text(0.71, 1.1, "$A_1 n^{\alpha}$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 16,'Color', 'red');
text(0.71, 0.83, "$A_0 n^{\alpha}$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 16,'Color', 'b');


set(gca,'XTick',[])
set(gca,'YTick',[])

% Texts
% text(0.21, 0.45+0.55, "$\frac{v'(n)}{u'(c)}=f^{'}(n)$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 19);
text(n(350), -0.75+0.65, "$n_0$", 'Interpreter','latex','Color', 'b', 'FontWeight', 'bold','FontSize', 13);
text(-0.1 ,MRS(350)/500+0.55 , "$c_0$", 'Interpreter','latex','Color', 'b', 'FontWeight', 'bold','FontSize', 13);

text(0.265, -0.75+0.65, "$n_1$", 'Interpreter','latex','Color', 'b', 'FontWeight', 'bold','FontSize', 13);
text(-0.1 ,0.858 , "$c_1$", 'Interpreter','latex','Color', 'b', 'FontWeight', 'bold','FontSize', 13);

% Vertical Line
hold on 
plot([n(350) n(350)],[0 MRS(350)/500+0.55],'--','LineWidth',linewidth)
plot([0.282 0.282],[0 0.858],'--','LineWidth',linewidth)


% Horizontal Line
hold on 
plot([0 n(350)],[MRS(350)/500+0.55 MRS(350)/500+0.55],'--','LineWidth',linewidth)
plot([0 0.282],[0.858 0.858],'--','LineWidth',linewidth)

annotation('arrow',[0.03 0.03],[.435 .509])

annotation('arrow',[0.41 0.35],[.02 .02])

% Question marks
hold on

scatter([0.349], [0.7125],'filled','MarkerFaceColor','b')



%New MRS
hold on 
plot(n(30:end-300)-0.15,MRS(30:end-300)/500+0.63,'LineWidth',linewidth)

xlabel("$n$",'Position',[0.7 -0],'Interpreter','latex','FontSize', 13);
ylabel("$c$",'Position',[0 1.3],'Interpreter','latex','FontSize', 13);
xlim([0,1])

hold on

scatter([0.282], [0.858],'filled','MarkerFaceColor','red')

%Save
print(gcf,'12.png','-dpng','-r500');
print(gcf,'12.eps','-depsc','-tiff','-r500');



%% 4

% parameters

clc
clear
close all
n=0:0.001:1;
linewidth=1.2;
FontName="Times";

% Marginal Rate of Substitution (Leisure vs. Consumption) 
MRS=((1/0.529)*n.^1/1.1).^(-1/2.1);
plot(n(30:end),MRS(30:end),'LineWidth',linewidth)

% MRS Slope
MRS_Slope=diff(MRS)/0.001;

% Tangent Line
Line=MRS(300)+MRS_Slope(300)*(n-n(300));
hold on 
plot(n,Line,'LineWidth',linewidth)


hold on 



% Vertical Line
plot([n(300) n(300)],[MRS(300) MRS(300)+2.1],'LineWidth',linewidth,'Color','red')

% Horizontal Line
plot([n(300) n(300)+0.4],[MRS(300) MRS(300)],'LineWidth',linewidth,'Color','red')



xlabel("$K$",'Position',[0.8 -0.6],'Interpreter','latex','FontSize', 13);
ylabel("$N$",'Position',[0 3.3],'Interpreter','latex','FontSize', 13);

% Text
text(n(300)+0.02, MRS(300)+1.9, "$\sigma=0$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','red');
text(n(300)+0.02, MRS(300)+1.6, "(Leontief)", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','red');


text(0.8, MRS(300)-0.4, "$\sigma=1$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','blue');
text(0.7, MRS(300)-0.75, "(Cobb-Douglas)", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','blue');



text(0.7, MRS(300)-1.3, "$\sigma=\infty$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','#D95319');
text(0.6, MRS(300)-1.55, "(Perfect Substitutes)", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','#D95319');


set(gca,'XTick',[])
set(gca,'YTick',[])

%save
print(gcf,'13.png','-dpng','-r500');
print(gcf,'13.eps','-depsc','-tiff','-r500');

%% lec5_1

% parameters
clc
clear -except linewidth
close all
linewidth=1.2;
FontName="Times";

% x axis
n=0:0.001:1;

% Marginal Product of capital
y=(1/3).*n.^(-2/3);
plot(n(90:end),y(90:end),'LineWidth',linewidth)

hold on

% Horizontal wage
plot([0,1],[0.65,0.65],'LineWidth',linewidth)

hold on 

% Vertical line
plot([0.367 0.367],[0 0.65],'--','LineWidth',linewidth)

xlabel("$K_2$",'Position',[0.8 0],'Interpreter','latex','FontSize', 13);

%ylabel("$f'(n)$",'Interpreter','latex','FontSize', 13);

% r+d and K*
text(0.33, -0.1, "$K_2^*$", 'Interpreter','latex','Color', 'b', 'FontWeight', 'bold','FontSize', 13);
text(-0.12, 0.65, "$r_1+d$", 'Interpreter','latex','Color', 'b', 'FontWeight', 'bold','FontSize', 13);

text(0.03, 0.92, "$A_2F'(K_2)$", 'Interpreter','latex','Color', 'b', 'FontWeight', 'bold','FontSize', 13);


set(gca,'XTick',[])
set(gca,'YTick',[])

% save
print(gcf,'lec5_1.png','-dpng','-r500');
print(gcf,'lec5_1.eps','-depsc','-tiff','-r500');



%% lec5_2


% parameters
clc
clear -except linewidth
close all
linewidth=1.2;
FontName="Times";

% x axis
n=0:0.001:1;

% Marginal Product of capital
y=(1/3).*n.^(-2/3);
plot(n(90:end),y(90:end),'LineWidth',linewidth)

hold on

y2=1.4*(1/3).*(n).^(-2/3);
plot(n(10:end),y2(10:end),'LineWidth',linewidth)


% Horizontal wage
plot([0,1],[0.65,0.65],'LineWidth',linewidth)

hold on 

% Vertical line
plot([0.367 0.367],[0 0.65],'--','LineWidth',linewidth)
plot([0.607 0.607],[0 0.65],'--','LineWidth',linewidth)

xlabel("$K_2$",'Position',[0.8 0],'Interpreter','latex','FontSize', 13);

%ylabel("$f'(n)$",'Interpreter','latex','FontSize', 13);

% r+d and K*
text(0.34, -0.1, "$K_2^*$", 'Interpreter','latex','Color', 'b', 'FontWeight', 'bold','FontSize', 13);
text(0.59, -0.1, "$\widehat{K_2}^*$", 'Interpreter','latex','Color', 'b', 'FontWeight', 'bold','FontSize', 13);

%text(-0.12, 0.65, "$r_1+d$", 'Interpreter','latex','Color', 'b', 'FontWeight', 'bold','FontSize', 13);

text(0.03, 0.92, "$A_2F'(K_2)$", 'Interpreter','latex','Color', 'b', 'FontWeight', 'bold','FontSize', 13);
text(0.4, 0.92, "$\widehat{A}_2F'(K_2)$", 'Interpreter','latex', 'Color','#D95319', 'FontWeight', 'bold','FontSize', 13);

text(0.6, 1.2, "$\widehat{A}_2 > A_2$", 'Interpreter','latex', 'Color','black', 'FontWeight', 'bold','FontSize', 13);

annotation('arrow',[.3 .36],[.55 .55])

annotation('arrow',[.45 .58],[0.07 0.07])


set(gca,'XTick',[])
set(gca,'YTick',[])
xlim([0 1])
ylim([0 1.8])

% save
print(gcf,'lec5_2.png','-dpng','-r500');
print(gcf,'lec5_2.eps','-depsc','-tiff','-r500');




%% lec5_3

% parameters
clc
clear -except linewidth
close all
linewidth=1.2;
FontName="Times";

% x axis
n=0:0.001:1;

% Marginal Product of capital
y=(1/3).*n.^(-2/3);
plot(n(90:end),y(90:end),'LineWidth',linewidth)

hold on

% Horizontal wage
plot([0,1],[0.65,0.65],'LineWidth',linewidth)
plot([0,1],[0.95,0.95],'LineWidth',linewidth)

hold on 

% Vertical line
plot([0.367 0.367],[0 0.65],'--','LineWidth',linewidth)
plot([0.206 0.206],[0 0.95],'--','LineWidth',linewidth)

xlabel("$K_2$",'Position',[0.8 0],'Interpreter','latex','FontSize', 13);

%ylabel("$f'(n)$",'Interpreter','latex','FontSize', 13);

% r+d and K*
text(0.33, -0.1, "$K_2^*$", 'Interpreter','latex','Color', 'b', 'FontWeight', 'bold','FontSize', 13);
text(0.17, -0.1, "$\widehat{K_2}^*$", 'Interpreter','latex','Color', 'b', 'FontWeight', 'bold','FontSize', 13);

text(-0.12, 0.65, "$r_1+d$", 'Interpreter','latex','Color', 'b', 'FontWeight', 'bold','FontSize', 13);
text(-0.12, 0.95, "$\widehat{r}_1+d$", 'Interpreter','latex','Color', 'b', 'FontWeight', 'bold','FontSize', 13);

text(0.18, 1.2, "$A_2F'(K_2)$", 'Interpreter','latex','Color', 'b', 'FontWeight', 'bold','FontSize', 13);

text(0.6, 1.2, "$\widehat{r}_1 > r_1$", 'Interpreter','latex', 'Color','black', 'FontWeight', 'bold','FontSize', 13);

annotation('arrow',[.38 .31],[0.06 0.06])

annotation('arrow',[.7 .7],[0.4 0.54])

set(gca,'XTick',[])
set(gca,'YTick',[])

% save
print(gcf,'lec5_3.png','-dpng','-r500');
print(gcf,'lec5_3.eps','-depsc','-tiff','-r500');


%% lec7_1

% parameters

clc
clear
close all
n=0:0.001:1;
linewidth=1.2;
FontName="Times";

% Marginal Rate of Substitution (Leisure vs. Consumption) 
MRS=((1/0.529)*n.^1/1.1).^(-1/2.1);

% MRS Slope
MRS_Slope=diff(MRS)/0.001;

% Tangent Line
Line=MRS(300)+1.4*MRS_Slope(300)*(n-n(300));
hold on 
plot(n,Line,'LineWidth',linewidth)


hold on 



% Vertical Line
plot([n(300) n(300)],[-1 MRS(300)+2.1],'LineWidth',linewidth,'Color','red')


plot([0 0.299],[1.3731 1.3731],'--','LineWidth',linewidth)

scatter([0.299], [1.3731],'filled','MarkerFaceColor','b')



xlabel("$Y_1$",'Position',[0.8 -1.1],'Interpreter','latex','FontSize', 13);
ylabel("$P_1$",'Position',[-.05 3.3],'Interpreter','latex','FontSize', 13);

% Text
text(n(300)+0.02, MRS(300)+1.9, "$Y_1^S=A_1K_1$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','red');


text(n(300)+0.1, MRS(300)-0.1, "$Y_1^D=C_1+I_1=\left[1+\left(\frac{1}{\beta A_2}\right)^\sigma A_2 \right]\frac{M_2}{(1+i_1)P_1}$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','blue');

text(-0.1, 1.3731, "$P_1^*$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','blue');


set(gca,'XTick',[])
set(gca,'YTick',[])

hYLabel = get(gca,'YLabel'); 
set(hYLabel,'rotation',0,'VerticalAlignment','middle')
%save
print(gcf,'lec7_1.png','-dpng','-r500');
print(gcf,'lec7_1.eps','-depsc','-tiff','-r500');


%% lec7_2

% parameters

clc
clear
close all
n=0:0.001:1;
linewidth=1.2;
FontName="Times";

% Marginal Rate of Substitution (Leisure vs. Consumption) 
MRS=((1/0.529)*n.^1/1.1).^(-1/2.1);

% MRS Slope
MRS_Slope=diff(MRS)/0.001;

% Tangent Line
Line=MRS(300)+1.4*MRS_Slope(300)*(n-n(300));
hold on 
plot(n,Line,'LineWidth',linewidth)
plot(n,Line+0.9,'--','LineWidth',linewidth)


hold on 



% Vertical Line
plot([n(300)+0.2 n(300)+0.2],[-1 MRS(300)+2.1],'LineWidth',linewidth,'Color','red')


plot([0 0.499],[1.6623 1.6623],'--','LineWidth',linewidth)



scatter([0.499], [1.6623],'filled','MarkerFaceColor','b')

plot([0.204 0.204],[-1 1.66018],'--','LineWidth',linewidth)


xlabel("$Y_1$",'Position',[0.8 -1.1],'Interpreter','latex','FontSize', 13);
ylabel("$P_1$",'Position',[-.05 3.3],'Interpreter','latex','FontSize', 13);

% Text
text(n(300)-0.05, MRS(300)+1.9, "$Y_1^S=A_1K_1$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','red');


text(n(300)+0.4, MRS(300)-0.1, "$Y_1^D=C_1+I_1$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','blue');

text(-0.1, 1.3731, "$P_1^*$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','blue');


text(0.202,-1.2, "$Y_1^*$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','blue');


set(gca,'XTick',[])
set(gca,'YTick',[])

hYLabel = get(gca,'YLabel'); 
set(hYLabel,'rotation',0,'VerticalAlignment','middle')

annotation('arrow',[.8 .7],[.343 .343])

annotation('arrow',[.26 .17],[.743 .743])


%save
print(gcf,'lec7_2.png','-dpng','-r500');
print(gcf,'lec7_2.eps','-depsc','-tiff','-r500');



%% lec7_3

% parameters

clc
clear
close all
n=0:0.001:1;
linewidth=1.2;
FontName="Times";

% Marginal Rate of Substitution (Leisure vs. Consumption) 
MRS=((1/0.529)*n.^1/1.1).^(-1/2.1);

% MRS Slope
MRS_Slope=diff(MRS)/0.001;

% Tangent Line
Line=MRS(300)+1.4*MRS_Slope(300)*(n-n(300));
hold on 
plot(n,Line,'--','LineWidth',linewidth)
plot(n,Line+0.9,'LineWidth',linewidth)


hold on 



% Vertical Line
plot([n(300)+0.2 n(300)+0.2],[-1 MRS(300)+2.1],'LineWidth',linewidth)


plot([0 .499],[1.6623 1.6623],':','LineWidth',linewidth)

plot([0 .499],[0.765 0.765],':','LineWidth',linewidth)

scatter([0.499], [1.66],'filled','MarkerFaceColor','b')

scatter([0.499], [0.765],'filled','MarkerFaceColor','r')


annotation('arrow',[0.1 0.1],[.45 .55])




xlabel("$Y_1$",'Position',[0.8 -1.1],'Interpreter','latex','FontSize', 13);
ylabel("$P_1$",'Position',[-.05 3.3],'Interpreter','latex','FontSize', 13);

% Text
text(n(300)-0.05, MRS(300)+1.9, "$Y_1^S=A_1K_1$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','red');


text(n(300)+0.4, MRS(300)-0.1, "$Y_1^D=C_1+I_1$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','blue');

%text(-0.1, 1.3731, "$P_1^*$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','blue');


%text(0.202,-1.2, "$Y_1^*$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','blue');
text(0.63,0.466, "Monetary Policy", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 10);


set(gca,'XTick',[])
set(gca,'YTick',[])

hYLabel = get(gca,'YLabel'); 
set(hYLabel,'rotation',0,'VerticalAlignment','middle')

annotation('arrow',[.7 .8],[.343 .343])

annotation('arrow',[.17 .26],[.743 .743])


%save
print(gcf,'lec7_3.png','-dpng','-r500');
print(gcf,'lec7_3.eps','-depsc','-tiff','-r500');


%% lec7_4

% parameters

clc
clear
close all
n=0:0.001:1;
linewidth=1.2;
FontName="Times";

% Marginal Rate of Substitution (Leisure vs. Consumption) 
MRS=((1/0.529)*n.^1/1.1).^(-1/2.1);

% MRS Slope
MRS_Slope=diff(MRS)/0.001;

% Tangent Line
Line=MRS(300)+1.4*MRS_Slope(300)*(n-n(300));
hold on 
plot(n,Line-.1,'LineWidth',linewidth)
plot(n,Line+0.9,'--','LineWidth',linewidth)


hold on 



% Vertical Line
plot([n(300)+0.2 n(300)+0.2],[-1 MRS(300)+2.1],'LineWidth',linewidth)


plot([0,0.499],[1.6623 1.6623],'--','LineWidth',linewidth)



scatter([0.499], [1.671],'filled','MarkerFaceColor','b')


xlabel("$Y_1$",'Position',[0.8 -1.1],'Interpreter','latex','FontSize', 13);
ylabel("$P_1$",'Position',[-.05 3.3],'Interpreter','latex','FontSize', 13);

% Text
text(n(300)-0.05, MRS(300)+1.9, "$Y_1^S=A_1K_1$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','red');
text(0.499,-1.2, "$Y_1^*$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(-0.08,1.666, "$P_1^*$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);

text(0.012,2.3, "Negative Aggregate", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 10);
text(0.07,2.1, "Demand Shock", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 10);


text(0.63,0.466, "Monetary Policy", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 10);

%text(n(300)+0.4, MRS(300)-0.1, "$Y_1^D=C_1+I_1$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','blue');

%text(-0.1, 1.3731, "$P_1^*$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','blue');


%text(0.202,-1.2, "$Y_1^*$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','blue');


set(gca,'XTick',[])
set(gca,'YTick',[])

hYLabel = get(gca,'YLabel'); 
set(hYLabel,'rotation',0,'VerticalAlignment','middle')

annotation('arrow',[.7 .8],[.343 .343])

annotation('arrow',[.26 .17],[.743 .743])


%save
print(gcf,'lec7_4.png','-dpng','-r500');
print(gcf,'lec7_4.eps','-depsc','-tiff','-r500');



%% lec7_5

% parameters

clc
clear
close all
n=0:0.001:1;
linewidth=1.2;
FontName="Times";

% Marginal Rate of Substitution (Leisure vs. Consumption) 
MRS=((1/0.529)*n.^1/1.1).^(-1/2.1);

% MRS Slope
MRS_Slope=diff(MRS)/0.001;

% Tangent Line
Line=MRS(300)+1.4*MRS_Slope(300)*(n-n(300));
hold on 
plot(n,Line-.1,'LineWidth',linewidth)
plot(n,Line+0.9,'--','LineWidth',linewidth)


hold on 



% Vertical Line
plot([n(300)+0.2 n(300)+0.2],[-1 MRS(300)+2.1],'LineWidth',linewidth)


plot([0,0.499],[1.6623 1.6623],'--','LineWidth',linewidth)



scatter([0.499], [1.671],'filled','MarkerFaceColor','b')


xlabel("$Y_1$",'Position',[0.8 -1.1],'Interpreter','latex','FontSize', 13);
ylabel("$P_1$",'Position',[-.05 3.3],'Interpreter','latex','FontSize', 13);

% Text
text(n(300)-0.05, MRS(300)+1.9, "$Y_1^S=A_1K_1$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','red');
text(0.499,-1.2, "$Y_1^*$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(-0.08,1.666, "$P_1^*$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);

text(0.012,2.3, "Negative Aggregate", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 10);
text(0.07,2.1, "Demand Shock", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 10);


text(0.63,0.66, "Monetary", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 10);
text(0.63,0.466, "or Fiscal Policy", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 10);

%text(n(300)+0.4, MRS(300)-0.1, "$Y_1^D=C_1+I_1$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','blue');

%text(-0.1, 1.3731, "$P_1^*$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','blue');


%text(0.202,-1.2, "$Y_1^*$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','blue');


set(gca,'XTick',[])
set(gca,'YTick',[])

hYLabel = get(gca,'YLabel'); 
set(hYLabel,'rotation',0,'VerticalAlignment','middle')

annotation('arrow',[.7 .8],[.343 .343])

annotation('arrow',[.26 .17],[.743 .743])


%save
print(gcf,'lec7_5.png','-dpng','-r500');
print(gcf,'lec7_5.eps','-depsc','-tiff','-r500');












%% lec7_6

% parameters

clc
clear
close all
n=0:0.001:1;
linewidth=1.2;
FontName="Times";

% Marginal Rate of Substitution (Leisure vs. Consumption) 
MRS=((1/0.529)*n.^1/1.1).^(-1/2.1);

% MRS Slope
MRS_Slope=diff(MRS)/0.001;

% Tangent Line
Line=MRS(300)+1.4*MRS_Slope(300)*(n-n(300));
hold on 
plot(n(1,50:450),(Line(1,50:450)+0.75),'LineWidth',linewidth,'Color','b')
hold on
plot([n(450) n(450)],[0 Line(450)+0.75],'LineWidth',linewidth,'Color','b')

plot([n(450) n(450)],[Line(450)+0.75 Line(450)+2],'--','LineWidth',linewidth,'Color','r')



% Vertical Line







xlabel("$Y_1$",'Position',[0.6 0.75],'Interpreter','latex','FontSize', 13);
ylabel("$i_1$",'Position',[-.06  2.6],'Interpreter','latex','FontSize', 13);




%text(n(300)+0.4, MRS(300)-0.1, "$Y_1^D=C_1+I_1$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','blue');

text(0.2, 2.5, "$IS$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','blue');
text(0.48, 2.5, "$Y_1^S=A_1K_1$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','red');


%text(0.202,-1.2, "$Y_1^*$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','blue');


set(gca,'XTick',[])
set(gca,'YTick',[])

hYLabel = get(gca,'YLabel'); 
set(hYLabel,'rotation',0,'VerticalAlignment','middle')

xlim([0,0.7])
ylim([0.8,3])



%save
print(gcf,'lec7_6.png','-dpng','-r500');
print(gcf,'lec7_6.eps','-depsc','-tiff','-r500');





%% lec7_7

% parameters

clc
clear
close all
n=0:0.001:1;
linewidth=1.2;
FontName="Times";

% Marginal Rate of Substitution (Leisure vs. Consumption) 
MRS=((1/0.529)*n.^1/1.1).^(-1/2.1);

% MRS Slope
MRS_Slope=diff(MRS)/0.001;

% Tangent Line
Line=MRS(300)+1.4*MRS_Slope(300)*(n-n(300));
hold on 
plot(n(1,50:450),(Line(1,50:450)+0.75),'LineWidth',linewidth,'Color','b')

hold on
plot([n(450) n(450)],[0 Line(450)+0.75],'LineWidth',linewidth,'Color','b')

plot([n(450) n(450)],[Line(450)+0.75 Line(450)+2],'--','LineWidth',linewidth,'Color','r')

%MP
plot([0 0.65],[Line(450)+0.75 Line(450)+0.75],'LineWidth',linewidth,'Color','[0.4660 0.5740 0.1880]')


scatter([n(450)], [Line(450)+0.75],'filled','MarkerFaceColor','blue')







xlabel("$Y_1$",'Position',[0.6 0.75],'Interpreter','latex','FontSize', 13);
ylabel("$i_1$",'Position',[-.06  2.6],'Interpreter','latex','FontSize', 13);




%text(n(300)+0.4, MRS(300)-0.1, "$Y_1^D=C_1+I_1$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','blue');

text(0.2, 2.5, "$IS$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','blue');
text(0.48, 2.5, "$Y_1^S=A_1K_1$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','red');
text(0.6,1.75, "$MP$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','[0.4660 0.5740 0.1880]');


%text(0.202,-1.2, "$Y_1^*$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','blue');


set(gca,'XTick',[])
set(gca,'YTick',[])

hYLabel = get(gca,'YLabel'); 
set(hYLabel,'rotation',0,'VerticalAlignment','middle')

xlim([0,0.7])
ylim([0.8,3])



%save
print(gcf,'lec7_7.png','-dpng','-r500');
print(gcf,'lec7_7.eps','-depsc','-tiff','-r500');





%% lec7_8

% parameters

clc
clear
close all
n=0:0.001:1;
linewidth=1.2;
FontName="Times";

% Marginal Rate of Substitution (Leisure vs. Consumption) 
MRS=((1/0.529)*n.^1/1.1).^(-1/2.1);

% MRS Slope
MRS_Slope=diff(MRS)/0.001;

% Tangent Line
Line=MRS(300)+1.4*MRS_Slope(300)*(n-n(300));
hold on 
plot(n(1,50:450),(Line(1,50:450)+0.75),'--','LineWidth',linewidth,'Color','b')

plot(n(1,50:450),(Line(1,50:450)+0.3),'LineWidth',linewidth,'Color','#D95319')


hold on
plot([n(450) n(450)],[0 Line(450)+0.75],'--','LineWidth',linewidth,'Color','b')

plot([n(450) n(450)],[0 Line(450)+0.3],'LineWidth',linewidth,'Color','#D95319')


plot([n(450) n(450)],[Line(450)+0.75 Line(450)+2],'--','LineWidth',linewidth,'Color','r')


%MP
plot([0 0.65],[Line(450)+0.75 Line(450)+0.75],'LineWidth',linewidth,'Color','[0.4660 0.5740 0.1880]')



plot([0.301 0.301],[0 1.66],':','LineWidth',linewidth)
scatter([n(450)], [Line(450)+0.75],'filled','MarkerFaceColor','blue')
scatter([0.301], [1.66],'filled','MarkerFaceColor','#D95319')







xlabel("$Y_1$",'Position',[0.3 0.75],'Interpreter','latex','FontSize', 13);
ylabel("$i_1$",'Position',[-.02  1.6],'Interpreter','latex','FontSize', 13);




%text(n(300)+0.4, MRS(300)-0.1, "$Y_1^D=C_1+I_1$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','blue');

text(0.2, 2.5, "$IS$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','blue');
text(0.03, 2.5, "$IS'$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','#D95319');

text(0.48, 2.5, "$Y_1^S=A_1K_1$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','red');
text(0.6,1.75, "$MP$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','[0.4660 0.5740 0.1880]');


%text(0.202,-1.2, "$Y_1^*$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','blue');


set(gca,'XTick',[])
set(gca,'YTick',[])

hYLabel = get(gca,'YLabel'); 
set(hYLabel,'rotation',0,'VerticalAlignment','middle')

xlim([0,0.7])
ylim([0.8,3])


annotation('arrow',[.4 .3],[.643 .643])



%save
print(gcf,'lec7_8.png','-dpng','-r500');
print(gcf,'lec7_8.eps','-depsc','-tiff','-r500');



%% lec7_9

% parameters

clc
clear
close all
n=0:0.001:1;
linewidth=1.2;
FontName="Times";

% Marginal Rate of Substitution (Leisure vs. Consumption) 
MRS=((1/0.529)*n.^1/1.1).^(-1/2.1);

% MRS Slope
MRS_Slope=diff(MRS)/0.001;

% Tangent Line
Line=MRS(300)+1.4*MRS_Slope(300)*(n-n(300));
hold on 
plot(n(1,50:450),(Line(1,50:450)+0.75),'--','LineWidth',linewidth,'Color','b')

plot(n(1,50:450),(Line(1,50:450)+0.3),'LineWidth',linewidth,'Color','#D95319')


hold on
plot([n(450) n(450)],[0 Line(450)+0.75],'--','LineWidth',linewidth,'Color','b')

plot([n(450) n(450)],[0 Line(450)+0.3],'LineWidth',linewidth,'Color','#D95319')


plot([n(450) n(450)],[Line(450)+0.75 Line(450)+2],'--','LineWidth',linewidth,'Color','r')


%MP
plot([0 0.65],[Line(450)+0.75 Line(450)+0.75],'LineWidth',linewidth,'Color','[0.4660 0.5740 0.1880]')



plot([0 0.65],[1.215 1.215],'LineWidth',linewidth,'Color','#7E2F8E')


% plot([0.301 0.301],[0 1.66],':','LineWidth',linewidth)
scatter([n(450)], [Line(450)+0.75],'filled','MarkerFaceColor','blue')
scatter([0.301], [1.66],'filled','MarkerFaceColor','#D95319')
scatter([0.449], [1.215],'filled','MarkerFaceColor','#7E2F8E')







% xlabel("$Y_1$",'Position',[0.6 0.75],'Interpreter','latex','FontSize', 13);
ylabel("$i_1$",'Position',[-.02  1.6],'Interpreter','latex','FontSize', 13);
text(-.03, 1.2, "$i_1'$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);




%text(n(300)+0.4, MRS(300)-0.1, "$Y_1^D=C_1+I_1$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','blue');

text(0.2, 2.5, "$IS$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','blue');
text(0.03, 2.5, "$IS'$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','#D95319');

text(0.48, 2.5, "$Y_1^S=A_1K_1$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','red');
text(0.6,1.75, "$MP$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','[0.4660 0.5740 0.1880]');


text(0.6,1.3, "$MP'$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','#7E2F8E');


%text(0.202,-1.2, "$Y_1^*$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','blue');


set(gca,'XTick',[])
set(gca,'YTick',[])

hYLabel = get(gca,'YLabel'); 
set(hYLabel,'rotation',0,'VerticalAlignment','middle')

xlim([0,0.7])
ylim([0.8,3])


annotation('arrow',[.4 .3],[.643 .643])

annotation('arrow',[.75 .75],[.421 .3])


%save
print(gcf,'lec7_9.png','-dpng','-r500');
print(gcf,'lec7_9.eps','-depsc','-tiff','-r500');



















%% lec7_10

% parameters

clc
clear
close all
n=0:0.001:1;
linewidth=1.2;
FontName="Times";

% Marginal Rate of Substitution (Leisure vs. Consumption) 
MRS=((1/0.529)*n.^1/1.1).^(-1/2.1);

% MRS Slope
MRS_Slope=diff(MRS)/0.001;

% Tangent Line
Line=MRS(300)+1.4*MRS_Slope(300)*(n-n(300));
hold on 
plot(n(1,50:450),(Line(1,50:450)+0.75),'LineWidth',linewidth,'Color','b')

hold on
plot([n(450) n(450)],[0 Line(450)+0.75],'LineWidth',linewidth,'Color','b')

plot([n(450) n(450)],[Line(450)+0.75 Line(450)+2],'--','LineWidth',linewidth,'Color','r')

%MP
plot([0 0.65],[Line(450)+0.75 Line(450)+0.75],'LineWidth',linewidth,'Color','[0.4660 0.5740 0.1880]')


plot([0 0.65],[Line(450)+0.5 Line(450)+0.5],'LineWidth',linewidth,'Color','#A2142F')



scatter([n(450)], [Line(450)+0.75],'filled','MarkerFaceColor','blue')







xlabel("$Y_1$",'Position',[0.6 0.75],'Interpreter','latex','FontSize', 13);
ylabel("$i_1$",'Position',[-.06  2.6],'Interpreter','latex','FontSize', 13);




%text(n(300)+0.4, MRS(300)-0.1, "$Y_1^D=C_1+I_1$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','blue');

text(0.2, 2.5, "$IS$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','blue');
text(0.48, 2.5, "$Y_1^S=A_1K_1$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','red');
text(0.6,1.75, "$MP$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','[0.4660 0.5740 0.1880]');

text(0.6,1.3, "$ZLB$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','#A2142F');

text(-0.09, 1.4, "$i_1=0$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','#A2142F');


%text(0.202,-1.2, "$Y_1^*$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','blue');


set(gca,'XTick',[])
set(gca,'YTick',[])

hYLabel = get(gca,'YLabel'); 
set(hYLabel,'rotation',0,'VerticalAlignment','middle')

xlim([0,0.7])
ylim([0.8,3])



%save
print(gcf,'lec7_10.png','-dpng','-r500');
print(gcf,'lec7_10.eps','-depsc','-tiff','-r500');


























%% lec7_11

% parameters

clc
clear
close all
n=0:0.001:1;
linewidth=1.2;
FontName="Times";

% Marginal Rate of Substitution (Leisure vs. Consumption) 
MRS=((1/0.529)*n.^1/1.1).^(-1/2.1);

% MRS Slope
MRS_Slope=diff(MRS)/0.001;

% Tangent Line
Line=MRS(300)+1.4*MRS_Slope(300)*(n-n(300));
hold on 
plot(n(1,50:450),(Line(1,50:450)+0.75),'--','LineWidth',linewidth,'Color','b')

plot(n(1,50:450),(Line(1,50:450)+0.3),'LineWidth',linewidth,'Color','#D95319')


hold on
plot([n(450) n(450)],[0 Line(450)+0.75],'--','LineWidth',linewidth,'Color','b')

plot([n(450) n(450)],[0 Line(450)+0.3],'LineWidth',linewidth,'Color','#D95319')


plot([n(450) n(450)],[Line(450)+0.75 Line(450)+2],'--','LineWidth',linewidth,'Color','r')


%MP
plot([0 0.65],[Line(450)+0.75 Line(450)+0.75],'LineWidth',linewidth,'Color','[0.4660 0.5740 0.1880]')

plot([0 0.65],[Line(450)+0.5 Line(450)+0.5],'LineWidth',linewidth,'Color','#A2142F')



plot([0.301 0.301],[0 1.66],':','LineWidth',linewidth)
plot([0.383 0.383],[0 1.416],':','LineWidth',linewidth)

scatter([n(450)], [Line(450)+0.75],'filled','MarkerFaceColor','blue')
scatter([0.301], [1.66],'filled','MarkerFaceColor','#D95319')
scatter([0.383], [1.416],'filled','MarkerFaceColor','#A2142F')

text(0.5,1.3, "binding ZLB", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','#A2142F');







xlabel("$Y_1$",'Position',[0.6 0.75],'Interpreter','latex','FontSize', 13);
ylabel("$i_1$",'Position',[-.02  2.6],'Interpreter','latex','FontSize', 13);

text(-0.09, 1.4, "$i_1=0$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','#A2142F');



%text(n(300)+0.4, MRS(300)-0.1, "$Y_1^D=C_1+I_1$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','blue');

text(0.2, 2.5, "$IS$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','blue');
text(0.03, 2.5, "$IS'$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','#D95319');

text(0.48, 2.5, "$Y_1^S=A_1K_1$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','red');
text(0.6,1.75, "$MP$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','[0.4660 0.5740 0.1880]');


%text(0.202,-1.2, "$Y_1^*$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','blue');


set(gca,'XTick',[])
set(gca,'YTick',[])

hYLabel = get(gca,'YLabel'); 
set(hYLabel,'rotation',0,'VerticalAlignment','middle')

xlim([0,0.7])
ylim([0.8,3])


annotation('arrow',[.4 .3],[.643 .643])



%save
print(gcf,'lec7_11.png','-dpng','-r500');
print(gcf,'lec7_11.eps','-depsc','-tiff','-r500');


















%% lec7_12

% parameters

clc
clear
close all
n=0:0.001:1;
linewidth=1.2;
FontName="Times";

% Marginal Rate of Substitution (Leisure vs. Consumption) 
MRS=((1/0.529)*n.^1/1.1).^(-1/2.1);

% MRS Slope
MRS_Slope=diff(MRS)/0.001;

% Tangent Line
Line=MRS(300)+1.4*MRS_Slope(300)*(n-n(300));
hold on 
plot(n,Line-.1,'LineWidth',linewidth)
plot(n,Line+0.9,'--','LineWidth',linewidth)


hold on 



% Vertical Line
plot([n(300)+0.2 n(300)+0.2],[-1 MRS(300)+2.1],'LineWidth',linewidth)


plot([0,0.499],[1.6623 1.6623],'--','LineWidth',linewidth)



scatter([0.499], [1.671],'filled','MarkerFaceColor','b')


xlabel("$Y_1$",'Position',[0.8 -1.1],'Interpreter','latex','FontSize', 13);
ylabel("$P_1$",'Position',[-.05 3.3],'Interpreter','latex','FontSize', 13);

% Text
text(n(300)-0.05, MRS(300)+1.9, "$Y_1^S=A_1K_1$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','red');
text(0.499,-1.2, "$Y_1^*$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(-0.08,1.666, "$P_1^*$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);

text(0.012,2.3, "Negative Aggregate", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 10);
text(0.07,2.1, "Demand Shock", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 10);


text(0.68,0.466, "Fiscal Policy", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 10);

%text(n(300)+0.4, MRS(300)-0.1, "$Y_1^D=C_1+I_1$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','blue');

%text(-0.1, 1.3731, "$P_1^*$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','blue');


%text(0.202,-1.2, "$Y_1^*$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','blue');


set(gca,'XTick',[])
set(gca,'YTick',[])

hYLabel = get(gca,'YLabel'); 
set(hYLabel,'rotation',0,'VerticalAlignment','middle')

annotation('arrow',[.7 .8],[.343 .343])

annotation('arrow',[.26 .17],[.743 .743])


%save
print(gcf,'lec7_12.png','-dpng','-r500');
print(gcf,'lec7_12.eps','-depsc','-tiff','-r500');

%% lec 5_4



% parameters
clc
clear -except linewidth
close all
linewidth=1.2;
FontName="Times";

% x axis
n=0:0.001:1;

% Marginal Product of capital
y=(1/3).*(n.^(-2/3));
plot(n(90:end),y(90:end),'LineWidth',linewidth)

hold on
plot(n(70:end),(n(70:end)+0.3).^2,'LineWidth',linewidth)

% Horizontal wage
plot([0,0.452],[0.565 .565],'--','LineWidth',linewidth)

hold on 

% Vertical line
plot([0.452 0.452],[0 0.565],'--','LineWidth',linewidth)

xlabel("$K_2$",'Position',[0.8 0],'Interpreter','latex','FontSize', 13);

ylabel("$r_1$",'Position',[-.05 1.4],'Interpreter','latex','FontSize', 13);

% r+d and K*
text(0.43, -0.1, "$K_2^*$", 'Interpreter','latex','Color', 'b', 'FontWeight', 'bold','FontSize', 13);
text(-0.06, 0.55, "$r_1^*$", 'Interpreter','latex','Color', 'b', 'FontWeight', 'bold','FontSize', 13);

text(0.15, 1.3, "$A_2F'(K_2)-d$", 'Interpreter','latex','Color', 'b', 'FontWeight', 'bold','FontSize', 13);
text(0.7, 1.3, "$K_2^S(r_1)$", 'Interpreter','latex','Color', '#D95319', 'FontWeight', 'bold','FontSize', 13);


set(gca,'XTick',[])
set(gca,'YTick',[])
hYLabel = get(gca,'YLabel'); 
set(hYLabel,'rotation',0,'VerticalAlignment','middle')
scatter([0.452], [0.565],'filled','MarkerFaceColor','red')


% save
print(gcf,'lec5_4.png','-dpng','-r500');
print(gcf,'lec5_4.eps','-depsc','-tiff','-r500');



%% lec5_5


% parameters
clc
clear -except linewidth
close all
linewidth=1.2;
FontName="Times";

% x axis
n=0:0.001:1;
% Horizontal wage
plot([0,1],[0.565 0.565],'LineWidth',linewidth)

% Marginal Product of capital
y=(1/3).*(n.^(-2/3));

hold on
plot(n(70:end),(n(70:end)+0.3).^2,'LineWidth',linewidth)


hold on 

% Vertical line
plot([0.452 0.452],[0 0.565],'--','LineWidth',linewidth)

xlabel("$K_2$",'Position',[0.8 0],'Interpreter','latex','FontSize', 13);

ylabel("$r_1$",'Position',[-.05 1.4],'Interpreter','latex','FontSize', 13);

% r+d and K*
text(0.43, -0.1, "$K_2^*$", 'Interpreter','latex','Color', 'b', 'FontWeight', 'bold','FontSize', 13);
% text(-0.06, 0.55, "$r_1^*$", 'Interpreter','latex','Color', 'b', 'FontWeight', 'bold','FontSize', 13);

text(0.7, 0.64, "$A_2-d$", 'Interpreter','latex','Color', 'b', 'FontWeight', 'bold','FontSize', 13);
text(0.7, 1.3, "$K_2^S(r_1)$", 'Interpreter','latex','Color', '#D95319', 'FontWeight', 'bold','FontSize', 13);


set(gca,'XTick',[])
set(gca,'YTick',[])
hYLabel = get(gca,'YLabel'); 
set(hYLabel,'rotation',0,'VerticalAlignment','middle')
scatter([0.452], [0.565],'filled','MarkerFaceColor','red')


% save
print(gcf,'lec5_5.png','-dpng','-r500');
print(gcf,'lec5_5.eps','-depsc','-tiff','-r500');


%% Lecture9_1

% parameters
clc
clear -except linewidth
close all
linewidth=1.2;
FontName="Times";

% x axis
t=0:0.001:40;
y_bar=2;
beta=.95;
c=3;
p=y_bar/(1-beta)+c*beta.^(-t);

plot(t,p,'LineWidth',linewidth)

hold on 
plot([0 40],[y_bar/(1-beta) y_bar/(1-beta)],'LineWidth',linewidth)



xlabel("$t$",'Position',[35 35],'Interpreter','latex','FontSize', 15);

ylabel("$p_t$",'Position',[-1 60],'Interpreter','latex','FontSize', 15);

text(-3.2, 39.8, "$\frac{\bar{y}}{1-\beta}$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 16);


text(23, 38.8, "fundamental value", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 15);


text(29, 45.8, "bubble=$c\beta^{-t}$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 15);


text(0, 34, "$0$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);


text(19, 60, "$p_t=\bar{y}+\beta p_{t+1}$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 15);
text(19, 57, "$\Rightarrow p_t=\frac{\bar{y}}{1-\beta}+c \beta^{-t}$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 15);

annotation('doublearrow',[.68 .68],[.26 .58])

% save

set(gca,'XTick',[])
set(gca,'YTick',[])
hYLabel = get(gca,'YLabel'); 
set(hYLabel,'rotation',0,'VerticalAlignment','middle')
% scatter([0.452], [0.565],'filled','MarkerFaceColor','red')
%save
print(gcf,'lec9_1.png','-dpng','-r500');
print(gcf,'lec9_1.eps','-depsc','-tiff','-r500');




%% Lecture9_2

% parameters
clc
clear -except linewidth
close all
linewidth=1.2;
FontName="Times";

% x axis
t=0:0.001:40;
y_bar=2;
beta=.95;
c=3;
p=c*beta.^(-t);

plot(t,p,'LineWidth',linewidth)



xlabel("$t$",'Position',[35 -.6],'Interpreter','latex','FontSize', 15);

ylabel("$p_t$",'Position',[-1 20],'Interpreter','latex','FontSize', 15);

text(-2, 2.8, "$c$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 15);





text(-.3, -1, "$0$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);

text(22, 20, "$p_t=\beta p_{t+1}$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 15);
text(22, 17, "$\Rightarrow p_t=c \beta^{-t}$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 15);


% save

set(gca,'XTick',[])
set(gca,'YTick',[])
hYLabel = get(gca,'YLabel'); 
set(hYLabel,'rotation',0,'VerticalAlignment','middle')
% scatter([0.452], [0.565],'filled','MarkerFaceColor','red')
%save
print(gcf,'lec9_2.png','-dpng','-r500');
print(gcf,'lec9_2.eps','-depsc','-tiff','-r500');


%% lec10_1
clc
clear -except linewidth
close all
linewidth=1.2;
FontName="Times";


n_lhs=0:0.001:0.5;
n=0.2:0.001:0.5;

A=2;
phi=0.9;
gamma=0.8;
kappa=0.6;
mu_bar=1;
eta=0.5;
n_0=0.2;



LHS=A*(1-phi)*(1-gamma*n_lhs)
RHS=(kappa/mu_bar)*((n-n_0)./(mu_bar.*(1.-n))).^((1-eta)/eta);

plot(n_lhs,LHS,'LineWidth',1.2)
hold on
plot(n,RHS,'LineWidth',1.2)

scatter([0.355], [0.144],'filled','MarkerFaceColor','red')
plot([0.355 0.355],[0 0.144],':','LineWidth',1.2)

xlim([0.15,.52])
text(0.145,-0.02, "$0$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(0.52,-0.02, "$1$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(0.19,-0.02, "$n_0$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(0.35,-0.02, "$n$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(0.09,0.18, "$A(1-\phi)$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(0.22,0.18, "$A-W(n)$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(0.38,0.28, "$\frac{\kappa}{\mu  \left(\Theta(n)\right)}$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 19);

set(gca,'XTick',[])
set(gca,'YTick',[])
hYLabel = get(gca,'YLabel'); 
set(hYLabel,'rotation',0,'VerticalAlignment','middle')
% scatter([0.452], [0.565],'filled','MarkerFaceColor','red')
%save
print(gcf,'lec10_1.png','-dpng','-r500');
print(gcf,'lec10_1.eps','-depsc','-tiff','-r500');





%% lec10_2
clc
clear -except linewidth
close all
linewidth=1.2;
FontName="Times";


n_lhs=0:0.001:0.5;
n=0.2:0.001:0.5;

A=2;
A2=3.5;

phi=0.9;
gamma=0.8;
kappa=0.6;
mu_bar=1;
eta=0.5;
n_0=0.2;
LHS=A*(1-phi)*(1-gamma*n_lhs);
LHS2=A2*(1-phi)*(1-gamma*n_lhs);

RHS=(kappa/mu_bar)*((n-n_0)./(mu_bar.*(1.-n))).^((1-eta)/eta);

plot(n_lhs,LHS,'LineWidth',1.2)
hold on
plot(n,RHS,'LineWidth',1.2)

scatter([0.354], [0.143],'filled','MarkerFaceColor','red')
xlim([0.15,.52])

plot(n_lhs,LHS2,'LineWidth',1.2)
scatter([0.423], [0.23156],'filled','MarkerFaceColor','blue')

plot([0.423 0.423],[0 0.23156],':','LineWidth',1.2)
plot([0.354 0.354],[0 0.143],':','LineWidth',1.2)
text(0.145,-0.02, "$0$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(0.52,-0.02, "$1$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(0.19,-0.02, "$n_0$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(0.35,-0.02, "$n$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(0.427,-0.02, "$n'$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(0.09,0.18, "$A(1-\phi)$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(0.22,0.18, "$A-W(n)$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(0.22,0.31, "$A'-W(n)$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
annotation('arrow',[.59 .69],[0.08 0.08])
annotation('arrow',[.2 .2],[0.5 0.7])


set(gca,'XTick',[])
set(gca,'YTick',[])
hYLabel = get(gca,'YLabel'); 
set(hYLabel,'rotation',0,'VerticalAlignment','middle')
% scatter([0.452], [0.565],'filled','MarkerFaceColor','red')
%save
print(gcf,'lec10_2.png','-dpng','-r500');
print(gcf,'lec10_2.eps','-depsc','-tiff','-r500');



%% lec10_3
clc
clear -except linewidth
close all
linewidth=1.2;
FontName="Times";


n_lhs=0:0.001:0.5;
n=0.2:0.001:0.5;

A=2;

phi=0.9;
gamma=0.8;
kappa=0.6;
mu_bar=1;
mu_bar2=1.3;

eta=0.5;
n_0=0.2;
LHS=A*(1-phi)*(1-gamma*n_lhs);

RHS=(kappa/mu_bar)*((n-n_0)./(mu_bar.*(1.-n))).^((1-eta)/eta);
RHS2=(kappa/mu_bar2)*((n-n_0)./(mu_bar2.*(1.-n))).^((1-eta)/eta);

plot(n_lhs,LHS,'LineWidth',1.2)
hold on
plot(n,RHS,'LineWidth',1.2)

scatter([0.354], [0.143],'filled','MarkerFaceColor','red')

plot(n,RHS2,'LineWidth',1.2)
xlim([0.15,.52])
scatter([0.418], [0.132],'filled','MarkerFaceColor','blue')
plot([0.418 0.418],[0 0.132],':','LineWidth',1.2)
plot([0.354 0.354],[0 0.143],':','LineWidth',1.2)


text(0.145,-0.02, "$0$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(0.52,-0.02, "$1$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(0.19,-0.02, "$n_0$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(0.35,-0.02, "$n$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(0.423,-0.02, "$n'$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(0.09,0.18, "$A(1-\phi)$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(0.22,0.18, "$A-W(n)$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(0.38,0.28, "$\frac{\kappa}{\mu  \left(\Theta(n)\right)}$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 19);
text(0.28,0.3, "$\bar{\mu}'>\bar{\mu}$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
annotation('arrow',[.59 .69],[0.08 0.08])
annotation('arrow',[.8 .8],[0.7 0.5])



set(gca,'XTick',[])
set(gca,'YTick',[])
hYLabel = get(gca,'YLabel'); 
set(hYLabel,'rotation',0,'VerticalAlignment','middle')
% scatter([0.452], [0.565],'filled','MarkerFaceColor','red')
%save
print(gcf,'lec10_3.png','-dpng','-r500');
print(gcf,'lec10_3.eps','-depsc','-tiff','-r500');

%% lec10_3v2
clc
clear -except linewidth
close all
linewidth=1.2;
FontName="Times";


n_lhs=0:0.001:0.5;
n=0.2:0.001:0.5;

A=2;

phi=0.9;
gamma=0.8;
kappa=0.6;
mu_bar=1;
kappa2=1.4;

eta=0.5;
n_0=0.2;
LHS=A*(1-phi)*(1-gamma*n_lhs);

RHS=(kappa/mu_bar)*((n-n_0)./(mu_bar.*(1.-n))).^((1-eta)/eta);
RHS2=(kappa2/mu_bar2)*((n-n_0)./(mu_bar.*(1.-n))).^((1-eta)/eta);

plot(n_lhs,LHS,'LineWidth',1.2)
hold on
plot(n,RHS,'LineWidth',1.2)

scatter([0.354], [0.143],'filled','MarkerFaceColor','red')

plot(n,RHS2,'LineWidth',1.2)
xlim([0.15,.52])
ylim([0 0.4])
scatter([0.3], [0.153],'filled','MarkerFaceColor','blue')
plot([0.3 0.3],[0 0.153],':','LineWidth',1.2)
plot([0.354 0.354],[0 0.143],':','LineWidth',1.2)


text(0.145,-0.02, "$0$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(0.52,-0.02, "$1$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(0.19,-0.02, "$n_0$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(0.35,-0.02, "$n$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(0.29,-0.02, "$n'$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(0.09,0.18, "$A(1-\phi)$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(0.2,0.19, "$A-W(n)$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(0.42,0.35, "$\frac{\kappa}{\mu  \left(\Theta(n)\right)}$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 19);
text(0.28,0.3, "$\kappa'>\kappa$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
annotation('arrow',[.54 .45],[0.08 0.08])
annotation('arrow',[.63 .63],[0.53 0.7])


set(gca,'XTick',[])
set(gca,'YTick',[])
hYLabel = get(gca,'YLabel'); 
set(hYLabel,'rotation',0,'VerticalAlignment','middle')
% scatter([0.452], [0.565],'filled','MarkerFaceColor','red')
%save
print(gcf,'lec10_3v2.png','-dpng','-r500');
print(gcf,'lec10_3v2.eps','-depsc','-tiff','-r500');




%% lec10_4


%Parameters

clc
clear
close all
n=0:0.001:1;
n_circle=0.7415:0.0001:0.753;
linewidth=1.2;
A=0.7;
% production function
y=A*n;

%
% y_prime=(1/3)*n.^(-2/3);
% 
% LOC=y_prime==MRS_Slope;

hold on

% plot(n,y,'LineWidth',linewidth)

hold on
% Marginal Rate of Substitution (Labor vs. Consumption)  
MRS=((0.529)*(1-n).^1/2).^(-1/0.4);

% MRS slope
MRS_Slope=diff(MRS/500)/0.001;


% production function


%  
set(gca,'XTick',[])
set(gca,'YTick',[])

%Text
text(0.05, 0.45+0.85, "$\frac{v'(n)}{u'(c)}=w$ and $w=f^{'}(n)$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 17);
text(n(350), -0.75+0.6+0.55, "$n^*$", 'Interpreter','latex','Color', 'b', 'FontWeight', 'bold','FontSize', 13);
text(-0.1 ,MRS(350)/500+0.55 , "$c^*$", 'Interpreter','latex','Color', 'b', 'FontWeight', 'bold','FontSize', 13);
text(0.67 ,0.89 , "$y=An$", 'Interpreter','latex','Color', 'b', 'FontWeight', 'bold','FontSize', 13);


%line

line=0.71256+0.7*(n-0.349);
plot(n,line,'LineWidth',linewidth)
plot(n(30:end-300),MRS(30:end-300)/500+0.55,'LineWidth',linewidth)

plot([0.859 0.979],[1.0696 1.0696],'LineWidth',linewidth)
hold on
n_circle=0.9:0.001:0.909;
Circle=1.0696+sqrt(0.05^2-(n_circle-0.859).^2);
plot(n_circle,Circle,'LineWidth',linewidth)
ylim([0.467,1.7])
text(0.94, 1.1 , "$w$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);



% Vertical Line
hold on 
plot([n(350) n(350)],[0 MRS(350)/500+0.55],'--','LineWidth',linewidth)


% Horizontal Line
hold on 
plot([0 n(350)],[MRS(350)/500+0.55 MRS(350)/500+0.55],'--','LineWidth',linewidth)


% Axis label
xlabel("$n$",'Position',[0.7 0.467],'Interpreter','latex','FontSize', 13);
ylabel("$c$",'Interpreter','latex','FontSize', 13);

%Save
print(gcf,'lec10_4.png','-dpng','-r500');
print(gcf,'lec10_4.eps','-depsc','-tiff','-r500');
%%

%% lec10_5
clc
clear -except linewidth
close all
linewidth=1.2;
FontName="Times";


n_lhs=0:0.001:0.5;
n=0.2:0.001:0.5;
c=0.01:0.001:5;
c2=0.01:0.001:5;

A=0.7;

phi=0.7;
phi2=0.8;
gamma=0.99;
kappa=0.6;
mu_bar=1;
mu_bar2=1.3;

eta=0.5;
n_0=0.2;

n_star=0.349;
n_star2=0.441;

wage=phi*A+(1-phi)*gamma*n_star;
wage2=phi2*A+(1-phi2)*gamma*n_star;



U_max1=log(A*n_star)-gamma*n_star;
U_max2=log(A/gamma)-1;

% 
% U_max2=0.4;
% 
% U_max3=-0.8;
% 
 n_iso1=(log(c)-U_max1)/gamma;
n_iso2=(log(c2)-U_max2)/gamma;
% n_iso3=(log(c)-U_max3)/gamma;
% 
% %MRS
hold on
plot(n_iso2,c2,'LineWidth',1.2,'Color',"#D95319")


xlim([0.05 1.7])
theta=((n_iso1-n_0)./(mu_bar.*(1.-n_iso1))).^(1/eta);

labor_cost=wage*n_iso1+(n_iso1-n_0)*kappa./(mu_bar.*theta.^(eta-1));

labor_marginal_cost=diff(labor_cost)./diff(n_iso1);

plot(n_iso2,A*n_iso2,'LineWidth',1.4,'Color',"#77AC30")

scatter([1/gamma], [A/gamma],'filled','MarkerFaceColor','red')

 %plot(n_iso1(2:end),labor_marginal_cost,'LineWidth',1.2)

% plot(n_iso1,labor_cost,'LineWidth',1.2)
text(0.15, 1, "$\frac{V'(n)}{U'(c)}=w$ and $w=f^{'}(n)$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 17);




text(1.2,0.8, "$y=An$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color',"#77AC30");
% text(0.34,1.2, "Labor Cost", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
% 
text(1.3,-0.05, "$n$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(0,1.2, "$c$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);

plot([1/gamma 1/gamma],[0 A*1/gamma],':','LineWidth',1.2)
plot([0 1/gamma],[A*1/gamma A*1/gamma],':','LineWidth',1.2)


text(1/gamma-0.03,-0.05, "$n^*$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color',"#D95319");
text(-0.05,A/gamma-0.03, "$c^*$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color',"#D95319");
text(1.55,1.065, "$w$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 9);


% Arc
n_circle=1.528:0.001:1.539;
Circle=1.04+sqrt(0.05^2-(n_circle-1.4889).^2);
hold on
plot(n_circle,Circle,'LineWidth',linewidth-0.2)
plot([1.487 1.59],[1.04 1.04],'LineWidth',1.2)
% 
set(gca,'XTick',[])
set(gca,'YTick',[])
% hold on
% plot(n_iso2,c,'LineWidth',1.2)
% plot(n_iso3,c,'LineWidth',1.2)
% 
% plot(n_iso,A*n_iso,'LineWidth',1.2)


%Save
print(gcf,'lec10_4.png','-dpng','-r500');
print(gcf,'lec10_4.eps','-depsc','-tiff','-r500');



%% lec10_5
clc
clear -except linewidth
close all
linewidth=1.2;
FontName="Times";


n_lhs=0:0.001:0.5;
n=0.2:0.001:0.5;
c=0.01:0.001:5;
c2=0.01:0.001:5;

A=0.7;

phi=0.7;
phi2=0.8;
gamma=0.99;
kappa=0.6;
mu_bar=1;
mu_bar2=1.3;

eta=0.5;
n_0=0.2;

n_star=0.349;
n_star2=0.441;

wage=phi*A+(1-phi)*gamma*n_star;
wage2=phi2*A+(1-phi2)*gamma*n_star;



U_max1=log(A*n_star)-gamma*n_star;
U_max2=log(A/gamma)-1;

% 
% U_max2=0.4;
% 
% U_max3=-0.8;
% 
 n_iso1=(log(c)-U_max1)/gamma;
n_iso2=(log(c2)-U_max2)/gamma;
% n_iso3=(log(c)-U_max3)/gamma;
% 
% %MRS
plot(n_iso1,c,'LineWidth',1.2)
hold on
plot(n_iso2,c2,'LineWidth',1.2)


xlim([0.05 1.7])
theta=((n_iso1-n_0)./(mu_bar.*(1.-n_iso1))).^(1/eta);

labor_cost=wage*n_iso1+(n_iso1-n_0)*kappa./(mu_bar.*theta.^(eta-1));

labor_marginal_cost=diff(labor_cost)./diff(n_iso1);

plot(n_iso2,A*n_iso2,'LineWidth',1.4,'Color',"#77AC30")

scatter([n_star], [A*n_star],'filled','MarkerFaceColor','blue')
scatter([1/gamma], [A/gamma],'filled','MarkerFaceColor','red')

 %plot(n_iso1(2:end),labor_marginal_cost,'LineWidth',1.2)

% plot(n_iso1,labor_cost,'LineWidth',1.2)



text(0.49,0.72, "standard model", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color',"#D95319");
text(0.5,0.25, "search model", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color',"blue");

text(1.2,0.8, "$y=An$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color',"#77AC30");
% text(0.34,1.2, "Labor Cost", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
% 
text(1.3,-0.05, "$n$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(0,1.2, "$c$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);

plot([n_star n_star],[0 A*n_star],':','LineWidth',1.2)
plot([1/gamma 1/gamma],[0 A*1/gamma],':','LineWidth',1.2)


text(n_star-0.03,-0.05, "$n^*_{\kappa=0.6}$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','Blue');
text(1/gamma-0.03,-0.05, "$n^*_{\kappa=0}$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','Red');
% 
set(gca,'XTick',[])
set(gca,'YTick',[])
hold on
% plot(n_iso2,c,'LineWidth',1.2)
% plot(n_iso3,c,'LineWidth',1.2)
% 
% plot(n_iso,A*n_iso,'LineWidth',1.2)


%Save
print(gcf,'lec10_5.png','-dpng','-r500');
print(gcf,'lec10_5.eps','-depsc','-tiff','-r500');
%%


%% lec10_6
clc
clear -except linewidth
close all
linewidth=1.2;
FontName="Times";


n_lhs=0:0.001:0.5;
n=0.2:0.001:0.5;
c=0.01:0.001:5;
c2=0.01:0.001:5;

A=0.7;

phi=0.5;
phi2=0.8;
gamma=0.99;
kappa=0.6;
mu_bar=1;
mu_bar2=1.3;

eta=0.5;
n_0=0.2;

n_star=0.407;
n_star2=0.441;

wage=phi*A+(1-phi)*gamma*n_star;
wage2=phi2*A+(1-phi2)*gamma*n_star;



U_max1=log(A*n_star)-gamma*n_star;
U_max2=log(A/gamma)-1;

% 
% U_max2=0.4;
% 
% U_max3=-0.8;
% 
 n_iso1=(log(c)-U_max1)/gamma;
n_iso2=(log(c2)-U_max2)/gamma;
% n_iso3=(log(c)-U_max3)/gamma;
% 
% %MRS
plot(n_iso1,c,'LineWidth',1.2)
hold on
plot(n_iso2,c2,'LineWidth',1.2)


xlim([0.05 1.7])
theta=((n_iso1-n_0)./(mu_bar.*(1.-n_iso1))).^(1/eta);

labor_cost=wage*n_iso1+(n_iso1-n_0)*kappa./(mu_bar.*theta.^(eta-1));

labor_marginal_cost=diff(labor_cost)./diff(n_iso1);

plot(n_iso2,A*n_iso2,'LineWidth',1.4,'Color',"#77AC30")

scatter([n_star], [A*n_star],'filled','MarkerFaceColor','blue')
scatter([1/gamma], [A/gamma],'filled','MarkerFaceColor','red')

 %plot(n_iso1(2:end),labor_marginal_cost,'LineWidth',1.2)

% plot(n_iso1,labor_cost,'LineWidth',1.2)

line1=wage*(n_iso1-n_star)+A*n_star;

% plot(n_iso1(100:430),line1(100:430),'--','LineWidth',1.1)
% text(0.8,0.49, "$w$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 9);
% 
% 
% % Arc
% n_circle=0.767:0.001:0.77;
% Circle=0.468+sqrt(0.05^2-(n_circle-0.72).^2);
% hold on
% plot(n_circle,Circle,'LineWidth',linewidth-0.2)
% plot([0.74 0.83],[0.468 0.468],'LineWidth',1.2)

% text(0.2,0.4, "$\kappa=0$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color',"#D95319");
% text(0.5,0.25, "$\kappa=0.6$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color',"blue");

text(0.49,0.72, "standard model", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color',"#D95319");
text(0.5,0.25, "search model", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color',"blue");

text(1.2,0.8, "$y=An$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color',"#77AC30");
% text(0.34,1.2, "Labor Cost", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
% 
text(1.3,-0.05, "$n$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(0,1.2, "$c$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);

plot([n_star n_star],[0 A*n_star],':','LineWidth',1.2)
plot([1/gamma 1/gamma],[0 A*1/gamma],':','LineWidth',1.2)


text(n_star-0.03,-0.05, "$n^*_{search}$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','Blue');
text(1/gamma-0.03,-0.05, "$n^*$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','Red');

set(gca,'XTick',[])
set(gca,'YTick',[])
% hold on
% plot(n_iso2,c,'LineWidth',1.2)
% plot(n_iso3,c,'LineWidth',1.2)
% 
% plot(n_iso,A*n_iso,'LineWidth',1.2)


%Save
print(gcf,'lec10_5v2.png','-dpng','-r500');
print(gcf,'lec10_5v2.eps','-depsc','-tiff','-r500');



%% lec10_6
clc
clear -except linewidth
close all
linewidth=1.2;
FontName="Times";


n_lhs=0:0.001:0.5;
n=0.2:0.001:0.5;
c=0.01:0.001:5;
c2=0.01:0.001:5;

A=0.7;

phi=0.7;
phi2=0.8;
gamma=0.99;
kappa=0.6;
mu_bar=1;
mu_bar2=1.3;

eta=0.5;
n_0=0.2;

n_star=0.349;
n_star2=0.441;

wage=phi*A+(1-phi)*gamma*n_star;
wage2=phi2*A+(1-phi2)*gamma*n_star;



U_max1=log(A*n_star)-gamma*n_star;
U_max2=log(A/gamma)-1;

% 
% U_max2=0.4;
% 
% U_max3=-0.8;
% 
 n_iso1=(log(c)-U_max1)/gamma;
n_iso2=(log(c2)-U_max2)/gamma;
% n_iso3=(log(c)-U_max3)/gamma;
% 
% %MRS
plot(n_iso1,c,'LineWidth',1.2)
hold on
plot(n_iso2,c2,'LineWidth',1.2)


xlim([0.05 1.7])
theta=((n_iso1-n_0)./(mu_bar.*(1.-n_iso1))).^(1/eta);

labor_cost=wage*n_iso1+(n_iso1-n_0)*kappa./(mu_bar.*theta.^(eta-1));

labor_marginal_cost=diff(labor_cost)./diff(n_iso1);

plot(n_iso2,A*n_iso2,'LineWidth',1.4,'Color',"#77AC30")

scatter([n_star], [A*n_star],'filled','MarkerFaceColor','blue')
scatter([1/gamma], [A/gamma],'filled','MarkerFaceColor','red')

 %plot(n_iso1(2:end),labor_marginal_cost,'LineWidth',1.2)

% plot(n_iso1,labor_cost,'LineWidth',1.2)

line1=wage*(n_iso1-n_star)+A*n_star;

plot(n_iso1(100:400),line1(100:400),'--','LineWidth',1.1)
text(0.79,0.49, "$w$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 9);


% Arc
n_circle=0.764:0.001:0.77;
Circle=0.468+sqrt(0.05^2-(n_circle-0.72).^2);
hold on
plot(n_circle,Circle,'LineWidth',linewidth-0.2)
plot([0.73 0.83],[0.468 0.468],'LineWidth',1.2)

% text(0.2,0.4, "$\kappa=0$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color',"#D95319");
% text(0.5,0.25, "$\kappa=0.6$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color',"blue");

text(0.49,0.72, "standard model", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color',"#D95319");
text(0.5,0.25, "search model", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color',"blue");

text(1.2,0.8, "$y=An$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color',"#77AC30");
% text(0.34,1.2, "Labor Cost", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
% 
text(1.3,-0.05, "$n$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(0,1.2, "$c$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);

plot([n_star n_star],[0 A*n_star],':','LineWidth',1.2)
plot([1/gamma 1/gamma],[0 A*1/gamma],':','LineWidth',1.2)


text(n_star-0.03,-0.05, "$n^*_{\kappa=0.6}$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','Blue');
text(1/gamma-0.03,-0.05, "$n^*_{\kappa=0}$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','Red');

set(gca,'XTick',[])
set(gca,'YTick',[])
% hold on
% plot(n_iso2,c,'LineWidth',1.2)
% plot(n_iso3,c,'LineWidth',1.2)
% 
% plot(n_iso,A*n_iso,'LineWidth',1.2)


%Save
print(gcf,'lec10_6.png','-dpng','-r500');
print(gcf,'lec10_6.eps','-depsc','-tiff','-r500');



%% lec10_6
clc
clear -except linewidth
close all
linewidth=1.2;
FontName="Times";


n_lhs=0:0.001:0.5;
n=0.2:0.001:0.5;
c=0.01:0.001:5;
c2=0.01:0.001:5;

A=0.7;

phi=0.5;
phi2=0.8;
gamma=0.99;
kappa=0.6;
mu_bar=1;
mu_bar2=1.3;

eta=0.5;
n_0=0.2;

n_star=0.407;
n_star2=0.441;

wage=phi*A+(1-phi)*gamma*n_star;
wage2=phi2*A+(1-phi2)*gamma*n_star;



U_max1=log(A*n_star)-gamma*n_star;
U_max2=log(A/gamma)-1;

% 
% U_max2=0.4;
% 
% U_max3=-0.8;
% 
 n_iso1=(log(c)-U_max1)/gamma;
n_iso2=(log(c2)-U_max2)/gamma;
% n_iso3=(log(c)-U_max3)/gamma;
% 
% %MRS
plot(n_iso1,c,'LineWidth',1.2)
hold on
plot(n_iso2,c2,'LineWidth',1.2)


xlim([0.05 1.7])
theta=((n_iso1-n_0)./(mu_bar.*(1.-n_iso1))).^(1/eta);

labor_cost=wage*n_iso1+(n_iso1-n_0)*kappa./(mu_bar.*theta.^(eta-1));

labor_marginal_cost=diff(labor_cost)./diff(n_iso1);

plot(n_iso2,A*n_iso2,'LineWidth',1.4,'Color',"#77AC30")

scatter([n_star], [A*n_star],'filled','MarkerFaceColor','blue')
scatter([1/gamma], [A/gamma],'filled','MarkerFaceColor','red')

 %plot(n_iso1(2:end),labor_marginal_cost,'LineWidth',1.2)

% plot(n_iso1,labor_cost,'LineWidth',1.2)

line1=wage*(n_iso1-n_star)+A*n_star;

plot(n_iso1(100:430),line1(100:430),'--','LineWidth',1.1)
text(0.8,0.49, "$w$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 9);


% Arc
n_circle=0.767:0.001:0.77;
Circle=0.468+sqrt(0.05^2-(n_circle-0.72).^2);
hold on
plot(n_circle,Circle,'LineWidth',linewidth-0.2)
plot([0.74 0.83],[0.468 0.468],'LineWidth',1.2)

% text(0.2,0.4, "$\kappa=0$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color',"#D95319");
% text(0.5,0.25, "$\kappa=0.6$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color',"blue");

text(0.49,0.72, "standard model", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color',"#D95319");
text(0.5,0.25, "search model", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color',"blue");

text(1.2,0.8, "$y=An$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color',"#77AC30");
% text(0.34,1.2, "Labor Cost", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
% 
text(1.3,-0.05, "$n$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(0,1.2, "$c$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);

plot([n_star n_star],[0 A*n_star],':','LineWidth',1.2)
plot([1/gamma 1/gamma],[0 A*1/gamma],':','LineWidth',1.2)


text(n_star-0.03,-0.05, "$n^*_{search}$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','Blue');
text(1/gamma-0.03,-0.05, "$n^*$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','Red');

set(gca,'XTick',[])
set(gca,'YTick',[])
% hold on
% plot(n_iso2,c,'LineWidth',1.2)
% plot(n_iso3,c,'LineWidth',1.2)
% 
% plot(n_iso,A*n_iso,'LineWidth',1.2)


%Save
print(gcf,'lec10_6v2.png','-dpng','-r500');
print(gcf,'lec10_6v2.eps','-depsc','-tiff','-r500');




%% lec10_7
clc
clear -except linewidth
close all
linewidth=1.2;
FontName="Times";


n_lhs=0:0.001:0.5;
n=0.2:0.001:0.5;
c=0.01:0.001:5;
c2=0.01:0.001:5;

A=0.7;

phi=0.7;
phi2=0.3;
gamma=0.99;
kappa=0.6;
mu_bar=1;
mu_bar2=1.3;

eta=0.5;
n_0=0.2;

n_star=0.349;
n_star2=0.581;

wage=phi*A+(1-phi)*gamma*n_star;
wage2=phi*A+(1-phi)*gamma*n_star2;



U_max1=log(A*n_star)-gamma*n_star;
U_max2=log(A*n_star2)-gamma*n_star2;

% 
% U_max2=0.4;
% 
% U_max3=-0.8;
% 
 n_iso1=(log(c)-U_max1)/gamma;
n_iso2=(log(c2)-U_max2)/gamma;
% n_iso3=(log(c)-U_max3)/gamma;
% 
% %MRS
plot(n_iso1(1:500),c(1:500),'LineWidth',1.2)
hold on
plot(n_iso2(1:600),c2(1:600),'LineWidth',1.2)


xlim([0.2 1])
theta=((n_iso1-n_0)./(mu_bar.*(1.-n_iso1))).^(1/eta);

labor_cost=wage*n_iso1+(n_iso1-n_0)*kappa./(mu_bar.*theta.^(eta-1));

labor_marginal_cost=diff(labor_cost)./diff(n_iso1);

plot(n_iso2,A*n_iso2,'LineWidth',1.4,'Color',"#77AC30")

scatter([n_star], [A*n_star],'filled','MarkerFaceColor','blue')
scatter([n_star2], [A*n_star2],'filled','MarkerFaceColor','red')

 %plot(n_iso1(2:end),labor_marginal_cost,'LineWidth',1.2)

% plot(n_iso1,labor_cost,'LineWidth',1.2)

line1=wage*(n_iso1-n_star)+A*n_star;
line2=wage2*(n_iso2-n_star2)+A*n_star2;

plot(n_iso1(100:400),line1(100:400),'--','LineWidth',1.1)
% text(0.79,0.49, "$w$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 9);

plot(n_iso2(350:700),line2(350:700),'--','LineWidth',1.1)

% Arc
n_circle=0.469:0.001:0.476;
Circle=0.290+sqrt(0.05^2-(n_circle-0.427).^2);
hold on
plot(n_circle,Circle,'LineWidth',linewidth-0.2)
plot([0.44 0.486],[0.299 0.299],'LineWidth',1.1)





% Arc
n_circle=0.921:0.001:0.931;
Circle=0.61+sqrt(0.03^2-(n_circle-0.9).^2);
hold on
plot(n_circle,Circle,'LineWidth',linewidth-0.2)
plot([0.89 0.945],[0.61 0.61],'LineWidth',1.1)

text(0.3,0.37, "$\kappa=0.1$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color',"#D95319");
text(0.6,0.3, "$\kappa=0.6$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color',"blue");
text(0.93,0.625, "$w$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 9,'color','red');
text(0.48,0.31, "$w$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 9,'color','blue');

text(0.8,0.65, "$y=An$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color',"#77AC30");
% text(0.34,1.2, "Labor Cost", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
% 
text(1.3,-0.05, "$n$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(0,1.2, "$c$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);

plot([n_star n_star],[0 A*n_star],':','LineWidth',1.2)
plot([n_star2 n_star2],[0 A*n_star2],':','LineWidth',1.2)


text(n_star-0.03,-0.05, "$n^*_{\kappa=0.6}$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','Blue');
text(n_star2-0.03,-0.05, "$n^*_{\kappa=0.1}$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','Red');

set(gca,'XTick',[])
set(gca,'YTick',[])
% hold on
% plot(n_iso2,c,'LineWidth',1.2)
% plot(n_iso3,c,'LineWidth',1.2)
% 
% plot(n_iso,A*n_iso,'LineWidth',1.2)


text(0.9,-0.05, "$n$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(0.15,0.6, "$c$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);


%Save
print(gcf,'lec10_7.png','-dpng','-r500');
print(gcf,'lec10_7.eps','-depsc','-tiff','-r500');

%% lec10_8




clc
clear -except linewidth
close all
linewidth=1.2;
FontName="Times";


n_lhs=0:0.001:0.5;
n=0.2:0.001:0.5;
c=0.65:0.001:3.9;
c2=0.9:0.001:2.3;

A=2;

phi=0.9;
phi2=0.7;
gamma=0.8;
kappa=0.6;
mu_bar=1;
mu_bar2=1.3;

eta=0.5;
n_0=0.2;

n_star=0.354;
n_star2=0.5;

wage=phi*A+(1-phi)*gamma*n_star;
wage2=phi2*A+(1-phi2)*gamma*n_star2;


U_max1=log(A*n_star)-gamma*n_star;
U_max2=log(A*n_star2)-gamma*n_star2;

% 
% U_max2=0.4;
% 
% U_max3=-0.8;
% 
 n_iso1=(log(c)-U_max1)/gamma;
n_iso2=(log(c)-U_max2)/gamma;


line1=wage*(n_iso1-n_star)+A*n_star;
line2=wage2*(n_iso2-n_star2)+A*n_star2;

plot(n_iso1(1:120),line1(1:120),'--','LineWidth',1.2,'Color','Red')
hold on
plot(n_iso2(300:500),line2(300:500),'--','LineWidth',1.2,'Color','Blue')

% n_iso3=(log(c)-U_max3)/gamma;
% 
% %MRS
plot(n_iso1,c,'LineWidth',1.2,'Color','r')
hold on
plot(n_iso2,c,'LineWidth',1.2,'Color','b')


slope1=diff(c)./diff(n_iso1);
slope2=diff(c)./diff(n_iso2);


xlim([0.3 1.1])
theta=((n_iso1-n_0)./(mu_bar.*(1.-n_iso1))).^(1/eta);

labor_cost=wage*n_iso1+(n_iso1-n_0)*kappa./(mu_bar.*theta.^(eta-1));

labor_marginal_cost=diff(labor_cost)./diff(n_iso1);

% plot(n_iso2,A*n_iso2,'LineWidth',1.2)

scatter([0.354], [A*0.354],'filled','MarkerFaceColor','red')
scatter([n_star2], [A*n_star2],'filled','MarkerFaceColor','blue')


n1=0.3:.001:0.5;
n2=0.45:.001:0.6;

hold on 
plot(n1,slope1(59)*(n1-0.354)+A*0.354,'LineWidth',2,'Color',"#77AC30")
plot(n2,slope2(351)*(n2-n_star2)+A*n_star2,'LineWidth',2,'Color',"#EDB120")

 %plot(n_iso1(2:end),labor_marginal_cost,'LineWidth',1.2)

% plot(n_iso1,labor_cost,'LineWidth',1.2)


text(0.8,0.9, "$\phi=0.9$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','Red');
text(0.9,1.35, "$\phi=0.7$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','Blue');
% text(0.6,0.85, "Indifference Curve", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);

text(1,0.55, "$n$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
text(0.25,1.6, "$c$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);



text(n_star-0.03,-0.05, "$n^*_{\phi=0.9}$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','Blue');
text(n_star2-0.03,-0.05, "$n^*_{\phi=0.7}$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','Red');




text(0.35,0.8, "$w_1$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','Red');
text(0.37,0.68, "MRS", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 12,'Color','#77AC30');
text(0.55,0.99, "MRS", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 12,'Color','#EDB120');

text(0.59,1.24, "$w_2$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13,'Color','Blue');

%%text(0.52,1.02, "$y=An$", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);
% text(0.34,1.2, "Labor Cost", 'Interpreter','latex', 'FontWeight', 'bold','FontSize', 13);

set(gca,'XTick',[])
set(gca,'YTick',[])
% hold on
% plot(n_iso2,c,'LineWidth',1.2)
% plot(n_iso3,c,'LineWidth',1.2)
% 
% plot(n_iso,A*n_iso,'LineWidth',1.2)

print(gcf,'lec10_8.png','-dpng','-r500');
print(gcf,'lec10_8.eps','-depsc','-tiff','-r500');

