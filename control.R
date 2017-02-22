# to comment out a block of code, use ctrl+shift+c
gap <- gapminder
number <- -11
if (number > 0) {
  print('The number was greater than 0')
} else if (number == 0) {
  print('The number was not greater than 0')
} else if (number > 20) {
  print('The number was greater than or equal to 20')
} else {
  print('The number was not greater than 0')
}

number <- 1
if (number > 0 && number < 10) {
  print('number was greater than 0 but less than 10')
}
# either condition is true, 'or'

if (number > 0 || number < 10) {
  print('number was greater than 0 or less than 10')
}

for (variable in 1:5) {
  print(variable)
}
# if I wanted to get all the unquie continents

unique(gap$continent)
for (continent in unique(gap$continent)) {
  data <- gap[gap$continent == continent,]
  print(continent)
  print(mean(data$pop))
}