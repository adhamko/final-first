
##lab1-DATA_ANLYSIS_R

install.packages("tidyverse")
library(tidyverse)

# url where the data is located

url <- "https://dax-cdn.cdn.appdomain.cloud/dax-airline/1.0.1/lax_to_jfk.tar.gz"


# download the file

download.file(url, destfile = "lax_to_jfk.tar.gz")


# untar the file so we can get the csv only
untar("lax_to_jfk.tar.gz", tar = "internal")

# read_csv only 
sub_airline <- read_csv("lax_to_jfk/lax_to_jfk.csv",
                        col_types = cols(
                          'DivDistance' = col_number(),
                          'DivArrDelay' = col_number()
                        ))

head(sub_airline,3)
head(sub_airline)


# THIS CELL TAKES LONGER TO RUN
# PLEASE RUN THIS LOCALLY, OR IT MAY FREEZE YOUR SKILLS NETWORK LABS KERNEL
# Download 2 million dataset


 


head(sub_airline)

# url where the data is located
url <- "https://dax-cdn.cdn.appdomain.cloud/dax-airline/1.0.1/airline_2m.tar.gz"

# download the file
download.file(url, destfile = "airline_2m.tar.gz")


untar("airline_2m.tar.gz")

# read_csv only 

airlines <- read_csv("airline_2m.csv",
                     col_types = cols(
                       'DivDistance' = col_number(),
                       'Div1Airport' = col_character(),
                       'Div1AirportID' = col_character(),
                       'Div1AirportSeqID' = col_character(),
                       'Div1WheelsOn' = col_character(),
                       'Div1TotalGTime' = col_number(),
                       'Div1LongestGTime' = col_number(),
                       'DivReachedDest' = col_number(),
                       'DivActualElapsedTime' = col_number(),
                       'DivArrDelay' = col_number(),
                       'Div1WheelsOff'= col_character(),
                       'Div1TailNum' = col_character(),
                       'Div2Airport' = col_character(),
                       'Div2AirportID' = col_character(),
                       'Div2AirportSeqID' = col_character(),
                       'Div2WheelsOn' = col_character(),
                       'Div2TotalGTime' = col_number(),
                       'Div2LongestGTime' = col_number(),
                       'Div2WheelsOff' = col_character(),
                       'Div2TailNum' = col_character()
                     ))


# We are going to be focusing on flights from  LAX to JFK and we will exclude
# flights that got cancelled or diverted

# we are also going to get only useful columns

sub_airline <- airlines %>% 
  filter(Origin == "LAX", Dest == "JFK", 
         Cancelled != 1, Diverted != 1) %>% 
  select(Month, DayOfWeek, FlightDate, 
         Reporting_Airline, Origin, Dest, 
         CRSDepTime, CRSArrTime, DepTime, 
         ArrTime, ArrDelay, ArrDelayMinutes, 
         CarrierDelay, WeatherDelay, NASDelay,
         SecurityDelay, LateAircraftDelay, DepDelay, 
         DepDelayMinutes, DivDistance, DivArrDelay)
dim(sub_airline)

##save dataset

write_csv(sub_airline, "lax_to_jfk.csv")

#determine type of columns 

sapply(sub_airline, typeof) 

## calcuate columns and statstical 
sub_airline %>% 
  filter(Month == 1) %>%
  group_by(Reporting_Airline) %>%
  summarize(avg_carrier_delay = mean(CarrierDelay, na.rm = TRUE))
#mean
sub_airline %>%
  group_by(Reporting_Airline) %>%
  summarize(avg_carrier_delay = mean(CarrierDelay, na.rm = TRUE))

##median

sub_airline %>%
  group_by(Reporting_Airline) %>%
  summarize(avg_carrier_delay = median(CarrierDelay,na.rm=TRUE))


