getmonitor <- function(id,directory, summarize = FALSE){
  ## 'id' is a vector of length 1 indicating the monitor ID
  ## number. The user can specify 'id' as either an integer, a
  ## character, or a numeric.
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  directory <- as.character(directory)
  id <- formatC(id, width = 3, format = "d", flag = "0")
  ## 'summarize' is a logical indicating whether a summary of
  ## the data should be printed to the console; the default is
  ## FALSE
  fileCsv <- paste(directory,"/", id,".csv", sep = "")
  
  ## Your code here
  di <- read.csv(fileCsv, header = T, colClasses = c("character", "numeric", "numeric", "numeric"))
  
  if ( summarize == T ) {
    summary( di )
  }
  
  y <- data.frame(di)
  y
}