load dbFeatureVector;

dbFet(:,:) = dbFeatureVct(:,2:42);

% dbFeatureVct(15,30:42)
% dbFeatureVct(647,30:42)
% dbFeatureVct(795,30:42)
% dbFeatureVct(1072,30:42)

dbFeatureVct(15,2:29)
dbFeatureVct(647,2:29)
dbFeatureVct(795,2:29)
dbFeatureVct(1072,2:29)


[clusterIndices, centroid] = kmeans(dbFet,50,'Replicates',10,'Distance','cosine');
% 
% clusterIndices(15)
% clusterIndices(647)
% clusterIndices(795)
% clusterIndices(1072)
 
j=1;
for i=1:1551
    
    if(clusterIndices(i) == clusterIndices(15))
        recluster(j,:) = dbFeatureVct(i,2:42);
        correspondingIndex(j,1) = dbFeatureVct(i,1);
        j = j + 1;
    end
end