##check info of dataset
glimpse(sub_airline)


    ##data_wrangling(dealing_with_Missing_value)
    head(sub_airline,12)
    
    
    ##check missimg value
    
    sub_airline%>%
      summarise(count =sum(is.na(CarrierDelay)))
    
    
    sub_airline %>% map(~sum(is.na(.)))
 
     ##drop_row
  ###  sub_airline[,-c(2,4,6)]  ##drop columns
  ###  sub_airline[-c(2,4,6),]  ###
    
    
    ## seperate date in air line to year , month ,day
    ### subair_line pipe seperate(date ,sep="-",into = c(year ,month ,date))
    
    
    
    
    ##LAB2
    
    ##DEFINE_MISSING_VALUE
    is.na(c(1, NA))        #> FALSE  TRUE
    is.na(paste(c(1, NA)))
    
    
    sub_airline %>%
      summarize(count = sum(is.na(CarrierDelay)))
    map(sub_airline, ~sum(is.na(.)))
    
    ##handling_missing_value
    ##drop_column_rows
    drop_na_cols <- sub_airline %>% select(-DivDistance, -DivArrDelay)
    dim(drop_na_cols)
    head(drop_na_cols)
    
    drop_na_rows <- drop_na_cols %>% drop_na(CarrierDelay)
    dim(drop_na_rows)
    head(drop_na_rows)
    
    
    ##replace by 0
    replace_na <- drop_na_rows %>% replace_na(list(CarrierDelay = 0,
                                                   WeatherDelay = 0,
                                                   NASDelay = 0,
                                                   SecurityDelay = 0,
                                                   LateAircraftDelay = 0))
    head(replace_na)
    
    # Calculate the mean vaule for "CarrierDelay" column
    carrier_mean <- mean(drop_na_rows$CarrierDelay)
    
    # Replace NA by mean value in "CarrierDelay" column
    sub_airline %>% replace_na(list(CarrierDelay = carrier_mean))
    
    
    ##data_format
    sub_airline %>% 
      summarize_all(class) %>% 
      gather(variable, class)
    
    ##seperate then convert
    date_airline <- replace_na %>% 
      separate(FlightDate, sep = "-", into = c("year", "month", "day"))
    
    head(date_airline)
    
    date_airline %>%
      select(year, month, day) %>%
      mutate_all(type.convert) %>%
      mutate_if(is.character, as.numeric)
    
    
    ##data_normalize
    
    #simple_scale
    simple_scale<-sub_airline$DepDelay / max(sub_airline$DepDelay)
    head(simple_scale)
    
    ##min_max_scale
    minmax_scale <- (sub_airline$ArrDelay - min(sub_airline$ArrDelay)) /
      (max(sub_airline$ArrDelay) - min(sub_airline$ArrDelay))
    head(minmax_scale)
    
    ##bining
    ggplot(data = sub_airline, mapping = aes(x = ArrDelay)) +
      geom_histogram(bins = 100, color = "white", fill = "red") +
      coord_cartesian(xlim = c(-73, 682))
    
    
    binning <- sub_airline %>%
      mutate(quantile_rank = ntile(sub_airline$ArrDelay,4))
    
    head(binning)    
    
    ggplot(data = binning, mapping = aes(x = quantile_rank)) +
      geom_histogram(bins = 4, color = "white", fill = "red")
    
    ##indicator_variable
    sub_airline %>%
      mutate(dummy = 1) %>% # column with single value
      spread(
        key = Reporting_Airline, # column to spread
        value = dummy,
        fill = 0) %>%
      slice(1:5)
    
    sub_airline %>% 
      spread(Reporting_Airline, ArrDelay) %>% 
      slice(1:5)
    
    sub_airline %>% # start with data
      mutate(Reporting_Airline = factor(Reporting_Airline,
                                        labels = c("AA", "AS", "DL", "UA", "B6", "PA (1)", "HP", "TW", "VX")))%>%
      ggplot(aes(Reporting_Airline)) +
      stat_count(width = 0.5) +
      labs(x = "Number of data points in each airline")
    
    #################################################################################
    
    ##first_load_data
    # url where the data is located
    url <- "https://dax-cdn.cdn.appdomain.cloud/dax-airline/1.0.1/lax_to_jfk.tar.gz"
    
    # download the file
    download.file(url, destfile = "lax_to_jfk.tar.gz")
    
    # untar the file so we can get the csv only
    # if you run this on your local machine, then can remove tar = "internal" 
    untar("lax_to_jfk.tar.gz", tar = "internal")
    
    # read_csv only 
    sub_airline <- read_csv("lax_to_jfk/lax_to_jfk.csv",
                            col_types = cols('DivDistance' = col_number(), 'DivArrDelay' = col_number()))
    
    
    
    
    
    ##LAB3
    
