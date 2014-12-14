pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## Read data from monitor file(s)
    data <- NULL
    for(monitor in id) {
        filename <- paste(paste(".", directory, sprintf("%03d", monitor), sep = "/"), "csv", sep = ".")
        data <- rbind(data, read.csv(filename))
    }
    
    # extract requested pollutant, and remove NA's
    data <- data[, pollutant]
    data <- data[!is.na(data)]
    
    ## Calculate the mean of the data,
    mean <- mean(data)
    
    ## return the mean calculate
    round(mean, digits=3)
}