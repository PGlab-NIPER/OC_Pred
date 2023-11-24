
# Ovarian Cancer Prediction using ML

**OC_Pred** is ML based classificaton model to predict given sample is tumor or normal.


## Contents
* ``data`` This folder contains the dump of classification models
* ``predict.R`` This is the R script for making predictions on the test set
## System Dependencies
* R language (64 bit) 
* make sure to add the path of R language to the sytem environment variables.
For adding path of R language to system environment variable use following command:                        
```bash
pathman /au C:\Program Files\R\R-4.3.2\bin\x64
```                                                                               
Above command is for R version 4.3.2, change it according to the R version installed               
For example for R version 4.2.0:                                                       
```bash
pathman /au C:\Program Files\R\R-4.2.0\bin\x64
```

## Required R libraries
* Use following command in the command prompt run as administrator to install required R libraries:                                                         
```bash
Rscript -e "install.packages(c('kernlab','randomForest','caret','class'),repos='https://cloud.r-project.org', dependencies=TRUE)"
```
## Usage
**To make the prediction need log2 normalized gene expression values of following set of genes in following order:**

* KRT18
* HOXB2
* CELSR1
* EHF
* KLK6
* FOLR1
* NEK2
* WFDC2
* OSR2
* FOXL2
* STAR
* SGK1
* CLSTN2
* ADAMTS5

***See the sample_data.csv for reference.***

**If gene expression values are non normalized, then normalize them using log2 normalization** 

1. Download the repository and save all the files and folders of repository in one folder.
2. Then Use the follwing command by changing current working directory to the folder where repository predict.R is saved.
```bash
Rscript predict.R
```
3. User wil be prompted to select ``.csv`` file of sample gene expression data of above 14 genes.  
4. Once the .csv file is selected and the process is completed, results will be saved in ``ovarian_cancer_prediction.csv`` file.




