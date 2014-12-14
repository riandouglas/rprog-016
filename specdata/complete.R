complete <- function(directory, id = 1:332) {
    frame <- data.frame()
    
    ## For each monitor
    for(monitor in id) {
        ## read data file, ommiting the incomplete rows
        filename <- paste(paste(".", directory, sprintf("%03d", monitor), sep = "/"), "csv", sep = ".")
        data <- na.omit(read.csv(filename))
        ## calculate number of complete cases
        complete <- nrow(data)
        ## add to resulting data frame
        newrow <- c(monitor, complete)
        frame <- rbind(frame, newrow)
    }
    
    ## return data frame with completed results
    names(frame) <- c('id', 'nobs')
    frame
}