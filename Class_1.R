# Class 1 COD com sofia

library(raster)


# Load boundaries and information about specific place
germany <- getData("GADM", country="DEU", level=2)
# Plot loaded information (boundaies)
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

#################################################################################### SAMPLE COLOMBIA

colombia <- getData("GADM", country="COL", level=2)
plot(colombia)
prec_col<- getData("worldclim", var="prec", res=2.5, lon=4, lat=-74)
plot(prec_col)
prec_col1 <- crop(prec_col,colombia)
prec_col2 <- mask(prec_col1,colombia)
spplot(prec_col2, col.regions=topo.colors(2000))

prec_col_tst <- (prec_col2)/1200
spplot(prec_col_tst, col=colorRampPalette(c("blue", "red"))(10))

#################################################################################### SAMPLE GUATEMALA
## PORFA SOFIA AGREGA ACA EL CÓDIGO PARA CARGAR LOS DATOS DEL CLIMA DE GUATEMALA!