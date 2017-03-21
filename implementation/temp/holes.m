BW = imread('E:\CBIR\implementation\version 12 analysis\images jpg\377.jpg');
BW = rgb2gray(BW);


thresholdValue = 50;
BW = BW > thresholdValue; % Bright objects will be the chosen if you use >.

% Do a "hole fill" to get rid of any background pixels inside the blobs.
% BW = imfill(BW, 'holes');

figure;
imshow(BW);
[B,L,N,A] = bwboundaries(BW);
numberOfBoundaries = size(B);

figure; imshow(BW); hold on;


for k=1:numberOfBoundaries-1
    for j=k+1:numberOfBoundaries
        [a b]  = size(B{k});
        [c d] = size(B{j});
      if(a < c)
            temp = B{k};
            B{k} = B{j};
            B{j} = temp;
      end
    end
end
   
for k=1:numberOfBoundaries
   size(B{k}) 
end
% 
% [L N] = size(B(1));
% tb = 1;
% for k = 2 : numberOfBoundaries
%     
%    thisBoundary = B{k};
%    [M N] = size(thisBoundary);
%    if(M>L)
% 	tb = k;
%     L = M;
%    end
% end 


% tb2 = 1;
% for k = 2 : numberOfBoundaries
%    thisBoundary = B{k};
%    [M N] = size(thisBoundary);
%    if(M>L && tb2 ~= tb)
% 	tb2 = k;
%     L = M;
%    end
% end
% 
% 
% tb3 = 1;
% for k = 2 : numberOfBoundaries
%    thisBoundary = B{k};
%    [M N] = size(thisBoundary);
%    if(M>L && tb3 ~= tb && tb3 ~= tb2)
% 	tb3 = k;
%     L = M;
%    end
% end

boundary = B{2};
           plot(boundary(:,2),...
               boundary(:,1),'g','LineWidth',2);
% for k=1:length(B),
%      if(~sum(A(k,:)))
% %        boundary = B{k};
% %        plot(boundary(:,2),...
% %            boundary(:,1),'r','LineWidth',2);
%        for l=find(A(:,k))'
%            boundary = B{l};
%            plot(boundary(:,2),...
%                boundary(:,1),'g','LineWidth',2);
%        end
%     end
% end