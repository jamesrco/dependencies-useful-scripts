# Convert_PALWx.R
#
# Created 11/23/15 by J.R.C.
#
# Purpose: Parse Palmer Station, Antarctica, 1 or 2-minute weather data in multiple files and generate a single table. Data currently exist as daily .txt files.
#
################ Caveats and prerequisites #############
#
# Requires R package "stringr"
#

library(stringr)

# setwd("/Users/jrcollins/Dropbox/Cruises & projects/High-Lat Lipid Peroxidation/Palmer 2015-2016/Wx data/")
setwd("/Users/jrcollins/Dropbox/Cruises & projects/High-Lat Lipid Peroxidation/Palmer 2015-2016/Wx data/Past seasons/")

# assumes user wants to read in all files in the directory, which may contain a mixture of 1- and 2-minute files

################ 1-minute files #############

file_list.1min = list.files(recursive=TRUE, full.names=FALSE, pattern="_BASE.txt") # get list of daily 1-minute files to be parsed

if (length(file_list.1min)>0) { # let's not do this if there aren't any 1-minute files...

for (i in 1:length(file_list.1min)) {
  
  this.Wxfile = read.delim(file_list.1min[i], header = TRUE, sep="\t", colClasses = "character")
      
  if (i==1) { # it's the first file
        
    allWx.1min <- this.Wxfile
    
  } else { # it's not the first file, so rbind
    
    allWx.1min = rbind(allWx.1min,this.Wxfile)
    
  }
  
}

# export to .csv

startdate.1min = str_extract(file_list.1min[i], "[0-9]+")
enddate.1min = str_extract(file_list.1min[length(file_list.1min)], "[0-9]+")

write.csv(allWx.1min, paste("PALWx_1min_",startdate.1min,"-",enddate.1min,".csv",sep=""))

}

################ 2-minute files #############

file_list.2min = list.files(recursive=TRUE, full.names=FALSE, pattern=".100") # get list of 2-minute data files to be parsed

if (length(file_list.2min)>0) { # let's not do this if there aren't any 2-minute files...

for (i in 1:length(file_list.2min)) {
  
  this.Wxfile = read.delim(file_list.2min[i], header = TRUE, sep="\t", colClasses = "character", skip = 1)
  
  if (i==1) { # it's the first file
    
    allWx.2min <- this.Wxfile
    
  } else { # it's not the first file, so rbind
    
    allWx.2min = rbind(allWx.2min,this.Wxfile)
    
  }
  
}

# export to .csv

startdate.2min = str_extract(file_list.2min[i], "[0-9]+")
enddate.2min = str_extract(file_list.2min[length(file_list.2min)], "[0-9]+")

write.csv(allWx.2min, paste("PALWx_2min_",startdate.2min,"-",enddate.2min,".csv",sep=""))

}
