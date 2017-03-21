function [R] = retrieveSimilar(IPimageShape,IPimageTexture)
queryFeatureVct = zeros(1,42);

%% Shape feature calculation for input image
Is = IPimageShape;
It = IPimageTexture;
queryFeatureVct(1,2:29) = calc_feature_shape(Is);
queryFeatureVct(1,30:42) = calc_feature_texture(It);

save queryFeatureVector queryFeatureVct;


%% finding the distance between feature vectors of i/p image and DB images
 load dbFeatureVector;
 temp1 = zeros(1551,42);
 index = 14;
 
 for q = 1:1551
     temp1(q,1:41) = ((dbFeatureVct(q,2:42) - queryFeatureVct(2:42))).^2;
 end
 
 save temporary temp1;

 dist = zeros(1551,2);
 onlyDist = zeros(1551,1);
 sortedDist = zeros(1551,1);
 sm = zeros(1551,1);
 

     sm = sum(temp1,2);

 
 save sum sm;
 
 for q=1:1551
     dist(q,2) = (sqrt(sm(q,1)));
     onlyDist(q) = dist(q,2);
     dist(q,1) = index;
     index = index + 1;
 end

 sortedDist = sort(onlyDist);
 
 
 save distances dist;
 
 save onlyDistance onlyDist;
 
 save SortedDistance sortedDist;

sortedIndices = zeros(1551,1);
 count = 1;
 for i=1:1551
     for j=1:1551
      if(sortedDist(i,1) == dist(j,2))
        sortedIndices(count) = dist(j,1);
        count = count + 1;
      end
     end
 end
R = sortedIndices;
end