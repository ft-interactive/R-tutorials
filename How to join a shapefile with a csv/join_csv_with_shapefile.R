library(rgdal)
library(dplyr)
library(rgeos)
library(ggplot2)

#you neeed to make sure the merge/join column in your csv has the same name as the column in your shapefile.
# Looking at at the attribute table in QGis will give you this info.

#at present this works for .shp files only.


# your .shp (and accompanying files) should be in a folder. 
#fileName should bein this format: folder/filename.shp
fileNameShapefile <- 'constit/constituencies.shp' 

#csv file should be loose in the same folder as this script.
# Make sure your working directory is set correctly (cog symbol bottom-right-hand pane)
fileNameCsv <- 'ukip_candidate_seats.csv'

#the name, in quotes, of the join column.
#you neeed to make sure the merge/join column in your csv has the same name as the column in your shapefile.
# Looking at at the attribute table in QGis will give you this info.

#In the example the two columns are different (.shp colname first, .csv second)

#If yours are two keep the format, otherwise just add the same column name twice
joinCols=c('CODE','PCON15CD')

########################### you shouldn't need to fiddle below here

csv <- read.csv(fileNameCsv,stringsAsFactors = F) #read the csv

mapData <- readOGR(dsn = fileNameShapefile,
                   layer = fileNameShapefile %>%
                     gsub('.+\\/|\\..+','',.)
                   ) %>% #gsub() just removes the shp extension from the fileName to give default layer name
  merge(csv,by.x=joinCols[1],by.y=joinCols[2])  #merges the csv with the .shp


writeOGR(obj=mapData, dsn="newMap", layer="newMap", driver="ESRI Shapefile") #saves it all
