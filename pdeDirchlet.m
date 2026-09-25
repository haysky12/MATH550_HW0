function phi = pdeDirchlet(bx, by, Nx, Ny)

% define boundaries
a = bx(1);
b = bx(2);
c = by(1);
d = by(2);

% calculate spacings
dx = (b-a)/Nx;
dy = (d-c)/Ny;

% vector of values to test at
x = (a:dx:b).';
y = (c:dx:d).';

% make grid
[X, Y] = meshgrid(x, y);
X = X.';
Y = Y.';

nx = length(X);
ny = length(Y);

ex = ones(nx, 1);
Dx = spdiags([ex, -2*ex, ex], [-1, 0, 1], nx, nx) / dx^2;
ey = ones(ny, 1);
Dy = spdiags([ey, -2*ey, ey], [-1, 0, 1], ny, ny) / dy^2;

Ix = speye(nx);
Iy = speye(ny);

% boundary conditions
Dxx(1, 1) = 1/(dx^2);
Dxx(1, 2) = 0;
Dxx(n, n-1) = 0;
Dxx(n, n) = 1/(dx^2);


L = kron(Iy, Dx) + kron(Dy, Ix);

% rhs
F = -2*sin(X).*sin(Y);
for i = 1:length(F)
    for j = 1:length(F(i))
        if j == 1
            F(i, j) = F(i, j) - a/dx^2;
        elseif j == ny
            F(i, j) = F(i, j) - b/dx^2;
        elseif i == 1
            F(i, j) = F(i, j) - c/dy^2;
        elseif i == nx
            F(i, j) = F(i, j) - d/dy^2;
        end
    end
end
          

f = F(:);

% solve
phi = L \ f;
phi = reshape(phi, nx, ny);