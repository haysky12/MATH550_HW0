b = [0, 5];
u = @(x) sin(x);
f = @(x) sin(x)*cos(x);

h = 1;
n = (b(2)-b(1))/h;
x = b(1):h:b(2);
B(1) = b(1);
B(n+1) = b(2);
for i = 2:n
    B(i) = h^2 * f(x(i));
end
[a, M] = odeDirchlet(u, h, b);
B =transpose(B);
c = M\B; % sometimes throws an error
err = abs(c - a);

dxs = logspace(-4, 0, 40); % grid spacings , 10^ -4 to 10^0
y2 = 2.0*(dxs.^2) + 16.0*(dxs.^4); % second order error curve

hold on
% plots
% plot(dxs, y2, 'Color', '#AC2694', 'LineWidth',3) 
plot(x, err, '--*', 'Color', '#FEB82C', 'LineWidth',3)

% set x label settings
xlim([0, 5])
xticks([0,1,2,3,4,5])

% title, labels, and legend
xlabel('x', 'FontWeight','bold')
ylabel('Error','FontWeight','bold')
title('Actual - Estimate Plot','FontSize',14,'FontWeight','bold')
% legend('Second-Order Error','Calculated Error','FontWeight','bold')

% turn on gridlines and make them bold
grid on
ax = gca;
ax.LineWidth = 3;
ax.XAxis.FontWeight = 'bold';
ax.YAxis.FontWeight = 'bold';

% set plot lines to be thicker
p1.LineWidth = 2.5;
p2.LineWidth = 3;

hold off