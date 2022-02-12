#This is for the D2_SahaTilakDavidat_Andaman_1992-3 dataset

library(readxl)


#loading the datasets------------
raw_data <- read_excel("D2_SahaTilakDavidar_Andaman1992-3_data.xlsx")
metadata <- read_excel("SahaTilakDavidar_Andaman1992-3_metadata.xlsx")


#this dataset doesn't have lat longs
#Can find centroids of locations using a shapefile
#site level averages can be done

#some sites don't have height
#within some sites, some trees don't have height
#What is 138-8?

#species names are messy

#adding site info with tree table--------------------
metadata$trans<-paste(metadata$`Island Name`, metadata$`Plot No`, sep="_")
raw_data$trans<-metadata$trans[match(raw_data$`Sheet Number`, metadata$`Sheet No`)]
raw_data$GBH<-as.numeric(raw_data$GBH)
raw_data$basal_area<-pi*((raw_data$GBH/(2*pi))^2) #calculating basal area in cm

sp.names<-unique(raw_data$Species)
sp.names.new<-sp.names[order(sp.names)]

write.csv(sp.names.new, "D2_sp.names.csv")
