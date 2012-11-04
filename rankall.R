rankall <- function(outcome, num = "best") {
  ## Read outcome data
  data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Check that outcome is valid
  ## and set outcome column to choose
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
  
  # find the row numbers for state
  
  ## For each state, find the hospital of the given rank
  # USA State Vector
  usaStateNames <- names(as.list(table(data$State)))
  hospital <- lapply(as.list(usaStateNames), function(state){
    # create a subset for each state
    dataState <- subset(data, data$State == state)
    # complete data
    dataStateCompl <- subset(dataState, dataState[,outcomeColumn] > 0)
    
    #check for word numbers
    #"worst "/"best"
    if(num=="worst"){
      num = nrow(dataStateCompl)
    } else if (num== "best"){
      num = 1
    }
    
    # choose right value, NA for wrong ranking or hospital name
    if(num > length(dataStateCompl[,11])){
      NA
    } else {
      stateDataOrd <- dataStateCompl[order(dataStateCompl[,outcomeColumn],dataStateCompl$Hospital.Name),]
      stateDataOrd[[c(2,num)]]
    }
  })
  state <- usaStateNames
  table <- cbind(hospital, state)
  data.frame(table, row.names = usaStateNames)
  ## Return a data frame with the hospital names and the
  ## (abbreviated) state name
}