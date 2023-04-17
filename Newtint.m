function yint = Newtint(x,y,xx)
n = length(x);
if length(y)~=n, error('x and y must be same length'); end
b = zeros(n,n);
% assign dependent variables to the first column of b.
b(:,1) = y(:); % the (:) ensures that y is a column vector.

for j = 2:n
for i = 1:n-j+1
b(i,j) = (b(i+1,j-1)-b(i,j-1))/(x(i+j-1)-x(i));
end
end
B=b(1,:);
% use the finite divided differences to interpolate
xt = 1;
yint = b(1,1);
f=@(xx) b(1,1);
for j = 1:n-1
xt = xt*(xx-x(j));
f=@(xx) yint+ b(1,j+1)*xt*(xx-x(j));
yint = yint+b(1,j+1)*xt;
end
n=length(b);
nn=length(x);
n=2:n;
i=0:nn-1;
t=[i' x' y' b(:,2:end)];
l=length(t);
F=[repmat(' %15d',1,l),'\n'];
format short g
fprintf('               i               x              y  ');fprintf('%15i',n);fprintf('\n');
fprintf(F,t.');

end