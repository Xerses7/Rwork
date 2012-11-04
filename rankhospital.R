rankhospital <- function(state, outcome, num = "best") {
  
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Check that state and outcome are valid
  t <- table(data$State)
  t <- as.list(t)
  if(length(t[[state]]) == 0 ){
    stop("invalid state")
  }
  
  # set outcome column to choose
  outcomeColumn = 0
  if(outcome == "heart attack"){
    data[,11] <- as.numeric(data[,11])
    outcomeColumn = 11
  } else if (outcome == "heart failure"){
    data[,17] <- as.numeric(data[,17])
    outcomeColumn = 17
  } else if (outcome == "pneumonia"){
    data[,23] <- as.numeric(data[,23])
    outcomeColumn = 23
  } else {
    stop("invalid outcome")
  }
  
 
  
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  
  stateData <- subset(data, data$State == state)
  stateDataCompl <- subset(stateData, stateData[,outcomeColumn] > 0)
  
  #"worst "/"best"
  if(num=="worst"){
    num = nrow(stateDataCompl)
  } else if (num== "best"){
    num = 1
  } else if (num > nrow(stateDataCompl)){
    v = NA
    return(v)
  }
  
  stateDataOrd <- stateDataCompl[order(stateDataCompl[,outcomeColumn],stateDataCompl$Hospital.Name),]
  stateDataOrd[[c(2,num)]]
  
}