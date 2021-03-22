function [ nmse_err ] = nmse( y_pre,y_real )
%NMSE Summary of this function goes here
% This function is used to calculate normalization \
% mean square error.
% y_pre : your prediction, y_real: the real value

y_premin = min(y_pre);
y_premax = max(y_pre);
y_pre = 2*(y_pre - y_premin)./(y_premax - y_premin) + -1;

y_realmin = min(y_real);
y_realmax = max(y_real);
y_real = 2*(y_real - y_realmin)./(y_realmax - y_realmin) + -1;
sum = 0;
for i=1:size(y_real,1)
    sum = sum + (y_real(i,1)-y_pre(i,1))^2;
end
sum = sum/size(y_real,1);
nmse_err = sum;
end

