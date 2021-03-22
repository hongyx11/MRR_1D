function [ x_processed,y_processed,dnpara ] = normalization( x,y,dnpara )
%NORMALIZATION Summary of this function goes here
%   Detailed explanation goes here
[x,PSx]=mapminmax(x');
x_processed=x';
dnpara.PSx=PSx;
[y,PSy]=mapminmax(y');
y_processed=y';
dnpara.PSy=PSy;

end

