clear all;

I = imread('E:\CBIR\implementation\temp\def\29.jpg'); 
I = rgb2gray(I);

[M,N]= size(I);
filter3 = fspecial('prewitt');
filter3=transpose(filter3);
Is=filter2(filter3,I)/255;
 
filter=fspecial('unsharp',.5);
Iu=filter2(filter,I)/255;


[I1] = filter_func(Iu);
[I2] = filter_func(Is);



I3= I1 | I2;



Fedgemapk1 = I3;
c=1;
 for l=1:M
    for k=1:N
        edgemap(l,k,c) = I3(l,k);        
    end
 end
 c = c + 1;       
       
       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
         Rk = edgemap(:,:,1);
         psi_rk = tanh(0.25*Rk);
         windowcount=0;
         tempcount=0;
         for m=3:5:M
             for n=3:5:N
                 esum=0;
                 for p=m-2:m+2
                     for q=n-2:n+2
                         esum=esum+psi_rk(p,q);
                     end
                 end
                 if(esum>0)
                     windowcount = windowcount + 1;
                     tempcount = tempcount + 1;
                     temp(tempcount,1)= esum/25;
                     ek(windowcount,1)=temp(tempcount,1);
                     ek(windowcount,2)=m;
                     ek(windowcount,3)=n;
                 end
             end
         end
         
         load tumorEnergy;
         count = 0;
         v = 1;
         for l=1:size(ek)
             count = 0;
             for k = 1:size(ektumor)
                 if(ektumor(k,1) == ek(l,1))
                     count = count + 1;
                     for id = 2:size(ektumor)
                         e = energy((ek(l,2)+ektumor(id,2)),(ek(l,3)+ektumor(id,3)),psi_rk);
                         if(ektumor(id,1) == e)
                             count = count + 1;
                         else
                             break;
                         end
                     end
                 end
                 
             end
             mat(v,1) = count;
             mat(v,2) = ek(l,2);
             mat(v,3) = ek(l,3);
             v = v + 1;
         end
        figure;
        imshow(I);
        hold on;
        r=25;
        th=0:0.1:360;
        total = size(ektumor);
        totalr = total(1);
         
        x = 1;
        for h=1:size(mat)
            if( (mat(h,1)/totalr) > 0.78)
                res(x,1) = mat(h,2);
                res(x,2) = mat(h,3);
                x = x + 1;
            end
        end
        load normalTumorMatchIndices;
        
        for t = 1:size(res)
            res(t,3) = 1;
        end
        
        for t = 1:size(res)
            for u = 1:size(normalTumorMatch)
                if((abs(res(t,1)-normalTumorMatch(u,1))<75) & (abs(res(t,2)-normalTumorMatch(u,2))<75))
                    res(t,3) = 0;
                    break;
                end
            end
        end
        
        for z = 1:size(res)
            if(res(z,3) == 1)
                drx = res(z,1);
                dry = res(z,2);
%                 for ITR=1:3600
%                     x(ITR)=r*cos(th(ITR))+drx;
%                     y(ITR)=r*sin(th(ITR))+dry;
%                 end
                plot(drx,dry,'*r','LineWidth',2,'MarkerSize',20);
            end
        end
% %         
% %         sum1 = sum(res);
% %         sum2 = sum(normalMatch);
% %         
% %         sum1
% %         sum2
% %         
% %         drx = sum1(1,1) - sum2(1,1);
% %         dry = sum1(1,2) - sum2(1,2);
% %          for ITR=1:3600
% %             x(ITR)=r*cos(th(ITR))+drx;
% %             y(ITR)=r*sin(th(ITR))+dry;
% %          end
% %          plot(x,y,'r');

        
% % %         for h=1:size(mat)
% % %             
% % %             if( (mat(h,1)/totalr) > 0.75)
% % %                 for a=1:size(normalMatch)
% % %                     if(~((mat(h,2) > normalMatch(a,1)-66) & (mat(h,2) < normalMatch(a,1)+65) ...
% % %                             & (mat(h,3) > normalMatch(a,2)-65) & (mat(h,3) < normalMatch(a,2)+65) ))
% % %                             drx = mat(h,2);
% % %                             dry = mat(h,3);
% % %                             drx
% % %                             dry
% % %                             for ITR=1:3600
% % %                                 x(ITR)=r*cos(th(ITR))+drx;
% % %                                 y(ITR)=r*sin(th(ITR))+dry;
% % %                             end
% % %                             plot(x,y,'r');
% % %                             break;
% % %                     end
% % %                 end
% % %             end
% % %         end
% % %         
        hold off;
        