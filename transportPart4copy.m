clear all;

%This script attemts to find the solution of the transport equation in two
%dimensions with part 4 initial conditions.
nu = 0.3;
%mu = dx/dt;

tend = 1;
J = 20;

%x in [0,1].
dx = 1/J;
%y in [0,1];
dy = 1/J;
% mu = dt/dx^2;
dt = nu/dx;

steps = ceil(tend/dt);

[x,y] = meshgrid(linspace(0,1,J));

%the boundary conditions are zero (of homogeneous diriclet type).
%the initial solution is u0(x,y) = sin(pi x) sin(pi y).
U = 15*(x - x^2).*(y-y^2).*exp(-50 *((x - 0.5)^2 + (y - 0.5)^2 ));
U1 = zeros(J);
U2 = zeros(J);

for t = 1:(tend/dt)
    U1 = zeros(J);
    U2 = zeros(J);
    elements = 2:J-1;  
    for i = 1:1:J
        %compute the columns where x is const.
        U1(elements,i) = nu*U(elements+1,i); 
        %compute the columns where y is const.
        U2(i,elements) = nu*U(i,elements+1);
    end
    Unew = (1 - 2*nu) .* U + U1 + U2;
    U = Unew;
    surf(x,y,U);
    view(180+45,30)
    M(t)= getframe;
end

% movie(M);
%movie2avi(M,'transport2.avi','quality',100)
