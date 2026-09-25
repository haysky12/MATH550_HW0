bx = [0, 5]; % BCs
by = [0, 5];
u = @(x) sin(x); % function to test
f = @(x, y) sin(x).*cos(y); % exact sol'n to DE

% Nx = Ny = N
N = 1:100; % vector of number of points
h = (b(2)-b(1))./N; % vector of spacings
err_2 = 1:100;

% WIP: this for loop should be modified for PDE
for i = 1:length(h)
    x = b(1):h(i):b(2);
    approx = pdeDirchlet(bx, by, N(i), N(i));
    actual = u(x);
    error = actual - approx;

    err_2(i) = log(norm(error) / norm(actual));
end

% y2 = (1./N).^2; % second order error

hold on
% plots
% i need to figure this out...

% set x label settings
%xlim([0, 5])
%xticks([0,1,2,3,4,5])

% title, labels, and legend
xlabel('log(Grid Size)', 'FontWeight','bold')
ylabel('log(Error)','FontWeight','bold')
title('Relative Error Convergence','FontSize',14,'FontWeight','bold')
legend('Second Order Error','Calculated Error','FontWeight','bold')

% turn on gridlines and make them bold
grid on
ax = gca;
ax.LineWidth = 3;
ax.XAxis.FontWeight = 'bold';
ax.YAxis.FontWeight = 'bold';

hold off