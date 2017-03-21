function[ShapeVct] = calc_feature_shape(I)

%% Convertion of RGB image to gray scale image.
% J = rgb2gray(I);
% J = edge(I,'canny');
J=I;
%% Wavelet Decomposition. a:Approximation comp; h:Horizontal comp;
%% v:Vertical Comp; d:Diagonal Comp.
[a,h,v,d] = dwt2(J,'db1');

%% Calculation of std deviation and thresholds-k1 & k2.
stda = std(a(:));
stdh = std(h(:));
stdv = std(v(:));
stdd = std(d(:));
k1 = ((stdh+stdv+stdd)/3)^(1/3);
k2 = (stda/(stdh+stdv+stdd))^(1/3);

%% Obtaining edge map using threshold k1
tmph1 = h < (-1 * stdh * k1) | h > (stdh * k1) ;
tmpv1 = v < (-1 * stdv * k1) | v > (stdv * k1) ;
tmpd1 = d < (-1 * stdd * k1) | d > (stdd * k1) ;
hc = mat2gray(h);
vc = mat2gray(v);
dc = mat2gray(d);
ac = mat2gray(a);

tmpf1 = tmph1 | tmpv1 | tmpd1;
tmpfh1 = tmpf1 .* abs(hc);
tmpfv1 = tmpf1 .* abs(vc);
tmpfd1 = tmpf1 .* abs(dc);

k1final = tmpfh1 | tmpfv1 | tmpfd1;
k1final = k1final .* ac;

% figure;
% imshow(k1final);
% calculating 7 moments 
k1m = invmoments(k1final);

%% Obtaining edge map using threshold k2
tmph2 = h < (-1 * stdh * k2) | h > (stdh * k2) ;
tmpv2 = v < (-1 * stdv * k2) | v > (stdv * k2) ;
tmpd2 = d < (-1 * stdd * k2) | d > (stdd * k2) ;

tmpf2 = tmph2 | tmpv2 | tmpd2;
tmpfh2 = tmpf2 .* abs(hc);
tmpfv2 = tmpf2 .* abs(vc);
tmpfd2 = tmpf2 .* abs(dc);

k2final = tmpfh2 | tmpfv2 | tmpfd2;
k2final = k2final .* ac;



% figure;
% imshow(k2final);
% calculating 7 moments 
k2m = invmoments(k2final);

%% Obtaining edge map using approximation component and K1 & k2.
afinal1 = ((tmpf1 + tmpf2) ./ 2);
afinal = afinal1 .* ac;
% calculating 7 moments 
am = invmoments(afinal);


% figure;
% imshow(afinal);
%% Obtaining edge map using maximum values of h,v & d components.
maxhv = max(abs(h),abs(v));
new = max(maxhv,abs(d));
stdnew = std(new(:));

new1 =  new < (-1 * stdnew * k1) | new > (stdnew * k1) ;
new2 =  new < (-1 * stdnew * k2) | new > (stdnew * k2) ;
newf = new1 + new2;
maxfinal = (newf ./ 2) .* ac;
maxm = invmoments(maxfinal);


% figure;
% imshow(maxfinal);
%% Complete Shape feature Vector
ShapeVct = [k1m k2m am maxm];
end