if(!require(checkpoint)) {
  install.packages('checkpoint')
  require(checkpoint)
}

if(!dir.exists("~/.checkpoint")){
  dir.create("~/.checkpoint")
}

project.path <- getwd()

date_of_proj <- "2017-07-10"


checkpoint(snapshotDate = date_of_proj,
           project = project.path, verbose = T,
           scanForPackages = T)