library(httr)
library(rvest)
url <- "https://en.wikipedia.org/w/index.php?title=Template:COVID-19_testing_by_country"
response<-GET(url )
status_code <- response$status_code
if (status_code == 200) {
  # Successful retrieval
} else {
  # Handle error, e.g., print a message
  print("Error: Could not retrieve the page.")
}
html_content <- content(response, "text")
html_content

#task 2
parsed_html <- read_html(html_content)
parsed_html
table_nodes <- html_nodes(parsed_html, "table")
table_nodes
covid_testing_table <- html_table(table_nodes[2])[[1]]
print(covid_testing_table)
covid_testing_df <- as.data.frame(covid_testing_table)
covid_testing_df

#task 3

summary(covid_testing_data)

preprocess_covid_data_frame <- function(data_frame) {
  
  shape <- dim(data_frame)
  
  # Remove the World row
  data_frame<-data_frame[!(data_frame$`Country.or.region`=="World"),]
  # Remove the last row
  data_frame <- data_frame[1:172, ]
  
  # We dont need the Units and Ref columns, so can be removed
  data_frame["Ref."] <- NULL
  data_frame["Units.b."] <- NULL
  
  # Renaming the columns
  names(data_frame) <- c("country", "date", "tested", "confirmed", "confirmed.tested.ratio", "tested.population.ratio", "confirmed.population.ratio")
  
  # Convert column data types
  data_frame$country <- as.factor(data_frame$country)
  data_frame$date <- as.factor(data_frame$date)
  data_frame$tested <- as.numeric(gsub(",","",data_frame$tested))
  data_frame$confirmed <- as.numeric(gsub(",","",data_frame$confirmed))
  data_frame$'confirmed.tested.ratio' <- as.numeric(gsub(",","",data_frame$`confirmed.tested.ratio`))
  data_frame$'tested.population.ratio' <- as.numeric(gsub(",","",data_frame$`tested.population.ratio`))
  data_frame$'confirmed.population.ratio' <- as.numeric(gsub(",","",data_frame$`confirmed.population.ratio`))
  
  return(data_frame)
}

preprocessed_df <- preprocess_covid_data_frame(covid_testing_df)
preprocessed_df
