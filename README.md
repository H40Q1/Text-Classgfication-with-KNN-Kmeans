# EC503Project
## Data
### All_categories.mat
The data file is a 300x5 matrix contains 1500 news from 5 different category. The columns are business, entertainment, politics, sports and tech respectively. 

<img width="639" alt="all_cat" src="https://user-images.githubusercontent.com/55101879/80283552-63039280-86e6-11ea-8b3b-15aa3f47e801.png">

  #### Train Data
    * Contains total number of 1200 news. 240 from each category
  #### Test Data
    * Contains total number of 300 news. 60 from each category.
    
### Words_list.mat
The word list contains most frequent 10 words in each category total of 50 words.

<img width="644" alt="table" src="https://user-images.githubusercontent.com/55101879/80283559-69920a00-86e6-11ea-814a-9e25e5b52acd.png">

### weights.mat
This data file contains the weights of most frequent words in each document. Because there are common words in categories it boils down from 50 to 39. So In total we have 1500x39 matrix.

<img width="638" alt="dist" src="https://user-images.githubusercontent.com/55101879/80283616-e7561580-86e6-11ea-912d-30371ad23c38.png">
