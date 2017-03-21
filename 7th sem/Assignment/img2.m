I = imread('C:\Users\rohit-raj\Pictures\1\ab.jpg');
%figure;
subplot(3,2,1),imshow(I),title('original image');
g=rgb2gray(I);
%figure;
subplot(3,2,3),imshow(g),title('2 gray');
re=imresize(g,[1000 1000]);
%figure;
subplot(3,2,4),imshow(re),title('resized');
gsn=imnoise(re,'salt & pepper',0.5);
%figure;
subplot(3,2,5),imshow(gsn),title('noise - salt & pepper');
ro=imrotate(gsn,35.57);
%figure;
subplot(3,2,6),imshow(ro),title('rotated - 35.57deg');