I=imread('E:\CBIR\implementation\temp\def\806.jpg');
figure;
imshow(I);
hold on;
% patch([0 5 10], [0 10 0], [1 0 0]);
% hold off;
th=0:0.1:360;
r=77;
x=200;
y=200;
%  for ITR=1:3600
%                     x(ITR)=r*cos(th(ITR))+200;
%                     y(ITR)=r*sin(th(ITR))+200;
%                 end
                plot(x,y,'*r','LineWidth',2,'MarkerSize',20);
           