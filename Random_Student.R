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
  "Niels")

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
require(ggplot2)
qplot(acumulate)

a <- table(acumulate)
total <- 0
for (var in 1:length(list)) {
  total = total + a[names(a)==list[var]]
  print(a[names(a)==list[var]])
}
