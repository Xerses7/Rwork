corr <- function ( directory, threshold = 0){
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## source complete and getmonitor
  source("getmonitor.R")
  source("complete.R")
  
  ## get dataframe with complete()
  data = complete("specdata")
  
  
  ## check which observations in the vector are correct over threshold
  mm <- subset(data, data$nobs > threshold)
  
  if (nrow(mm) < 1){
    a <- c()
    return(a)
  }
  
  ## apply
  correlations <- apply(mm, 1,function(el){
    ## get the data for the file with getmonitor()
    data <- getmonitor(el[["id"]], "specdata")
    
    ## create a dataframe of complete cases 
    data <- data.frame(data[complete.cases(data),])
    
    ## extract nitrate data & sulfate data and correlate
    cc <-cor(data$sulfate, data$nitrate)
    cc
  })

  ## Return a numeric vector of correlations
  numVector<- as.numeric(correlations)
  numVector
}