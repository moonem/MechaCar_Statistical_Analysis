# Overview

Design a statistical study to review the production data for insights that may help the manufacturing team by comparing vehicle performance of the *MechaCar* vehicles against vehicles from other manufacturers. 

## MechaCar_Statistical_Analysis

The data analytics steps should perform the following:

- Perform **multiple linear regression* analysis to identify which variables in the dataset predict the mpg of MechaCar prototypes
- Collect **summary** statistics on the pounds per square inch (PSI) of the suspension coils from the manufacturing lots
- Run **t-tests** to determine if the manufacturing lots are statistically different from the mean population
- Design a statistical study to **compare** vehicle performance of the MechaCar vehicles against vehicles from other manufacturers. 
- For each statistical analysis, there will be a **summary interpretation** of the findings.

### The R-Script for Linear Regression model

*load the "dplyr" package*
`library(dplyr) #load the "dplyr" package`

*Download the .csv file*
`MechaCar_df <- read.csv(file='MechaCar_mpg.csv', check.names = F, stringsAsFactors = F)` 

*Perform linear regressison*
`model <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_df)`
`summary(model)`

### Summary Statitstics of the "model"

`
Call:
lm(formula = mpg ~ vehicle_length + vehicle_weight + spoiler_angle + 
    ground_clearance + AWD, data = MechaCar_df)

Residuals:
     Min       1Q   Median       3Q      Max 
-19.4701  -4.4994  -0.0692   5.4433  18.5849 

Coefficients:
                   Estimate Std. Error t value Pr(>|t|)    
(Intercept)      -1.040e+02  1.585e+01  -6.559 5.08e-08 ***
vehicle_length    6.267e+00  6.553e-01   9.563 2.60e-12 ***
vehicle_weight    1.245e-03  6.890e-04   1.807   0.0776 .  
spoiler_angle     6.877e-02  6.653e-02   1.034   0.3069    
ground_clearance  3.546e+00  5.412e-01   6.551 5.21e-08 ***
AWD              -3.411e+00  2.535e+00  -1.346   0.1852    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

Residual standard error: 8.774 on 44 degrees of freedom
Multiple R-squared:  0.7149,	Adjusted R-squared:  0.6825 
F-statistic: 22.07 on 5 and 44 DF,  p-value: 5.35e-11 
`

### Summary Interpretation 

[Courtesy Reference](https://feliperego.github.io/blog/2015/10/23/Interpreting-Model-Output-In-R)

**Coefficient - Pr(>t)**

- The `Pr(>|t|)` acronym shown in the model summary statistics relates to the probability of observing any value equal or greater than `t`. - A small p-value indicates that it is unlikely we will observe a relationship between the dependent variables (i.e., `vehicle_length`, `vehicle_weight`, `spoiler_angle`, `ground_clearance` and `AWD`) and independent variable or response (i.e., `mpg`) variable due to chance. - Typically, a **p-value of 5% or less (< 0.05) is a good cut-off point**. In our model, the p-value(s) for `vehicle_length`,  are very close to zero. Note the ‘signif. Codes’ associated to each estimate. Three stars (or asterisks) represent a highly significant p-value. Consequently, a small p-value for the intercept and the slope indicates that we can reject the null hypothesis which allows us to conclude that there is a relationship between speed and distance.

Residual Standard Error

Residual Standard Error is measure of the quality of a linear regression fit. Theoretically, every linear model is assumed to contain an error term E. Due to the presence of this error term, we are not capable of perfectly predicting our response variable (dist) from the predictor (speed) one. The Residual Standard Error is the average amount that the response (dist) will deviate from the true regression line. In our example, the actual distance required to stop can deviate from the true regression line by approximately 15.3795867 feet, on average. In other words, given that the mean distance for all cars to stop is 42.98 and that the Residual Standard Error is 15.3795867, we can say that the percentage error is (any prediction would still be off by) 35.78%. It’s also worth noting that the Residual Standard Error was calculated with 48 degrees of freedom. Simplistically, degrees of freedom are the number of data points that went into the estimation of the parameters used after taking into account these parameters (restriction). In our case, we had 50 data points and two parameters (intercept and slope).

Multiple R-squared, Adjusted R-squared

The R-squared (R2) statistic provides a measure of how well the model is fitting the actual data. It takes the form of a proportion of variance. R2 is a measure of the linear relationship between our predictor variable (speed) and our response / target variable (dist). It always lies between 0 and 1 (i.e.: a number near 0 represents a regression that does not explain the variance in the response variable well and a number close to 1 does explain the observed variance in the response variable). In our example, the R2 we get is 0.6510794. Or roughly 65% of the variance found in the response variable (dist) can be explained by the predictor variable (speed). Step back and think: If you were able to choose any metric to predict distance required for a car to stop, would speed be one and would it be an important one that could help explain how distance would vary based on speed? I guess it’s easy to see that the answer would almost certainly be a yes. That why we get a relatively strong R2. Nevertheless, it’s hard to define what level of R2 is appropriate to claim the model fits well. Essentially, it will vary with the application and the domain studied.

A side note: In multiple regression settings, the R2 will always increase as more variables are included in the model. That’s why the adjusted R2 is the preferred measure as it adjusts for the number of variables considered.


as

