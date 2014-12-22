function U = exactHeat(tend,J)

%The script returns the exact solution of the Heat equation at tend
%in a grid of size J.

[x,y] = meshgrid(linspace(0,1,J));
%.* allows meshgrid X and Y. 

t = tend;
U = exp(-2*pi^2*t) .* sin(pi*x) .* sin (pi*y);
%surf(x,y,U);
end