library(gapminder)
gap <- gapminder
str(gap)
colnames(gap)
dim(gap)
summary(gap)
numbers <- c(1,5,10,15,2,5,67,NA,NA)
numbers >= 10
numbers[numbers >= 10]
mean(numbers)
is.na(numbers)
numbers[!is.na(numbers)]
mean(numbers[!is.na(numbers)])
mean(numbers,na.rm = T)
text <- c('a','b','c','d','cheesecake')
text[text != 'a']
gap[gap$country == 'Canada',]
asia <- gap[gap$continent == 'Asia', ]
unique(asia$continent)
unique(asia$country)
text[text %in% c('a', 'cheesecake')]
#get the mean gdp per capita for china, canada, cambodia together
#Bonus: compute the gdp for these countries as well for each of the years (in billions of dollars) 
#Hint: you can do the math on columns
mean(gap$gdpPercap[(gap$country %in% c('China','Canada','Cambodia'))])
population <- tapply(gap$gdpPercap[(gap$country %in% c('China','Canada','Cambodia'))],gap$year[(gap$country %in% c('China','Canada','Cambodia'))],mean,na.rm = T)
population


