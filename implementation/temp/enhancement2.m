clear;
% img_name = input('Enter the image name (grayscale) :','s');
img = imread('E:\CBIR\implementation\version 2\conv\24.jpg');
img=rgb2gray(img);
size_img = size(img);

%Adaptive histogram equaliztion
global_res = histeq(img);
res_image = img;
threshold = 20;

% for  .......... Adaptive Histogram Equalization ...........

for i = 2:size_img(1)-1
    for j = 2:size_img(2)-1
        deviation = std(double(img(i-1:i+1,j-1:j+1)));
        if abs(double(img(i,j)) - double(deviation)) > threshold
            res_image(i,j) = global_res(i,j);
        end
    end
end
res_image = imadjust(res_image);
 figure, imshow(res_image);
% fprintf('\n saving image to pics/img_adpHist.jpg \n');
% imwrite(res_image,'pics/img_adpHist.jpg','jpg');

