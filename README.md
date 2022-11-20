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
* A folder containing a compilation of uploaded reports

A number of the datasets used in the calculations are quite large. The following is a link to larger files used in this project:
https://drive.google.com/drive/folders/10wpORzZURV11VAUPKmCDDKxHFCvwjloR
Note: You must use be a member of the Toronto Metropolitan University group account to access this folder.

### Tentative Stages of This Project

This project will follow these tentative stages:
1. Data import and cleaning
    * Import data
    * Combine data from different sources sources
    * Gather missing data from Spotify API
    * Optimise data types and file format
2. Exploratory data analysis:
    * investigate histograms for features
    * investigate time series changes to features
    * investigate correlation between features
    * investigation genres
3. Investigate and remove outliers:
    * investigate IQR, Z score, percentiles, and domain knowledge
    * combine percentiles and domain knowledge to remove tracks that are not music (or a reasonable estimate)
4. Cluster data using audio features
    * optimise clusters using silhouette and elbow methods
    * compare clusters to genres from EDA, and create another clustering with the same number of features
5. Classify songs based on predicted popularity
    * set up a modelling pipeline that includes undersampling to balance the dataset for classification
    * investigate a number of machine learning models
      * logistic regression
      * decision trees
      * k nearest neighbours
      * random forests
      * boosted classifiers (adaboost)
      * neural networks (TensorFlow)
    * 5A. test all methods using default settings on a number of clusters
      * choose the best performing model to tune hyperparameters and optimise
      * THIS STEP FAILED, NO CLASSIFIER WORKS PARTICULARLY WELL (see discussion below)
    * 5B. tune hyperparameters to optimise the chosen classifier
      * since the previous step hasn't worked, every model was tuned to check for optimal settings
      * THIS STEP DIDN'T WORK EITHER, NO HYPERPARAMETERS IMPROVED CLASSIFICATION UNDER ANY EVALUATION METRIC
    * 5C. investigate whether neural networks could solve the above problems
      * THIS STEP DIDN'T WORK EITHER
    * 5D. investigate whether Spotify's popularity metric is more predictable or consistent
      * THIS STEP DIDN'T WORK EITHER
    * 5E. OPTIONAL: use a voting classifier to ensemble the best performing methods from before
    * 5F. OPTIONAL: use PCA to reduce dimensionality prior to classifying
      * NOTE: based on results from Step 6, this may increase accuracy of classification
      * if time permits, it would be interesting to investigate adding PCA to the modelling pipeline
6. Conclusion and reporting
    * statistics
    * visualisations of predictions vs expected results
    * evaluation of models
    * study limitations
    * future work
  
### Discussion About Failed Classification
Although results are not as desired, the models appear to be functioning correctly, and there may be no way to avoid a huge percentage of false positives. The balanced classification models are working much better than the unbalanced defaults, which predict 100% of songs are not popular (accurate, but 0 recall). So the models are technically performing much better than chance. However, predicting on the order of 30% of songs as popular leads to near 0 precision. It looks like there is too much variance in each of the audio features to predict popularity with any precision, even after clustering or grouping by genre. It should be noted that none of the references that predicted popularity dealt with a highly unbabalanced datasets, which is a large part of the issue here.

Another reason to believe that the models are functioning properly involves PCA as utilised for visualisations in STEP 6. Looking at a scatterplot of the first 2 principal components, it appears that predictions are lined up well with actual popular songs. The issue with precision involves popular songs taking up a large portion of 2-dimensional audio feature space (and presumably also the full dimensional feature space, but that is impossible to visualise). Also interesting to note, reducing dimensionality as part of the evaluation pipeline has the potential to improve
