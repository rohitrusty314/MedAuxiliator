function[x1,y1,x2,y2,x3,y3] = plotArrow(thisBoundary)


offset = max(thisBoundary)
mins = min(thisBoundary)

means = (offset(2)+ mins(2))/2;
% means=mins(2)-(offset(2)/3);
means=mins(2);
offset(1) = offset(1)+10;
means
offset(1)
j=1;
for i=0:0.01:50
  x1(j) = i + offset(1);
  j=j+1;
end


j=1;
for i=50:-0.01:0
  y1(j) = i + means;
  j=j+1;
end



j=1;
for i=0:0.04:10
  x2(j) = i+ offset(1);
  j=j+1;
end


j=1;
for i=50:-0.08:30
  y2(j) = i + means;
  j=j+1;
end



j=1;
for i=0:0.08:20
  x3(j) = i + offset(1);
  j=j+1;
end


j=1;
for i=50:-0.04:40
  y3(j) = i + means;
  j=j+1;
end

end