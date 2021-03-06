clear all;

%This script attemts to find the solution of the transport equation in two
%dimensions.

tend = 0.1;
mu = 0.3;


timesteps = logspace(-1,-4,20);

maxerror = zeros(length(timesteps),1);

for j = 1:length(timesteps)
    100*j/length(timesteps)
    
    dt = timesteps(j);
    
    
    
    % dt = 0.01;
    % J = 30;
    dx = dt/mu;
    dy = dx;
    J = round(1/dx);
    
    % %x in [0,1].
    % dx = 1/J;
    % %y in [0,1];
    % dy = 1/J;
    % %equal spacing in x and y direction.
    % mu = dt/dx;
    
    [x,y] = meshgrid(linspace(0,1,J));
    
    %the boundary conditions are zero (of homogeneous diriclet type).
    %the initial solution is u0(x,y) = sin(pi x) sin(pi y).
    U = sin(pi*x).*sin(pi*y);
    U1 = zeros(J);
    U2 = zeros(J);
    %time loop
    
    Uex=zeros(J);
    for t = 1:(tend/dt)
        U1 = zeros(J);
        U2 = zeros(J);
        elements = 2:J-1;
        for i = 1:1:J
            %compute the columns where x is const.
            U1(elements,i) = mu*U(elements+1,i);
            %compute the columns where y is const.
            U2(i,elements) = mu*U(i,elements+1);
        end
        Unew = (1 - 2*mu) .* U + U1 + U2;
        U = Unew;
        Uex = exactTranport(t*dt,J);
        Udiff = Uex - Unew;
        Udiff = sqrt(Udiff.^2);
        %     surf(x,y,Udiff);
        %     axis([0 1 0 1 -1 1 -1 1]);
        %     view(180+45,30)
        %     M(t)= getframe;
        
        %     pause;
    end
    
    maxerror(j) = max(max(Udiff));
    
end

loglog(timesteps,maxerror);


%compute the exact solution:
% Uex = exactTranport(tend,J);
% Uerror = U - Uex;
% surf(x,y,Uerror);
% norm = max(max(abs(Uerror)))
