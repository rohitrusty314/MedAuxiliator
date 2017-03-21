clear all;
I = imread('E:\CBIR\implementation\defects\infarct.jpg'); 
I = rgb2gray(I);

figure;
imshow(I);


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
       [gabout] = gabor_fn(I,1,t,u,0,0.5);
       
        
       %calculate mean and std deviation for each gabor responses
        std_mean = mean2(gabout);
        std_deviation=std2(gabout);
        count=count+1;
        Tfeature(count)=std_mean;
        count=count+1;
        Tfeature(count)=std_deviation;
        
         diff = abs(mean2(gabout) - std2(gabout));
%          if(diff < 50)
            
            % create a edge map using threshold k1
            k1=2.5;
            tempI1= gabout < (-1 * std_deviation * k1) | gabout > ( std_deviation * k1 );

            Fedgemapk1 = Fedgemapk1 | tempI1;

            
            for l=1:M
               for k=1:N
%                 edgemap(l,k,c) = tempI1(l,k);
                  edgemap(l,k,c) = Fedgemapk1(l,k);        
               end
            end
%  subplot(4,7,c), imshow(edgemap(:,:,c));
% subplot(4,7,c), imshow(tempI1);
   c = c + 1;       
   end
end

% 
% figure;
% imshow(Fedgemapk1);

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
%             
%             Rk = edgemap(:,:,28);
%             figure;
%             imshow(Rk);
%             ind(cn)=b;
%             cn=cn+1;
%             psi_t = tanh(0.25*edgemap(:,:,b));
%             sum1 = sum(psi_t,1);
% %           sum1
%             sum2 = sum(sum1,2);
% %           sum2
%             ek(cn,1) = sum2/(avrg*avrg);
%  
        end
        
       end
       
         Rk = edgemap(:,:,1);
         psi_rk = tanh(0.25*Rk);
         windowcount=1;
         for m=3:5:M
            for n=3:5:N
                esum=0;
                for p=m-2:m+2
                   for q=n-2:n+2
                       esum=esum+psi_rk(p,q);
                   end
                end
                if(esum>0)
                    ekinfarct(windowcount,1) = esum/25;
                    ekinfarct(windowcount,2) = m;
                    ekinfarct(windowcount,3) = n;
                    windowcount=windowcount+1;
                end
            end
         end
         
         for k = 2:size(ekinfarct)
            ekinfarct(k,2) = ekinfarct(k,2)-ekinfarct(1,2);
             ekinfarct(k,3) = ekinfarct(k,3)-ekinfarct(1,3);
         end
         ekinfarct(1,2) = 0;
         ekinfarct(1,3) = 0;
         save infarctEnergy ekinfarct;
         