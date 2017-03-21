function [resampledImage] = resampling(image)

% fprintf('in resampling');

[M N] = size(image);
resampledImage = image;
for i=1:2:M
   for j=2:2:N
       resampledImage(i,j-1)= image(i,j-1);
       resampledImage(i,j)=0;
   end
end

for i=2:2:M
  for j=1:2:N-2
     resampledImage(i,j)=0;
     resampledImage(i,j+1)=(image(i,j)+image(i,j+2))/2;
  end
end


% figure;
% imshow(resampledImage);
% imwrite(resampledImage,'E:\CBIR\implementation\version 3\conv\24hex.jpg')
