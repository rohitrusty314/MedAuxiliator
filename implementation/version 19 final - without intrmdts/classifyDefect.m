function [flag] = classifyDefect(I)


% clear all;
%  I = rgb2gray(imread('E:\CBIR\implementation\temp\histogram\imges\29.jpg'));
% I = rgb2gray(imread('E:\CBIR\implementation\temp\histogram\imges\660.jpg'));
%  I = rgb2gray(imread('E:\CBIR\implementation\temp\histogram\imges\846.jpg'));
% I = rgb2gray(imread('E:\CBIR\implementation\temp\histogram\imges\806.jpg'));
% % I = rgb2gray(imread('E:\CBIR\implementation\temp\histogram\imges\334.jpg'));
%  I = rgb2gray(imread('E:\CBIR\implementation\temp\histogram\imges\1085.jpg'));
 

[M,N] = size(I);
% leftHalf = zeros(M,N/2);

l=zeros(256,1);
for i = 1:M
    for j=1:(N/2)
      p=I(i,j);
      l(p+1,1)=l(p+1,1)+1;
    end
end

left = l(130:256,1);
figure;
bar(left);


r=zeros(256,1);
for i = 1:M
    for j=1:N
      p=I(i,j);
      r(p+1,1)=r(p+1,1)+1;
    end
end

right = r(130:256,1);
figure;
bar(right);


diff = abs(left(:,1) - right(:,1));

figure;
bar(diff);

[val, ind] = max(diff);
val
ind
ind=ind+130;
ind
figure, imshow(I);
hold on;
count1=1;
count2=1;
count3=1;

for a=1:M
    for b=1:N    
        if((I(a,b)==ind))
         
            x1(count1)=a;
            y1(count1)=b;
            count1=count1+1;
        end
        
         if((I(a,b)< (ind+2)) & (I(a,b)> (ind-2)) )
            x2(count2)=a;
            y2(count2)=b;
            count2=count2+1;
         end
        
        
          
    end 
end
% 
% plot(y2,x2,'y*');
plot(y1,x1,'r*');


hold off;

if(ind>210)
    flag = 1;
elseif(ind>140 & ind <210)
    flag = 2;
elseif(ind<140)
    flag = 3;
end
flag
end