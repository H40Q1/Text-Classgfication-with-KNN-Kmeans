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
  * Case Folding: 
  * Tokenizing:
  * Filtering:
  * Lemmatisation:
### Words_list.mat
The word list contains most frequent 10 words in each category total of 50 words.

<img width="644" alt="table" src="https://user-images.githubusercontent.com/55101879/80283559-69920a00-86e6-11ea-814a-9e25e5b52acd.png">
