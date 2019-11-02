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


require(devtools)
install_github("slidify", "ramnathv")
install_github("slidifyLibraries", "ramnathv")
#######################################################
################### Steigerwald Data ##################
#######################################################
# Create a vector sequence from 1 to 100 with 2.5 interval
X <- seq(1,100,by=2.5)
# Access X vector 
X
# Access X vector in position 5
X[5]
# Access X vector from position 4 to 10
X[4:10]
# Access X vector from position "Last"
X[length(X)]
# Access X vector from position "Last - 1"
X[length(X)-1]
# Access X vector withount n position 
X[-1]
# Access X vector withount list position 
idx <- c(1,4,6,8,10)
X[idx]
# Access X vector with rules 
X>20
X[X>20]
(X<=10)|(X>=30)
X[(X<=10)|(X>=30)]
# Chancge X vector values    --------------------------- MAYBE CLASSIFY?
X2 <- numeric(length(X))
X2
X2[X<=30] <- 1
X2[(X>30)&(X<=70)] <- 2
X2
X2[(X>70)] <- 3
X2
#                         -------------------------- Another way
library(car)
X2 <- recode(X, "0:30=1; 30:70=2; else=3")
X2

################################################################################################################## MATRIX

m1 <- matrix(c(4,7,3,8,9,2), nrow=2)
m1

m2 <- matrix(
  c(4,7,3,8,9,2),
  nrow=2,
  ncol=3,
  byrow=TRUE)
m2

numbers_1 <- rnorm(80,mean=0,sd=1)
mat_1 <- matrix(numbers_1,nrow=20,ncol=4)
mat_1

##################### convert to dataframe

df_1 <- data.frame(mat_1)
df_1
names(df_1) <- c("var1","var2","var3","var4")
df_1

head(df_1)
summary(df_1)
plot(df_1)
plot(df_1$var1,df_1$var4)

test<-data.frame(A=c(1,2,3),B=c("Z","X","C"))

test[,1]  # all col
test[1,]  # all rw

test[,"A"]

test$A

test$B

test$A[1:2]

################################################################################################################## EXAMPLE


df_1 <- data.frame(plot="location_name_1", measure1=runif(100)*1000, measure2=round(runif(100)*100), value=rnorm(100,2,1), ID=rep(LETTERS,100)[1:100])
summary(df_1)
head(df_1)

df_2 <- data.frame(plot="locarion_name2", measure1=runif(50)*100, measure2=round(runif(50)*10), value=rnorm(50), ID=rep(LETTERS,50)[1:50])


df <- rbind(df_1,df_2)
df[,c('plot','measure1','measure2')]



#WRITE ALL OTHER EXAMPLES! 


#MAKE A SCRIPT TO PEACK UP SOMEONE RANDOMLY !!!!!!!


