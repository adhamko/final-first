movie<-list(1995,"toy story",c("Animation", "Adventure", "Comedy"))
movie
#createlist

movie[2]
movie[2:3]
#acess index in alist 
movie<-list(name="toy story",year=1995,genre=c("Animation", "Adventure", "Comedy"))
movie$year
movie["genre"]
movie["name"]
movie$genre[2]
#named categorize list

class(movie["name"])

#add value to alist
movie["age"]<-5
movie

#remove value from alist
movie["age"]<-NULL
movie

movie[["WillWatch"]] <- T
movie
                                                                  