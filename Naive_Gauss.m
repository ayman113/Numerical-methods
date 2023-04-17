%%%%%%  made by: ayman abdalla A19ET4021 %%%%%%
      %%%%%% 2020/2021/2 %%%%%%%%
%%% Linkedin %%%
%%% https://www.linkedin.com/in/ayman-abdalla-b55634203 %%%

% example on how to use : 
% R=[1 2 3;4 5 6;7 8 9];
% b=[10 20 30];
% >> Naive_Gauss(R,b)
function[]=Naive_Gauss(R,b)
format short g
[m n]=size(R);
if m~=n
    error('wrong matrix input');
end
if ~iscolumn(b)
    b=b';
end
[bm bn]=size(b);
if bm~=n
  error('wrong matrix input');
end
    j=1;
    disp([R b]);
for i=1:m-1
    disp('=========================');
    disp(['step ', num2str(j),' :']);
    cons(i+1)=(R(i+1,i)/R(i,i));
    fprintf('constant =(%f/%f)*row %i , =%f\n',R(i+1,i),R(i,i),i,cons(i+1));
    R(i+1,:)=R(i+1,:)-((R(i+1,i)/R(i,i))*R(i,:));
    b(i+1)=b(i+1)-(cons(i+1)*b(i));
    disp('R=');
    disp(R);
    disp('b=');
    disp(b);
    j=j+1;
    if i~=(n-1)
        disp('=========================');
    disp(['step ', num2str(j),' :']);
        cons(i+2)=R(i+2,i)/R(i,i);
        fprintf('constant =(%f/%f)* row%i , =%f\n',R(i+2,i),R(i,i),i,cons(i+2));
        R(i+2,:)=R(i+2,:)-((R(i+2,i)/R(i,i))*R(i,:));
        b(i+2)=b(i+2)-(cons(i+2)*b(i));
    disp('R=');
    disp(R);
    disp('b=');
    disp(b);
    j=j+1;
    end
end
for ii=n:-1:1
    switch ii
        case n
            x(ii)=b(ii)/R(ii,ii);
        case n-1
            x(ii)=(b(ii)-(x(ii+1)*R(ii,ii+1)))/R(ii,ii);
        case n-2
            x(ii)=(b(ii)-(x(ii+1)*R(ii,ii+1))-(x(ii+2)*R(ii,ii+2)))/R(ii,ii);
        case n-3
            x(ii)=(b(ii)-(x(ii+1)*R(ii,ii+1))-(x(ii+2)*R(ii,ii+2))-(x(ii+3)*R(ii,ii+3)))/R(ii,ii);
        case n-4
            x(ii)=(b(ii)-(x(ii+1)*R(ii,ii+1))-(x(ii+2)*R(ii,ii+2))-(x(ii+3)*R(ii,ii+3))-(x(ii+4)*R(ii,ii+4)))/R(ii,ii);
        case n-5
                        x(ii)=(b(ii)-(x(ii+1)*R(ii,ii+1))-(x(ii+2)*R(ii,ii+2))-(x(ii+3)*R(ii,ii+3))-(x(ii+4)*R(ii,ii+4))-(x(ii+5)*R(ii,ii+5)))/R(ii,ii);

    end
    
    disp(['x',num2str(ii),' = ',num2str(x(ii))]);
end