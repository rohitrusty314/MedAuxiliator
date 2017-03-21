 load ('IFile14');
 load ('IFile24');
 load ('IFile37');
 load ('IFile92');
% for i=1:length(I1)
%     I1(i,1)
% end



load ('category14');
load ('category24');
load ('category37');
load ('category92');


% for i=1:length(C14)
%     category14(i,1)
% end


precCountArray=zeros(4,3);
recallCountArray=[0,0,0,0];
recallPercent=[0,0,0,0];
numberOfImages=[10,20,30,40,50];
for l=1:4
    
 if(l==1)
  C=C14;
  I=I14;
 end
 if(l==2)
  C=C24;
  I=I24;
 end
 if(l==3)
  C=C37;
  I=I37;
 end
 if(l==4)
  C=C92;
  I=I92;
 end
 
 
 
 for i=1:length(C)
   for j=1:length(C)
     if (I(i,1)== C(j,1))
      recallCountArray(l)=recallCountArray(l)+1;
     end
   end
 end

 recallPercent(l)=recallCountArray(l)*100/length(C);
 recallPercent
 
count=0;
 for k=1:5
   for i=1:(k*10)
   for j=1:length(C)
     if (I(i,1)== C(j,1))
      count=count+1;
       
     end
   end
   end
   precCountArray(l,k)=count;
   count=0;
 end
 
 
 
end


prec10Percent=[0,0,0,0];
prec14Percent(1)=precCountArray(1,1)/0.1;
prec14Percent(2)=precCountArray(1,2)/0.2;
prec14Percent(3)=precCountArray(1,3)/0.3;
prec14Percent(4)=precCountArray(1,4)/0.4;
prec14Percent(5)=precCountArray(1,5)/0.5;


prec24Percent=[0,0,0,0];
prec24Percent(1)=precCountArray(2,1)/0.1;
prec24Percent(2)=precCountArray(2,2)/0.2;
prec24Percent(3)=precCountArray(2,3)/0.3;
prec24Percent(4)=precCountArray(2,4)/0.4;
prec24Percent(5)=precCountArray(2,5)/0.5;


prec37Percent=[0,0,0,0];
prec37Percent(1)=precCountArray(3,1)/0.1;
prec37Percent(2)=precCountArray(3,2)/0.2;
prec37Percent(3)=precCountArray(3,3)/0.3;
prec37Percent(4)=precCountArray(3,4)/0.4;
prec37Percent(5)=precCountArray(3,5)/0.5;


prec92Percent=[0,0,0,0];
prec92Percent(1)=precCountArray(4,1)/0.1;
prec92Percent(2)=precCountArray(4,2)/0.2;
prec92Percent(3)=precCountArray(4,3)/0.3;
prec92Percent(4)=precCountArray(4,4)/0.4;
prec92Percent(5)=precCountArray(4,5)/0.5;
% 
% imgId = [14,24,37,92];
% % for i=1:4
% %     a(i,:)=num2str(recallPercent(i));
% %     
% % end
% % 
% % precCountArray
% % recallCountArray
% % prec10Percent
% % recallPercent
% bar(recallPercent,prec10Percent);

plot(numberOfImages,prec14Percent,'b*:','LineWidth',2);
hold on;
plot(numberOfImages,prec24Percent,'g*:','LineWidth',2);
plot(numberOfImages,prec37Percent,'r*:','LineWidth',2);
plot(numberOfImages,prec92Percent,'c*:','LineWidth',2),legend('category 1','category 2','category 3','category 4'),
title('Precision vs. Number of Images retrieved');
hold off;
% % 
% % figure;
% % err14Percent = 100 - prec14Percent(1,:);
% % err24Percent = 100 - prec24Percent(1,:);
% % err37Percent = 100 - prec37Percent(1,:);
% % err92Percent = 100 - prec92Percent(1,:);
% % 
% % plot(numberOfImages,err14Percent,'b*:','LineWidth',2);
% % hold on;
% % plot(numberOfImages,err24Percent,'g*:','LineWidth',2);
% % plot(numberOfImages,err37Percent,'r*:','LineWidth',2);
% % plot(numberOfImages,err92Percent,'c*:','LineWidth',2),legend('category 1','category 2','category 3','category 4'),
% % title('Error rate vs. Number of Images retrieved');
% % hold off;

%   