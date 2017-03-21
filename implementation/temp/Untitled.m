[FILENAME,PATHNAME] = uigetfile('*.*','Load the query image:');

if(FILENAME == 0)
    flag = 0;
    msgbox('Select image','Error','warn');
    return;
end

[a,b,Ext] = fileparts(FILENAME);
availableExt = {'.jpg','.jpeg'};
found=0;
for (i=1:length(availableExt))
   if(strcmpi(Ext,availableExt(i)))
       found=1;
       break
   end
end

if(found==0)
    msgbox('Load a .jpg/.jpeg Image only','Error','Warn');
    return;
end

queryImage = imread([PATHNAME FILENAME]);
% figure;
% imshow(queryImage);
PATHNAME
FILENAME

[FILENAME2,PATHNAME2] = uigetfile('PATHNAME\*.*','Load the query image:');