##boxplot
    library(ggplot2)
    ggplot(data = sub_airline, mapping = aes(x = Reporting_Airline, y = ArrDelay)) +
      geom_boxplot(fill = "bisque",color = "black", alpha = 0.3) +
      geom_jitter(aes(color = 'blue'), alpha=0.2) +
      labs(x = "Airline") +
      ggtitle("Arrival Delays by Airline") +
      guides(color = FALSE) +
      theme_minimal() +
      coord_cartesian(ylim = quantile(sub_airline$ArrDelay, c(0, 0.99)))
    
    
    ##scatter_plot
    # Load Alaska data, deleting rows that have missing departure delay or arrival delay data
    alaska_flights <- sub_airline %>%
      filter(Reporting_Airline == "AS") %>%
      filter(!is.na(DepDelay) & !is.na(ArrDelay)) %>%
      filter(DepDelay < 40)
    
    ggplot(data = alaska_flights, mapping = aes(x = DepDelay, y = ArrDelay)) +
      geom_point() +
      ggtitle("Alaska Flight Depature Delays vs Arrival Delays")
    
    str(sub_airline)
class(sub_airline$ArrDelayMinutes)    
cor(sub_airline$DepDelay,sub_airline$ArrDelay)

##linear_regression
ggplot(data=sub_airline,mapping=(aes(x=DepDelay,y=ArrDelay)))+
  geom_point()+
  geom_smooth(method = "lm",na.rm=TRUE)

##weak_linear_regression
ggplot(data = sub_airline, mapping = aes(x = WeatherDelay, y = ArrDelayMinutes)) +
  geom_point() + 
  geom_smooth(method = "lm", na.rm = TRUE)


cor(sub_airline$CarrierDelay, 
    sub_airline$ArrDelayMinutes, 
    use = "complete.obs")
ggplot(data = sub_airline, mapping = aes(x = CarrierDelay, y = ArrDelayMinutes)) +
  geom_point() + 
  geom_smooth(method = "lm", na.rm = TRUE)  


##descripitive_analysis

summary_dataset<-sub_airline%>%
  group_by(Reporting_Airline)%>%
  summarize(count=n() ,
            mean=mean(ArrDelayMinutes,na.rm=TRUE),
            std_dev=sd(ArrDelayMinutes,na.rm=TRUE),
            min=min(ArrDelayMinutes,na.rm=TRUE),
meidan=median(ArrDelayMinutes,na.rm=TRUE),
iqr=IQR(ArrDelayMinutes,na.rm=TRUE),
max=max(ArrDelayMinutes,na.rm=TRUE),
)
summary_dataset

            
            
   ##apply type og each column         
sapply(sub_airline, typeof)
sub_airline %>%
  count(Reporting_Airline)

###groupingg
avg_delay<-sub_airline%>%
  group_by(Reporting_Airline,DayOfWeek)%>%
  summarize(mean_delay=mean(ArrDelayMinutes),groups=('keeps'))
head(avg_delay)            


##SORTED
sorted<-avg_delay%>%
  arrange(desc(mean_delay))
head(sorted)            
            

##heatmap
avg_delay%>%
  ggplot(aes(x=Reporting_Airline,y=DayOfWeek,fil=mean_delay))+
  geom_tile(color='white',size=0.4)+
  scale_fill_gradient(low="yellow",high="red")


# This visualization will use lubridate package
library(lubridate)
# Let's take a simple average across Reporting_Airline and DayOfWeek
avg_delays <- sub_airline %>%
  group_by(Reporting_Airline, DayOfWeek) %>%
  summarize(mean_delay = mean(ArrDelayMinutes), .groups = 'keep') %>%
  # create a new variable "bins" from mean_delays
  # make the first range -0.1 to 0.1 to include zero values
  mutate(bins = cut(mean_delay,breaks = c(-0.1,0.1,10,20,30,50, max(mean_delay)),
                    labels = c("0","0-10","10-20","20-30","30-50",">50"))) %>%
  mutate(bins = factor(as.character(bins),levels = rev(levels(bins))))


