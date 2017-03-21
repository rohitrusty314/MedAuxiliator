function[threshold] = getThreshold(image)
   [M N] = size(image);
   m = mean2(image);
m
threshold = m;
std = std2(image);
std
end