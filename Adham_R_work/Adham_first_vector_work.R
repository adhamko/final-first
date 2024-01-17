release_year <- c(1985, 1999, 2015, 1964)
release_year
titles <- c("Toy Story", "Akira", "The Breakfast Club") // Create genre vector and assign values to it// 
titles
release_year <- c(1985, 1999, 2015, 1964)
release_year<- c(release_year,2019,2018)
length(release_year) #length_of_vector
head(release_year) #return_all_objects_in_vectors
head(release_year, n = 2) #Return_first n items
head(release_year, 2) #return first n items
tail(release_year)#return last_items in vectors 
sort(release_year)
min(release_year)
max(release_year)
release_year <- c(1985, 1999, 2015, 1964)
names(release_year) <- c("The Breakfast Club", "American Beauty", "Black Swan", "Chicago")
release_year
year_difference <- release_year['Black Swan'] - release_year['The Breakfast Club']
 year_difference
(#difference between years of blackswan and breakfeast club)
  cost_2014 <- c(8.6, 8.5, 8.1)
  cost_2014
  summary(cost_2014)
  mean(cost_2014)