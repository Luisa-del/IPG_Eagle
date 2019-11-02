####################### Class 1 #######################
#######################################################
####################### RASTER ########################
#######################################################
#--> Load raster library
library(raster)

#--> Load color library
library(RColorBrewer)

#--> Set the folder path to ignore heavy data on push, modify as well .gitignore file!!!!
folder <- "D:/EAGLE/I_SEMESTER/Introdution_to_Progrmming_and_Geostatistics/IPG_Eagle/Tempral_Data/"

#--> Load boundaries and information about specific place in this case Germany
#-> Use COL for Colombia or GTM for Guatemala
germany <- getData("GADM", country="DEU", level=2, path=folder)

#-> Plot boundaies data 
plot(germany)

#-->Load precipitation information
#->  Use getData("worldclim", var="prec", res=2.5, lon=4, lat=-74) for Colombia 
prec<- getData("worldclim", var="prec", res=.5, lon=10, lat=51, path=folder)

#-> Plot precipitation data 
plot(prec)

#->Crop precipitation to extent of germany
prec_crop <- crop(prec,germany)

#-> Plot cropped data 
spplot(prec_crop)

#->Mask precipitation to shape of germany
prec_mask <- mask(prec_crop,germany)

####-> Plot masked data 
#-> Choose a color Palette 
my.palette <- brewer.pal(n = 11, name = "RdYlBu")
spplot(prec_mask,
       main ="Precipitation in Germany",
       col.regions = my.palette,
       cuts = 10,
       col = "transparent")

#######################################################
#-> Calculate the mean value per month 
prec_mean <- cellStats(prec_mask, stat="mean")

#-> Make X axis for plot 
prec_avg_month <- c(1,2,3,4,5,6,7,8,9,10,11,12)

#-> Make X axis labels for plot
lablist <- as.vector(c("Jän",
                       "Feb",
                       "März",
                       "Apr",
                       "Mai",
                       "Juni",
                       "Juli",
                       "Aug",
                       "Sept",
                       "Okt",
                       "Nov",
                       "Dez"))

#-> Make simple plot 
plot(prec_avg_month, prec_mean, 
     main = "Precipitation Average in Germany 2018",
     type = "p", 
     lty  = "dashed",
     lwd  = 3,
     xlab = "Month",
     xaxt = "n",
     ylab = "Precipitation Average",
     pch='+',
     col ='blue')
#-> Put X lables on plot 
axis(1, at=1:12, labels=lablist)

#-> Make line on plot 
lines(prec_avg_month, prec_avg_mean, 
      lty  = "dashed",
      lwd  = 1,
      pch='+',
      col ='black')

#SEE MORE: http://www.nickeubank.com/wp-content/uploads/2015/10/RGIS3_MakingMaps_part1_mappingVectorData.html#a-final-note-on-ggplot

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



