
% Just for fun, let's get its histogram.
originalImage = rgb2gray(imread('E:\CBIR\implementation\temp\histogram\imges\660.jpg'));
[pixelCount grayLevels] = imhist(originalImage);
subplot(3, 3, 2); 
bar(pixelCount); title('Histogram of original image');
% xlim([0 grayLevels(end)]);