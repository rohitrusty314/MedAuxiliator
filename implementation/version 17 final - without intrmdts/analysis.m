 function[] =  analysis(axis1,originalImage)

tic; % Start timer.
clc; % Clear command window.
% clear all; % Get rid of variables from prior run of this m-file.
disp('Running BlobsDemo.m...'); % Message sent to command window.
workspace; % Show panel with all the variables.

% Change the current folder to the folder of this m-file.
% (The line of code below is from Brett Shoelson of The Mathworks.)
if(~isdeployed)
	cd(fileparts(which(mfilename)));
end

% Read in standard MATLAB demo image
% %   originalImage = imread('coins.png'); 
 
 axes(axis1),imshow(originalImage);
 
 mean = mean2(originalImage);
 std = std2(originalImage);

if(mean<40 && std<45)

  thresholdValue = 50;
  BW = originalImage > thresholdValue;
    [B,L,N,A] = bwboundaries(BW);
    figure; imshow(BW); hold on;
    for k=1:length(B),
      if(~sum(A(k,:)))
         boundary = B{k};
         plot(boundary(:,2),...
            boundary(:,1),'r','LineWidth',2);
            for l=find(A(:,k))'
               boundary = B{l};
               plot(boundary(:,2),...
               boundary(:,1),'g','LineWidth',2);
            end
     end
   end 
 end
 
% Threshold the image to get a binary image (only 0's and 1's) of class "logical."
% Method #1: using im2bw()
%   normalizedThresholdValue = 0.4; % In range 0 to 1.
%   thresholdValue = normalizedThresholdValue * max(max(originalImage)); % Gray Levels.
%   binaryImage = im2bw(originalImage, normalizedThresholdValue);       % One way to threshold to binary
% Method #2: using a logical operation.
thresholdValue = 150;
  binaryImage = originalImage > thresholdValue; % Bright objects will be the chosen if you use >.
% Do a "hole fill" to get rid of any background pixels inside the blobs.
binaryImage = imfill(binaryImage, 'holes');


  hold on;
 boundaries = bwboundaries(binaryImage);	
%  boundaries = bwboundaries(originalImage);	
 numberOfBoundaries = size(boundaries);

[L N] = size(boundaries(1));
tb = 1;
for k = 2 : numberOfBoundaries
   thisBoundary = boundaries{k};
   [M N] = size(thisBoundary);
   if(M>L)
	tb = k;
    L = M;
   end
end 

thisBoundary = boundaries{tb};

%  plot(thisBoundary(:,2), thisBoundary(:,1), 'r', 'LineWidth', 4);
% 
[x1 y1 x2 y2 x3 y3]= plotArrow(thisBoundary);
plot(x1, y1, 'r', 'LineWidth', 2);
plot(x2, y2, 'r', 'LineWidth', 2);
plot(x3, y3, 'r', 'LineWidth', 2);

% for k = 1 : numberOfBoundaries
% 	thisBoundary = boundaries{k};
%     size(thisBoundary)
% 	plot(thisBoundary(:,2), thisBoundary(:,1), 'r', 'LineWidth', 4);
% end

hold off;
end