%compute the error of the 2d heat equation in 2d.

mu = 0.1;
%mu = dx/dt;


tend = 3;
J = 40;

%x in [0,1].
dx = 1/J;
%y in [0,1];
dy = 1/J;
dt = dx/mu

%equal spacing in x and y direction.
disp('cond: mx + my <= 0.5')
if 2*mu > 0.5
    disp ('unstable:')
    disp (2*mu)
else
    disp('stable')
end


x = linspace(0,1,J);
y = linspace(0,1,J);

%the boundary conditions are zero (of homogeneous diriclet type).
U1 = zeros(J);
U2 = zeros(J);

%the initial solution is u0(x,y) = sin(pi x) sin(pi y).
for i = 1:1:J
    U1(:,i) = sin(pi*x);
    U2(i,:) = sin(pi*y); 
end
U = U1 .* U2; 
UInit = U;
%time loop
for t = 1:dt:tend
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
Uerror = Uex - U;
surf(x,y,abs(Uerror));
norm = max(max(abs(Uerror)))
