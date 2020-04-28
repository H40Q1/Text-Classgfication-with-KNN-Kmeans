%% Create Xtr,Xte,Ytr,Yte
close all;
clear;
load('All_categories.mat');
data = all_category_data;
train_set = data(1:240,:);
test_set = data(241:end,:);
for j = 1:size(data,2)
    switch j
        case 1
            [business, bag(1)] = find_most_freq(train_set,j);
            bag(1) = removeInfrequentWords(bag(1),business.Count(end)-1);
            business.Properties.VariableNames(1) = {'Business'};
            business.Properties.VariableNames(2) = {'Count_B'};
        case 2
            [entertainment, bag(2)] = find_most_freq(train_set,j);
            bag(2) = removeInfrequentWords(bag(2),entertainment.Count(end)-1);
            entertainment.Properties.VariableNames(1) = {'Entertainment'};
            entertainment.Properties.VariableNames(2) = {'Count_E'};
        case 3
            [politics, bag(3)] = find_most_freq(train_set,j);
            bag(3) = removeInfrequentWords(bag(3),politics.Count(end)-1);
            politics.Properties.VariableNames(1) = {'Politics'};
            politics.Properties.VariableNames(2) = {'Count_P'};
        case 4
            [sports, bag(4)] = find_most_freq(train_set,j);
            bag(4) = removeInfrequentWords(bag(4),sports.Count(end)-1);            
            sports.Properties.VariableNames(1) = {'Sport'};
            sports.Properties.VariableNames(2) = {'Count_S'};
        case 5
            [tech, bag(5)]= find_most_freq(train_set,j);
            bag(5) = removeInfrequentWords(bag(5),tech.Count(end)-1);            
            tech.Properties.VariableNames(1) = {'Tech'};
            tech.Properties.VariableNames(2) = {'Count_T'};
    end
end
All_counted = [business entertainment politics sports tech];
%% Adjust the weights
train_bag = join(bag);
train_weight = tfidf(train_bag);
train_weight = full(train_weight);
test_weight = tfidf(train_bag,tokenizedDocument(lower(test_set)));
test_weight = full(test_weight);
Ytr = zeros(1200,1);
Ytr(1:240,1) = 1; Ytr(241:480,1) = 2; Ytr(481:720,1) = 3;
Ytr(721:960,1) = 4; Ytr(961:1200,1) = 5;
Yte = zeros(300,1);
Yte(1:60,1) = 1; Yte(61:120,1) = 2; Yte(121:180,1) = 3;
Yte(181:240,1) = 4; Yte(241:300,1) = 5;
shuffle = randperm(1200)';
for i = 1:1200
    Xtr(i,:) = train_weight(shuffle(i),:);
    Ytr(i,1) = Ytr(shuffle(i),1);
end
shuffle = randperm(300)';
for j = 1:300
    Xte(j,:) = test_weight(shuffle(j),:);
    Yte(j,1) = Yte(shuffle(j),1);
end