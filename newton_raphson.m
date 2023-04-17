%%%%%%  made by: ayman abdalla A19ET4021 %%%%%%
      %%%%%% 2020/2021/2 %%%%%%%%
%%% Linkedin %%%
%%% https://www.linkedin.com/in/ayman-abdalla-b55634203 %%%

% example on how to use : 
% f=@(x) 2*x^2 +5*x; (the f(x) function without differentiation ) $(must be @(x))$
% X=1; (initial guess)
% es=0.1; (estimated error in %) or if not given, es=[];
% maxit=10; (number of iteration) or if not given, maxit=[];
% >> newton_raphson(f,X, es , maxit)
function[]=newton_raphson(f,X, es , maxit)
syms x;
df=eval(['@(x)' char(diff(f(x)))]); %%a way to calculate the diffrenttiation of a function handle
if nargin==1
    error('the value of x should be entered !!');
elseif isempty(es)
    es=0.0001;
end
if isempty(maxit)
    maxit=50;
end
i=1;
a=true;
while a
    X(i+1)= X(i)-(f(X(i))/df(X(i)));
    ea(i)=((X(i+1)-X(i))/X(i+1))*100;
    ea(i)=abs(ea(i));
    if ea(i)<=es || i==maxit
        i=0:i;
        ea=[0 ea];
        for ii=1:length(X)
            DF(ii)=df(X(ii));
            F(ii)=f(X(ii));
        end
        t=[i; X;  ea;F;DF]; 
        fprintf('iteration      x                ea                f(x)           df(x)\n');
        fprintf('%5.0f   %12.8f    %12.8f        %12.8f    %12.8f\n', t);
        break;
    end
    i=i+1;
end

end