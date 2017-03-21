function [ik2] = cannyImp(im)

step = 0;

% Gaussian Filter
FILTER_SIZE = 5;
SIGMA = 14;

im = double(im);

[M N] = size(im);

% Gaussian Filter with standard deviation SIGMA (1.4)
gaussian_filter = fspecial('gaussian', FILTER_SIZE, SIGMA);


% Convoluting image with chosen filter
conv_im = conv2(im, gaussian_filter, 'same');



% Estimate local edge normal directions n 
%  for each pixel in the image

[gaussian_filter_x gaussian_filter_y] = gradient(gaussian_filter);

im_gradient_x = conv2(conv_im, gaussian_filter_x, 'same');
im_gradient_y = conv2(conv_im, gaussian_filter_y, 'same');

n_direction = atan2(im_gradient_y, im_gradient_x);
n_direction = n_direction*180/pi;

% Discretization of directions
n_direction_dis = zeros(M, N);
for i = 1  : M
    for j = 1 : N

        if ((n_direction(i, j) > 0 ) && (n_direction(i, j) < 22.5) || (n_direction(i, j) > 157.5) && (n_direction(i, j) < -157.5))
            n_direction_dis(i, j) = 0;
        end
        
        if ((n_direction(i, j) > 22.5) && (n_direction(i, j) < 67.5) || (n_direction(i, j) < -112.5) && (n_direction(i, j) > -157.5))
            n_direction_dis(i, j) = 45;
        end
        
        if ((n_direction(i, j) > 67.5 && n_direction(i, j) < 112.5) || (n_direction(i, j) < -67.5 && n_direction(i, j) > 112.5))
            n_direction_dis(i, j) = 90;
        end
        
        if ((n_direction(i, j) > 112.5 && n_direction(i, j) <= 157.5) || (n_direction(i, j) < -22.5 && n_direction(i, j) > -67.5))
            n_direction_dis(i, j) = 135;
        end
    end
end

% Compute the magnitude of the edge
im_gradient_mag = sqrt(im_gradient_x.^2 + im_gradient_y.^2);

step = step + 1;
figure(step);
imshow(im_gradient_mag, []);
title('Gradient Magnitude');


step = step + 1;
figure(step);
ik2 = im_gradient_mag;
imshow(ik2);
title('c on grad');

end