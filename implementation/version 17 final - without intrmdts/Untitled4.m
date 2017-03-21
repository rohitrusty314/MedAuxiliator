function [I] = Untitled4()
load path;
pathNew = PATHNAME;


ls = size(pathNew);
last = ls(1,2)
count = 1;
for i=last-1:-1:1
    if(pathNew(1,i)=='\') 
       break;
   end
   count = count+1;
   
end

% for j=1:last-count
%     
% end

rootdir = pathNew(1:last-count);

fullpath = strcat(rootdir,'eT2W_TSE\*.jpg');


Im = rdir(fullpath);
if(imread(Im)==0);
    msgbox('Select image','Error','warn');
end
% 
% figure;
% imshow(Im);
I = Im;
end