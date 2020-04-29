% This is the test file of the project

clc
clear all
close all
%load data Xtr Ytr Xte Yte
load x1
load x2
load y1
load y2



% optimal k
k=1;

% find base sampls 
[c_set,c_labels]=kmeans(Xtr,Ytr);

% use knn to produce accuracy
[acc,ypred]=knn(k,c_set,c_labels,Xte,Yte);

%accuracy_on_each_type
% F-measure
a_vec=zeros(1,5);
b_vec=zeros(1,5);
c_vec=zeros(1,5);
d_vec=zeros(1,5);

s=size(Yte,1);
for j=1:s
    
    for type=1:5
        % update a
        if ypred(j)==type && Yte(j)==type
            a_vec(type)=a_vec(type)+1;
        end
        
        % update d
        if ypred(j)~=type && Yte(j)~=type
            d_vec(type)=d_vec(type)+1;
        end
        
        % update b
        if ypred(j)==type && Yte(j)~=type
            b_vec(type)=b_vec(type)+1;
        end
        
        % update c
        if ypred(j)~=type && Yte(j)==type
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