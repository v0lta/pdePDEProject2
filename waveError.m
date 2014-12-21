clear all;
%Find the error of the wave Equation.


mu = 0.25
%mu = dx/dt;

tend = 1;
J = 30;

%x in [0,1].
dx = 1/J;
%y in [0,1];
dy = 1/J;
% mu = dt/dx^2;
dt = sqrt(mu*dx^2);

[x,y] = meshgrid(linspace(0,1,J));


steps = ceil(tend/dt)

%the boundary conditions are zero (of homogeneous diriclet type).
U1 = zeros(J);
U2 = zeros(J);

%the initial solution is u0(x,y) = sin(pi x) sin(pi y).
U = sin(pi*x).*sin(pi*y); 

Uold = U;
figure('Renderer','zbuffer');
for t = 1:steps
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
    
    %tcurr = t*dt;
    %Uex = exactWave(tcurr,J); 
    %surf(x,y,Uex);
    %axis([0 1 0 1 -1 1 -1 1]);
    %1M(t)= getframe;
end
Uex = exactWave(tend,J);
Uerror = U - Uex;
surf(x,y,U);
maxVal = max(max(abs(Uerror)))
