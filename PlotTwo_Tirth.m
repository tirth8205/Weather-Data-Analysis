clear; close all; fclose all; clc;
a=1;
b=1;
c=1;
z=[0,0,0,0,0,0,0,0,0,0];
d=1;
x=linspace(1,500,10);
y=linspace(1,500,10);
while (c<=10)
    z(c)=a^2+b^2;
    a=a+1;
    b=b+1;
    c=c+1;
end

% while (d<=10)
%    

    [X,Y,Z] = meshgrid(1:0.5:10,1:20,1:20);
    X1=repmat(x,10,1);
    Y1=repmat(y,10,1);
    Z1=repmat(z,10,1);
    surf(X1,Y1,Z1);
%     surf(x(d),y(d),z(d))
%     d=d+1;
%     colorbar
%     
% end

    
    

