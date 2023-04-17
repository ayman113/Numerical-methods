%%%%%%  made by: ayman abdalla A19ET4021 %%%%%%
      %%%%%% 2020/2021/2 %%%%%%%%
%%% Linkedin %%%
%%% https://www.linkedin.com/in/ayman-abdalla-b55634203 %%%

% example on how to use : 
% mod='max' (to find maximum value) or
% mod='min' (to find minimum value)
% f=@(x) 2*x^2 +5*x; (the f(x) function ) $(must be @(x))$
% xL=0;
% xU=5;
% es=0.1; (estimated error in %) or if not given, es=[];
% maxit=10; (number of iteration) or if not given, maxit=[];
% >> golden(mod,f,xL,xU, es , maxit)
function[]=golden(mod,f,xL,xU, es , maxit)
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
    d(i)=(((sqrt(5)+1)/2)-1)*(xU(i)-xL(i));
    x1(i)=xL(i)+d(i);
    x2(i)=xU(i)-d(i);
    f1(i)=f(x1(i));
    f2(i)=f(x2(i));
    switch mod
        case 'max'
            if f1(i)>=f2(i)
                xL(i+1)=x2(i);
                xU(i+1)=xU(i);
                xopt(i)=x1(i);
            else
                xU(i+1)=x1(i);
                xL(i+1)=xL(i);
                xopt(i)=x2(i);
            end
        case 'min'
            if f1(i)>=f2(i)
                xU(i+1)=x1(i);
                xL(i+1)=xL(i);
                xopt(i)=x2(i);
            else
                xL(i+1)=x2(i);
                xU(i+1)=xU(i);
                xopt(i)=x1(i);
            end
    end
    ea(i)=(2-((sqrt(5)+1)/2))*abs((xU(i)-xL(i))/xopt(i))*100;
    if ea(i)<=es || i==maxit
        i=1:i;
        xL=xL(1:end-1);
        xU=xU(1:end-1);
        t=[i; xL;x2;x1;xU;xopt;f2;f1;d; ea]; 
        fprintf('iteration      xL              x2                  x1              xU           xopt            f(x2)           f(x1)                 d                ea      \n');
        fprintf('%5.0i   %12.8f    %12.8f        %12.8f    %12.8f    %12.8f    %12.8f    %12.8f        %12.8f    %12.8f\n', t)
        break;
    end
    i=i+1;
end

end