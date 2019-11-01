#######################################################
####################### Class 1 #######################
#######################################################
#--> Load raster library
library(raster)
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
#-> Plot masked data 
spplot(prec_mask)
#######################################################
#-> Calculate the mean value per month 
prec_mean <- cellStats(prec_mask, stat="mean")
#-> Make X axis for plot 
prec_avg_month <- c(1,2,3,4,5,6,7,8,9,10,11,12)
#-> Make X axis labels for plot
lablist <- as.vector(c("Jän","Feb","März","Apr","Mai","Juni","Juli","Aug","Sept","Okt","Nov","Dez"))
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
