r=input('Enter the radius');
th=0:0.1:360;
for i=1:3600
   x(i)=r*cos(th(i));
   y(i)=r*sin(th(i));
%    x
%    y
   
end
 plot(x,y)   

