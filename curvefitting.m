%%%%%%  made by: ayman abdalla A19ET4021 %%%%%%
      %%%%%% 2020/2021/2 %%%%%%%%
%%% Linkedin %%%
%%% https://www.linkedin.com/in/ayman-abdalla-b55634203 %%%

      % chapter 6 : curve fitting 
% example on how to use : 
% x=[0 1 2 3 4];
% y=[2 3 7 1 4];
% mode=1; (for linear equation :  y=ao+a1x )
% mode=2; (for exponential equation :  y=a(e^bx) )
% mode=3; (for power equation :  y=ax^b )
% mode=4; (for saturated-grow-rate equation : y=a(x/(b+x) )
% >> fit=curvefitting(x, y,mode )
%%%% later to interpolate if needed %%%%%
% >> fit(20)    %(to find the value of y at x=20)      %%(for mode=1)%%
% >> fit{1}(20) %(to find the value of y at x=20)      %%(for mode=2)%%
% >> fit{2}(20) %(to find the value of ln(y) at x=20)  %%(for mode=2)%%
% >> fit{1}(20) %(to find the value of y at x=20)      %%(for mode=3)%%
% >> fit{2}(20) %(to find the value of Log(y) at x=20) %%(for mode=3)%%
% >> fit{1}(20) %(to find the value of y at x=20)      %%(for mode=4)%%
% >> fit{2}(20) %(to find the value of 1/y at x=20)    %%(for mode=4)%%
function [f]=curvefitting(x, y,mode )
n=length(x);
if n~=length(y) % check input
    error('arrays should be in the same length');
elseif nargin<=2 
    fprintf(2,' 1 : y=ao+a1x\n 2 : y=a(e^bx)\n 3 : y=ax^b\n 4 : y=a(x/(b+x))\n');
    error('please enter the curve equation!! example : cf(x,y,1)');
end
if mode==1
    mode='1';
elseif mode==2
    mode='2';
elseif mode==3
    mode='3';
elseif mode==4
    mode='4';
end
switch mode
    case '1' %y=ao+a1x
        xy=x.*y;
        x2=x.^2;
        sumx2=sum(x2);
        sumx=sum(x);
        sumy=sum(y);
        sumxy=sum(xy);
        xdash=mean(x);
        ydash=mean(y);
        a1=((n*sumxy-(sumx*sumy))/(n*sumx2-(sumx^2)));
        ao=ydash-(a1*xdash);
        f=@(X) ao+X.*a1;
        y_ydash2=(y-ydash).^2;
        st=sum(y_ydash2);
        y_ao_a1x2=(y-ao-(a1.*x)).^2;
        sr=sum(y_ao_a1x2);
        sy=sqrt(st/(n-1));
        syx=sqrt(sr/(n-2));
        r2=(st-sr)/st;
        r=sqrt(r2);
        Y=f(x);
        i=1:n;
        format short g
        A=[i' x' y' x2' xy' Y' y_ydash2' y_ao_a1x2'];
        fprintf('n             x              y              x^2            xy             ao-x*a1        y-y`^2        (y-ao-x*a1)^2\n');
        fprintf('%i %15.3f %15.3f %15.3f %15.3f %15.3f %15.3f %15.3f\n',A');
        a=[sumx sumy sumx2 sumxy st sr];
        fprintf('--------------------------------------------------------------------------------------------------------------------\nsum : %11.3f %15.3f %15.3f %15.3f                 %15.3f %15.3f\n',a);
        fprintf('--------------------------------------------------------------------------------------------------------------------\n');
        fprintf('ao = %0.4f\na1 = %0.4f\nSt = %0.4f\nSr = %0.4f\nSy = %0.4f\nSy/x = %0.4f\nr^2 = %0.5f\nr = %0.5f\n',ao,a1,st,sr,sy,syx,r2,r);
        fprintf('--------------------------------------------------------------------------------------------------------------------\n');
        plot(x,y,'o r',x,Y,'LineWidth',2);
        xlabel('X')
        ylabel('Y')
        grid on
    case '2' %y=a(e^bx)
        lny=log(y);
        x2=x.^2;
        lnyx=lny.*x;
        sumx=sum(x);
        sumlny=sum(lny);
        sumx2=sum(x2);
        sumlnyx=sum(lnyx);
        xdash=mean(x);
        lnydash=mean(lny);
        b=(n*sumlnyx-(sumx*sumlny))/(n*sumx2-(sumx^2));
        lna=lnydash-b*xdash;
        f{2}=@(X) lna +b.*X;
        a=exp(lna);
        f{1}=@(X) a.*exp(b*X);
        i=1:n;
        A=[i' x' y' lny' x2' lnyx'];
        fprintf('n             x              y              lny            x^2             xlny\n');
        fprintf('%i %15.3f %15.3f %15.3f %15.3f %15.3f\n',A');
        aa=[sumx sumlny sumx2 sumlnyx];
        fprintf('--------------------------------------------------------------------------------------------------------------------\nsum : %11.3f                 %15.3f %15.3f%15.3f\n',aa);
        fprintf('--------------------------------------------------------------------------------------------------------------------\n');
        fprintf('lna = %0.4f\na = %0.4f\nb = %0.4f\n',lna,a,b);
        fprintf('--------------------------------------------------------------------------------------------------------------------\n');
        Y=f{1}(x);
        subplot(2,1,1);
        plot(x,y,'o r',x,Y,'LineWidth',2);
        lnY=f{2}(x);
        xlabel('X')
        ylabel('Y')
        grid on
        title('y = a*e^b^*^x')
        subplot(2,1,2);
        plot(x,lny,'o g',x,lnY,'b','LineWidth',2);
        xlabel('X')
        ylabel('lnY')
        grid on
        title('lny = lna +b*x')
    case '3' %y=ax^b
        logx=log10(x);
        logy=log10(y);
        logx2=logx.^2;
        logxy=logx.*logy;
        sumlogx=sum(logx);
        sumlogy=sum(logy);
        sumlogx2=sum(logx2);
        sumlogxy=sum(logxy);
        logxdash=mean(logx);
        logydash=mean(logy);
        b=(n*sumlogxy-(sumlogx*sumlogy))/(n*sumlogx2-(sumlogx^2));
        loga=logydash-b*logxdash;
        a=10^loga;
        f{2}=@(X) loga + b.*log10(X);
        f{1}=@(X) a.*(X.^b);
        logY=f{2}(x);
        Y=f{1}(x);
        
        i=1:n;
        A=[i' x' y' logx' logy' logx2' logxy'];
        fprintf('n             x              y           log(x)            log(y)           log(x)^2          log(x)log(y)\n');
        fprintf('%i %15.3f %15.3f %15.3f %15.3f %15.3f %15.3f\n',A');
        aa=[sumlogx sumlogy sumlogx2 sumlogxy];
        fprintf('--------------------------------------------------------------------------------------------------------------------\nsum :                                 %11.3f%15.3f %15.3f%15.3f\n',aa);
        fprintf('--------------------------------------------------------------------------------------------------------------------\n');
        fprintf('log(a) = %0.4f\na = %0.4f\nb = %0.4f\n',loga,a,b);
        fprintf('--------------------------------------------------------------------------------------------------------------------\n');
        subplot(2,1,1);
        plot(x,y,'o r',x,Y,'LineWidth',2);
        xlabel('X')
        ylabel('Y')
        grid on
        title('y = a x ^b')
        subplot(2,1,2);
        plot(logx,logy,'o g',logx,logY,'b','LineWidth',2);
        xlabel('Log X')
        ylabel('Log Y')
        grid on
        title('log y = log a+ b log x')

    case '4' % y=a(x/(b+x))
        l_x=1./x;
        l_x2=l_x.^2;
        l_y=1./y;
        l_yx=l_x.*l_y;
        sumx=sum(x);
        sumy=sum(y);
        suml_x=sum(l_x);
        suml_y=sum(l_y);
        suml_x2=sum(l_x2);
        suml_yx=sum(l_yx);
        b_a=(n*suml_yx-(suml_x*suml_y))/(n*suml_x2-(suml_x^2));
        l_a=mean(l_y)-b_a*mean(l_x);
        a=1/l_a;
        b=a*b_a;
        f{2}=@(X) b_a.*(1./X)+l_a;
        f{1}=@(X) a.*((X)./(X+b));
        l_Y=f{2}(x);
        Y=f{1}(x);
        
        i=1:n;
        A=[i' x' y' l_x' l_y' l_x2' l_yx'];
        fprintf('n             x              y              1/x            1/y             1/x^2           1/(xy)\n');
        fprintf('%i %15.3f %15.3f %15.3f %15.3f %15.3f %15.3f\n',A');
        aa=[sumx sumy suml_x suml_y suml_x2 suml_yx];
        fprintf('--------------------------------------------------------------------------------------------------------------------\nsum : %11.3f  %15.3f   %11.3f %15.3f %15.3f%15.3f\n',aa);
        fprintf('--------------------------------------------------------------------------------------------------------------------\n');
        fprintf('b/a = %0.4f\n1/a = %0.4f\nb = %0.4f\na = %0.4f\n',b_a,l_a,b,a);
        fprintf('--------------------------------------------------------------------------------------------------------------------\n');
        subplot(2,1,1);
        plot(x,y,'o r',x,Y,'LineWidth',2);
        xlabel('X')
        ylabel('Y')
        grid on
        title('y = a*(x/(b+x))')
        subplot(2,1,2);
        plot(l_x,l_y,'o g',l_x,l_Y,'b','LineWidth',2);
        xlabel('1/x')
        ylabel('1/y')
        grid on
        title('1/y = b/a * 1/x + 1/a')
end

end 
