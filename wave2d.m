clear all;
%This script attemts to find the solution of the wave equation in two
%dimensions.

tend = 20;
dt = 0.1;
J = 20;

%x in [0,1].
dx = 1/J;
%y in [0,1];
dy = 1/J;
%equal spacing in x and y direction.
mu = dx/dt;

[x,y] = meshgrid(linspace(0,1,J));

%the boundary conditions are zero (of homogeneous diriclet type).
U1 = zeros(J);
U2 = zeros(J);

%the initial solution is u0(x,y) = sin(pi x) sin(pi y).
U = sin(pi*x).*sin(pi*y); 

Uold = U;
for t = 1:(tend/dt)
    U1 = zeros(J);
    U2 = zeros(J);
    elements = 2:J-1;  
    for i = 1:1:J
        %compute the columns where x is const.
        U1(elements,i) = mu*U(elements+1,i) + mu*U(elements-1,i); 
        %compute the columns where y is const.
        U2(i,elements) = mu*U(i,elements+1) + mu*U(i,elements-1);
    end
    Unew = (2 - 4*mu) .* U - Uold + U1 + U2;
    Uold = U;
    U = Unew;
    surf(x,y,U); axis([0 1 0 1 -1 1 -1 1]);
    M(t)= getframe;
end

%movie(M);
%movie2avi(M,'wave.avi','quality',100)
     
        
        
        
        
        