ggplot(avg_delay, aes(x = Reporting_Airline, 
                       y = lubridate::wday(DayOfWeek, label = TRUE), 
                       fill = bins)) +
  geom_tile(colour = "white", size = 0.2) +
  geom_text(aes(label = round(mean_delay, 3))) +
  guides(fill = guide_legend(title = "Delays Time Scale"))+
  labs(x = "Reporting Airline",y = "Day of Week",title = "Average Arrival Delays")+
  # Define color palette for the scale
  scale_fill_manual(values = c("#d53e4f", "#f46d43", "#fdae61", "#fee08b", "#e6f598", "#abdda4"))            
          


#pearson_corlleation
sub_airline%>%
  select(DepDelayMinutes,ArrDelayMinutes)%>%
  cor(method = "pearson")
sub_airline%>%
cor.test(~DepDelayMinutes+ArrDelayMinutes,data=.)



#corlleation_multiple_variable

correlation <- sub_airline %>%
  select(ArrDelayMinutes, DepDelayMinutes, 
         CarrierDelay, WeatherDelay, NASDelay, SecurityDelay, LateAircraftDelay) %>% 
  cor(use = "pairwise.complete.obs", method = "pearson")

correlation

##Anova

summary_airline<-sub_airline%>%
  group_by(Reporting_Airline)%>%
  summarize(Average_delay=mean(ArrDelayMinutes,na.rm=TRUE))
summary_airline


summary_airline%>%
  ggplot(aes(x=Reporting_Airline,y=Average_delay))+
  geom_bar(stat = "identity")
  ggtitle("average delay by arrival airline")
  
  aa_as_subset <- sub_airline %>%
    select(ArrDelay, Reporting_Airline) %>%
    filter(Reporting_Airline == 'AA' | Reporting_Airline == 'AS')
  
  ad_aov <- aov(ArrDelay ~ Reporting_Airline, data = aa_as_subset)
  summary(ad_aov)
  
  
  
  
  ##week4
  
  
  library(tidyverse)
  # url where the data is located
  url <- "https://dax-cdn.cdn.appdomain.cloud/dax-airline/1.0.1/lax_to_jfk.tar.gz"
  
  # download the file
  download.file(url, destfile = "lax_to_jfk.tar.gz")
  
  # if you run this on your local machine, then can remove tar = "internal" 
  untar("lax_to_jfk.tar.gz", tar = "internal")
  
  # read_csv only 
  sub_airline <- read_csv("lax_to_jfk/lax_to_jfk.csv",
                          col_types = cols('DivDistance' = col_number(), 
                                           'DivArrDelay' = col_number()))  
  
  
#simple_linearmodel##
  
  aa_delays <- sub_airline %>%
    filter(CarrierDelay != "NA", Reporting_Airline == "AA")
  
  head(aa_delays)
  
  linear_model<-lm(ArrDelayMinutes~DepDelayMinutes,data=aa_delays)
linear_model
summary(linear_model)


##model

# Input data we use to predict
new_depdelay <- data.frame(
  DepDelayMinutes = c(12, 19, 24))

# Predict the data points
pred <- predict(linear_model, newdata = new_depdelay, interval = "confidence")
pred

linear_model$coefficients


linear_model2<-lm(CarrierDelay~ArrDelayMinutes,data=aa_delays)
summary(linear_model2)
linear_model2$coefficients


##multiple_linear_regression
mlr<-lm(ArrDelayMinutes~DepDelayMinutes + LateAircraftDelay,data =aa_delays)
summary(mlr)


mlr2<-lm(ArrDelayMinutes~DepDelayMinutes + LateAircraftDelay + CarrierDelay,data=aa_delays)
summary(mlr2)
mlr2$coefficients
 

