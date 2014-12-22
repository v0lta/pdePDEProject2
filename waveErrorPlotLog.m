clear all;
%Find the error of the wave Equation.


tend = 0.1
mu = 0.2;

timesteps = logspace(-4,-1,20);

maxerror = zeros(length(timesteps),1);

for j = 1:length(timesteps)
    100*j/length(timesteps)
    
    dt = timesteps(j);
    
        
    % dt = 0.01;
    % J = 30;
    %mu = dt/dx^2
    dx = sqrt(dt^2/mu);
    dy = dx;
    %dx = 1/J;
    J = round(1/dx);
       
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
    
    end
    Uex = exactWave(t*dt,J);
    Udiff = Uex - U;
    Udiff = abs(Udiff);
    maxerror(j) = max(max(Udiff));
    
end
%plot(timesteps,maxerror);
loglog(timesteps,maxerror);