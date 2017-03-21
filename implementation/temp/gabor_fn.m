function [gb] = gabor_fn(img, sigma,theta,lambda,psi,gamma)
 
% if isa(img,'double')~=1 
%     img = double(img);
% end


sigma_x = sigma;
sigma_y = sigma/gamma;
 
% Bounding box
nstds = 3;
xmax = max(abs(nstds*sigma_x*cos(theta)),abs(nstds*sigma_y*sin(theta)));
xmax = ceil(max(1,xmax));
ymax = max(abs(nstds*sigma_x*sin(theta)),abs(nstds*sigma_y*cos(theta)));
ymax = ceil(max(1,ymax));
xmin = -xmax; ymin = -ymax;
[x,y] = meshgrid(xmin:xmax,ymin:ymax);
 
% Rotation 
x_theta=x*cos(theta)+y*sin(theta);
y_theta=-x*sin(theta)+y*cos(theta);
 fprintf('3');
gb = exp(-.5*(x_theta.^2/sigma_x^2+y_theta.^2/sigma_y^2)).*cos(2*pi/lambda*x_theta+psi);
fprintf('4');

 
 Imgabout = conv2(img,double(imag(gb)),'same');
 Regabout = conv2(img,double(real(gb)),'same');
 
 gb = sqrt(Imgabout.*Imgabout + Regabout.*Regabout);
 