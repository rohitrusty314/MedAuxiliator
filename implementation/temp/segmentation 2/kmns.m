function [] = kmeans(ek)
ek
% [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
% % prevCluster1 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
% % prevCluster2 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
% 
% cluster1 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
% cluster2 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
% cluster3 = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];


cluster1center = ek(1);
cluster2center = ek(length(ek));
cluster3center = ek(abs(length(ek)/2));

itr=1;

while(1)
  cn=1;
  cn2=1;
  cn3=1;
  
  for i=1:length(ek)
     ed1 = sqrt(cluster1center.^2-ek(i).^2);
     ed2 = sqrt(cluster2center.^2-ek(i).^2);
     ed3 = sqrt(cluster3center.^2-ek(i).^2);
     
     if(ed1<ed2 && ed1<ed3)
         cluster1(cn) = i;
         cn=cn+1;
     elseif(ed2<ed3 && ed2<ed1)
         cluster2(cn2) = i;
         cn2=cn2+1;
     else
         cluster3(cn3) = i;
         cn3=cn3+1;    
     end
  end
  
  
 if(itr>1)
    if(length(cluster1)==length(prevCluster1))
        if(length(cluster2)==length(prevCluster2))
            if(length(cluster3)==length(prevCluster3))
                if(prevCluster1 == cluster1)
                    if(prevCluster2 == cluster2)
                        if(prevCluster3 == cluster3)
                            break;   
                        end
                    end
                end
            end
        end
    end
 end


  if(cn>1)
   cluster1
   cluster1center = mean(cluster1);
   prevCluster1 = cluster1;
   clear cluster1;
  end
  if(cn2>1)
   cluster2
   cluster2center = mean(cluster2);
   prevCluster2 = cluster2;
   clear cluster2;
  end
  if(cn3>1)
   cluster3 
   cluster3center = mean(cluster3);
   prevCluster3 = cluster3;
   clear cluster3;
  end


itr=itr+1;
end

end