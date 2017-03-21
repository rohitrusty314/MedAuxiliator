clear all;

I = imread('E:\CBIR\implementation\temp\def\660.jpg'); 
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
         
         windowlim(1,1) = 0;    windowlim(1,2) = 0;     windowlim(1,3) = 186;   windowlim(1,4) = 186; count(1) = 0;
         windowlim(2,1) = 185;  windowlim(2,2) = 0;     windowlim(2,3) = 371;   windowlim(2,4) = 186; count(2) = 0;
         windowlim(3,1) = 370;  windowlim(3,2) = 0;     windowlim(3,3) = 556;   windowlim(3,4) = 186; count(3) = 0;
         
         windowlim(4,1) = 0;    windowlim(4,2) = 185;   windowlim(4,3) = 186;   windowlim(4,4) = 371; count(4) = 0;
         windowlim(5,1) = 185;  windowlim(5,2) = 185;   windowlim(5,3) = 371;   windowlim(5,4) = 371; count(5) = 0;
         windowlim(6,1) = 370;  windowlim(6,2) = 185;   windowlim(6,3) = 556;   windowlim(6,4) = 371; count(6) = 0;
         
         windowlim(7,1) = 0;    windowlim(7,2) = 370;   windowlim(7,3) = 186;   windowlim(7,4) = 556; count(7) = 0;
         windowlim(8,1) = 185;  windowlim(8,2) = 370;   windowlim(8,3) = 371;   windowlim(8,4) = 556; count(8) = 0;
         windowlim(9,1) = 370;  windowlim(9,2) = 370;   windowlim(9,3) = 556;   windowlim(9,4) = 556; count(9) = 0;
         
         load bleedEnergy;
          
         x=1;
         category = 0;
          pixelno = 1;
%          for i=93:185:555
%              for j=93:185:555
               for i = 1:9      
%                  category = category + 1;
%                  for k=i-92:i+92
%                      for l=j-92:j+92
                         for n = 1:size(ekbleed)
                             for m = 1:size(ek)
                                 if(ek(m,2) > windowlim(i,1))
                                     if(ek(m,3) > windowlim(i,2))
                                         if(ek(m,2) < windowlim(i,3))
                                             if(ek(m,3) < windowlim(i,4))
                                                 if(ekbleed(n,1) == ek(m,1))
                                                     temp(x,1) = ekbleed(n,1);
                                                     temp(x,2) = ek(m,2);
                                                     temp (x,3) = ek(m,3);
                                                     temp (x,4) = i;
                                                     
                                                     x = x+1;
%                                                      count(i) = count(i) + 1;
%                                                      break;
                                                 end
                                             end
                                         end
                                     end
                                 end
                             end
                         end
                     end
%                  end
%              end
%          end
         tempunq = unique(temp,'rows');
         
         for b=1:size(tempunq)
            if(tempunq(b,4)==1)
                count(1) = count(1) + 1;
            elseif(tempunq(b,4)==2)
                count(2) = count(2) + 1;
            elseif(tempunq(b,4)==3)
                count(3) = count(3) + 1;
            elseif(tempunq(b,4)==4)
                count(4) = count(4) + 1;
            elseif(tempunq(b,4)==5)
                count(5) = count(5) + 1;
            elseif(tempunq(b,4)==6)
                count(6) = count(6) + 1;
            elseif(tempunq(b,4)==7)
                count(7) = count(7) + 1;
            elseif(tempunq(b,4)==8)
                count(8) = count(8) + 1;
            elseif(tempunq(b,4)==9)
                count(9) = count(9) + 1;
            end
         end
         count


