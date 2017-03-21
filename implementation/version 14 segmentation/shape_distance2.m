function[R] = shape_distance(IPimage)

%% Initialization of query vector
QueryVct = zeros(1,29);

%% Shape feature calculation for input image
I = IPimage;
QueryVct(1,2:29) = calc_feature_shape(I);
QueryVct
%% finding the distance between feature vectors of i/p image and DB images
 load FeatureShapeVector;
 temp1 = zeros(500,29);
 temp2 = zeros(500,29);
 Dist = zeros(500,29);
 index = 299;
 
 for q = 1:500
     temp1(q,:) = abs(featureSVct(q,:) - QueryVct);
     temp2(q,:) = abs(featureSVct(q,:)) + abs(QueryVct);
     Dist(q,:) = temp1(q,:) ./ temp2(q,:);
     index = index + 1;
     Dist(q,1) = index;
 end

%summing the elements in Dist matrix
sumfin = zeros(500,2);
[x,y] = size(Dist);

for m = 1:x
    sumfin(m,1) = Dist(m,1);
    for n = 2:y
        sumfin(m,2) = Dist(m,n) + sumfin(m,2);
    end
end

%calculating the minimum distance
result = zeros(500,1);
i = 1;
ascnd = sort(sumfin,1,'ascend');
ascnd(501,1:2) = [799,999999];
for p = 1:500
    if ascnd(p+1,2) == ascnd(p,2)

    else
        for q = 1:500
            if ascnd(p,2) == sumfin(q,2)
               result(i)=sumfin(q);
               i = i+1;
            end
        end
    end
end

%% result matrix contains most similar image indexes sorted in ascending order
R = result;
end