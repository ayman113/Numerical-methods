%%%%%%  made by: ayman abdalla A19ET4021 %%%%%%
      %%%%%% 2020/2021/2 %%%%%%%%
%%% Linkedin %%%
%%% https://www.linkedin.com/in/ayman-abdalla-b55634203 %%%

% example on how to use : 
% f=@(x) 2*x^2 +5*x; (the f(x) function ) $(must be @(x))$
% x_1=0 (the value of x-1)
% x0=1; (the value of x0)
% es=0.1; (estimated error in %) or if not given, es=[];
% maxit=10; (number of iteration) or if not given, maxit=[];
% >> secant(f,x_1,x0 ,es , maxit)
function[]=secant(f,x_1,x0 ,es , maxit)
maxit=maxit+2;
if nargin<3
    error('the value of x should be entered !!');
elseif isempty(es)
    es=0.0001;
end
if isempty(maxit)
    maxit=50;
end
i=1;
a=true;
X_l=x_1;
Xo=x0;
while a
    FX_l(i)=f(X_l(i));
    FXo(i)=f(Xo(i));
    X(i)= Xo(i)-((FXo(i)*(X_l(i)-Xo(i)))/(FX_l(i)- FXo(i)));
    ea(i)=((X(i)-Xo(i))/X(i))*100;
    ea(i)=abs(ea(i));
    if ea(i)<=es || i==maxit-2
       break;
    end
    i=i+1;
    X_l(i)=Xo(i-1);
Xo(i)=X(i-1);
end
format short g
i=1:i;
t=[i'  X_l'  FX_l'  Xo'  FXo'  X'  ea' ];
fprintf('i           X-1            f(X-1)           X0             f(X0)             X               ea\n');
fprintf('%i   %13.5f   %13.5f   %13.5f   %13.5f   %13.5f   %13.5f\n',t');
end