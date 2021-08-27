# Deliverable-1:

#load the "dplyr" package
library(dplyr) #load the "dplyr" package

# Download the 'MechaCar_mpg.csv'
MechaCar_df <- read.csv(file='MechaCar_mpg.csv', check.names = F, stringsAsFactors = F) 

# Perform linear regressison
model <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_df)
summary(model)


## Deliverable-2:

## Download the 'Suspension_Coil.csv'
SuspCoil_df <- read.csv(file='Suspension_Coil.csv', check.names = F, stringsAsFactors = F)

## Create 'total summary' dataFrame using 'summarize()'
total_summary <- summarize(SuspCoil_df, Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))

## Write an RScript that creates a 'lot_summary' dataframe using the group_by() and the summarize() functions to group 
## each manufacturing lot by the mean, median, variance, and standard deviation of the suspension coil's PSI column.
lot_summary <- SuspCoil_df %>% group_by(Manufacturing_Lot) %>% summarize(Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))


### Deliverable-3:
### write an RScript using the t.test() function to determine if the PSI across all manufacturing lots is statistically different 
## from the population mean of 1,500 pounds per square inch.
t.test(lot_summary$Mean, mu=mean(SuspCoil_df$PSI))

### Write three more RScripts using the t.test() function and its subset() argument to determine if the PSI for 
### each manufacturing lot is statistically different from the population mean of 1,500 pounds per square inch.

t.test(subset(SuspCoil_df$PSI, SuspCoil_df$Manufacturing_Lot == "Lot1"), mu = mean(SuspCoil_df$PSI), conf.level = 0.95)

t.test(subset(SuspCoil_df$PSI, SuspCoil_df$Manufacturing_Lot == "Lot2"), mu = mean(SuspCoil_df$PSI), conf.level = 0.95)

t.test(subset(SuspCoil_df$PSI, SuspCoil_df$Manufacturing_Lot == "Lot3"), mu = mean(SuspCoil_df$PSI), conf.level = 0.95)
