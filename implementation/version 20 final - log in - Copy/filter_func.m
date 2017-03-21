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
    
       [gabout] = gabor_fn_defect(I,1,t,l,0,0.5);
        
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
