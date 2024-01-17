ratings<-c(20,22,23,24,25,30)
mean(ratings)
sort(ratings,decreasing = TRUE)           #pre_defined_functions
max(ratings)
min(ratings)




print_Adham<-function(){
  print('hello adham')

}
print_Adham()
add<-function(x,y){
  x+y
}
                                          #user-defined-function

add(4,5)


isgoodrating<-function(rating){
  if(rating<7){
    return('good')
    
  }
  else{
    return('bad')
  }
}                                     #if_else_statment in functions
isgoodrating(6)
isgoodrating(9)


isbadrating<-function(ratings){
  if(ratings<5){
    print('yes')
  }
  else{                                          #if_else_statment in functions
    print('no')
  }
}
isbadrating(4)
isbadrating(10)


#function_in function
my_data <- read.csv("movies-db.csv")
 head(my_data)
 #first_we_intiliaze_our function
 akira<-my_data[my_data$name=="Akira","average_rating"]
 akira
 
 
 
 watchmovie<-function(data,movie_name){
   rating<-data[data$name==movie_name,"average_rating"]
   return(isgoodrating(rating  ))
   
 }
   watchmovie(my_data,"Akira")
   
   #update_watch_movie_function
   watchmovie<-function(data,movie_name,my_threshold){
     ratings<-data[data$name== movie_name,"average_ratings"]
   return(isgoodrating(rating ,threshold = my_threshold))
   }
watchmovie(my_data, "Akira", 7)
   