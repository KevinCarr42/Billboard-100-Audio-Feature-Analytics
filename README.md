# Comparing Song Audio Features to Rankings on The Billboard Hot 100

### Project Description

The central problem in this project is to utilise publicly available audio feature data to predict whether or not a song is likely to appear on the Billboard Hot 100 charts. Audio feature data and Billboard Hot 100 chart data for this project have been obtained from multiple sources and combined.

For this project, two main techniques will be employed, namely data mining and predictive analytics. First, data mining and knowledge discovery will be used to explore the data, cluster audio features, and determine correlations between audio features. Second, predictive analytics will be used to attempt to build a predictive model using the data. By utilising knowledge discovered during the data mining phase of the project, predictive analysis will be broken into sets clustered with similar audio features. It is anticipated that this segmentation will improve predictive accuracy and lead to further insights.

### Links to Source Files and Spotify API:
https://www.kaggle.com/datasets/maltegrosse/8-m-spotify-tracks-genre-audio-features
https://www.kaggle.com/datasets/rodolfofigueroa/spotify-12m-songs
https://www.kaggle.com/datasets/dhruvildave/billboard-the-hot-100-songs
https://developer.spotify.com/documentation/web-api/reference/#/

### Repository Outline

This repository contains the following:
* An ordered set of Jupyter notebooks (.ipynp format) for the following calculations:
  * Data import and cleaning
  * Exploratory data analysis
  * Analysis of outliers
  * Various classification calculations (still in progress)
* Dataframes used in the calculations (in .pickle format)
* The working copy of the final report (in .docx format, still in progress)
* A file with some usefull SQL queries used in this project (in .sql format)
* A spreadsheet organising references (in .xlsx format)
* A folder of HTML exports of completed notebooks with outputs
* A folder of printed figures for the report
* A folder containing relevant references

A number of the datasets used in the calculations are quite large. The following is a link to larger files used in this project:
https://drive.google.com/drive/folders/10wpORzZURV11VAUPKmCDDKxHFCvwjloR
Note: You must use be a member of the Toronto Metropolitan University group account to access this folder.

### Tentative Stages of This Project

This project will follow these tentative stages:
1. Import data
2. Combine data from different sources sources
3. Gather missing data from Spotify API
4. Exploratory data analysis
   * investigate histograms for features
   * investigate time series changes to features
   * investigate correlation between features
   * investigation genres
5. Remove outliers before clustering:
   * investigate IQR, Z score, percentiles, and domain knowledge
   * combine percentiles and domain knowledge to remove tracks that are not music (or a reasonable estimate)
6. Cluster data using audio features
   * optimise clusters using silhouette and elbow methods
   * compare clusters to genres from EDA, and create another clustering with the same number of features
7. Classify songs based on predicted popularity
   * set up a modelling pipeline that includes undersampling to balance the dataset for classification
   * investigate a number of machine learning models
     * logistic regression
     * decision trees
     * k nearest neighbours
     * random forests
     * boosted classifiers (adaboost)
     * neural networks (TensorFlow)
   * test all methods using default settings on a number of clusters
   * choose the best performing model to tune hyperparameters and optimise
     * THIS STEP FAILED, NO CLASSIFIER WORKS PARTICULARLY WELL (see discussion below)
8. Tune hyperparameters to optimise the chosen classifier
   * since the previous step hasn't worked, every model was tuned to check for optimal settings
     * THIS STEP DIDN'T WORK EITHER, NO HYPERPARAMETERS IMPROVED CLASSIFICATION UNDER ANY EVALUATION METRIC
9. OPTIONAL: Use a voting classifier to ensemble the best performing methods from before
10. Conclusion and reporting
  
### Discussion About Failed Classification
The balanced classification models are working better than the unbalanced defaults, which predict 100% of songs are not popular (accurate, but 0 recall). So the models are technically performing better than chance. However, predicting on the order of 30% of songs as popular leads to near 0 precision. It looks like there is too much variance in each of the audio features to predict popularity with any precision, even after clustering or grouping by genre. It should be noted that none of the references that predicted popularity dealt with a highly unbabalanced datasets, which is a large part of the issue here.
