function [flag]=classifyDefect(imgpath)
ls = size(imgpath);
last = ls(1,2);
count = 1;
for i=last-4:-1:1
    if(imgpath(1,i)=='\') 
       break;
   end
   revstrimgID(count)=imgpath(1,i);
   count=count+1;
end

count2=1;
v = size(revstrimgID);
l = v(1,2);
for j=l:-1:1
   
    strimgID(1,count2)=revstrimgID(1,j);
    count2=count2+1;
    
end

id=str2num(strimgID);

load dbFeatureVector;
id
size(id)
id-13
featurShapeVctFifteen(1,:)=dbFeatureVct(id-13,2:29);
featurTextureVctFifteen(1,:)=dbFeatureVct(id-13,30:42);
featurShapeTextureVctFifteen(1,:)=dbFeatureVct(id-13,2:42);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


load defrefShapeFeatureVector;
load defrefTextureFeatureVector ;
load defrefShapeTextureFeatureVector ;
% 
% 
% defrefShapeFeatureVct
% 
% featurShapeVctFifteen


 for q = 1:3
%      temp1(q,1:13) = ((defrefTextureFeatureVct(q,1:13) - featurTextureVctFifteen(1:13))).^2;
     temp1(q,1:28) = ((defrefShapeFeatureVct(q,1:28) - featurShapeVctFifteen(1:28))).^2;
 end
 

 onlyDist = zeros(3,1);
 sm = zeros(3,1);
 
  sm = sum(temp1,2);

 
 for q=1:3
     onlydist(q,1) = (sqrt(sm(q,1)));
 end

onlydist
 
% save featurShapeVectorFifteen  featurShapeVctFifteen;
% save featurTextureVectorFifteen  featurTextureVctFifteen;
% save featurShapeTextureVectorFifteen  featurShapeTextureVctFifteen;
 



flag=1;
end