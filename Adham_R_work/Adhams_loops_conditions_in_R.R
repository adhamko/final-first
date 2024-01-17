

#if_conditon_in_R

movie_year=2002
if(movie_year>2000)
{
  
  print('movie year is greater than 2000')
}

movie_year=1997
if(movie_year>2000)
{
  
  print('movie year is greater than 2000')
}else
{
  print('movie year is not greater than 2000')                
  
}

movie_year = 1997
# If Movie_Year is BOTH less than 2000 AND greater than 1990 -- both conditions have to be true! -- ... 
if(movie_year < 2000 & movie_year > 1990 ) {
  # ...then we print this message.
  print('Movie year between 1990 and 2000') 
}
# If Movie_Year is EITHER greater than 2010 OR less than 2000 -- any of the conditions have to be true! -- ... 
if(movie_year > 2010 | movie_year < 2000 ) {
  # ...then we print this message.
  print('Movie year is not between 2000 and 2010') 
}


decade = 'recent'
# If the decade given is recent...
if(decade == 'recent' ){
  # Subset the dataset to include only movies after year 2000.
  subset(movies_data, year >= 2000)
} else { # If not...
  # Subset the dataset to include only movies before 2000.
  subset(movies_data, year < 2000)
}



# Get the data for the "year" column in the data frame.
years <- movies_data['year']

# For each value in the "years" variable...
# Note that "val" here is a variable -- it assumes the value of one of the data points in "years"!
for (val in years) {
  # ...print the year stored in "val".
  print(val)
}




# Creating a start point.
iteration = 1

# We want to repeat until we reach the sixth operation -- but not execute the sixth time.
# While iteration is less or equal to five...
while (iteration <= 5) {
  
  print(c("This is iteration number:",as.character(iteration)))
  
  # ...print the "name" column of the iteration-th row.
  print(movies_data[iteration,]$name)
  
  # And then, we increase the "iteration" value -- so that we actually reach our stopping condition
  # Be careful of infinite while loops!
  iteration = iteration + 1
}



# Creating a start point to be 6
iteration = 6
# Check if iteration is between 6 and 8
while (iteration > 5 && iteration < 9) {
  print(c("This is row number:",as.character(iteration)))
  print(movies_data[iteration,]$name)
  iteration = iteration + 1
}


#applying_functions_to_vector

# First, we create a vector...
my_list <- c(10,12,15,19,25,33)
# ...we can try adding two to all the values in that vector.
my_list + 2
# Or maybe even exponentiating them by two.
my_list ** 2
# We can also sum two vectors element-wise!
my_list + my_list