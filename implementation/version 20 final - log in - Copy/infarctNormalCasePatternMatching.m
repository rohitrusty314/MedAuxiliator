function [] = infarctNormalCasePatternMatching(I,cid)
  %waitbar while processing is being done
    h = waitbar(0,'Please wait...');
           steps = 1000;
    for step=1:steps
    waitbar(step / steps)
    end
close(h)

%PREPROCESSING
[M,N]= size(I);

%apply filters
filter3 = fspecial('prewitt');
filter3=transpose(filter3);
Is=filter2(filter3,I)/255;
 
filter=fspecial('unsharp',.5);
Iu=filter2(filter,I)/255;

%for edge detection to generate edgemap
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
       
  %calculate energy values for 3x3 windows     
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
                     ek(windowcount,1)=temp(tempcount,1);  %store the energy value
                     ek(windowcount,2)=m;                  %store corresponding x index
                     ek(windowcount,3)=n;                  %store corresponding y index
                 end
             end
         end
         
         load bleedEnergy;          %load energy values of Infarct
         count = 0;
         v = 1;
         
         %sequential match
         for l=1:size(ek)
             count = 0;
             for k = 1:size(ekbleed)
                 if(ekbleed(k,1) == ek(l,1))
                     count = count + 1;
                     for id = 2:size(ekbleed)
                         e = energy((ek(l,2)+ekbleed(id,2)),(ek(l,3)+ekbleed(id,3)),psi_rk);  %calculate energy for the crrent window
                         if(ekbleed(id,1) == e)                        % if match keep a count
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
        imshow(I),title('Analysis Result');
        hold on;
        r=25;
        th=0:0.1:360;
        total = size(ekbleed);
        totalr = total(1);
         
        x = 1;
        
        %regions with more than 80% match
        for h=1:size(mat)
            if( (mat(h,1)/totalr) > 0.80)
                res(x,1) = mat(h,2);
                res(x,2) = mat(h,3);
                x = x + 1;
            end
        end
        
        %Indices on match with normal Infarct Energy pattern
        load normalMatchIndices;
        for t = 1:size(res)
            res(t,3) = 1;
        end
        
        %if the locations detected in the current image is within the range
        %of the locations identified on the normal brain image
        for t = 1:size(res)
            for u = 1:size(normalMatch)
                if((abs(res(t,1)-normalMatch(u,1))<66) & (abs(res(t,2)-normalMatch(u,2))<66))
                    res(t,3) = 0;
                    break;
                end
            end
        end
        
        
        for t = 1:size(res)
            if((res(t,1)>340) &(res(t,2)>500) )
                res(t,3) = 0;
            end
        end
        
        %regions other than on the proximity of Normal Brain Image are
        %marked as the defected regions
        normal = 1;
        for z = 1:size(res)
            if(res(z,3) == 1)
                normal = 0;
                drx = res(z,1);
                dry = res(z,2);
                if(cid==3)
                else
                    plot(drx,dry,'*r','LineWidth',2,'MarkerSize',20);
                end
            end
        end
        
        save isnormal normal;        %Normal flag is saved for use
        hold off;
end