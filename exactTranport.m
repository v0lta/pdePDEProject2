function U = exactTranport(tend,J)

%The script returns the exact solution of the Heat equation.

v = -1; %should be switched if needed

x = linspace(0,1,J);
y = linspace(0,1,J);

stopper = 1 + v*tend;
stopper = stopper*(J-1)+1;
stopper = ceil(stopper);
% stopper = J;

U =  sin(pi*(x-v*tend))' * sin (pi*(y-v*tend));
U(stopper:end,:)=0;
U(:,stopper:end) = 0;

U(:,end)=0;
U(:,1)=0;
U(1,:)=0;
U(end,:)=0;
%surf(x,y,U);
end