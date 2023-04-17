%%%%%%  made by: ayman abdalla A19ET4021 %%%%%%
      %%%%%% 2020/2021/2 %%%%%%%%
%%% Linkedin %%%
%%% https://www.linkedin.com/in/ayman-abdalla-b55634203 %%%

% example on how to use : 
% f=@(x) x^3 + 5*x; $(must be @(x))$
% xL=0;
% xU=5;
% es=0.1; (estimated error in %) or if not given, es=[];
% maxit=10; (number of iteration) or if not given, maxit=[];
% >> bisection(f,xL,xU ,es , maxit)
function[]=bisection(f,xL,xU ,es , maxit)
if nargin<3
    error('the value of x should be entered !!');
elseif isempty(es)
    es=0.0001;
end
if isempty(maxit)
    maxit=50;
end
a=true;
i=1;
while a
    xR(i)=(xL(i)+xU(i))/2;
    fR(i)=f(xR(i));
    fL(i)=f(xL(i));
    if fR(i)*fL(i)>0
        xL(i+1)=xR(i);
        xU(i+1)=xU(i);
        s(i)="+";
    else
        xU(i+1)=xR(i);
        xL(i+1)=xL(i);
        s(i)="-";
    end
    if  i~=1
        ea(i)=abs((xR(i)-xR(i-1))/xR(i))*100;
    else
        ea=100;
    end
    if ea(i)<=es || i==maxit
        i=1:i;
        xL=xL(1:end-1);
        xU=xU(1:end-1);
        ea(1)=0;
        t=[i; xL;xR;xU;fL;fR;s;  ea;];
        fprintf('iteration      xL               xR              xU              f(xL)             f(xR)          sign           ea         \n');
        fprintf('%5.0f   %12.6f    %12.6f     %12.6f      %12.6f    %12.6f     %8s     %12.6f\n', t)
        break;
    end
    i=i+1;
end

end