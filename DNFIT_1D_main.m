% load data
clc
clear
clc;
clear;
close all;

[x_train,y_train,x_test,y_test] = loaddataLNA();

algorithm = 'DNFIT_1D';

dnpara.normalization = 1;
dnpara.loglization = 1;
dnpara.order = 1;

if dnpara.loglization
    y_ = log(y_train);
end
if dnpara.normalization
    [x_,y_,dnpara] = normalization(x_train,y_,dnpara);
end
x_ = genbasisX(x_,dnpara.order);
dnpara = DNFIT_1D(x_,y_,dnpara,1,20);

if dnpara.normalization
    x_ = mapminmax('apply',x_test',dnpara.PSx);
    x_ = x_';
end
x_ = genbasisX(x_,dnpara.order);
x_n = [ones(size(x_,1),1),x_];
y_pre = (x_n*dnpara.wn)./(1-x_*dnpara.wd);
if dnpara.normalization
    y_pre = mapminmax('reverse',y_pre',dnpara.PSy);
    y_pre = y_pre';
end
if dnpara.loglization
    y_pre = exp(y_pre);
end
test_err = nmse(y_pre,y_test)


