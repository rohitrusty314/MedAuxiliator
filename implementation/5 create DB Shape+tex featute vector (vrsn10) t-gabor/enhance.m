function [enhancedImage] = enhance(originalImage)

% fprintf('In enhance');

enhancedImage = imadjust(originalImage);
[M N] = size(enhancedImage);
for i=1:M
   for j=1:N
       
    enhancedImage(i,j)=enhancedImage(i,j)+(enhancedImage(i,j)/3); 
       
   end
end
