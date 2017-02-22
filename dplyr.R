library(dplyr)
library(gapminder)
gap <- gapminder

#say we only wanted to select certain columns
#select, selects columns

res <- select(gap,country,year,gdpPercap)

#forward output from one command into the next one

europe <- gap %>% 
  select(country,continent,year,gdpPercap) %>% 
  filter(continent == "Europe")
unique(europe$country)

#filter by multiple things in one command
# Right way to do it
europe <- gap %>% 
  select(country,continent,year,gdpPercap) %>% 
  filter(continent == "Europe" & country != "United Kingdom")
unique(europe$country)
# wrong way to do it
# europe <- gap %>% 
#   select(country,continent,year,gdpPercap) %>% 
#   filter(continent == "Europe" && country != "United Kingdom")
# unique(europe$country)

# say we want the gdp per capita by year in europe, but add asia to it.

europe <- gap %>% 
  # select(country,continent,year,gdpPercap) %>% 
  filter(continent %in% c("Europe", "Asia")) %>% 
  group_by(continent, year) %>%
  mutate(gdp = gdpPercap * pop / 1e9) %>% 
  summarize(
    mean_gdp = mean(gdp),
    mean_pop = mean(pop)
  )

# What is the mean and standard error of the mean of population for the years 1952, 1962, 1972, for the continents "Africa", and "Asia" grouped by continent and year
# std error of the mean == std dev / sqrt (n)
# std error == sd(populatin)/sqrt(length(population)) 

test <- gap %>% 
  #select(country,continent,year,gdpPercap) %>% 
  filter(continent %in% c("Africa", "Asia")) %>% 
  filter(year %in% c("1952","1962","1972")) %>% 
  group_by(continent, year) %>%
  summarize(
    mean_pop = mean(pop),
    stde_pop = sd(pop)/sqrt(length(pop))
  )
length(gap$pop)
unique(gap$year)
