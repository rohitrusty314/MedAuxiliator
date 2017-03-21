%
% DIP assignment - 5  
% Question - 3 
% Name - Sanyam Sharma
% Roll No. - 200101072
%
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
 
fprintf('\n saving image to pics/img_adpHist.jpg \n');
imwrite(res_image,'pics/img_adpHist.jpg','jpg');

% for  .......... Homorphic Filtering ...........
     

        img_fft = fft2(log(double(img) + 1 ));
        
        size_img = size(img_fft);
        
        lpf = [1 1 1;1 1 1;1 1 1]/9;
        hpf = [-1 -1 -1;-1 8 -1;-1 -1 -1]/9;
        lpf_fft = fft2 ( lpf , size_img ( 1 ) , size_img ( 2 ) );
        result_fft = img_fft .* lpf_fft;
        result_img = exp ( ifft2(result_fft) ) ;

        fprintf ( '\n saving image to pics/img_homomorphic.jpg \n' );
        imwrite ( uint8(real ( result_img )) , 'pics/img_homomorphic.jpg' , 'jpg' );
        
        
% for  .......... Adaptive Contrast Enhancement ...........
        
        res_image = img;
        constant = 1.5;
        for i = 2:size_img(1)-1
            for j = 2:size_img(2)-1
                deviation = std(double(img(i-1:i+1,j-1:j+1)));
                if abs(double(img(i,j)) - double(deviation)) > threshold
                    res_image(i,j) = double(img(i,j)) * constant ;
                end  
            end
        end
        fprintf('\n saving image to pics/img_adpContrast.jpg \n');
        imwrite(res_image,'pics/img_adpContrast.jpg','jpg');