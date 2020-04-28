%% Create a table for most frequent words in each category
load('All_categories.mat');
for j = 1:5
    switch j
        case 1
            [business, bag(1)] = find_most_freq(all_category_data,j);
            business.Properties.VariableNames(1) = {'Business'};
            business.Properties.VariableNames(2) = {'Count_B'};
            bag(1) = removeInfrequentWords(bag(1),250);
        case 2
            [entertainment, bag(2)] = find_most_freq(all_category_data,j);
            entertainment.Properties.VariableNames(1) = {'Entertainment'};
            entertainment.Properties.VariableNames(2) = {'Count_E'};
            bag(2) = removeInfrequentWords(bag(2),262);
        case 3
            [politics, bag(3)] = find_most_freq(all_category_data,j);
            politics.Properties.VariableNames(1) = {'Politics'};
            politics.Properties.VariableNames(2) = {'Count_P'};
            bag(3) = removeInfrequentWords(bag(3),331);
        case 4
            [sports, bag(4)] = find_most_freq(all_category_data,j);
            sports.Properties.VariableNames(1) = {'Sport'};
            sports.Properties.VariableNames(2) = {'Count_S'};
            bag(4) = removeInfrequentWords(bag(4),237);
        case 5
            [tech, bag(5)]= find_most_freq(all_category_data,j);
            tech.Properties.VariableNames(1) = {'Tech'};
            tech.Properties.VariableNames(2) = {'Count_T'};
            bag(5) = removeInfrequentWords(bag(5),341);
    end
end
All_counted = [business entertainment politics sports tech];
%% Adjust the weights
bag = join(bag);
weight_d = tfidf(bag);
weight_d = full(weight_d);
y = zeros(1500,1);
y(1:300,1) = 1;
y(301:600,1) = 2;
y(601:900,1) = 3;
y(901:1200,1) = 4;
y(1201:1500,1) = 5;
shuffle = randperm(1500)';
for i = 1:1200
    X_tr(i,1:39) = weight_d(shuffle(i),:);
    Y_tr(i,1) = y(shuffle(i),1);
end
for j = 1201:1500
    X_te(j-1200,1:39) = weight_d(shuffle(j),:);
    Y_te(j-1200,1) = y(shuffle(j),1);
end