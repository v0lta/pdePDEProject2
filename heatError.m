clear all;
%compute the error of the 2d heat equation in 2d.

tend = 0.1
mu = 0.25;

J = 30;

%x in [0,1].
dx = 1/J;
%y in [0,1];
dy = 1/J;
% mu = dt/dx^2;
dt = mu*dx^2

%keep h/k constant.

steps = ceil(tend/dt)

[x,y] = meshgrid(linspace(0,1,J));

%the boundary conditions are zero (of homogeneous diriclet type).
%the initial solution is u0(x,y) = sin(pi x) sin(pi y).
U = sin(pi*x).*sin(pi*y); 
U1 = zeros(J);
U2 = zeros(J);
%time loop
for t = 1:steps
    elements = 2:J-1;  
    for i = 1:1:J
        %compute the columns where x is const.
        U1(elements,i) = mu*U(elements+1,i) + mu*U(elements-1,i); 
        %compute the columns where y is const.
        U2(i,elements) = mu*U(i,elements+1) + mu*U(i,elements-1);
    end
    Unew = (1 - 4*mu) .* U + U1 + U2;
    U = Unew;
end
%compute the exact solution:
Uex = exactHeat(tend,J);
Uerror = U - Uex;
surf(x,y,U);
maxVal = max(max(abs(Uerror)))
