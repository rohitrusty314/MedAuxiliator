load dbFeatureVector;
temp = dbFeatureVct(15,2:42);
dbFeatureVct(15,2:42) = dbFeatureVct(16,2:42);
dbFeatureVct(16,2:42) = temp;


temp = dbFeatureVct(1069,2:42);
dbFeatureVct(1069,2:42) = dbFeatureVct(1072,2:42);
dbFeatureVct(1072,2:42) = temp;