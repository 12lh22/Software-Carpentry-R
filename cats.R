cats <- read.csv('cats.csv', as.is = TRUE)
cats$likes_string <- as.logical(cats$likes_string)
str(cats)
vec <- 4:10
vec
vec[3]
vec[1]
vec[1:3]
vec[-1]
length(vec)
vec[length(vec)]
a_list <- list(1,4.5,TRUE,NA,c(1,2,54))
a_list
length(a_list)
class(a_list[1])
class(a_list[[1]])
a_list[[1]]
a_list[[5]]
a_list[[5]][3]
names(a_list)
names(a_list) <- c('first','second','third','fourth','fifth')
a_list$etc
