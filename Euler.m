%%%%%%  made by: ayman abdalla A19ET4021 %%%%%%
      %%%%%% 2020/2021/2 %%%%%%%%
%%% Linkedin %%%
%%% https://www.linkedin.com/in/ayman-abdalla-b55634203 %%%

% example on how to use : 
% fdy=@(x) 2*x^2 +5*x; (the function that needs to be intigrated) $(must be @(x))$
% fy=@(x) (2/3)*x^3 +(5/2)*x^2 +8; (the given true intigrated function, if true values to estimate error is not needed, use Euler1)
% xi=0;
% xo=5;
% Y=2; (the true initial value of y at xi)
% h=0.5;
% >> Euler(fdy,fy,xi,xo,Y,h)
function Euler(fdy,fy,xi,xo,Y,h)
if isempty(fy)
    fDY=sym(fdy);
    fy=int(fDY);
    fy=matlabFunction(fy);
end
X=xi:h:xo;
i=1;
while true
    FdY(i)=fdy(X(i),Y(i));
    FY(i)=fy(X(i));
    Yt(i)=FY(i);
    Et(i)=((Yt(i)-Y(i))/(Yt(i)))*100;
    if i==length(X)
        break;
    end
    Y(i+1)=Y(i)+FdY(i)*h;
    FY(i+1)=fy(X(i+1));
    Yt(i+1)=FY(i+1);
    i=i+1;
end
i=0:i-1;
t=[i'  X'  Y'  Yt'   Et'];
fprintf('i           X               Y euler           Y true         Et\n');
fprintf('%i   %13.5f    %13.5f     %13.5f %13.5f\n',t');
end