# Adrian Bach
# function to convert a binary string into a decimal

bin2dec <- function(x) {
  
  # init sum
  binsum <- 0
  for (i in 1:length(x)) {
    binsum <- binsum + 2^(i-1) * x[i]
  }
  
  return(binsum)
}
