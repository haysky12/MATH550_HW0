function [x, M] = odeDirchlet(u, h, b)
% input u is the function
% input h is the spacing
% input b is the boundaries in a vector
% output x is the solution vector

% duu + sin(x)*du + u = f
n = (b(2)-b(1))/h; % # of points
x = b(1):h:b(2);
B = 1:n+1;
B(1) = b(1);
B(n+1) = b(2);

du = centralDiff(u(x), h);
ddu = centralDiff(du, h);

% make rhs vector
f = @(x) ddu(x) + sin(x)*du(x) + u(x);
for i = 2:n
    B(i) = h^2 * f(x(i));
end

% really way too long for what it does (making matrix M)
for i = 1:n+1
    for j = 1:n+1
        if i==1
            if j==1
                M(i, j) = 1;
            else
                M(i, j) = 0;
            end
        elseif i == n+1
            if j == n+1
                M(i, j) = 1;
            else
                M(i, j) = 0;
            end
        else
            if i==j-1
                M(i,j) = 1;
            elseif i == j
                M(i, j) = -2;
            elseif i==j+1
                M(i,j) = 1;
            else
                M(i,j) = 0;
            end
        end
    end
end

% flip it to make it vertical
B = transpose(B);

x = M\B;