# EC503Project
## Data
* This dataset is provided from BBC news. (D. Greene and P. Cunningham. "Practical Solutions to the Problem of Diagonal Dominance in Kernel Document Clustering", Proc. ICML 2006.).

* Our dataset consists of 1500 news from 5 different categories. Business, entertainment, politics, sports and tech. 

* We put all the news documents in a 300x5 matrix. Where each column represents a news category.   

*  The columns represents business, entertainment, politics, sports and tech categories respectively. 

    <img width="560" alt="WeChat Image_20200427212621" src="https://user-images.githubusercontent.com/55101879/80549796-29ec4c00-898c-11ea-8dc3-15905eae4b78.png">

* We split the whole dataset by 8:2 ratio. That makes 1200 news for Train and 300 news for Test.
## Preprocessing
* In order to make use of raw text documents, we have to preproces them. Our preprocessing steps are:
  * Case Folding: Changing letters to lowercases and getting rid of any special characters.
  * Tokenizing: The process of reducing the text into it's individual.
  * Filtering: Dispose conjunction words and unnecessary words such as 'am','is','are', that doesn't give us any information about category labels.
  * Lemmatisation: This is a tecnique for reducing the words onto their root form. 
  
 * Use a bag of words model to find the most frequent 10 words for each category, total 50 words. Then select each unique word to determine the feature words. 

* The word list contains most frequent 10 words in each category total of 50 words. After we select the unique words we get 38 feature words. 

* You can see the categories, most frequent words and their corresponding labels in the table.

    * <img width="644" alt="table" src="https://user-images.githubusercontent.com/55101879/80283559-69920a00-86e6-11ea-814a-9e25e5b52acd.png">

 ## Term-Weighting
 * 
