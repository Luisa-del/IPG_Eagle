library(ggplot2)
##############################################################################################
list <- c(
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
  "Chris")

Random_Student <- function(number) {
  if(number > length(list)){
    return(paste("There are only",length(list), "students not", number))
  }
  else
    lucky_ones <- list[sample(1:length(list), number)]
  return( lucky_ones)
}

Random_Student(3)
##############################################################################################
acumulate <- vector(mode='character', length=100)
for (var in 1:100) {
  acumulate[var] <- Random_Student(1)
}

Histo <- data.frame(acumulate)
qplot(Histo$acumulate,
      xlab = "sudents",
      main = "Histogram for # of Calls")