DepDelayMinutes <- c(10, 20, 30)
LateAircraftDelay <- c(20, 60, 30)
new_multidelay <- data.frame(DepDelayMinutes, LateAircraftDelay)
pred <- predict(mlr, 
                newdata = predict_df, 
                interval = "confidence")  
summary(pred)



#assesing model visullay

library(ggplot2)
ggplot(aa_delays ,aes(x=DepDelayMinutes,y=ArrDelayMinutes))+
  geom_point()+
  stat_smooth(method="lm",col='red')

ggplot(aa_delays, aes(x = CarrierDelay, y = ArrDelayMinutes)) +
  geom_point() + 
  stat_smooth(method = "lm", col = "red")


cor(aa_delays$DepDelayMinutes, 
    aa_delays$ArrDelayMinutes)
cor(aa_delays$CarrierDelay, 
    aa_delays$ArrDelayMinutes)


#resuidal_plot

aa_delays <- sub_airline %>%
  filter(CarrierDelay != "NA", Reporting_Airline == "AA")
score_model <- lm(ArrDelayMinutes ~ DepDelayMinutes, data = aa_delays)
aa_delays$predicted <- predict(score_model)

ggplot(aa_delays, aes(x = DepDelayMinutes, y = ArrDelayMinutes)) +
  geom_smooth(method = "lm", se = FALSE, color = "red") +  # Plot regression slope
  geom_segment(aes(xend = DepDelayMinutes, yend = predicted), alpha = .2) +  # alpha to fade lines
  geom_point() +
  geom_point(aes(y = predicted), shape = 1) +
  theme_bw() # Add theme for cleaner look


ggplot(lm(ArrDelayMinutes ~ DepDelayMinutes, data = aa_delays)) +
  geom_point(aes(x=DepDelayMinutes, y=.resid))
  

#other_diagonstic_plot

linear_model <- lm(ArrDelayMinutes ~ DepDelayMinutes, data = aa_delays)
plot(linear_model)


##poloynmial regression

set.seed(20)
x <- seq(from=0, to=20, by=0.1)

# value to predict (y):
y <- 500 + 0.4 * (x-10)^3

# some noise is generated and added to the real signal (y):
noise <- rnorm(length(x), mean=10, sd=80)
noisy.y <- y + noise

# fit linear model
ggplot(data=NULL,aes(x, noisy.y)) + 
  geom_point() + 
  geom_smooth(method = "lm")


ggplot(data=NULL,aes(x, noisy.y)) + 
  geom_point() + 
  geom_smooth(method = "lm", formula = y ~ poly(x, 5))

time <- 6:19
temp <- c(4,6,7,9,10,11,11.5,12,12,11.5,11,10,9,8)

ggplot(data = NULL, aes(time, temp)) + 
  geom_point() 

##fit th line to curve
polyfit2 <- lm(temp ~ poly(time, 2, raw = TRUE))

summary(polyfit2)

ggplot(data = NULL, aes(time, temp)) + 
  geom_point() + 
  geom_smooth(method = "lm", formula = y ~ poly(x, 2)) 


# calculate polynomial
polyfit4 <- lm(temp ~ poly(time, 4, raw = TRUE))
# print results
summary(polyfit4)

temp = 0.9580 -1.683 * time 
+ 0.5770 * time^2 
- 0.03971 * time^3 
+ 0.0007906 * time^4


##Assesing the model
##simple_regression
linear_model <- lm(ArrDelayMinutes ~ DepDelayMinutes, aa_delays)

MSE<-mean(linear_model$residuals^2)
MSE
RMSE<-sqrt(MSE)
RMSE

##multiple_regression


mlr <- lm(ArrDelayMinutes ~ DepDelayMinutes + LateAircraftDelay, data = aa_delays)
mse_mlr<-mean(mlr$residuals^2)
mse_mlr

RMSE_mlr<-sqrt(mse_mlr)
RMSE_mlr

##polyonmial_regression
poly_reg <- lm(ArrDelayMinutes ~ poly(DepDelayMinutes, 3), data = aa_delays)
ploy_mse<-mean(poly_reg$residuals^2)
ploy_mse

poly_rmse<-sqrt(ploy_mse)
poly_rmse



