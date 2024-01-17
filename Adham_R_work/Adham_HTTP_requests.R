install.packages("httr")

#get resources
url<-'https://www.ibm.com/'
response<-GET(url)
response
response$status

#heading of url
response_headers<-headers(response)
response_headers
response_headers['date']
response_headers['content-type']
response$request$headers

response_headers['content-length']
image_url<-'https://gitlab.com/ibm/skills-network/courses/placeholder101/-/raw/master/labs/module%201/images/IDSNlogo.png'

image_response<-GET(image_url)

image_url

image_headers<-headers(image_response)
image_headers
image_headers['date']
image_headers['content-type']
image <- content(image_response, "raw")
writeBin(image, "logo.png")