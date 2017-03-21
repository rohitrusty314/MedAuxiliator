function [flag] = classifyDefect(I)
[M,N] = size(I);

%DIVIDE IMAGE
%left falf
l=zeros(256,1);
for i = 1:M
    for j=1:(N/2)
      p=I(i,j);
      l(p+1,1)=l(p+1,1)+1;
    end
end

left = l(130:256,1);

%right half
r=zeros(256,1);
for i = 1:M
    for j=1:N
      p=I(i,j);
      r(p+1,1)=r(p+1,1)+1;
    end
end

right = r(130:256,1);


%get difference between left and right half
diff = abs(left(:,1) - right(:,1));


[val, ind] = max(diff);
ind=ind+130;

figure, imshow(I);
hold on;
count1=1;
count2=1;
count3=1;

%identify pixel values matching
for a=1:M
    for b=1:N    
        if((I(a,b)==ind))
         
            x1(count1)=a;
            y1(count1)=b;
            count1=count1+1;
        end
  
    end 
end
plot(y1,x1,'r*');
hold off;


%classify defects based on the difference between the left an the right
%half
if(ind>210)
    flag = 1;
elseif(ind>140 & ind <210)
    flag = 2;
elseif(ind<140)
    flag = 3;
end
end