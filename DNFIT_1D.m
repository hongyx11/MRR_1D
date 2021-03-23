function [ dnpara ] = DNFIT_1D( X, y, dnpara, P_MSE,iteration )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
[n,m] = size(X);
I = ones(n,1);
X1 = [I,X];
X2 = X;
for c=1:m
    X2(:,c) = X2(:,c).*y;
end
wd = zeros(m,1);
wd_step = wd;
wd_plus = zeros(m,1);
wn = zeros(m+1,1);
wn_step = wn;
MSEs = ones(iteration,1);
wn_opt = zeros(m+1,1);
wd_opt = zeros(m,1);
MSE_DNFIT_MIN = 1000;
W = zeros(2*m + 1,1);
for c=1:iteration
    wn = W(1:m+1);
    wd_plus = W(m+2:end);
    wd = wd + wd_plus;
    g = 1-X*wd;
    A = [X1,X2];
    for d=1:2*m+1
        A(:,d) = A(:,d)./g;
    end
    W = A \ y;
    % draw MSE
    wd_step = wd_step + W(m+2:end);
    A_step = X1;
    g_step = 1-X*wd_step;
    for d=1:m+1
        A_step(:,d) = A_step(:,d)./g_step;
    end
    % 2 ols problems, use another ols to calculate wn
    % wn_step = A_step \ y; 
    % 1 ols problem, use W(1:m+1) as wn_step
    wn_step = W(1:m+1);
    y_pre = A_step*wn_step;
    MSEs(c,1) = nmse(y_pre,y);
    if MSEs(c,1) < MSE_DNFIT_MIN
        MSE_DNFIT_MIN = MSEs(c,1);
        wn_opt = wn_step;
        wd_opt = wd_step;
    end
end
dnpara.wn = wn_opt;
dnpara.wd = wd_opt;
wd_opt
if P_MSE
    figure('name','DNFIT-1D MSE of every step');
    semilogy(MSEs,'.','MarkerSize',15);
    hold on;
    semilogy(MSEs);
    grid on;
    ylabel('MSE');xlabel('step');
end


end
