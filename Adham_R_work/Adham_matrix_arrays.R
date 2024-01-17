##how to make and access elements in arrays//

movie_vector <- c("Akira", "Toy Story", "Room", "The Wave", "Whiplash",
                  "Star Wars", "The Ring", "The Artist", "Jumanji")
movie_vector
movie_array<- array(movie_vector,dim = c(4,3))
movie_array
movie_array[1,2]
movie_array[1,]
movie_array[,3]

dim(movie_array)
##how to make and Acess elements in matrix matrix
movie_vector <- c("Akira", "Toy Story", "Room", "The Wave", "Whiplash",
                  "Star Wars", "The Ring", "The Artist", "Jumanji")
movie_vector

movie_matrix<- matrix(movie_vector,nrow = 3,ncol = 3)
movie_matrix
movie_matrix[1,1]
movie_matrix[2:3,1:2]
movie_matrix[2,]
movie_matrix[,2]
