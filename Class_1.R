####################### Class 1 #######################
library(raster)
# Load boundaries and information about specific place in this case Germany
germany <- getData("GADM", country="DEU", level=2)
# Then you can plot previously loaded data (boundaies)
plot(germany)
#Load precipitation information
prec<- getData("worldclim", var="prec", res=.5, lon=10, lat=51)
plot(prec)

#Crop precipitation to extent of germany
prec_ger1 <- crop(prec,germany)
spplot(prec_ger1)
#Mask precipitation to shape of germany
prec_ger2 <- mask(prec_ger1,germany)
spplot(prec_ger2)


prec_avg_mean <- cellStats(prec_ger2, stat="mean")
plot(prec_avg_mean)

# SAMPLE COLOMBIA

colombia <- getData("GADM", country="COL", level=2)
prec_col<- getData("worldclim", var="prec", res=2.5, lon=4, lat=-74)
prec_col1 <- crop(prec_col,colombia)
prec_col2 <- mask(prec_col1,colombia)
spplot(prec_col2, col.regions=topo.colors(2000))

# SAMPLE GUATEMALA

guatemala <- getData("GADM", country="GTM", level=2)
plot(guatemala)

