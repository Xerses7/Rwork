slidingwindowplot <- function(sequence, window){
  # get the GC percentage in chunks of 2000 nucleotides
  start <- seq(1,length(sequence)-window, by = window)
  
  # get number of elements in start
  n <- length(start)
  
  # create a  numeric vector with the number of elements in start
  GCchunks <- numeric(n)
  
  for(i in 1:n){
    chunk <- sequence[start[i]:(start[i]+window-1)]
    GCchunk <- GC(chunk)
    
    # collect the data in the vector
    GCchunks[i] <- GCchunk
  }
  
  # plot the data against nucleotides indices
  plot(start, GCchunks,type = "b", xlab = "Nucleotides Start position", ylab = "% GC")
}

