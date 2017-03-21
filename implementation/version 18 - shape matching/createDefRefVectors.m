load dbFeatureVector;

defrefShapeFeatureVct = zeros(3,28);
defrefTextureFeatureVct = zeros(3,13);
defrefShapeTextureFeatureVct = zeros(3,41);


defrefShapeFeatureVct(1,:)=dbFeatureVct(15,2:29);
defrefShapeFeatureVct(2,:)=dbFeatureVct(647,2:29);
defrefShapeFeatureVct(3,:)=dbFeatureVct(1069,2:29);



defrefTextureFeatureVct(1,:)=dbFeatureVct(15,30:42);
defrefTextureFeatureVct(2,:)=dbFeatureVct(647,30:42);
defrefTextureFeatureVct(3,:)=dbFeatureVct(1069,30:42);



defrefShapeTextureFeatureVct(1,:)=dbFeatureVct(15,2:42);
defrefShapeTextureFeatureVct(2,:)=dbFeatureVct(647,2:42);
defrefShapeTextureFeatureVct(3,:)=dbFeatureVct(1069,2:42);


save defrefShapeFeatureVector defrefShapeFeatureVct;
save defrefTextureFeatureVector defrefTextureFeatureVct;
save defrefShapeTextureFeatureVector defrefShapeTextureFeatureVct;
