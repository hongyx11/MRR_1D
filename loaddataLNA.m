function [ x_train,y_train,x_test,y_test ] = loaddataLNA()
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
data = load('dataset/LNA_train.mat');
data = data.data;
x_train = data(:,1:14);
y_train = data(:,15);
data = load('dataset/LNA_test.mat');
data = data.data;
x_test = data(:,1:14);
y_test = data(:,15);
end

