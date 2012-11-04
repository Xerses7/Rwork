best <- function(state, outcome) {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  
  
  ## Check that state and outcome are valid
#   if (outcome != "heart attack" && outcome != "heart failure" && outcome != "pneumonia"){
#     stop("invalid outcome")
#   }
  
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
  
  ## Return hospital name in that state with lowest 30-day death
  ## rate
  
  # search for state data
  stateData <- subset(data, data$State == state)
  stateData2 <- stateData[order(stateData[,outcomeColumn],na.last = T),]

  stateData2[[c(2,1)]]
}