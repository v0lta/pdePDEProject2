function U = exactHeat(tend,J)

%The script returns the exact solution of the Heat equation.

v = 1; %should be switched if needed

x = linspace(0,1,J);
y = linspace(0,1,J);

t = tend;
U =  sin(pi*(x-v*t))' * sin (pi*(y-v*t));
%surf(x,y,U);
end