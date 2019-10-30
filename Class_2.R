#Class_2

#install.packages("fun")
library(fun)
if(.Platform$OS.type == "windows") x11() else x11(type = "Xlib")
mine_sweeper()


#install.packages("sudoku")
library(sudoku)
playSudoku()

# Cheer up Brian!
devtools::install_github("gaborcsardi/praise")
library(praise)
praise()

# Time untl Chitsmas up Briean!
difftime("2019-12-24",Sys.Date(),units="secs")

<<<<<<< HEAD
#coment from git webpage not from R
=======
# Hi Sofia
>>>>>>> 62e2f0a21b2cb2d5bae6733c105ecc7a2225da84
