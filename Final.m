U_e=[-6.53	-6.65	-6.74	-6.83	-6.92	-6.99	-7.07;...
    -12.38	-12.57	-12.74	-12.90	-13.06	-13.20	-13.34;...
    -22.49	-22.84	-23.13	-23.43	-23.7	-23.94	-24.24;...
    -39.96	-40.57	-41.10	-41.60	-42.09	-42.51	-42.88;...
    -67.94	-68.94	-69.85	-70.70	-71.44	-72.14	-72.80;...
    -115.24	-116.85	-118.30	-119.83	-121.07	-122.21	-123.29];
U_e=-10^-3*U_e;
R_e=2700;
U_a=[38.07	47.88	57.80	67.61	77.36	87.35	97.35;...
    37.99	47.82	57.64	67.49	77.35	87.19	97.09;...
    37.92	47.75	57.61	67.44	77.19	87.15	96.097;...
    37.80	47.66	57.54	67.33	77.25	87.10	96.95;...
    37.74	47.63	57.48	67.38	77.10	86.99	96.86;...
    37.70	47.54	57.31	67.26	76.95	86.86	96.88];
I_e=[];
I_e1=log10(U_e/R_e);
U_a1=sqrt(U_a);
figure;
for i=1:6
    Temp=polyfit(U_a1(i,:),I_e1(i,:),1);
    I_e=[I_e Temp(2)];
    y_fit=polyval(Temp,U_a1(i,:));
    plot(U_a1(i,:),I_e1(i,:), 'o');
    hold on;
    plot(U_a1(i,:), y_fit, '-');
    str = ['y = ', num2str(Temp(1)), ' * x + ', num2str(Temp(2))];
    text(mean(U_a1(i,:)), mean(y_fit), str, 'FontSize', 10);
end
legend('第1组原始数据','第1组线性拟合结果','第2组原始数据','第2组线性拟合结果','第3组原始数据','第3组线性拟合结果','第4组原始数据','第4组线性拟合结果','第5组原始数据','第5组线性拟合结果','第6组原始数据','第6组线性拟合结果');
hold off;
xlabel('$\sqrt{U_a}$','Interpreter','latex');
ylabel('$lg{I''_e}$','Interpreter','latex');
T=[1753.7 1786.5 1819.4 1852.2 1885.1 1917.9];
I_e=10.^I_e;
y=log10(I_e./(T.^2));
x=1./T;
p=polyfit(x,y,1);
y1=polyval(p,x);
figure;
plot(x,y,'o');
hold on
plot(x,y1,'-');
legend('原始数据', '线性拟合结果');
hold off;
xlabel('$1/T$','Interpreter','latex');
ylabel('$lg{I_e}/{T^2}$','Interpreter','latex');
axis('auto'); 
str = ['y = ', num2str(p(1)), ' * x + ', num2str(p(2))];
text(mean(x), mean(y), str, 'FontSize', 12);
E=p(1)/(-5.039*10^3);
disp('计算可得逸出功为');
disp(E);
disp('与公认值相对偏差为');
disp(E-4.54);