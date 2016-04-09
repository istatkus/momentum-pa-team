### Codebook Marketing Customer Value Analysis

### title: Momentum Customer Value Analysis
##### date: March 2016

### Project Description

Identify characteristics of customers who positively responded to the renewal offer campaign.

+The raw data is a set of files from Watson Analytics with categorical and numeric data: 
+https://community.watsonanalytics.com/guide-to-sample-datasets/
+read.csv("WA_Fn-UseC_-Marketing-Customer-Value-Analysis.csv", header=TRUE)

### R Studio  

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
+ library(rpart)  

#### Additional Insights into the data

The data sample was from a Marketing offer Campaign
It contains the Renewal Offer 
The Response Yes/No
Does not appear to contain any R,F,M characteristics
Contains a collection of numeric, catagorical data
Which variables have a relationship with Response

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
#### Response 
table(myfile$Respose)  

|  No   | Yes   |
|------:|------:|
|7826   |1308   | 

### Renewal.Offer.Type  
table(myfile$Response,myfile$Renew.Offer.Type)  

|Response |Offer1  |   Offer2  |   Offer3 |   Offer4  |
|-------:|----------:|---------:|----------:|--------:|
|   No   |     3158  |   2242 |   1402  | 1024  |
|  Yes   |     594   |    684 |   30  |    0  |  

### Education  
table(myfile$Education)  

|Bachelor  |   College |   Doctor | High School or Below | Master  |
|---------:|----------:|---------:|---------------------:|--------:|
|2748  |    2681   |      342 |        2622| 741|  


#### EmploymentStatus  
table(myfile$EmploymentStatus)  

| Disabled  | Employed  |Medical Leave  | Retired  | Unemployed |
|----------:|----------:|--------------:|---------:|------------|
| 405       |     5698  |         432   |     282  |      2317  | 

#### Number.of.Policies
sum_rrpYMatrix <- dcast(sum_rrpYp, Renew.Offer.Type ~ Number.of.Policies,  
+ value.var='percentYes', fun.aggregate=sum)  
> sum_rrpYMatrix  

|  Renew.Offer.Type |    1  |   2   |  3  |   4   |  5   |  6   |  7  |   8   |  9   |
|------------------:|------:|------:|-----:|-----:|-----:|-----:|-----:|-----:|-----:|
|           Offer1| 0.171 | 0.180 | 0.139 | 0.127 | 0.162 | 0.103 |0.093 |0.139 |0.181 | 
|           Offer2| 0.256 | 0.224 | 0.178 | 0.161 | 0.244 | 0.211 |0.309 |0.155 |0.288  |
|           Offer3| 0.047 | 0.017 | 0.000 | 0.000 | 0.000 | 0.000 |0.000 |0.000 |0.000  |
|           Offer4| 0.000 | 0.000 | 0.000 | 0.000 | 0.000 | 0.000 |0.000 |0.000 |0.000  |  
    

image:![Plot Offer Policy Yes Percent](https://github.com/istatkus/momentum-pa-team/blob/master/Rplot%20Offer%20Policy2.png)

image:![Plot Offer Policy Yes Response](https://github.com/istatkus/momentum-pa-team/blob/master/Rplot%20Offer%20Policy.png)

#### Grow a Tree

image:![Tree For Response](https://github.com/istatkus/momentum-pa-team/blob/master/Rplot%20Tree.png)  

image:![Tree For Offer](https://github.com/istatkus/momentum-pa-team/blob/master/Rplotoffer.png)  







