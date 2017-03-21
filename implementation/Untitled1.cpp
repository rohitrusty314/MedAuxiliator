#include<stdio.h>
#include<stdlib.h>

main()
{
int i,t=0,ti[279],j,count=0;
FILE *fi,*fo;
 fi = fopen("img37ifile.txt","r");
 fo = fopen("img37indx.txt","r");


 for(i=0;i<279;i++){
 fscanf(fo, "%d",&ti[i]);
 //printf("%d ",ti[i]);
}

 for(i=0;i<20;i++){
 fscanf(fi,"%d",&t);
// printf("%d ",t);
 for(j=0;j<279;j++){
  if(ti[j]==t){
    count++;  
    break;           
  }                   
 }
}
printf("%d",count);
fclose(fi);
fclose(fo);
      
      system("pause");
}
