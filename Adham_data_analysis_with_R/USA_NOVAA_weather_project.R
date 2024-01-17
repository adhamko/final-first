##0.import modules 
library(tidyverse)

##1. Download and Unzip NOAA Weather Dataset

url<-"https://dax-cdn.cdn.appdomain.cloud/dax-noaa-weather-data-jfk-airport/1.1.4/noaa-weather-sample-data.tar.gz"
download.file(url,destfile = "noaa-weather-sample-data.tar.gz")

# untar the file so we can get the csv only

untar("noaa-weather-sample-data.tar.gz",tar="internal")

##read_data
weather_data <- read.csv("noaa-weather-sample-data/jfk_weather_sample.csv")
head(weather_data)

#glimpse
 library(dplyr)
glimpse(weather_data)


##subset of adata

key_columns<-c("HOURLYRelativeHumidity", "HOURLYDRYBULBTEMPF", "HOURLYPrecip", "HOURLYWindSpeed", "HOURLYStationPressure")
keywa<-weather_data[key_columns]
head(keywa)

head(keywa,10)


##clean_up_column

is.na(c(1, NA))        #> FALSE  TRUE
is.na(paste(c(1, NA)))


keywa%>%
  summarize(count=sum(is.na(HOURLYPrecip)))
map(keywa,~sum(is.na(.)))


unique(keywa$HOURLYPrecip)

##replace _miising value _in _column

modified_keywa<-keywa%>%
  mutate(HOURLYPrecip=replace(HOURLYPrecip,HOURLYPrecip=="T","0.0"))%>%
  mutate(HOURLYPrecip=str_remove(HOURLYPrecip,pattern="s$"))

unique(modified_keywa$HOURLYPrecip)


##5.convert columns to numeircal

library(dplyr)
glimpse(modified_keywa)


##convert to numeric
cleaned_keywa<-modified_keywa%>%
mutate(HOURLYPrecip,as.numeric(HOURLYPrecip))
glimpse(cleaned_keywa)


##6.rename_column

library(dplyr)  # Load the dplyr package if needed

final_keywa <- cleaned_keywa %>%
  rename(relative_humidity = HOURLYRelativeHumidity,
         dry_bulb_temp_f = HOURLYDRYBULBTEMPF,
         precip = HOURLYPrecip,
         wind_speed = HOURLYWindSpeed,
         station_pressure = HOURLYStationPressure)

# View the final data frame
glimpse(final_keywa)



##7.Exploratory_analysis
install.packages("caTools")
library(caTools)
set.seed(1234)

# Split the data into 80% training and 20% testing
split <- sample.split(final_keywa$precip, SplitRatio = 0.8)
training_data1 <- subset(final_keywa, split == TRUE)
testing_data1 <- subset(final_keywa, split == FALSE)
head(training_data1)
head(testing_data1)
library(ggplot2)  # Load the ggplot2 package for visualization

# Histograms
ggplot(training_data1) +
  geom_histogram(aes(x = relative_humidity), bins = 20) +
  ggtitle("Histogram of Relative Humidity")

ggplot(training_data1) +
  geom_histogram(aes(x = dry_bulb_temp_f), bins = 20) +
  ggtitle("Histogram of Dry Bulb Temperature")

ggplot(training_data1) +
  geom_histogram(aes(x = precip), bins = 20) +
  ggtitle("Histogram of Precipitation")

ggplot(training_data1) +
  geom_histogram(aes(x = wind_speed), bins = 20) +
  ggtitle("Histogram of Wind Speed")

ggplot(training_data1) +
  geom_histogram(aes(x = station_pressure), bins = 20) +
  ggtitle("Histogram of Station Pressure")

# Box plots
ggplot(training_data1) +
  geom_boxplot(aes(x = "", y = relative_humidity)) +
  ggtitle("Box Plot of Relative Humidity")

ggplot(training_data1) +
  geom_boxplot(aes(x = "", y = dry_bulb_temp_f)) +
  ggtitle("Box Plot of Dry Bulb Temperature")

# ... (Create box plots for other variables as needed)


##8_linear regression

library(ggplot2)  # Load the ggplot2 package for visualization

# 1. precip ~ relative_humidity
model1 <- lm(precip ~ relative_humidity, data = training_data1)
summary(model1)

ggplot(training_data1, aes(x = relative_humidity, y = precip)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  ggtitle("Precipitation vs Relative Humidity")

# 2. precip ~ dry_bulb_temp_f
model2 <- lm(precip ~ dry_bulb_temp_f, data = training_data1)
summary(model2)

ggplot(training_data1, aes(x = dry_bulb_temp_f, y = precip)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  ggtitle("Precipitation vs Dry Bulb Temperature")

# 3. precip ~ wind_speed
model3 <- lm(precip ~ wind_speed, data = training_data1)
summary(model3)

ggplot(training_data1, aes(x = wind_speed, y = precip)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  ggtitle("Precipitation vs Wind Speed")

# 4. precip ~ station_pressure
model4 <- lm(precip ~ station_pressure, data = training_data1)
summary(model4)

ggplot(training_data1, aes(x = station_pressure, y = precip)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  ggtitle("Precipitation vs Station Pressure")



##9.improve the model
library(tidymodels)  # Load the tidymodels meta-package
library(glmnet)      # Load the glmnet package for regularized regression

# ------------------------------
# Model 1: L2 Regularization (Ridge Regression)
# ------------------------------

# Create a recipe for preprocessing
recipe <- recipe(precip ~ ., data = training_data1) %>%
  step_normalize(all_predictors())  # Normalize predictors for glmnet

# Create a model specification
model8_spec <- linear_reg(penalty = 0.1, mixture = 0)  # L2 penalty (ridge)

# Create a workflow
workflow8 <- workflow() %>%
  add_recipe(recipe) %>%
  add_model(model8_spec)

# Fit the model using cross-validation
fit8 <- fit(workflow8, training_data)

# Evaluate performance on the training set
predictions8 <- predict(fit8, training_data) %>%
  bind_cols(training_data)  # Combine predictions with original data
mse8 <- mean((predictions8$.pred - predictions8$precip)^2)
rmse8 <- sqrt(mse8)
rsquared8 <- cor(predictions8$.pred, predictions8$precip)^2

# Print performance metrics
cat("Model 8 (L2 Regularization):\n")
cat("MSE:", mse8, "\n")
cat("RMSE:", rmse8, "\n")
cat("R-squared:", rsquared8, "\n\n")

# ------------------------------
# Model 2: L1 Regularization (Lasso Regression)
# ------------------------------

# Model specification for L1 penalty
model9_spec <- linear_reg(penalty = 0.1, mixture = 1)  # L1 penalty (lasso)

# Workflow and fitting (similar to Model 8)
# ...

# Evaluate performance on the training set (similar to Model 8)
# ...

# ------------------------------
# Model 3: Combined L1 and L2 Regularization (Elastic Net)
# ------------------------------

# Model specification for mixed penalty
model10_spec <- linear_reg(penalty = 0.1, mixture = 0.5)  # L1 + L2 penalty

# Workflow and fitting (similar to Model 8)
# ...

# Evaluate performance on the training set (similar to Model 8)
# ...




