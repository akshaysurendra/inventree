#code to make a metadata map

#read file
setwd("C://Users/krish/Documents/INvenTree/")
metadata<-read.csv("InvenTree_WoS-search_2023.csv")
metadata$Lat<-as.numeric(metadata$Lat)
metadata$Long<-as.numeric(metadata$Long)

library(rgdal)
library(sp)
library(sf)
library(rgeos)


world_shp<-readOGR("C://Users/krish/Documents/Columbia/Naeem_Lab/Phd_thesis/Chap3/maps/world_borders", "TM_WORLD_BORDERS_SIMPL-0.3")
world_shp2<-unionSpatialPolygons(world_shp, IDs=world_shp@data$NAME)

plot(world_shp[world_shp$NAME=="India",])

ind2<-readOGR("C://Users/krish/Documents/Andamans/Fejervarya/India-shape/india_shape2", "India_Country_Boundary")

ind<-spTransform(ind2, CRS("+proj=longlat +datum=WGS84 +no_defs"))

#read forest cover map


png("map_for_website.png", width=8, height = 8, units="in", res=300)
plot(ind)
axis(1)
axis(2)
grid()
points(Lat~Long, metadata, pch=16, col="mediumseagreen", cex=1)
dev.off()
