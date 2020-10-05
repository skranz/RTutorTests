library(RTutor)
library(stringtools)
library(testthat)
dir = system.file("examples",package = "RTutor")
list.files(dir)
sol.files = list.files(dir,pattern = glob2rx("*_sol.Rmd"),full.names = TRUE) 
sol.files = sol.files[1]

sol.file = sol.files[1]
file.copy(sol.file, "testex/ps/")

setwd("testex/ps")
short.file = basename(sol.file)

ps.name = str.left.of(short.file,"_sol.")
libs = c("ggplot2","dplyr") 
# Important add the parameter addons="quiz" !
test_that(
  expect_error(create.ps(sol.file=short.file, ps.name=ps.name,libs=libs), NA)
)

