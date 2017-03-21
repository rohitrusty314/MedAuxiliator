dirPath = strcat(pwd, '\','images jpg','\')
% dirfiles = dir(strcat(dirPath, '*.jpg'))

% 
% for temp=14:16
%     z = I1(temp,1)
%     tmp = strcat(dirPath, dirfiles(z-299).name);
%     axes(Axes(temp+1)); cla; imshow(tmp);
%   
% end

for i=14:1564
    str = int2str(i);
   imgName = strcat(str,'.jpg');
   temp = strcat(dirPath,imgName);
   I = imread(temp);
   I = rgb2gray(I);
%    figure;
%    imshow(I);
[enhancedImage] = enhance(I);
[resampledImage] = resampling(enhancedImage);

[gaborOutputImage] = edgeDetection(resampledImage);

[edgeDetectedImage] = cannyImp(gaborOutputImage);

dbFeatureVct(i-13,2:29) = calc_feature_shape(edgeDetectedImage);
dbFeatureVct(i-13,30:42) = calc_feature_texture(resampledImage);

% dbfeatureVct(i-13,2:29) = calc_feature_shape(edgeDetectedImage);
dbFeatureVct(i-13,1) = i;
%     figure;
%     imshow(resampledImage);
fprintf(int2str(i));
end
  save dbFeatureVector dbFeatureVct;


