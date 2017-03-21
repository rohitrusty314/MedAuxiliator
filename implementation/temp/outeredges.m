% I = imread('E:\CBIR\implementation\version 4\24.jpg');
% BW = im2bw(I, graythresh(I));
%        [B,L] = bwboundaries(BW,'noholes');
%        imshow(label2rgb(L, @jet, [.5 .5 .5]))
%        hold on
%        for k = 1:length(B)
%            boundary = B{k};
%            plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)
%        end
% 



% BW = imread('E:\CBIR\implementation\version 4\24.jpg');
% BW= rgb2gray(BW);
%        [B,L,N,A] = bwboundaries(BW);
%        imshow(BW); hold on;
%        colors=['b' 'g' 'r' 'c' 'm' 'y'];
%        for k=1:length(B),
%          boundary = B{k};
%          cidx = mod(k,length(colors))+1;
%          plot(boundary(:,2), boundary(:,1), colors(cidx),'LineWidth',2);
%          %randomize text position for better visibility
%          rndRow = ceil(length(boundary)/(mod(rand*k,7)+1));
%          col = boundary(rndRow,2); row = boundary(rndRow,1);
%          h = text(col+1, row-1, num2str(L(row,col)));
%          set(h,'Color',colors(cidx),'FontSize',14,'FontWeight','bold');
%        end
%        figure; spy(A);


% 
%  BW = imread('E:\CBIR\implementation\version 4\24.jpg');
%  BW= rgb2gray(BW);
% 
%        [B,L,N] = bwboundaries(BW);
%        imshow(BW); hold on;
%        for k=1:length(B),
%          boundary = B{k};
%          if(k > N)
%            plot(boundary(:,2), boundary(:,1), 'g','LineWidth',2);
%          else
%            plot(boundary(:,2), boundary(:,1), 'r','LineWidth',2);
%          end
%        end



  BW = imread('E:\CBIR\implementation\version 4\24.jpg');
  BW= rgb2gray(BW);

       [B,L,N,A] = bwboundaries(BW);
       imshow(BW); hold on;
       for k=1:length(B),
         if(~sum(A(k,:)))
           boundary = B{k};
           plot(boundary(:,2), boundary(:,1), 'r','LineWidth',2);
           for l=find(A(:,k))'
             boundary = B{l};
             plot(boundary(:,2), boundary(:,1), 'g','LineWidth',2);
           end
         end
       end