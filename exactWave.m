function [ U ] = exactWave( tend,J )
%This function returns the exact solution of the Wave equation on at time
%tend on a grid of size J.
%

x = linspace(0,1,J);
y = linspace(0,1,J);

t = tend;
U = cos(sqrt(2)*pi*t) .* sin(pi*x)' * sin (pi*y);


end

