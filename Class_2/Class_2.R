#######################################################
####################### Class 2 #######################
#######################################################

#install.packages("fun")
library(fun)
if(.Platform$OS.type == "windows") x11() else x11(type = "Xlib")
mine_sweeper()


#install.packages("sudoku")
library(sudoku)
playSudoku()

# Cheer up brian!
devtools::install_github("gaborcsardi/praise")
library(praise)
praise()

#Time until Chitsmas!
difftime("2019-12-24",Sys.Date(),units="sec")

#######################################################
####################### TABLES ########################
#######################################################
#--> Load xlsx, datapasta and googledrive library
library(xlsx)
library(datapasta)
library(googledrive)

#--> Get and modify Working Directory (optional)
# Get
getwd()

# Set, use tab to autocomplete directions
setwd("D:/EAGLE/I_SEMESTER/Introdution_to_Progrmming_and_Geostatistics/IPG_Eagle/Tempral_Data/")

#--> Load Table from csv giving the path
Tablecsv <- read.csv("D:/EAGLE/I_SEMESTER/Introdution_to_Progrmming_and_Geostatistics/IPG_Eagle/Tempral_Data/Table.csv",
                     header = T,
                     sep=";")

#--> Get summary of data csv
summary(Tablecsv)

#--> Load xslx Table
Tablexls <- read.xlsx("Table.xlsx", 1, header=TRUE)

#--> Get summary of data csv
summary(Tablexls)

#--> Paste table using DATAPASTA

Table_Datapasta <- data.frame(stringsAsFactors=FALSE,
                              MUESTRA = c("IT-103", "IT-102", "IT-101", "IT-100"),
                              H = c(464.9, 461.7, 460.4, 457.2),
                              Al2O3 = c(26.646, 30.341, 28.778, 27.692),
                              SiO2 = c(64.073, 59.257, 62.192, 63.034),
                              P2O5 = c(0.25, 0.227, 0.234, 0.259)
)

#--> Load xslx Table from google drive
#--> Get gsheet package
#install.packages('gsheet')
#--> Load gsheet package
library(gsheet)
#--> Get url for document
Google_URL <- "https://docs.google.com/spreadsheets/d/1VRLmwNxIXQIYJgqGh3lQ053txgaAWJpmCxhL7ygFPIY/edit?usp=sharing"

#--> Download Table
Tabledrive <- gsheet2tbl(Google_URL)

#--> Check Table
summary(Tabledrive)

#######################################################
################### Steigerwald Data ##################
#######################################################
#install.packages("RCurl")

#-> Load data from Steigerwald
Steigerwald <- read.csv("https://raw.githubusercontent.com/wegmann/R_data/master/Steigerwald_sample_points_all_data_subset_withNames.csv")

#-> Evaluate data downloaded from Steigerwald
head(Steigerwald)
tail(Steigerwald)
summary(Steigerwald)
str(Steigerwald)
names(Steigerwald)
dim(Steigerwald)
class(Steigerwald)
levels(Steigerwald)
plot(Steigerwald$x,Steigerwald$y)

#######################################################
###################### VECTOR DATA ####################
#######################################################
# Declare empty vector with specific length
vectorTst <- vector(mode='double', length=100)
                          #logical
                          #integer
                          #numeric or double
                          #complex
                          #character
                          #raw 

# Create a vector sequence from 1 to 100 with 2.5 interval
Vec <- seq(1,100,by=2.5)
plot(Vec)
# Access Vec vector
Vec  

# Access Vec vector in position 5
X[5]

# Access Vec vector from position 4 to 10
Vec[4:10]

# Access Vec vector from position "Last"
Vec[length(Vec)]

# Access Vec vector from position "Last - 1"
Vec[length(Vec)-1]

# Access Vec vector withount n position 
n <- 2
Vec[-n]

# Access Vec vector withount list position 
idx <- c(1,4,6,8,10) # create vector idx
Vec[idx] # access from vector

# Access Vec vector with rules 
Vec>20
Vec[Vec>20]
(Vec<=10)|(Vec>=30)
Vec[(Vec<=10)|(Vec>=30)]

# Changing vec vector values by "cloning" vec into vec2
# this can be used to make classifications!

# Create vector vec2 with interger type and vec length
vec2 <- numeric(length(Vec))

#check vec2
vec2

# Filling vec2 by accessing date from vec and classifying it  
vec2[Vec<=30] <- 1
vec2[(Vec>30)&(Vec<=70)] <- 2
vec2[(Vec>70)] <- 3
vec2

# Make the sabe in other approach 
library(car)
vec2 <- recode(Vec, "0:30=1; 30:70=2; else=3")
vec2

#######################################################
# Arrange vector ascendig or descending
Vec_s <- sample(1:100, 100, replace=FALSE)
plot(Vec_s)
Vec_s <- sort(Vec_s, decreasing = FALSE)
plot(Vec_s)
Vec_s <- sort(Vec_s, decreasing = TRUE)
plot(Vec_s)
#######################################################
###################### MATRIX DATA ####################
#######################################################
# Generate a 2 x 3 matrix using vector data
Mat1 <- matrix(c(4,7,3,8,9,2), nrow=2)
Mat1

# Generate a 2 x 3 matrix being more specific
Mat2 <- matrix(
  c(4,7,3,8,9,2),  # Date to fill with
  nrow=2,          # number of rows
  ncol=3,          # number of column 
  byrow=FALSE)     # Fill by column 
Mat2

# Get date from matrix by row 
Mat1[1,]

# Get date from matrix by column 
Mat1[,1]

# Get date from matrix by row and column 
Mat1[1,1]

#######################################################
# Create vector of 80 data normally distributed
Vector_n <- rnorm(80,mean=0,sd=1)

# Check standard deviation
sd(Vector_n)

# convert to dataframe
Matrix_n <- matrix(Vector_n,nrow=20,ncol=4)

# convert to dataframe
Dataf <- data.frame(Matrix_n)
Dataf
# name variables of dataframe
names(Dataf) <- c("var1","var2","var3","var4")
Dataf

# Check dataframe
head(Dataf)
summary(Dataf)
plot(Dataf)
plot(Dataf$var1,Dataf$var4)

#######################################################
###################### DATAFRAMES  ####################
#######################################################

test<-data.frame(A=c(1,2,3),B=c("Z","X","C"))

test[,1]  # all col
test[1,]  # all rw

test[,"A"]

test$A

test$B

test$A[1:2]

####################################################### EXAMPLE
df_1 <- data.frame(plot="location_name_1", measure1=runif(100)*1000, measure2=round(runif(100)*100), value=rnorm(100,2,1), ID=rep(LETTERS,100)[1:100])
summary(df_1)
head(df_1)

df_2 <- data.frame(plot="locarion_name2", measure1=runif(50)*100, measure2=round(runif(50)*10), value=rnorm(50), ID=rep(LETTERS,50)[1:50])


df <- rbind(df_1,df_2)
df[,c('plot','measure1','measure2')]



#WRITE ALL OTHER EXAMPLES! 



