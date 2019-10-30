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

# no commit detected, first commit. Then push
