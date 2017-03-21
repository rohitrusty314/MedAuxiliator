A = [1 3 5;4 5 7] ;
B = [3 7;5 8;6 9];
C = [0 0;0 0];
for i=1:2
    for j=1:2
        C(i,j)=0;
     for k=1:3
        C(i,j)=C(i,j)+A(i,k)*B(k,j);
    end
    end
end
C