complete <- function (directory, id = 1:332){
  
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  source("getmonitor.R")
  # iterate on ids
  v <- sapply(id, function(x){
    mm <- getmonitor(x, "specdata/")
    ## create a dataframe of complete cases 
    cc <- data.frame(mm[complete.cases(mm),])
    ## count how many lines there are in the data frame
    ll <- nrow(cc)
    ll
  })
  
  matrix <- cbind(id,v)
  dimnames(matrix) <- list(NULL,c("id","nobs"))
  df <- data.frame(matrix)
  df
}