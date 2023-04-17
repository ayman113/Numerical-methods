%%%%%%  made by: ayman abdalla A19ET4021 %%%%%%
      %%%%%% 2020/2021/2 %%%%%%%%
%%% Linkedin %%%
%%% https://www.linkedin.com/in/ayman-abdalla-b55634203 %%%

% example on how to use : 
% f=@(x) 2*x^2 +5*x; (the f(x) function  ) $(must be @(x))$
% X=[0 3 5]; (must be 3 points)
% es=0.1; (estimated error in %) or if not given, es=[];
% I=10; (number of iteration) or if not given, I=[];
% >> [X fx]=ParabolicInterp(f,x,I,es) 
function [X,Fx]= ParabolicInterp(f,x,I,es) 
n=length(x);
if nargin<=2 %checking input
    fprintf(2,'ERROR wrong input\nParabolicInterp(f,x,I,es)\nexample:\nf=@(x) x+1\nx=[1 2 3]\nI = 10 (number of iteration, if not given I=[])\nes = 0.5 (estimated error in percentage , if not given es=[])\n');
error('');
end
if n~=3
    fprintf(2,'ERROR\nx should be an array consists of three points !!!\n');
    error('example : x=[1 2 3]');
end
x1=x(1);
x3=x(3);
x2=x(2);
if isempty(I)
    I=15;
end
if isempty(es)
    es=0.05;
end
i=1;
ea=100;
while true
    fx1(i)=f(x1(i)); % calculating fx1,fx2, fx3,
    fx2(i)=f(x2(i));
    fx3(i)=f(x3(i));
    %substitute in the equation to calculate x4
    x4(i)=x2(i)-(0.5*(((((x2(i)-x1(i))^2)*(fx2(i)-fx3(i)))-(((x2(i)-x3(i))^2)*(fx2(i)-fx1(i))))/(((x2(i)-x1(i))*(fx2(i)-fx3(i)))-((x2(i)-x3(i))*(fx2(i)-fx1(i))))));
    fx4(i)=f(x4(i)); %calculate fx4
    if i~=1 %percentage error calculation
        ea(i)=abs((x4(i)-x4(i-1))/(x4(i)))*100;
    end
    if i==I||round(ea(i),4)<=es %break loop 
        break;
    end
    if x4(i)>=x2(i) %setting values of x1,x2,x3 for the next iteration 
        x1(i+1)=x2(i);
        x2(i+1)=x4(i);
        x3(i+1)=x3(i);
    else
        x1(i+1)=x1(i);
        x2(i+1)=x4(i);
        x3(i+1)=x2(i);
        
    end
    i=i+1;
end
i=1:i;
tab=[i' x1' x2' x3' fx1' fx2' fx3' x4' fx4' ea']; % design the output table
fprintf('i            x1              x2              x3            fx1               fx2            fx3             x4             fx4            ea\n');
fprintf('%i   %13.5f   %13.5f   %13.5f   %13.5f   %13.5f   %13.5f   %13.5f   %13.5f   %13.5f\n',tab');
X=x4(end);
Fx=fx4(end);
end