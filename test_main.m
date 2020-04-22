% This is the test file of the project

%load data Xtr Ytr Xte Yte

% optimal k
k=1;

% find base sampls 
[c_set,c_labels]=k_means(Xtr,Ytr);

% use knn to produce accuracy
acc=knn(k,c_set,c_labels,Xte,Yte);

%normal knn on Xte?
