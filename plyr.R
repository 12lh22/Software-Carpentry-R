# http://swcarpentry.github.io/r-novice-gapminder/12-plyr/
library(gapminder)
library(plyr)
library(doParallel)
gap <- gapminder
write.csv(gap,"gap.csv",row.names = F)
gap2 <- read.csv("gap.csv")

#functions!
adder <- function(num1, num2) {
  print(num1 + num2)
}
adder(3,5)

adder <- function(num1, num2) {
  print(num1)
  print(num2)
}

adder <- function(num1, num2) {
  return(num1 + num2)
}
x <- adder(3,5)

# convert from ferenheight to Kelvin

# (Fahr - 32) * 5 / 9 + 273 = Kelvin


FtoK <- function(num){
  return((num - 32) * (5 / 9) + 273)
}
FtoK(32)
FtoK(41)
KtoF <- function(num){
  return((num - 273) / (5 / 9) + 32)
}
KtoF(FtoK(32))
KtoF(280)
# how to return multiple things, i.e. answer plus units

FtoK1 <- function(num) {
  ans <- ((num - 32) * 5 / 9) + 273
  return(paste(ans, "Kelvin"))
}
FtoK1(32)

# how does this help us with plyr

gdpByContinent <- ddply(
  .data = gap,
  .variables = c("continent"),
  .fun = function(chunk) {
    return(mean(chunk$pop))
  })
gdpByContinent

#what if we wanted by continent and by year
gdpByContinentYear <- ddply(
  .data = gap,
  .variables = c("continent","year"),
  .fun = function(chunk) {
    return(mean(chunk$pop))
  })
gdpByContinentYear

results <- laply(
  .data = 1:100,
  .fun = function(number) {
    Sys.sleep(0.1)
    return(number)
  })
results
library(microbenchmark)
ncores <- detectCores()
registerDoParallel(cores = ncores)

times <- microbenchmark(
  results <- laply(
    .data = 1:100,
    .fun = function(number) {
      Sys.sleep(0.1)
      return(number)
    }),
  results <- laply(
    .data = 1:100,
    .fun = function(number) {
      Sys.sleep(0.1)
      return(number)
    },
    .parallel = TRUE,
    .paropts = list(packages = "plyr")
  ),
  times = 1
)
times