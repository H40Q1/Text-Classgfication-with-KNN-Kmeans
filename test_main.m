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
[acc,ypred]=knn(k,c_set,c_labels,X_te,Y_te);

%accuracy_on_each_type
% F-measure
a_vec=zeros(1,5);
b_vec=zeros(1,5);
c_vec=zeros(1,5);
d_vec=zeros(1,5);

s=size(Y_te,1);
for j=1:s
    
    for type=1:5
        % update a
        if ypred(j)==type && Y_te(j)==type
            a_vec(type)=a_vec(type)+1;
        end
        
        % update d
        if ypred(j)~=type && Y_te(j)~=type
            d_vec(type)=d_vec(type)+1;
        end
        
        % update b
        if ypred(j)==type && Y_te(j)~=type
            b_vec(type)=b_vec(type)+1;
        end
        
        % update c
        if ypred(j)~=type && Y_te(j)==type
            c_vec(type)=c_vec(type)+1;
        end
           
    end  
    
end

%recall precision F
for k=1:5
    recall(k)=a_vec(k)/(a_vec(k)+c_vec(k));
    precision(k)=a_vec(k)/(a_vec(k)+b_vec(k));
    F(k)=2*recall(k)*precision(k)/(recall(k)+precision(k));
end
