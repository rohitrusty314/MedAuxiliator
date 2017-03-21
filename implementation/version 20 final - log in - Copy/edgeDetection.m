function [I3] = edgeDetection(I) 

filter3 = fspecial('prewitt');
filter3=transpose(filter3);
Is=filter2(filter3,I)/255;
 
filter=fspecial('unsharp',.5);
Iu=filter2(filter,I)/255;
   
[I1] = filter_func(Iu);
[I2] = filter_func(Is);
   
I3= I1 | I2;
figure;
imshow(I3);
end
   
function [Fedgemapk1]=filter_func(I)
n1= 6; % number of scales


lambda =[0,2,4,8,16,32]; % different scales

n2= 3; % number of orintations

theta = [0,pi/3,2*pi/3];    % different orientations
Tfeature = zeros(1,60);
count=0;
[M,N]= size(I);
Fedgemapk1 = zeros(M,N);
Fedgemapk2 = zeros(M,N);
figure;
imshow(I);
c=1;
for i=1:n1
    l=lambda(i);
    
    for j=1:n2
        t=theta(j);
        % apply gabor filter
   
        [gabout] = gabor_fn(I,1,t,10,0,0.5);
   
        %calculate mean and std deviation for each gabor responses
        std_mean = mean2(gabout);
        std_deviation=std2(gabout);
        count=count+1;
        Tfeature(count)=std_mean;
        count=count+1;
        Tfeature(count)=std_deviation;
        
       diff = abs(mean2(gabout) - std2(gabout));
        
  
         if(diff < 50)
            
            % create a edge map using threshold k1
            k1=2.5;
            tmpI1= gabout < (-1 * std_deviation * k1) | gabout > ( std_deviation * k1 );
            edgemap1 = tmpI1;
            Fedgemapk1 = Fedgemapk1 | edgemap1;
         end
        
         
    end
end


   end %function end
   