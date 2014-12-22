clear all;

%This script attempts to find the solution of the heat equation in two
%dimensons with the new initial conditions given in part4.

mu = 0.1;
%mu = dx/dt;

tend = 0.2;
J = 50;

%x in [0,1].
dx = 1/J;
%y in [0,1];
dy = 1/J;
% mu = dt/dx^2;
dt = mu*dx^2;

steps = ceil(tend/dt);

%equal spacing in x and y direction.
disp('cond: mx + my <= 0.5')
if 2*mu > 0.5
    disp ('unstable:')
    disp (2*mu)
else
    disp('stable')
end

[x,y] =meshgrid(linspace(0,1,J));

%the boundary conditions are zero (of homogeneous diriclet type).
U1 = zeros(J);
U2 = zeros(J);

%the initial solution is u0(x,y) = sin(pi x) sin(pi y)
U = 15*(x - x.^2).*(y-y.^2).*exp(-50 .*((x - 0.5).^2 + (y - 0.5).^2 ));

%time loop
%figure('Renderer','zbuffer');
for t = 1:(tend/dt)
    elements = 2:J-1;  
    for i = 1:1:J
        %compute the columns where x is const.
        U1(elements,i) = mu*U(elements+1,i) + mu*U(elements-1,i); 
        %compute the columns where y is const.
        U2(i,elements) = mu*U(i,elements+1) + mu*U(i,elements-1);
    end
    Unew = (1 - 4*mu) .* U + U1 + U2;
    U = Unew;
    %surf(x,y,U); 
    %axis([0 1 0 1 -1 1]);
    %M(t)= getframe;
end

surf(x,y,U); 
axis([0 1 0 1 -1 1]);
    
