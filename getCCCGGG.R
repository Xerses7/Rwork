getCCCGGG <- function(sequence){
  tableSequence <- count(sequence,2)
  
  print(tableSequence["cc"])
  
  print(tableSequence["cg"])
  
  print(tableSequence["gc"])
}