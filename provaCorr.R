source("getmonitor.R")
source("complete.R")

d <- complete("specdata", 110:115)

lapply(d, function(d) { m <- matrix(data = NA, nrow = 5, ncol = 2) 
    if($nobs > 200) { 
      l<-c($id,$nobs) 
      rbind(m,l)
      }
  })