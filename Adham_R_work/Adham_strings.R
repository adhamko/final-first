my_data <- readLines("The_Artist.txt")
my_data
length(my_data)       #length_ofline in files
file.size("The_Artist.txt")   #size_of_file
nchar(my_data[1])

#frequency_of_each_word_in_string
my_data1<-scan("The_Artist.txt",",")
my_factor<-factor(my_data1)
summary(my_factor)


#upper_lower case in string
toupper(my_data[3])
tolower(my_data[1])

#replace_in_string
chartr("","-",my_data[1])


  #split in sttring
character_list <- strsplit(my_data[1], " ")
word_list <- unlist(character_list)
word_list

#Replace the space characters in the 3rd element of my_data vector with underscore _, then split the string by 
new_third <- chartr(" ", "_", my_data[3])
new_third
character_list<-strsplit(new_third[1]," _")
word_list<-unlist(character_list)
word_list


#sort_list
sorted_list<-sort(word_list)
sorted_list

#concentante
paste(sorted_list, collapse = " ")

#subset_of _string
substring<-substr(my_data[1],start = 4,stop = 50)
substring


#trim
trimws(substring)



