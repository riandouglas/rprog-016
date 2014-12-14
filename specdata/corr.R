corr <- function(directory, threshold = 0) {
    data <- NULL
    for(monitor in 1:332) {
        complete <- complete(directory, monitor)
        if (complete[, 'nobs'] > threshold) {
            filename <- paste(paste(".", directory, sprintf("%03d", monitor), sep = "/"), "csv", sep = ".")
            csv <- na.omit(read.csv(filename))
            correlation <- round(cor(csv[,'sulfate'], csv[, 'nitrate']), digits=5)
            data <- c(data, correlation)
        }
    }
    data
}