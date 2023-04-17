%%%%%%  made by: ayman abdalla A19ET4021 %%%%%%
      %%%%%% 2020/2021/2 %%%%%%%%
%%% Linkedin %%%
%%% https://www.linkedin.com/in/ayman-abdalla-b55634203 %%%

% example on how to use : 
% es=0.05; (estimated error in %)
% f1=@(X) 10*X(1)+ 2*X(2) - X(3) -27 == 0   ; (the R1 function ) $(must be @(X)...==..)$
% f2=@(X) -3*X(1) - 5*X(2) + 2*X(3) +62 == 0; (the R2 function ) $(must be @(X)...==..)$
% f3=@(X) X(1) + X(2) + 6*X(3) +22 == 0; (the R3 function ) $(must be @(X)...==..)$
% ig=[0 0 0]; (initial guesses for x1,x2,x3)
% >> Siedel(es,f1,f2,f3,ig)
function []=Siedel(es,f1,f2,f3,ig)
XX=[sym('x1') sym('x2') sym('x3')];
F(1)=f1(XX);
F(2)=f2(XX);
F(3)=f3(XX);
% S=solve(F,XX);
j=1;
X=ig;
FF(j,1)=subs(F(1),XX(2:3),X(j,2:3));
X(j,1)=solve(FF(j,1));
ea(j,1)=100;
while true
    for i=1:nargin-2
        if j==1
            if i==2
                FF(j,i)=subs(F(i),XX(1:2:3),X(j,1:2:3));
                X(j,i)=solve(FF(j,i),XX(i));
                ea(j,i)=abs((X(j,i)-ig(j,i))/X(j,i))*100;
            elseif i==3
                FF(j,i)=subs(F(i),XX(1:2),X(j,1:2));
                X(j,i)=solve(FF(j,i),XX(i));
                ea(j,i)=abs((X(j,i)-ig(j,i))/X(j,i))*100;
            end
        else
            if i==1
                FF(j,i)=subs(F(i),XX(2:3),X(j-1,2:3));
                X(j,i)=solve(FF(j,i),XX(i));
                ea(j,i)=abs((X(j,i)-X(j-1,i))/X(j,i))*100;
            elseif i==2
                X(j,2:3)=X(j-1,2:3);
                FF(j,i)=subs(F(i),XX(1:2:3),X(j,1:2:3));
                X(j,i)=solve(FF(j,i),XX(i));
                ea(j,i)=abs((X(j,i)-X(j-1,i))/X(j,i))*100;
            else
                FF(j,i)=subs(F(i),XX(1:2),X(j,1:2));
                X(j,i)=solve(FF(j,i),XX(i));
                ea(j,i)=abs((X(j,i)-X(j-1,i))/X(j,i))*100;
            end
        end
    end
    if ea(j,1)<=es && ea(j,1)<=es && ea(j,1)<=es
        break;
    end
    j=j+1;
end
FF=vpa(FF,6);
fprintf('equations: \n');
disp(FF);
x1=X(:,1);
x2=X(:,2);
x3=X(:,3);
ea1=ea(:,1);
ea2=ea(:,2);
ea3=ea(:,3);
j=[1:j];
T=[j' x1 x2 x3 ea1 ea2 ea3];
fprintf('iteration      x1                x2                x3                ea 1                ea 2                ea 3\n');
fprintf('%5.0i   %12.6f    %12.6f     %12.6f           %12.6f      %12.6f        %12.6f\n', T');
end