I = imread('C:\Users\rohit-raj\Pictures\1\ab.jpg');
%figure;
subplot(3,2,1),imshow(I),title('original image');
g=rgb2gray(I);
%figure;
subplot(3,2,3),imshow(g),title('RGB 2 GRAY');
gsn=imnoise(g,'gaussian',0.5,0.1);
%figure;
subplot(3,2,4),imshow(gsn),title('gaussian noise');
% gsn1=imnoise(I,'gaussian');
% figure;
% imshow(gsn1)
ed=edge(gsn,'canny');
%figure;
subplot(3,2,5),imshow(ed),title('edges - using canny');
cr=imcrop(ed,[50 50 200 200]);
%figure;
subplot(3,2,6),imshow(cr),title('cropped');