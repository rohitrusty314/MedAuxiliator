I = imread('E:\CBIR\implementation\temp\pics\24.jpg');
I1 = rgb2gray(I);
imshow(I1);

BW = I1>0;
imshow(BW);