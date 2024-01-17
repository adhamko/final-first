# Download datasets

# download CSV file
download.file("https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-RP0101EN-Coursera/v2/dataset/movies-db.csv", 
              destfile="movies-db.csv")

#download excel file
download.file("https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-RP0101EN-Coursera/v2/dataset/movies-db.xls", 
              destfile="movies-db.xls")

#reading CSV file
my_data<-read.csv("movies-db.csv")
my_data

head(my_data) #give first 6 column and row of CSv files
str(my_data) #Informations about data frame
summary(my_data)

#install_read_excel_pacakage
install.packages("readxl")

library(readxl)
download.file("https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-RP0101EN-Coursera/v2/dataset/movies-db.xls", 
              destfile="movies-db.xls")
my_excel_data<- read_excel("movies-db.xls")
my_excel_data
my_data['name']
my_data[['name']]
