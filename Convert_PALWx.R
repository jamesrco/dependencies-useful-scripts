# Convert_PALWx.R
#
# Created 11/23/15 by J.R.C.
#
# Purpose: Parse Palmer Station, Antarctica, 1-minute weather data in multiple files and generate a single table. Data currently exist as daily .txt files
#
################ Caveats and prerequisites #############
#
# Requires R package "stringr"
#

library(stringr)

setwd("/Users/jrcollins/Dropbox/Cruises & projects/High-Lat Lipid Peroxidation/Palmer 2015-2016/Wx data/")

# assumes user wants to read in all files in the directory

file_list = list.files(recursive=TRUE, full.names=FALSE, pattern="_BASE.txt") # get list of daily files to be parsed

for (i in 1:length(file_list)) {
  
  this.Wxfile = read.delim(file_list[i], header = TRUE, sep="\t", colClasses = "character")
  
  if (i==1) { # it's the first file
        
    allWx <- this.Wxfile
    
  } else { # it's not the first file
    
    allWx = rbind(allWx,this.Wxfile)
    
  }
  
}

# export to .csv

startdate = str_extract(file_list[i], "[0-9]+")
enddate = str_extract(file_list[length(file_list)], "[0-9]+")

write.csv(allWx, paste("PALWx_1min_",startdate,"-",enddate,".csv",sep=""))
