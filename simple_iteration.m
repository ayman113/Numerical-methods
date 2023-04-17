%%%%%%  made by: ayman abdalla A19ET4021 %%%%%%
      %%%%%% 2020/2021/2 %%%%%%%%
%%% Linkedin %%%
%%% https://www.linkedin.com/in/ayman-abdalla-b55634203 %%%

% example on how to use : 
% f=@(x) 2*x^2 +5*x; (the X=f(x) function ) $(must be @(x))$
% X=0;
% es=0.1; (estimated error in %) or if not given, es=[];
% maxit=10; (number of iteration) or if not given, maxit=[];
% >> simple_iteration(f,X, es , maxit)
function simple_iteration(f,X, es , maxit)
i=1;
if nargin==1
    error('the value of x should be entered !!');
elseif isempty(es)
    es=0.000001;
end
if isempty(maxit)
    maxit=50;
end
while true
    FX(i)=f(X(i));
    X(i+1)=FX(i);
    ea(i)=abs(((X(i+1)-X(i))/(X(i+1)))*100);
    if ea(i)<=es || i==maxit
        break;
    end
  i=i+1;
end
format short g
i=1:i;
X(end)=[];
t=[i'  X'  FX'  ea'];
fprintf('i           X               f(X)          ea\n');
fprintf('%i   %13.5f   %13.5f   %13.5f\n',t');
end