

email_df <- read.csv("https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBMDeveloperSkillsNetwork-RP0101EN-Coursera/v2/dataset/email%20list.csv")
email_df

#grep also has an extra parameter called ‘value’ that changes the output to display the strings instead of the list position

grep("@.+",c("test@testing.com","not an email","test2@testing.com"))
#load_email_frame
grep("@.+",c("test@testing.com","not an email","test2@testing.com"),value = TRUE)


grep("@.+\\.com",c("test@testing.co","test@ibm.com","test2@testing.org"),value=TRUE)


gsub("@.+","@newdomain.com",c("test@testing.com","not an email","test2@testing.com"))



matches <- regexpr("@.*\\.", email_df[,'Email'])
email_df[,'Domain'] = regmatches(email_df[,'Email'], matches)
matches <- regexpr("@.*\\.", email_df[,'Email'])
email_df
