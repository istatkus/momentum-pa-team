### Codebook Marketing Customer Value Analysis

### title: Momemtum Customer Value Analysis
##### date: March 2016

### Project Description

Clean and prepare a tidy data set from Watson Analytics using customer demographics to predict Customer Value or Identify variables that are correlated or predictors of value.  We will use the same data set in R, Watson Analytics and SPSS.

+The raw data is a set of files from Watson Analytics with categorical and numeric data: 
+https://community.watsonanalytics.com/guide-to-sample-datasets/
+read.csv("WA_Fn-UseC_-Marketing-Customer-Value-Analysis.csv", header=TRUE)

####The First Step is to analyze and understand the data. 

In R we will use various R packages and functions to better understand each variable.  
* Set the environment and working directory. Some of the packages used include  
+ install.packages("xlsx") 
+ library(xlsx) for downloading and reading Excel spreadsheets
+ install.packages("ggplot2")
+ library(ggplot2) for plotting charts
+ require(stats)
+ library(dplyr) 
+ library(tidyr)
+ library(stringr)
+ library(reshape2)
+ +library(rpart)

#### Variables 
The data was collected on customers.
There are 24 columns of data. Many of the fields are categorical.

+> str(myfile)
+'data.frame':	9134 obs. of  24 variables:
+ $ Customer                     : Factor w/ 9134 levels "AA10041","AA11235",..: 601 5947 97 8017 2489 4948 8434 756 1352 548 
+ $ State                        : Factor w/ 5 levels "Arizona","California",..: 5 1 3 2 5 4 4 1 4 4 ...
+ $ Customer.Lifetime.Value      : num  2764 6980 12887 7646 2814 ...
+ $ Response                     : Factor w/ 2 levels "No","Yes": 1 1 1 1 1 2 2 1 2 1 ...
+ $ Coverage                     : Factor w/ 3 levels "Basic","Extended",..: 1 2 3 1 1 1 1 3 1 2 ...
+ $ Education                    : Factor w/ 5 levels "Bachelor","College",..: 1 1 1 1 1 1 2 5 1 2 ...
+ $ Effective.To.Date            : Factor w/ 59 levels "1/1/11","1/10/11",..: 48 25 42 13 53 18 48 10 19 40 ...
+ $ EmploymentStatus             : Factor w/ 5 levels "Disabled","Employed",..: 2 5 2 5 2 2 2 5 3 2 ...
+ $ Gender                       : Factor w/ 2 levels "F","M": 1 1 1 2 2 1 1 2 2 1 ...
+ $ Income                       : int  56274 0 48767 0 43836 62902 55350 0 14072 28812 ...
+ $ Location.Code                : Factor w/ 3 levels "Rural","Suburban",..: 2 2 2 2 1 1 2 3 2 3 ...
+ $ Marital.Status               : Factor w/ 3 levels "Divorced","Married",..: 2 3 2 2 3 2 2 3 1 2 ...
+ $ Monthly.Premium.Auto         : int  69 94 108 106 73 69 67 101 71 93 ...
+ $ Months.Since.Last.Claim      : int  32 13 18 18 12 14 0 0 13 17 ...
+ $ Months.Since.Policy.Inception: int  5 42 38 65 44 94 13 68 3 7 ...
+ $ Number.of.Open.Complaints    : int  0 0 0 0 0 0 0 0 0 0 ...
+ $ Number.of.Policies           : int  1 8 2 7 1 2 9 4 2 8 ...
+ $ Policy.Type                  : Factor w/ 3 levels "Corporate Auto",..: 1 2 2 1 2 2 1 1 1 3 ...
+ $ Policy                       : Factor w/ 9 levels "Corporate L1",..: 3 6 6 2 4 6 3 3 3 8 ...
+ $ Renew.Offer.Type             : Factor w/ 4 levels "Offer1","Offer2",..: 1 3 1 1 1 2 1 1 1 2 ...
+ $ Sales.Channel                : Factor w/ 4 levels "Agent","Branch",..: 1 1 1 3 1 4 1 1 1 2 ...
+ $ Total.Claim.Amount           : num  385 1131 566 530 138 ...
+ $ Vehicle.Class                : Factor w/ 6 levels "Four-Door Car",..: 6 1 6 5 1 6 1 1 1 1 ...
+ $ Vehicle.Size                 : Factor w/ 3 levels "Large","Medsize",..: 2 2 2 2 2 2 2 2 2 2 .



### Description of the variables in the Marketing Customer Value Analysis File  

#### State   
These are US States and appear to be a subset of the following  
table(myfile$State)  

| Arizona | California | Nevada | Oregon  | Washington |  
|--------:|-----------:|-------:|--------:|-----------:|  
| 1703    |    3150    |   882  |     2601|     798    |  

