# Adrian Bach
# NINA uncertainty workshop - build a barplot of frequency of use of the different types of uncertainty representations in Conservation Policy Documents
# Script to build the binary code associated with each observation and convert it into decimal to plot

# Clear list
rm(list=ls())

# set work directory
setwd("Documents/uncertainty_workshop/")
getwd()

# packages


# import data set
d <- read.csv("uncert_repres_review1.csv", h = T)

#### collide the dichotomies into a single string ####

# # binary column as factors
# for (i in 2:(ncol(d)-3)) {
#  d[,i] <- as.factor(d[,i])
# }

# column were dichotomies assessment starts
st <- 6

# and ends
nd <- st+5

# browse lines
for (i in 1:nrow(d)) {
  # init the binary number and string
  bin <- NULL
  bin_strg <- rep(NA, nd-st+1)
  
  # browse binary columns
  for (j in st:nd) {
    bin <- paste(bin, d[i,j], sep = "")
    bin_strg[j-(nd-st)] <- d[i,j]
  }
  
  # assign bin to the right column
  d[i,nd+1] <- bin
  
  # convert to decimal using personal function
  d[i,nd+2] <- bin2dec(bin_strg)
}

# export the new table
write.csv(d, file = "uncert_repres_review1_Rtreated.csv", na = "")