##prediction and decision making
##Add predicted value in original dataset
aa_delays_predicted<-predict(linear_model)
ggplot(aa_delays,aes(x=DepDelayMinutes,y=ArrDelayMinutes))+
  geom_point()+

  geom_smooth(method = "lm",se=FALSE,color='red')+
  
  geom_point(aes(y=predicted),color='green')+
  geom_segment(aes(xend=DepDelayMinutes,yend=predicted),alpha=0.2)

head(predict(score_model))


##model_evaluation_week(5)

##model_evaluation

install.packages("rlang")
install.packages("tidymodels")


##download_data

# url where the data is located
url <- "https://dax-cdn.cdn.appdomain.cloud/dax-airline/1.0.1/lax_to_jfk.tar.gz"

# download the file
download.file(url, destfile = "lax_to_jfk.tar.gz")

# untar the file so we can get the csv only
# if you run this on your local machine, then can remove tar = "internal" 
untar("lax_to_jfk.tar.gz", tar = "internal")

# read_csv only 
sub_airline <- read_csv("lax_to_jfk/lax_to_jfk.csv",
                        col_types = cols('DivDistance' = col_number(), 
                                         'DivArrDelay' = col_number()))



##(1)Traning_testing_model
flight_delays <- sub_airline %>% 
  replace_na(list(CarrierDelay = 0,
                  WeatherDelay = 0,
                  NASDelay = 0,
                  SecurityDelay = 0,
                  LateAircraftDelay = 0)) %>%
  select(c(ArrDelayMinutes, DepDelayMinutes, CarrierDelay, WeatherDelay, NASDelay, SecurityDelay, LateAircraftDelay, DayOfWeek, Month))

head(flight_delays)
head(sub_airline)



set.seed(1234)
flight_split<-initial_split(flight_delays)
train_data<-training(flight_split)
test_data<-testing(flight_split)


flight_split2 <- initial_split(flight_delays, prop = 4/5)  # prop = 0.8 works as well
train_data2<-training(flight_split)
test_data2<-testing(flight_split)


##1.2 training model

# Pick linear regression
lm_spec <- linear_reg() %>%
  # Set engine
  set_engine(engine = "lm")


train_results <- train_fit %>%
  # Make the predictions and save the predicted values
  predict(new_data = train_data) %>%
  # Create a new column to save the true values
  mutate(truth = train_data$ArrDelayMinutes)

head(train_results)

# Print the linear function
lm_spec

train_fit <- lm_spec %>% 
  fit(ArrDelayMinutes ~ DepDelayMinutes, data = train_data)

train_fit 


test_results <- train_fit %>%
  # Make the predictions and save the predicted values
  predict(new_data = test_data) %>%
  # Create a new column to save the true values
  mutate(truth = test_data$ArrDelayMinutes)

head(test_results)


##1.3 evaluate_model
rmse(train_results, truth = truth,
     estimate = .pred)
rmse(test_results, truth = truth,
     estimate = .pred)


rsq(train_results, truth = truth,
    estimate = .pred)
rsq(test_results, truth = truth,
estimate = .pred)

test_results %>%
  mutate(train = "testing") %>%
  bind_rows(train_results %>% mutate(train = "training")) %>%
  ggplot(aes(truth, .pred)) +
  geom_abline(lty = 2, color = "orange", 
              size = 1.5) +
  geom_point(color = '#006EA1', 
             alpha = 0.5) +
  facet_wrap(~train) +
  labs(x = "Truth", 
       y = "Predicted Arrival Delays (min)")



train_fit <- lm_spec %>% 
  fit(ArrDelayMinutes ~ DepDelayMinutes, data = train_data2)

train_results <- train_fit %>%
  # Make the predictions and save the predicted values
  predict(new_data = train_data2) %>%
  # Create a new column to save the true values
  mutate(truth = train_data$ArrDelayMinutes)

head(train_results)

##cross_validation


set.seed(1234)
cv_folds <- vfold_cv(train_data, v = 10)
results <- fit_resamples(lm_spec, 
                         ArrDelayMinutes ~ DepDelayMinutes,
                         resamples = cv_folds)
results %>% collect_metrics()

