library(rvest)
install.packages("rvest")
simple_html_text <- "
<html>
    <body>
        <p>This is a test html page</p>
    </body>
</html>"

root_node <- read_html(simple_html_text)
root_node
class(root_node)

#read_html_node
ibm_html_node<-read_html("http://www.ibm.com")
ibm_html_node

download.file('https://www.r-project.org', destfile = 'r.html')
html_node <- read_html('r.html')
html_node



simple_html_text <- "
<html>
    <body>
        <p style=\"color:red;\">This is a test html page</p>
    </body>
</html>"

root_node <- read_html(simple_html_text)
root_node

body_node<-html_nodes(root_node,"body")
body_node

p_node <- html_node(body_node, "p")
p_content<-html_text(p_node)
p_content

style_attr <- html_attr(p_node, "style")
style_attr

url <- 'https://www.r-project.org'
html_node <- read_html('r.html')

# Get the image node using its root node
img_node <- html_node(html_node, "img")
# Get the "src" attribute of img node, representing the image location
img_relative_path <- html_attr(img_node, "src")
img_relative_path

# Paste img_relative_path with 'https://www.r-project.org'
image_path <- paste(url, img_relative_path, sep="")
# Use GET request to get the image
image_response<-GET(image_path)


image <- content(image_response, "raw")
# Write the bytes to a png file
writeBin(image, "r.png")


table_url <- "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/IBM-DA0321EN-SkillsNetwork/labs/datasets/HTMLColorCodes.html"
root_node <-read_html(table_url)
table_node <- html_node(root_node, "table")
table_node

color_data_frame <- html_table(table_node)
head(color_data_frame)

names(color_data_frame)
names(color_data_frame) <- as.matrix(color_data_frame[1, ])
# Then remove the first row
data_frame <- color_data_frame[-1, ]

head(data_frame)
names(color_data_frame)