#### Customer.Lifetime.Value  
summary(myfile$Customer.Lifetime.Value)   

|Min. | 1st Qu. | Median |   Mean | 3rd Qu. |    Max. |
|----:|--------:|-------:|-------:|--------:|---------|
|1898 |  3994   |  5780  |   8005 |   8962  |   83330 |

#### Response 
There is no additional documentation on this field.  
table(myfile$Respose)  

|  No   | Yes   |
|------:|------:|
|7826   |1308   | 

#### Coverage    
table(myfile$Coverage)  

| Basic | Extended | Premium |
|------:|---------:|--------:|
| 5568  |   2742 |      824 | 

#### Education  
table(myfile$Education)  

|Bachelor  |   College |   Doctor | High School or Below | Master  |
|---------:|----------:|---------:|---------------------:|--------:|
|2748  |    2681   |      342 |        2622| 741|  

#### Effective.To.Date            

#### EmploymentStatus  
table(myfile$EmploymentStatus)  

| Disabled  | Employed  |Medical Leave  | Retired  | Unemployed |
|----------:|----------:|--------------:|---------:|------------|
| 405       |     5698  |         432   |     282  |      2317  | 
image:![Employment Status and Claim](https://github.com/istatkus/momentum-pa-team/blob/master/mmbox_Empstatus_Claim.PNG)

#### Gender    
|F     |M     |
|-----:|-----:|
|4658  | 4476 | 
#### Income  
| Min. | 1st Qu.| Median |  Mean  | 3rd Qu. |  Max.  | 
|-----:|-------:|-------:|-------:|--------:|-------:|
| 0    |   0    |  33890 | 37660  | 62320   | 99980  |

#### Location.Code   
table(myfile$Location.Code)  
|Rural    |Suburban |  Urban  | 
|--------:|--------:|--------:|
|1773     |  5779   |  1582   |  
image:![Boxplot Location and Total Claim](https://github.com/istatkus/momentum-pa-team/blob/master/mmBox_Loc_claim.PNG)

#### Marital.Status 

|Divorced|Married | Single | 
|-------:|-------:|-------:|
|1369    | 5298   |  2467  |   
#### Monthly.Premium.Auto 
This is a continuous numeric field, so we explore additional information on its central tendency and spread.
|Mean      | Std Deviation |
|---------:|--------------:|
|93.21929  |  34.40797     |
To see if there is any linear relationship to Claim, we use a scatterplot.
image:![Scatterplot Premium To Total Claim](https://github.com/istatkus/momentum-pa-team/blob/master/mmScatterPremiumVClaim.PNG)

Pearsons r .632  
using Evans 1996 it appears strong however, it fails the assumptions for Pearsons r  
.00-.19 very weak  
.20-.39 weak  
.40-.59 moderate  
.60-.79 strong  
.80-1.0 very strong  

interval - ok, linear - appears to have some, bivariate normal - FAIL- each variable is skewed right  
using Spearmans rank   .52   however the data has ties

image:![Histogram of Monthly Premiums](https://github.com/istatkus/momentum-pa-team/blob/master/mmHIstMonthlyPremium.PNG)

lm(formula = myfile$Total.Claim.Amount ~ myfile$Monthly.Premium.Auto)

Coefficients:
|(Intercept)       | Slope        |
|-----------------:|-------------:|
|-63.329           |     5.336    |
  
  


#### Months.Since.Last.Claim      
#### Months.Since.Policy.Inception
#### Number.of.Open.Complaints    
#### Number.of.Policies           
#### Policy.Type                  
#### Policy                       
#### Renew.Offer.Type            
#### Sales.Channel              
#### Total.Claim.Amount   

image:![Histogram Total Claim](https://github.com/istatkus/momentum-pa-team/blob/master/mmhist_claim.PNG)

image:![Scatterplot Total Claim to LifeTime Value](https://github.com/istatkus/momentum-pa-team/blob/master/mmScatterClaimsLifeTimeValue.PNG)

#### Vehicle.Class  


|Four-Door Car    |Luxury Car |   Luxury SUV|    Sports Car |          SUV|  Two-Door Car|  
|----------------:|----------:|------------:|--------------:|------------:|-------------:|  
|    4621   |        163    |       184 |          484  |        1796|          1886 |


#### Vehicle.Size                

 
 
 


##Sources and Acknowledgements

For more information about this dataset please contact:  Watson Analytics

Acknowledging 
Coursera Basic Statistics Class, Intro to R
http://www.statstutor.ac.uk/resources/uploaded/pearsons.pdf
http://www.r-bloggers.com/what-a-nice-looking-scatterplot/
http://www.gardenersown.co.uk/education/lectures/r/correl.htm#correlation
Watson Analytics for the data set

License:
========
Use of this dataset is for testing and training on Watson Analytics which we are comparing to R and SPSS
