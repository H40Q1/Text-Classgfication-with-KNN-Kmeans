%cross_validation
%import K-means + KNN

function [acc]=cross_validation(Xtr,Ytr,k)
    [m]=size(Xtr,1);
%     errs=zeros(1,4);
    
    % cluster into 100 centers
    num_center=100;
    
    % 4-folder
    for j=1:4
        idx_train=(mod(1:m,folds)==j-1);
        Xtrain=Xtr(idx_train,:);
        Xtest=Xtr(~idx_train,:);
        Ytrain=Ytr(idx_train);
        Ytest=Ytr(~idx_train);
    
        % find 100 centers and their labels
        [c_set,c_lables]=k_means(Xtrain,Ytrain)
        
        % evaluate the error vector by using knn with base samples on c_set
        % output mean error
        accuracy(j)=knn(k,c_set,c_lables,Xtest,Ytest);
    end

    
acc=mean(accuracy);

end
