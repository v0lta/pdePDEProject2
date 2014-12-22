function [ U ] = exactWave( tend,J )
%This function returns the exact solution of the Wave equation on at time
%tend on a grid of size J.
%

[x,y] = meshgrid(linspace(0,1,J));

t = tend;
U = cos(sqrt(2)*pi*t) .* sin(pi*x) .* sin (pi*y);


end

