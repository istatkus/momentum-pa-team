## Codebook Marketing Customer Value Analysis

### title: Codebook Customer Value Analysis
##### date: March 2016

## Project Description

Clean and prepare a tidy data set from Watson Analytics using customer demographics to predict buying behavior.  
+The raw data is a set of files from: 
+https://community.watsonanalytics.com/guide-to-sample-datasets/
+read.csv("WA_Fn-UseC_-Marketing-Customer-Value-Analysis.csv", header=TRUE)

####The consumer of this tidy data set requests:

* SUBJECT 
+ For 
+ For 

#### SUBJECTS 
The data was collected on customers.
There are 24 columns of data.

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


##Creating the tidy datafile
* Set the environment and working directory
+ install.packages("xlsx")
+ library(xlsx)
+ install.packages("ggplot2")
+ library(ggplot2)
+ require(stats)
+ library(dplyr)
+ library(tidyr)
+ library(stringr)
+ library(reshape2)


1. Step 1: Get the data by Downloading 
2. Step 2: Prepare the table for 
3. Step 3: 
4. Step 4: Read 
5. Step 5: 
6. Step 6:       
7. Step 7: 
8. Step 8: 
9. Step 9: 
10. Step 10 :
11. Step11: 
12. Step 12 write it out


##Description of the variables in the tidydata.txt file  

#### State   
Arizona | California |    Nevada |    Oregon  | Washington 
-----------------------------------------------------------
 1703   |    3150    |      882  |     2601   |     798

#### Customer.Lifetime.Value  
summary(myfile$Customer.Lifetime.Value)  
Min. | 1st Qu. | Median |   Mean | 3rd Qu. |    Max. 
----------------------------------------------------------
1898 |  3994   |  5780  |   8005 |   8962  |   83330 

#### Response                     

#### Coverage    

#### Education                    

#### Effective.To.Date            

#### EmploymentStatus    

#### Gender    

#### Income  
 Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
 0       0   33890   37660   62320   99980 
#### Location.Code                
#### Marital.Status               
#### Monthly.Premium.Auto         
#### Months.Since.Last.Claim      
#### Months.Since.Policy.Inception
#### Number.of.Open.Complaints    
#### Number.of.Policies           
#### Policy.Type                  
#### Policy                       
#### Renew.Offer.Type            
 Sales.Channel              
 Total.Claim.Amount           
 Vehicle.Class                
 Vehicle.Size                

 
 
 


##Sources and Acknowledgements

For more information about this dataset please contact: 

Acknowledging 

License:
========
Use of this dataset is for testing and training on Watson Analytics which we are comparing to R and SPSS
