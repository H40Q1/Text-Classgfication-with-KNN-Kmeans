% This is the main function for finding the optimal K
% plot error of different k values
clc
clear all
close all


%load data

load X_tr
load Y_tr

Xtr=X_tr;
Ytr=Y_tr;

%potential k parameter choices
k_vec=[1,2,3,4,5,6,7,8,9];

%cross validation:4-folder
l=size(k_vec,2);
for i=1:l
    %k is the 
    k=k_vec(i);
    
    %input Xtrain Ytrain and k
    %output the mean error of KNN errors with this k
    acc=cross_validation(Xtr,Ytr,k);
    
    %put every mean errors of different k in a vector
    accu(i)=acc;
    
end

% plot the k-error diagram
plot(k_vec,accu)
xlabel('K values')
ylabel('Accuracy')
ylim([0 1])
