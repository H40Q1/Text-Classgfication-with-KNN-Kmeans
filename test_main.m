% This is the test file of the project

clc
clear all
close all
%load data Xtr Ytr Xte Yte
load X_tr
load X_te
load Y_tr
load Y_te



% optimal k
k=1;

% find base sampls 
[c_set,c_labels]=kmeans(X_tr,Y_tr);

% use knn to produce accuracy
acc=knn(k,c_set,c_labels,X_te,Y_te);


