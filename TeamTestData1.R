## Try some Excel data from Watson Analytics
## Set my working directory
##
setwd("C:/Users/irene/Desktop/CourseraDS/TeamTest")
## make packages available that I might use for the Data Analysis
install.packages("xlsx")
library(xlsx)
install.packages("ggplot2")
library(ggplot2)
require(stats)
library(rpart)
## 
## Downloaded the file from website separate read it with R
##
myfile <-read.csv("WA_Fn-UseC_-Marketing-Customer-Value-Analysis.csv", header=TRUE)
##
## quick check of variables
##
str(myfile)
##
## another quick checks shows first few records few last
##
head(myfile)
##
## Descriptive Statistics. One way to understand new data is to start looking at 
## some descriptive measures of the data. For continuous things like mean, 
## interquartile ranges, measures of central tendency
##
## For Categorical data we can start with table of values and number of observations
##
## State - Categorical
##
table(myfile$State)
plot(myfile$State, myfile$Customer.Lifetime.Value/1000, 
     main="Lifetime Value by State", 
     xlab="State", ylab="LifetimeValue ($1,000s)")
##
## Lifetime Value - numeric
##
summary(myfile$Customer.Lifetime.Value)
IQR(myfile$Customer.Lifetime.Value)
boxplot(myfile$Customer.Lifetime.Value)
##
## Income
##
summary(myfile$Income)
hist(myfile$Income/1000)
boxplot(myfile$Income/1000)
##
## Response - have not found what this could be Contains Yes, No
##
table(myfile$Response)
##
## Coverage
##
table(myfile$Coverage)
## some diff type of coverage seems to have an association
##
plot(myfile$Coverage, myfile$Customer.Lifetime.Value/1000, 
     main="Lifetime Value by Coverage", 
     xlab="Coverage", ylab="LifetimeValue ($1,000s)")
## some diff
plot(myfile$Coverage, myfile$Total.Claim.Amount, 
     main="Total Claim Amount", 
     xlab="Coverage", ylab="Total Claim Amount")
##
## Education
##
table(myfile$Education)
plot(myfile$Education, myfile$Customer.Lifetime.Value/1000, 
     main="Lifetime Value by Education", 
     xlab="Education", ylab="LifetimeValue ($1,000s)")
## lots of outliers similar sized boxes
##
plot(myfile$Education, myfile$Total.Claim.Amount, 
     main="Total Claim Amount", 
     xlab="Education", ylab="Total Claim Amount")
##
## Doctor and Master are lowe and fewer outliers
##
## Employment Status
##
table(myfile$EmploymentStatus)
plot(myfile$EmploymentStatus, myfile$Customer.Lifetime.Value/1000, 
     main="Lifetime Value by Emp Status", 
     xlab="EmploymentStatus", ylab="LifetimeValue ($1,000s)")
## boxes similar but outliers are different
##
##  >>>>differences
##
plot(myfile$EmploymentStatus, myfile$Total.Claim.Amount, 
     main="Total Claim Amount by Emp Status", 
     xlab="Emp Status", ylab="Total Claim Amount")
## Emp status to Total Claim shows an association also difference in outliers
##
## scatterplot
plot(myfile$Total.Claim.Amount/1000, myfile$Customer.Lifetime.Value/1000, 
     xlab="Total Claim 000s", 
     ylab="Lifetime Value 000s", 
     main="Claims V Value", pch=2, cex.main=1.5, frame.plot=FALSE , col="blue")
## shows some linear but doesnt look strong
##
## Gender
table(myfile$Gender)
##
plot(myfile$Gender, myfile$Total.Claim.Amount, 
     main="Total Claim Amount by Gender", 
     xlab="Gender", ylab="Total Claim Amount")
## similar
##
## Location Code
table(myfile$Location.Code)
plot(myfile$Location.Code, myfile$Customer.Lifetime.Value/1000, 
     main="Lifetime Value by Location", 
     xlab="Location", ylab="LifetimeValue ($1,000s)")
## similar
## >>>>> Differences
##
plot(myfile$Location.Code, myfile$Total.Claim.Amount, 
     main="Total Claim Amount by Location Code", 
     xlab="LocationCode", ylab="Total Claim Amount")
## But Location to Total Claim seems to have an association
##
## Marital Status
table(myfile$Marital.Status)
plot(myfile$Marital.Status, myfile$Customer.Lifetime.Value/1000, 
     main="Lifetime Value by Location", 
     xlab="MaritalStatus", ylab="LifetimeValue ($1,000s)")
plot(myfile$Marital.Status, myfile$Total.Claim.Amount, 
     main="Total Claim Amount", 
     xlab="MaritalStatus", ylab="Total Claim Amount")
