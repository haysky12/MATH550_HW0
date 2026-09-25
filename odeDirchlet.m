function phi = odeDirchlet(u, t, N)
% input u is the function
% input t is the BCs as [t0, tN]
% input N is the number of grid spaces
% output phi is the solution vector

a = t(1);
b = t(2);
dx = (b-a)/N;
x = a:dx:b;
x = x';
n = length(x);

e = ones(n,1);
Dxx = spdiags([e, -2*e, e], [-1, 0, 1], n, n) / dx^2;

f = u(x);

f(1) = a;
f(N) = b;
Dxx(1, 1) = 1/(dx^2);
Dxx(1, 2) = 0;
Dxx(n, n-1) = 0;
Dxx(n, n) = 1/(dx^2);

phi = Dxx\f;