cv_folds_3 <- vfold_cv(train_data, v = 3)
results <- fit_resamples(
  lm_spec, 
  ArrDelayMinutes ~ DepDelayMinutes, 
  resamples = cv_folds_3)
results %>% collect_metrics()






###over_fitting and under_fitting
##under_fitting
ggplot(cars, aes(x = speed, y = dist)) + 
  geom_point() + 
  geom_hline(yintercept = mean(cars$dist), 
             col = "red")

##over_fitting
ggplot(cars, aes(x = speed, y = dist)) + 
  geom_point() + 
  geom_smooth(method = "lm", 
              formula = y ~ poly(x, 8), 
              col = "red", se = FALSE) 

##bias_variance_trade_off
ggplot(cars, aes(x = speed, y = dist)) + 
  geom_point() + 
  geom_smooth(method = "lm", 
              formula = y ~ x, 
              col = "red", 
              se = FALSE) 


##regularization

##ridge

flight_recipe<-recipe(ArrDelayMinutes~.,data=train_data)
ridge_spec <- linear_reg(penalty = 0.1, mixture = 0) %>%
  set_engine("glmnet")

ridge_wf <- workflow() %>%
  add_recipe(flight_recipe)
ridge_fit <- ridge_wf %>%
  add_model(ridge_spec) %>%
  fit(data = train_data)
ridge_fit %>%
  pull_workflow_fit() %>%
  tidy()


##lasso

lasso_spec <- linear_reg(penalty = 0.1, mixture = 1) %>%
  set_engine("glmnet")

lasso_wf <- workflow() %>%
  add_recipe(flight_recipe)

lasso_fit <- lasso_wf %>%
  add_model(lasso_spec) %>%
  fit(data = train_data)

##elatsic_net

elasticnet_spec <- linear_reg(penalty = 0.1, mixture = 0.3) %>%
  set_engine("glmnet")

elasticnet_wf <- workflow() %>%
  add_recipe(flight_recipe)

elasticnet_fit <- elasticnet_wf %>%
  add_model(elasticnet_spec) %>%
  fit(data = train_data)
flight_recipe <-
  recipe(ArrDelayMinutes ~ ., data = train_data)


el_spec <- linear_reg(penalty = 0.5, mixture = 0.2) %>%
  set_engine("glmnet")

el_wf <- workflow() %>%
  add_recipe(flight_recipe)

el_fit <- el_wf %>%
  add_model(el_spec) %>%
  fit(data = train_data)

el_fit %>%
  pull_workflow_fit() %>%
  tidy()



##GRID_SEARCH

tune_spec <- linear_reg(penalty = tune(), mixture = 1) %>% 
  set_engine("glmnet")

lasso_wf <- workflow() %>%
  add_recipe(flight_recipe)
##Next, define cross validation to resample the data:
flight_cvfolds <- vfold_cv(train_data)

###Now, you can set up the grid using `grid_regular()`. The `levels` are how many values to use and in `penalty()` you can specify the range of values to use. By default, the range values are inverse log transformed. This means that $-3$ is really $10^{-3}$ and $0.3$ is really $10^{0.3}$.

lambda_grid <- grid_regular(levels = 50,
                            penalty(range = c(-3, 0.3)))

##To tune the grid, use `tune_grid()` and include the lambda grid just specified.
lasso_grid <- tune_grid(
  lasso_wf %>% add_model(tune_spec), 
  resamples = flight_cvfolds, 
  grid = lambda_grid)

show_best(lasso_grid, metric = "rmse")

lasso_grid %>%
  collect_metrics() %>%
  filter(.metric == "rmse") %>%
  ggplot(aes(penalty, mean)) +
  geom_line(size=1, color="red") +
  scale_x_log10() +
  ggtitle("RMSE")

tune_spec <- linear_reg(
  penalty = tune(), 
  mixture = 0) %>% 
  set_engine("glmnet")

ridge_grid <- tune_grid(ridge_wf %>% 
                          add_model(tune_spec), 
                        resamples = flight_cvfolds, 
                        grid = lambda_grid)

show_best(ridge_grid, metric = "rmse")