## single shows some association Divorced fewer outliers
##
## Total Claim Amount
##
mean(myfile$Total.Claim.Amount)
hist(myfile$Total.Claim.Amount)
sd(myfile$Total.Claim.Amount)
IQR(myfile$Total.Claim.Amount)
hist(myfile$Total.Claim.Amount)
##
## Months Since Last Claim
##
mean(myfile$Months.Since.Last.Claim)
hist(myfile$Months.Since.Last.Claim)
mean(myfile$Number.of.Policies)
hist(myfile$Number.of.Policies)
##
## Customer Lifetime Value
## expected more here, but not found
## to Income
plot(myfile$Income/1000, myfile$Customer.Lifetime.Value/1000, 
     xlab="Income 000s", 
     ylab="Lifetime Value 000s", 
     main="Income V Value", pch=2, cex.main=1.5, frame.plot=FALSE , col="green")
plot(myfile$Number.of.Policies, myfile$Customer.Lifetime.Value/1000,
     xlab="number of policies", 
     ylab="Lifetime Value 000s", 
     main="Nbr Policies V LifeTime Value", cex.main=1.5,  col="blue")
plot(myfile$Months.Since.Policy.Inception, myfile$Customer.Lifetime.Value/1000, 
     xlab="Months policy inception", 
     ylab="Lifetime Value 000s", 
     main="Months since Inception V Value",  col="green")
plot(myfile$Number.of.Open.Complaints, myfile$Total.Claim.Amount/1000, 
     xlab="Nbr Complaints", 
     ylab="Total Claim Amt 000s", 
     main="Open Complaints V Claim",  col="black")
## Premium and Claim
plot(myfile$Monthly.Premium.Auto, myfile$Total.Claim.Amount/1000, 
     xlab="Monthly Premium", 
     ylab="Total Claim Amt 000s", 
     main="Premium V Claim", pch=21,  col="blue")
(lm(myfile$Total.Claim.Amount ~ myfile$Monthly.Premium.Auto))
       
hist(myfile$Monthly.Premium.Auto)
## caculate Perasons R for Premium and Claim
premMean <- mean(myfile$Monthly.Premium.Auto)
premMean
premSD <- sd(myfile$Monthly.Premium.Auto)
premSD
claimMean <- mean(myfile$Total.Claim.Amount)
claimMean
claimSD <- sd(myfile$Total.Claim.Amount)
claimSD
premZ <- ( myfile$Monthly.Premium.Auto - premMean)/premSD
claimZ <-(myfile$Total.Claim.Amount-claimMean)/claimSD
ZxZy <- premZ*claimZ
## it is .632 so positive correlation
r <- sum(ZxZy)/9133
r
## or you can just use the cor.test
cor.test(myfile$Monthly.Premium.Auto, myfile$Total.Claim.Amount)
##
cor.test(myfile$Monthly.Premium.Auto, myfile$Total.Claim.Amount,method = "spearman")
## 
### Catagorical Data
# grow tree
fit <- rpart(myfile$Coverage ~ myfile$EmploymentStatus + 
             myfile$State + myfile$Gender,
             method="class", data=myfile)

printcp(fit) # display the results
plotcp(fit) # visualize cross-validation results
summary(fit) # detailed summary of splits

# plot tree
plot(fit, uniform=TRUE,
     main="Classification Tree for Response")
text(fit, use.n=TRUE, all=TRUE, cex=.8)

# create attractive postscript plot of tree
post(fit, file = "C:/Users/irene/Desktop/CourseraDS/TeamTest/tree.ps",
     title = "Classification Tree for Response")


## Vehicle class
table(myfile$Vehicle.Class)
plot(myfile$Vehicle.Class, myfile$Total.Claim.Amount/1000, 
     xlab="Vehicle Class", 
     ylab="Total Claim Amt 000s", 
     main="Vehicle Class V Claim", pch=21,  col="blue")
##
plot(myfile$Vehicle.Class, myfile$Customer.Lifetime.Value/1000, 
     xlab="Vehicle Class", 
     ylab="Lifetime Value 000s", 
     main="Vehicle Class V Lifetime Value", pch=2,  col="yellow")
#####################################################################



## Intercept and slope
fit1 <-lm(myfile$Customer.Lifetime.Value 
          ~ myfile$Months.Since.Last.Claim  )
fit1
plot(fit1)

##
fit2 <- lm(myfile$sales_M ~ myfile$Mth_nbr + myfile$Weeks)
fit2
plot(fit2)
anova(fit1, fit2) 
coefficient(fit)
##
myfilelob <-read.xlsx("zzTEAM TEST DATA 2.xlsx", sheetIndex = 1,header=TRUE)
barplot(myfile$sales_M)
boxplot(myfile$sales_M)

plot(myfile$Mth_nbr, myfile$net_sales, xlab ="Month", ylab = "Net Sales")
##
line <- lm(myfile$sales_M ~ myfile$Mth_nbr)

plot(myfile$Mth_nbr, myfile$sales_M, xlab ="Month", 
     ylab = "Net Sales")

abline(a=958.24, b=-2.45)
##
myfilelob <-read.xlsx("zzTEAM TEST DATA 2.xlsx", sheetIndex = 1,header=TRUE)
myfilelob$sales_M <- round((myfilelob$net_sales/1000000),1)
myfilelob
##
fit3 <- lm(myfilelob$sales_M ~ myfilelob$Mth_nbr + myfilelob$Week 
           + myfilelob$LOB_Nbr)
fit3
anova(fit3)


