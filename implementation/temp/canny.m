% file_name = 'cameraman.tif';
I = imread('E:\CBIR\implementation\version 3\conv\24hex.jpg');
normal_edges = edge(I,'canny');
imshow(I);
title('Original Image');
figure
imshow(normal_edges);
title('Conventional Edge Detection');