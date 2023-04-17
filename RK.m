%%%%%%  made by: ayman abdalla A19ET4021 %%%%%%
      %%%%%% 2020/2021/2 %%%%%%%%
%%% Linkedin %%%
%%% https://www.linkedin.com/in/ayman-abdalla-b55634203 %%%

% example on how to use : 
% fdy=@(x,y) 2*x^2 +5*x; (the function that needs to be intigrated) %(must be @(x,y))%
% fy=@(x,y) (2/3)*x^3 +(5/2)*x^2 +8; (the given true intigrated function, if true values to estimate error is not needed, use RK1)
% xi=0;
% xo=5;
% Y=2; (the true initial value of y at xi)
% h=0.5;
% type='2H'; (for second order RK-Heun)
% type='2M'; (for second order RK-Midpoint)
% type='2R'; (for second order RK-Ralston’s)
% type='3'; (for second third RK)
% type='4'; (for second fourth RK)
% >> RK(fdy,fy,xi,xo,Y,h,type)
function RK(fdy,fy,xi,xo,Y,h,type)
if isempty(fy)
    fDY=sym(fdy);
    fy=int(fDY);
    fy=matlabFunction(fy);
end
X=xi:h:xo;
i=1;
switch type
    case '2H'
        while true
            K1(i)=fdy(X(i),Y(i));
            K2(i)=fdy(X(i)+h,Y(i)+K1(i)*h);
            FY(i)=fy(X(i));
            Yt(i)=FY(i);
            Et(i)=((Yt(i)-Y(i))/(Yt(i)))*100;
            if i==length(X)
                break;
            end
            Y(i+1)=Y(i)+0.5*(K1(i)+K2(i))*h;
            FY(i+1)=fy(X(i+1));
            Yt(i+1)=FY(i+1);
            i=i+1;
        end
        i=0:i-1;
        t=[i'  X'  K1'  K2'  Y'  Yt'   Et'];
        fprintf('i           X               K1                K2             Y Rk-2 Heun         Y true         Et\n');
        fprintf('%i   %13.5f    %13.5f     %13.5f    %13.5f     %13.5f %13.5f\n',t');
    case '2M'
        while true
            K1(i)=fdy(X(i),Y(i));
            K2(i)=fdy(X(i)+0.5*h,Y(i)+K1(i)*h*0.5);
            FY(i)=fy(X(i));
            Yt(i)=FY(i);
            Et(i)=((Yt(i)-Y(i))/(Yt(i)))*100;
            if i==length(X)
                break;
            end
            Y(i+1)=Y(i)+K2(i)*h;
            FY(i+1)=fy(X(i+1));
            Yt(i+1)=FY(i+1);
            i=i+1;
        end
        i=0:i-1;
        t=[i'  X'  K1'  K2'  Y'  Yt'   Et'];
        fprintf('i           X               K1                K2             Y Rk-2 mid         Y true         Et\n');
        fprintf('%i   %13.5f    %13.5f     %13.5f    %13.5f     %13.5f %13.5f\n',t');
    case '2R'
        while true
            K1(i)=fdy(X(i),Y(i));
            K2(i)=fdy(X(i)+(3/4)*h,Y(i)+(3/4)*K1(i)*h);
            FY(i)=fy(X(i));
            Yt(i)=FY(i);
            Et(i)=((Yt(i)-Y(i))/(Yt(i)))*100;
            if i==length(X)
                break;
            end
            Y(i+1)=Y(i)+((1/3)*K1(i)+(2/3)*K2(i))*h;
            FY(i+1)=fy(X(i+1));
            Yt(i+1)=FY(i+1);
            i=i+1;
        end
        i=0:i-1;
        t=[i'  X'  K1'  K2'  Y'  Yt'   Et'];
        fprintf('i           X               K1                K2             Y Rk-2 Ralston       Y true         Et\n');
        fprintf('%i   %13.5f    %13.5f     %13.5f    %13.5f     %13.5f     %13.5f\n',t');
    case '3'
        while true
            K1(i)=fdy(X(i),Y(i));
            K2(i)=fdy(X(i)+0.5*h,Y(i)+0.5*K1(i)*h);
            K3(i)=fdy(X(i)+h,Y(i)-K1(i)*h+2*K2(i)*h);
            FY(i)=fy(X(i));
            Yt(i)=FY(i);
            Et(i)=((Yt(i)-Y(i))/(Yt(i)))*100;
            if i==length(X)
                break;
            end
            Y(i+1)=Y(i)+(1/6)*(K1(i)+4*K2(i)+K3(i))*h;
            FY(i+1)=fy(X(i+1));
            Yt(i+1)=FY(i+1);
            i=i+1;
        end
        i=0:i-1;
        t=[i'  X'  K1'  K2' K3'  Y'  Yt'   Et'];
        fprintf('i           X               K1                 K2                 K3             Y Rk-3            Y true         Et\n');
        fprintf('%i   %13.5f    %13.5f     %13.5f     %13.5f    %13.5f     %13.5f %13.5f\n',t');
    case '4'
        while true
            K1(i)=fdy(X(i),Y(i));
            K2(i)=fdy(X(i)+0.5*h,Y(i)+0.5*K1(i)*h);
            K3(i)=fdy(X(i)+0.5*h,Y(i)+0.5*K2(i)*h);
            K4(i)=fdy(X(i)+h,Y(i)+K3(i)*h);
            FY(i)=fy(X(i));
            Yt(i)=FY(i);
            Et(i)=((Yt(i)-Y(i))/(Yt(i)))*100;
            if i==length(X)
                break;
            end
            Y(i+1)=Y(i)+(1/6)*(K1(i)+2*K2(i)+2*K3(i)+K4(i))*h;
            FY(i+1)=fy(X(i+1));
            Yt(i+1)=FY(i+1);
            i=i+1;
        end
        i=0:i-1;
        t=[i'  X'  K1'  K2' K3'  K4'  Y'  Yt'   Et'];
        fprintf('i           X                K1                K2                K3                K4             Y Rk-4            Y true          Et\n');
        fprintf('%i   %13.5f    %13.5f     %13.5f     %13.5f     %13.5f    %13.5f     %13.5f %13.5f\n',t');
        
end
end