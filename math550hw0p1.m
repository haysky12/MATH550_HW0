% set font
s = settings;
s.matlab.fonts.editor.code.Name.TemporaryValue = 'Helvetica';

h = 0.1; % spacing
x = 0:h:2*pi; % x vector values to approximate
y = exp(sin(x)); % function
df = centralDiff(y,h); % numerical approx.

% actual derivative for comparison
dy = @(x) cos(x).*exp(sin(x));
dyv = dy(x);

% graph
hold on
p2 = plot(x, dyv, 'Color', '#FEB82C'); % gold
p1 = plot(x, df, 'o', 'Color', "#AC2694"); % dark magenta

% set x label settings
xlim([0, 2*pi])
xticks([0,pi/2,pi,3*pi/2,2*pi])
xticklabels({'0','\pi/2','\pi','3\pi/2','2\pi'})

% title, labels, and legend
xlabel('x', 'FontWeight','bold')
ylabel("f '(x)",'FontWeight','bold')
title('Central Difference Approximation vs. Analytical Solution','FontSize',14,'FontWeight','bold')
legend('Analytical Solution','Numerical Approx.','FontWeight','bold')

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

% part b
% relative error on y-axis, grid size n on x-axis
err = 1:63;
a = 1:63; 
b = 1:63;
n = 1:63;
for i = 1:63
    hi = (2*pi)/i;
    xi = 0:hi:2*pi;
    n(i) = hi;
    yi = exp(sin(xi));
    dfi = centralDiff(yi,hi);
    dyvi = dy(xi);
    a(i) = max(abs(dyvi - dfi));
    b(i) = max(abs(dyvi));
    err(i) = a(i) / b(i);
end
figure(2);
hold on
loglog(n, err, 'Color', "#AC2694", 'LineWidth', 3)
%loglog(n, a, 'Color', "#AC2694", 'LineWidth', 3)
%loglog(n, b, 'Color', "#FEB82C", 'LineWidth', 3)

% set x label settings
xlim([0, 2*pi])
xticks([0,pi/2,pi,3*pi/2,2*pi])
xticklabels({'0','\pi/2','\pi','3\pi/2','2\pi'})

% title, labels, and legend
xlabel('Grid Size', 'FontWeight','bold')
ylabel('Relative Error','FontWeight','bold')
title('Relative Error Convergence Plot','FontSize',14,'FontWeight','bold')
%legend('Analytical Solution','Numerical Approx.','FontWeight','bold')

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

%dxs = logspace(-4, 0, 40); % grid spacings , 10^ -4 to 10^0
%y2 = 2.0*(dxs.^2) + 16.0*(dxs.^4); % second order error curve
%plot(dxs, y2, 'g')
%hold off






