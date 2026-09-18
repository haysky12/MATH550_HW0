function df = centralDiff(f, h)
% input f is the function at equally spaced points
% input h is the spacing
% output df is the estimated values at the derivative

% 1st order one-sided difference for first point
df(1) = (f(2)-f(1))/h;

% 2nd order central difference for internal points
for i = 2:length(f)-1
    df(i) = (f(i+1)-f(i-1))/(2*h);
end

% 1st order one-sided difference for end point
df(length(f)) = (f(length(f))-(f(length(f)-1)))/h;