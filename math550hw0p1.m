% set font
s = settings;
s.matlab.fonts.editor.code.Name.TemporaryValue = 'Helvetica';

h = 0.1; % spacing
x = 0:h:2*pi; % x vector values to approximate
f = @(x) exp(sin(x));
y = f(x); % function
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
b = [0, 2*pi]; % boundaries
N = 1:100; % number of points
h = (b(2)-b(1))./N; % vector of spacings
err_2 = 1:100;
err_inf = 1:100;

for i = 1:length(h)
    x = b(1):h(i):b(2);
    approx = centralDiff(f(x), h(i));
    actual = dy(x);
    error = actual - approx;

    err_2(i) = log(norm(error) / norm(actual));
    err_inf(i) = log(norm(error, inf) / norm(actual, inf));
end


figure(2);
hold on
loglog(log(N), err_2, '-', 'Color', "#FEB82C", 'LineWidth', 3)
loglog(log(N), err_inf, ':', 'Color', "#AC2694", 'LineWidth', 3)

% set x label settings
% xlim([0, 1])
%xticks([10^1, 10^2, 10^3])
%xticklabels({'10^1', '10^2', '10^3'})

% ylim([0,1])
% yticks([10^-3, 10^-2, 10^-1, 10^0])
% yticklabels({'10^-3', '10^-2', '10^-1', '10^0'})

% title, labels, and legend
xlabel('log(Grid Size)', 'FontWeight','bold')
ylabel('log(Relative Error)','FontWeight','bold')
title('Relative Error Convergence Plot','FontSize',14,'FontWeight','bold')
legend('L2','L-Inf.','FontWeight','bold')

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








