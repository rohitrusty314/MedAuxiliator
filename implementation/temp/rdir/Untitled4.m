path = 'E:\CBIR\implementation\version 14 final\Images Folder\A\BRAIN\Series\';

ls = size(path);
last = ls(1,2)
count = 1;
for i=last-1:-1:1
   path(i)
    if(path(1,i)=='\') 
       break;
   end
   count = count+1;
   
end
count

% for j=1:last-count
%     
% end

rootdir = path(1:last-count);
rootdir

fullpath = strcat(rootdir,'eT2W_TSE\*.jpg');

fullpath

Im = rdir(fullpath);
if(imread(Im)==0);
    msgbox('Select image','Error','warn');
end

figure;
imshow(Im);