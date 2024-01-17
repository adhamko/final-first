movie_years <- c(1985, 1999, 2002, 2010, 2012)
movie_years
movie_years[C(1,3)]  #CHOOSING FIRST AND THIRD OBJECT FROM VECTOR#


movie_length <- c("Very Short", "Short", "Medium","Short", "Long",
                                    Very Short", "Very Long")
                                    
movie_length_ordered <- factor( movie_length, ordered = TRUE , 
                                levels = c("Very Long", "Long", "Medium", 
                                           "Short", "Very Short"))
movie_length_ordered

genre_vector <- c("Comedy", "Animation" , "Crime" , "Comedy" , "Animation")
genre_vector
genre_factor<- as.factor(genre_vector)

summary(genre_factor)
sort(summary(genre_factor))