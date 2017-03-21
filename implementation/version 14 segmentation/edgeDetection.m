function [I3] = edgeDetection(I) 
% % load image;
% % I = originalImage;
% % figure;
% % imshow(I);

I4 = edge(I, 'canny');

 originalI =I;
        se = strel('ball',5,5);
        dilatedI = imdilate(originalI,se);
        figure, imshow(originalI), figure, imshow(dilatedI)
        
        I = dilatedI;
figure;
imshow(I4),title('rtgrgfgffggf');

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

   sstottemp = (Fedgemapk1).^2;
       sstotsum = sum(sstottemp,1);
       sstot = sum(sstotsum,2); 
       
       cn=1;
       
       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       Rk = edgemap(:,:,1);
         psi_rk = tanh(0.25*Rk);
         windowcount=0;
         tempcount=0;
         tempcount2=0;
         flag = 1;
         
         for m=3:5:M
            for n=3:5:N
%                 temp = windowcount;
                esum=0;
                for p=m-2:m+2
                   for q=n-2:n+2
                       esum=esum+psi_rk(p,q);
                   end
                end
                
                if(esum>0)
                    
                    tempcount = tempcount + 1;
                    windowcount = windowcount + 1;
                    tempcount2=tempcount2+1;
                    temp(tempcount,1)= esum/25;
                    
                    
                        if(flag == 1)
                               ek(windowcount,1)=temp(tempcount,1);
                                    location(windowcount,3)=1;
                        end
                        
                         if(flag == 2)
%                           if(m==8)
%                               m
%                             if(n<54)
%                               m
%                               n
                              if(tempcount2>11)
                                if(tempcount2<20)
                                    ek(windowcount-10,2)=temp(tempcount,1);              
                                    location(windowcount-10,3)=2; 
                                end
                            else
                             
                               ek(windowcount,2)=temp(tempcount,1);
                               
                         location(windowcount,3)=2;
                         end 
                         
                         end
                      
                    if(tempcount==10)
                    
                        tempcount=0; 
                        if(flag==1)
                            flag=2;
                        
                        elseif(flag==2)
                            flag=1;
                            windowcount=windowcount-10;
                        end
                        
                    end
                    
                  location(windowcount,1)=m;
                  location(windowcount,2)=n;

                end
            end
         end
         windowcount

        opts = statset('Display','final');         
        [clusterIndices, centroid] = kmeans(ek,5,'Replicates',5,'EmptyAction','drop');
         
        figure;
        imshow(I);
        hold on;
        count = 1;
        s=1;
        t=1;
        u=1;
        v=1;
        w=1;
        
        size(clusterIndices)
        windowcount

          for f=1:size(clusterIndices)
           if(clusterIndices(f)==1) 
               a(s,1)=location(f,1);
               a(s,2)=location(f,2);
               s=s+1;
           elseif(clusterIndices(f)==2)
               b(t,1)=location(f,1);
               b(t,2)=location(f,2);
               t=t+1;
           elseif(clusterIndices(f)==3)
               c(u,1)=location(f,1);
               c(u,2)=location(f,2);
               u=u+1;
           elseif(clusterIndices(f)==4)
               d(v,1)=location(f,1);
               d(v,2)=location(f,2);
               v=v+1;
           elseif(clusterIndices(f)==5)
               e(w,1)=location(f,1);
               e(w,2)=location(f,2);
               w=w+1;
           end
        end
        
        arr=[s,t,u,v,w];
        maxim=max(arr,[],2);
        if(maxim == s)
            drx=mean2(a(:,2));
            dry=mean2(a(:,1));
        elseif (maxim == t)
            drx=mean2(b(:,2));
            dry=mean2(b(:,1));
        elseif (maxim == u)
            drx=mean2(c(:,2));
            dry=mean2(c(:,1));
            
        elseif (maxim == v)
            drx=mean2(d(:,2));
            dry=mean2(d(:,1));
            
        elseif (maxim == w)
            drx=mean2(e(:,2));
            dry=mean2(e(:,1));
        end
        
        
%         plot(a(:,2),a(:,1),'r.');
%         plot(b(:,2),b(:,1),'b.');
%         plot(c(:,2),c(:,1),'g.');
%         plot(d(:,2),d(:,1),'m.');
%         plot(e(:,2),e(:,1),'c.');
        
% %        
% %         r=77;
% %         th=0:0.1:360;
% %    for ITR=1:3600
% %    x(ITR)=r*cos(th(ITR))+drx;
% %    y(ITR)=r*sin(th(ITR))+dry;
% % end
% %  plot(x,y,'r') ;  
% % drx
% % dry
% %         
% %         
   
        
        
load bleedEnergy;

matchcount=[0,0,0,0,0];

for i=1:size(ekbleed)
    
    if (ekbleed(i)>0)
        
for j=1:size(clusterIndices)
    
    
   if(clusterIndices(j)==1)
     
       if(ekbleed(i)== ek(j,location(j,3)))
          matchcount(1)= matchcount(1)+1;
       end
   end
   
    if(clusterIndices(j)==2)
     
       if(ekbleed(i)== ek(j,location(j,3)))
          matchcount(2)= matchcount(2)+1;
       end
    end
    
      
    if(clusterIndices(j)==3)
     
       if(ekbleed(i)== ek(j,location(j,3)))
          matchcount(3)= matchcount(3)+1;
       end
    end
    
      
    if(clusterIndices(j)==4)
     
       if(ekbleed(i)== ek(j,location(j,3)))
          matchcount(4)= matchcount(4)+1;
       end
    end
    
      
    if(clusterIndices(j)==5)
     
       if(ekbleed(i)== ek(j,location(j,3)))
          matchcount(5)= matchcount(5)+1;
       end
    end
   
end    

    end
end

matchcount
maxcid=1;
maxe=matchcount(1);
for i=2:5
 if(matchcount(i)>maxe)
     maxcid=i;
     maxe=matchcount(i);
 end
end

maxcid
maxe




if(maxcid==1)
        plot(a(:,2),a(:,1),'r.');
elseif(maxcid==2)
        plot(b(:,2),b(:,1),'b.');
elseif(maxcid==3)
        plot(c(:,2),c(:,1),'g.');
    elseif(maxcid==4)
        plot(d(:,2),d(:,1),'m.');
     elseif(maxcid==5)
        plot(e(:,2),e(:,1),'c.');
end







     hold off;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
       
figure;
imshow(I3);
end

function [Fedgemapk1]=filter_func(I)
   
  n1= 6;
  lambda =[0,2,4,8,16,32];

  n2= 3;
  theta = [0,pi/3,2*pi/3];

  [M,N]= size(I);
  Fedgemapk1 = zeros(M,N);
  Fedgemapk2 = zeros(M,N);

  Tfeature = zeros(1,60);

  
  c=1;
  count = 1;
  for i=1:n1
    l=lambda(i);
    for j=1:n2
        t=theta(j);
    
       [gabout] = gabor_fn(I,1,t,l,0,0.5);
        
        std_mean = mean2(gabout);
        std_deviation=std2(gabout);
        count=count+1;
        Tfeature(count)=std_mean;
        count=count+1;
        Tfeature(count)=std_deviation;
        
        diff = abs(mean2(gabout) - std2(gabout));
        
        k1=2.5;
            tempI1= gabout < (-1 * std_deviation * k1) | gabout > ( std_deviation * k1 );

            Fedgemapk1 = Fedgemapk1 | tempI1;

   end
end
end
