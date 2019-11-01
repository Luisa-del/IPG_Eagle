#######################################################
####################### Class 1 #######################
#######################################################
#--> Load raster library
library(raster)
#--> Load boundaries and information about specific place in this case Germany
#-> Use COL for Colombia or GTM for Guatemala
germany <- getData("GADM", country="DEU", level=2)
#-> Plot boundaies data 
plot(germany)
#-->Load precipitation information
#->  Use getData("worldclim", var="prec", res=2.5, lon=4, lat=-74) for Colombia 
prec<- getData("worldclim", var="prec", res=.5, lon=10, lat=51)
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







prec_avg_mean <- cellStats(prec_ger2, stat="mean")
plot(prec_avg_mean)



