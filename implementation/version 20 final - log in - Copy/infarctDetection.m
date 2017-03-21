function [] = infarctDetection(I)

    h = waitbar(0,'Please wait...');
           steps = 1000;
    for step=1:steps   
    % computations take place here
    waitbar(step / steps)
    end
close(h)    
% clear all;
% I = imread('E:\CBIR\implementation\version 13 segmentation\1085.jpg'); 
% I = rgb2gray(I);

% figure;
% imshow(I);

f = [4*1.41,8*1.41,16*1.41,32*1.41,64*1.41,128*1.41,256*1.41];
theta = [0,pi/4,pi/2,3*pi/4];

[M,N]= size(I);
Tfeature = zeros(1,60);
Fedgemapk1 = zeros(M,N);
edgemap = zeros(M,N,1);


T = 560/(4*1.41);
avrg = 0.5*T;


c=1;
count=1;
% figure;
for i=1:length(f);
   u = f(i);
   for j=1:length(theta);
       t = theta(j);
       [gabout] = gabor_fn_defect(I,1,t,u,0,0.5);
       
        
       %calculate mean and std deviation for each gabor responses
        std_mean = mean2(gabout);
        std_deviation=std2(gabout);
        count=count+1;
        Tfeature(count)=std_mean;
        count=count+1;
        Tfeature(count)=std_deviation;
        
         diff = abs(mean2(gabout) - std2(gabout));

            
            % create a edge map using threshold k1
            k1=2.5;
            tempI1= gabout < (-1 * std_deviation * k1) | gabout > ( std_deviation * k1 );

            Fedgemapk1 = Fedgemapk1 | tempI1;

            
            for l=1:M
               for k=1:N

                  edgemap(l,k,c) = Fedgemapk1(l,k);        
               end
            end
   c = c + 1;       
   end
end

%calculate segmentation efficiency
       sstottemp = (Fedgemapk1).^2;
       sstotsum = sum(sstottemp,1);
       sstot = sum(sstotsum,2); 
       
       cn=1;
       for b=1:28
          
        ssetemp = (edgemap(:,:,b) - Fedgemapk1).^2;
        ssesum = sum(ssetemp,1);
        sse = sum(ssesum,2); 
        
        r_sq = 1 - (sse/sstot);
        
       
        if(r_sq>0.94)
        end
        
       end
       
         Rk = edgemap(:,:,1);
         psi_rk = tanh(0.25*Rk);
         windowcount=1;
         
         %calculate each pixels energy value, taking on a 3X3 window 
         for m=3:5:M
            for n=3:5:N
                temp = windowcount;
                esum=0;
                for p=m-2:m+2
                   for q=n-2:n+2
                       esum=esum+psi_rk(p,q);
                   end
                end
                
                if(esum>0)
                if(rem(windowcount,2)==1)
                  ek(windowcount,1) = esum/25;
                else
                ek(windowcount,2) = esum/25;
                
                end

                  location(windowcount,1)=m;
                  location(windowcount,2)=n;
                  windowcount = windowcount+1;
                end
            end
         end
         

        opts = statset('Display','final');         
        [clusterIndices, centroid] = kmeans(ek,5,'Replicates',5);  %cluster based on energy values
         
        figure;
        imshow(I);
        hold on;
        count = 1;
        s=1;
        t=1;
        u=1;
        v=1;
        w=1;
        
 %cluster with highest matches
        for f=1:windowcount-1
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
        
%get index for the marking the affected region         
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
    
      
    
        plot(drx,dry,'*r','LineWidth',2,'MarkerSize',20);

        hold off;
end