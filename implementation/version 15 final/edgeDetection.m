function [I3] = edgeDetection(I) 
% I = imread('E:\CBIR\implementation\version 3\conv\24h2.jpg');
% I1 = imread('H:\images jpg\18.jpg');
%  I = rgb2gray(I);
filter3 = fspecial('prewitt');
filter3=transpose(filter3);
Is=filter2(filter3,I)/255;
 
filter=fspecial('unsharp',.5);
Iu=filter2(filter,I)/255;
   
[I1] = filter_func(Iu);
[I2] = filter_func(Is);

% I3= I1;
I3= I1 | I2;
figure;
  
 imshow(I3);
%  figure;
%   [I3]=resampling(I3);
%  imshow(I3);
%  figure;
%  imshow(edge((I3),'canny'));
 %imshow(Fedgemapk1);
end
   
   function [Fedgemapk1]=filter_func(I)
n1= 6; % number of scales


lambda =[0,2,4,8,16,32]; % different scales

n2= 3; % number of orintations

% theta= [0,pi/3,pi/6,pi/2,3*pi/4]; % different orientations
theta = [0,pi/3,2*pi/3];
Tfeature = zeros(1,60);
[M,N]= size(I);
Fedgemapk1 = zeros(M,N);
Fedgemapk2 = zeros(M,N);
% figure;
% imshow(I);
c=1;
count = 1;

   figure;
for i=1:n1
    l=lambda(i);
    
    for j=1:n2
        
        t=theta(j);
        % apply gabor filter
   
        [gabout] = gabor_fn(I,1,t,l,0,0.5);
   
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
            tmpI1= gabout < (-1 * std_deviation * k1) | gabout > ( std_deviation * k1 );
            edgemap1 = tmpI1;
            Fedgemapk1 = Fedgemapk1 | edgemap1;
%             Fedgemapk1 = edgemap1;

          % create a edge map using threshold k1
%             k2=2.5;
%             tmpI2= gabout < (-1 * std_deviation * k2) | gabout > ( std_deviation * k2 );
%             edgemap2 = tmpI2;
%             Fedgemapk2 = Fedgemapk2 | edgemap2;
%          end
        
   subplot(3,6,c), imshow(edgemap1);
   c = c + 1;       
    end
end

figure;
imshow(Fedgemapk1);
   end %function end
   
 
%  figure;
%  imshow(Fedgemapk2);
%   I5 = imfuse(Fedgemapk1,Fedgemapk2,'diff');
% %  subplot(1,1,1),imshow(I5), title(k1);
%   subplot(1,2,1),imshow(Fedgemapk1), title(k1);
%   subplot(1,2,2),imshow(Fedgemapk2), title(k2);
% % 
% shape1 = ZernikeTest(Fedgemapk1);
% shape2 = ZernikeTest(Fedgemapk2);

