pollutantmean <- function(directory, pollutant, id = 1:332) {
        files_list <- list.files(directory, full.names=TRUE) #store all files in speficied directory in a variable called files_list
        dat <- data.frame() #create empty data frame
        for (i in id) {
                #loop through files, and rbind them into one file
                dat <- rbind(dat, read.csv(files_list[i]))        
        }
        dat_subset <- dat[dat[, "ID"] %in% id, ] #subset the data by ids
        mean(dat_subset[[pollutant]], na.rm = TRUE) #calculate mean based on pollutant argument
}

#tests
pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)