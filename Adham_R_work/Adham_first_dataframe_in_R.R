movies <- data.frame(name = c("Toy Story", "Akira", "The Breakfast Club", "The Artist",
                              "Modern Times", "Fight Club", "City of God", "The Untouchables"),
                     year = c(1995, 1998, 1985, 2011, 1936, 1999, 2002, 1987),
                     stringsAsFactors=F)
movies
movies["name"]   #column of name
movies[1]         #first_column

movies[1,]    #first_raw 

movies[1:2,1] #first AND second raw but first column only

str(movies)  #informations about data frame\

class(movies$year)
head(movies)
tail(movies)
selected <- movies["name"] == "Toy Story"
toy_story <- movies[selected, c("name", "year")]
toy_story
movies["lengths"]<-c(81, 125, 97, 100, 87, 139, 130, 119)   #insert new column in dataframe
movies

movies<-rbind(movies,c(name="elmaslha",year=2012,length=112))   #insert new raw in data frame
movies

movies[["lengths"]] <- NULL      #delete_column
movies

movies<-movies[-6,]   #delete_column
movies
