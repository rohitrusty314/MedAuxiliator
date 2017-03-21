% function bargraphplot
%% choosing 27 random images in query image set
QuerySet = [100; 111; 130; 200; 210; 222; 300; 310; 315; 400; 412; 420;  503; 509; 522;  600; 618; 627;  700; 714; 725;  800; 801; 810;  900; 909; 919; ];

%
% I1 = zeros(27,900);
% %% compute relevant retrieved images
%
% for i= 1:27
%     I= calcsimilar(QuerySet(i));
%     I=I';
%     I1(i,1:900)= I;
% end
res= zeros(4,9);
boundry_low = [100, 200,300,400,500,600,700,800,900];
boundry_up  = [199, 299,399,499,599,699,799,899,999];
load I1;

for temp=1:4
    bar_res = zeros(9,3);
    count=1;
    for i=1:9
        for j=1:3
            I=I1(count,1:100);
            for k=1:10*temp
                if((I(k)>=boundry_low(i))&&(I(k)<=boundry_up(i)))
                    bar_res(i,j)=bar_res(i,j)+1;
                end
            end
            count= count+1;
        end
    end
    res(temp,1:9)= mean(bar_res');
end

figure;
bar(res),legend('sea shore','monument','bus','dinosaur','elephant','rose','horse','mountain','dishes');