%% Find the most freq words
function [most_freq,bag] = find_most_freq(all_category_data,index)
    % Receive categoires one by one
    news = all_category_data(1:end,index);
    % Delete the punctuation
    news = erasePunctuation(news);
    % Tokenize the words in order to process in bag of words
    tokenized_news = tokenizedDocument(lower(news));
    % Normalize the words thru lemmatizing
    tokenized_news = normalizeWords(tokenized_news, 'Style','lemma');
    % Delete unwanted words
    unwanted_words = ["the" "to" "in" "of" "a" "and" "is" "that" "for" ...
        "said" "on" "it" "has" "its" "by" "as" "at" "be" "was" "have" ...
        "are" "will" "from" "with" "us" "mr" "but" "which" "an" "this" ...
        "had" "he" "not" "been" "would" "than" "more" "were" "their" ...
        "up" "also" "we" "they" "could" "about" "his" "who" "i" "she" ...
        "after" "there" "if" "should" "out" "you" "all" "can" "or" ...
        "her" "what" "when" "my" "many" "such" "them" "other" "some" ...
        "say" "do" ];
    tokenized_news = removeWords(tokenized_news,unwanted_words);
    % Initialize the bag of words
    bag = bagOfWords(tokenized_news);
    % Return the most 10 frequenct words
    most_freq = topkwords(bag,70);
end