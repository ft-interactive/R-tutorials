library(dplyr)
library(ggplot2)
library(magrittr)
library(rmarkdown)

fileName <- getwd() %>% gsub('.+/','',.)

mtcars %>% 
  ggplot(aes(
    cyl,mpg
  ))+
    geom_point()+
    theme_minimal()

save.image(paste0(fileName,'.Rdata'))
