library(ggplot2)
library(maptools)
library(rgeos)
library(Cairo)
library(ggmap)
library(scales)
library(RColorBrewer)
require(gpclib)
gpclibPermit()
set.seed(8000)

##set directory to the folder where the shapefile is, then input shapefile
setwd("/Users/rafael/Downloads/BRA_adm/")
states.shp <- readShapeSpatial("BRA_adm1.shp")
class(states.shp)
names(states.shp)
print(states.shp$NAME_1)
num.states<-length(states.shp$NAME_1)
mydata<-data.frame(NAME_1=states.shp$NAME_1, id=states.shp$ID_1,
prevalence=rnorm(num.states, 55, 20))
head(mydata)

print(states.shp$ID_1)

states.shp.f <- fortify(states.shp, region = "ID_1")
class(states.shp.f)


merge.shp.coef<-merge(states.shp.f, mydata, by="id", all.x=TRUE)
final.plot<-merge.shp.coef[order(merge.shp.coef$order), ] 



ggplot() +
  geom_polygon(data = final.plot, 
               aes(x = long, y = lat, group = group, fill = prevalence), 
               color = "black", size = 0.25) + 
  coord_map()