#######################################################
############ Random Student Function ##################
#######################################################
library(ggplot2) # load ggplot
#######################################################
list <- c( # create student list
  "Marius",
  "Jakob",
  "Annika",
  "Kemeng",
  "Diego", 
  "Sofía", 
  "Diana", 
  "Larissa", 
  "James", 
  "Helena", 
  "Narges", 
  "Antonio",
  "Niels",
  "Kevin",
  "Chris",
  "Luisa",
  "Sanaz",
  "Walid")

Random_Student <- function(number) { # create function to saple students
  if(number > length(list)){         # check the number of students to sample
    return(paste("There are only",length(list), "students not", number))
  }
  else
    lucky_ones <- list[sample(1:length(list), number, replace=F)]
  return(lucky_ones)
}
#######################################################
# Function Call passing the number of students to call
Random_Student(3)

#######################################################
#################### Is it Random? ####################
#######################################################
acumulate <- vector(mode='character', length=100)
for (var in 1:100) {
  acumulate[var] <- Random_Student(1)
  #rev(list) #revert the order
}

Histo <- data.frame(acumulate)
qplot(Histo$acumulate,
      xlab = "sudents",
      ylab = "Calls",
      main = "Histogram for # of Calls")

