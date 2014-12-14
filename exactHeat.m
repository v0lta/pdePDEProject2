function U = exactHeat(tend,J)

%The script returns the exact solution of the Heat equation.

x = linspace(0,1,J);
y = linspace(0,1,J);

t = tend;
U = exp(-2*pi^2*t) .* sin(pi*x)' * sin (pi*y);
%surf(x,y,U);
end