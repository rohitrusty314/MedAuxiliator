%  axis ( [ 0, 1, 0, 1 ] )
I = imread('E:\CBIR\implementation\version 12 analysis\images jpg\377.jpg');
axes(axis1),imshow(I);
hold on; 
x1 = [ 0.0, 0.5, 0.5 ];
        y1 = [ 0.5, 0.5, 1.0 ];
plot(x1, y1, 'r', 'LineWidth', 4);
hold off;
