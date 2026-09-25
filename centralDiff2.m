function ddf = centralDiff2(f, h)
% input f is the function at equally spaced points
% input h is the spacing
% output df is the estimated values at the derivative

% periodicity instead of one-sided
ddf(1) = (f(2)-2*f(1)+f(length(f)-1))/(h^2);

% 2nd order central difference for internal points
for i = 2:length(f)-1
    ddf(i) = (f(i+1)-2*f(i)+f(i-1))/(h^2);
end

% periodicity instead of one-sided
ddf(length(f)) = (f(2)-2*(f(length(f)))+f(length(f)-1))/(h^2);