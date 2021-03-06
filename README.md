# Overview

Design a statistical study to review the production data for insights that may help the manufacturing team by comparing vehicle performance of the *MechaCar* vehicles against vehicles from other manufacturers. 

## MechaCar_Statistical_Analysis

The data analytics steps should perform the following:

- Perform **multiple linear regression* analysis to identify which variables in the dataset predict the mpg of MechaCar prototypes
- Collect **summary** statistics on the pounds per square inch (PSI) of the suspension coils from the manufacturing lots
- Run **t-tests** to determine if the manufacturing lots are statistically different from the mean population
- Design a statistical study to **compare** vehicle performance of the MechaCar vehicles against vehicles from other manufacturers. 
- For each statistical analysis, there will be a **summary interpretation** of the findings.

## Deliverable 1: 

### The R-Script for Linear Regression model

*load the "dplyr" package*

`library(dplyr) #load the "dplyr" package`

*Download the .csv file*

`MechaCar_df <- read.csv(file='MechaCar_mpg.csv', check.names = F, stringsAsFactors = F)` 

*Perform linear regressison*

`model <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD, data=MechaCar_df)`

`summary(model)`

### Summary Statitstics of the "model"

![lm_summary](https://user-images.githubusercontent.com/58155187/131023481-ab3d7447-fad3-4b8c-af8b-644dc6587d80.png)

### Summary Interpretation 

[Courtesy Reference: Felipe Rego](https://feliperego.github.io/blog/2015/10/23/Interpreting-Model-Output-In-R)

**Coefficient - t value**

The coefficient **t-value** is a measure of how many standard deviations the coefficient estimate is far away from 0. We want it to be far away from zero as this would indicate we could reject the null hypothesis - that is, we could declare a relationship between `mpg` and `other variables` exist. In our example, the t-statistic values are relatively far away from zero and are large relative to the standard error for `vehicle_length` and `ground_clearance`, which could indicate a relationship exists between `mpg` and these parameters. In general, t-values are also used to compute p-values.

**Coefficient - Pr(>t)**

- The `Pr(>|t|)` values shown in the model summary statistics relate to the probability of observing any value equal or greater than `t`. 
- A small p-value indicates that it is unlikely we will observe a relationship between the dependent variables (i.e., `vehicle_length`, `vehicle_weight`, `spoiler_angle`, `ground_clearance` and `AWD`) and independent variable or response (i.e., `mpg`) variable due to chance.
- Typically, a **p-value of 5% or less (< 0.05) is a good cut-off point**. In our model, the p-value(s) for `vehicle_length` and `ground_clearance` are very close to zero. 
- The **signif. Codes** associated to each estimate show that three stars i.e. *** represents a highly significant p-value. Consequently, a small p-value for the intercept and the slope indicates that we can reject the null hypothesis which allows us to conclude that there is a relationship between `mpg` and distance.

**Residual Standard Error**

Residual Standard Error is measure of the quality of a linear regression fit. Theoretically, every linear model is assumed to contain an error term E. Due to the presence of this error term, we are not capable of perfectly predicting our independent variable `mpg` from the dependent variables. The Residual Standard Error is the average amount that the `mpg` will deviate from the true regression line. 

**Degrees of Freedom** 

Degrees of freedom are the **number of data points** that went into the estimation of the parameters used after taking into account these parameters (restriction). In our case, we had 50 data points and two parameters (intercept and slope), although the degrees of freedom in the summary was **44**.

**Multiple R-squared, Adjusted R-squared**

The R-squared (R<sup>2</sup>) statistic provides a measure of how well the model is fitting the actual data. It takes the form of a proportion of variance. R<sup>2</sup> is a measure of the linear relationship between our independent variables and our dependent variable `mpg`. It always **lies between 0 and 1** (i.e.: a number near 0 represents a regression that does not explain the variance in the response variable well and a number close to 1 does explain the observed variance in the dependent variable). 

In our example, the R<sup>2</sup> we get is **0.7149**. Or roughly 71% of the variance found in the dependent variable `mpg` can be explained by the independent variables.  Although the R<sup>2</sup> value we got is strong enough, it???s hard to define what level of R<sup>2</sup> is appropriate to claim the model fits well. Essentially, it will vary with the application and the domain studied. In multiple regression settings, the R<sup>2</sup> will always increase as more variables are included in the model. That???s why the **adjusted R<sup>2</sup>** is the preferred measure as it adjusts for the number of variables considered.

**F-Statistic**

F-statistic is a good indicator of whether there is a relationship between the independent and the dependent variables. The **further the F-statistic is from 1 the better it is**. However, how much larger the F-statistic needs to be depends on both the number of data points and the number of predictors. Generally, when the number of data points is large, an F-statistic that is only a little bit larger than 1 is already sufficient to reject the null hypothesis (H0 : There is no relationship between `mpg` and `other variables`). 

### Summary Q & A

*Q1: Which variables/coefficients provided a non-random amount of variance to the mpg values in the dataset?*

  - `vehicle_length` and `ground_clearance` (as well as `Intercept`) provided non-random amount of variance to the `mpg` values. In ohter words, these two dependent variables have significant impact on `mpg`.

*Q2: Is the slope of the linear model considered to be zero? Why or why not?*

  - No, the slope coefficients shown under the `Estimate` heading in the model summary show very high non-zero values. This is because, `vehicle_length` and `ground_clearance` have strong relation with `mpg` as their `p-value` is much smaller than 0.05.

*Q3: Does this linear model predict mpg of MechaCar prototypes effectively? Why or why not?*

  - F-statistic is a good indicator of whether there is a relationship between our predictor and the response variables. The further the F-statistic is from 1 the better it is. In our case, the F-statistic is **22.07** which is relatively larger than 1 and sufficient to reject the null hypothesis (H<sub>0</sub> : There is no relationship between `mpg` and `other variables`). 

## Deliverable-2: 
  
  ## Summary Statistics on Suspension Coils

  ### Technical Analysis

- In the `MechaCarChallenge.RScript`, import and read in the Suspension_Coil.csv file as a table.

  `> SuspCoil_df <- read.csv(file='Suspension_Coil.csv', check.names = F, stringsAsFactors = F)`

- Write an RScript that creates a `total_summary` dataframe using the `summarize()` function to get the **mean, median, variance**, and **standard deviation** of the suspension coil???s `PSI` column.

  `> total_summary <- summarize(SuspCoil_df, Mean=mean(PSI), Median=median(PSI), Variance=var(PSI), SD=sd(PSI))`
  
  ![total_summary](https://user-images.githubusercontent.com/58155187/131073766-909a6fb7-99c3-4ea1-99da-10044b0f26e7.png)

- Write an RScript that creates a `lot_summary` dataframe using the `group_by()` and the `summarize()` functions to group each manufacturing lot by the *mean, median, variance,* and *standard deviation* of the suspension coil???s `PSI` column.

  ![lot_summary](https://user-images.githubusercontent.com/58155187/131074356-d895720a-2fea-44be-af1a-c548ad29c1da.png)

  ### Summary 
  
  The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed **100 PSI** (pounds per square inch).
  
  Q: *Does the current manufacturing data meet this design specification for all manufacturing lots in total and each lot individually? Why or why not?*
  
  Answer: From the `total_summary` table we see than the `Variance` is **62.29** which is the combined variance of all three lots. This value is less than 100 PSI, so acceptable.
  
  When we look at the `lot_summary` table which is grouped-by `Manufacturing_Lot`, we find that `Lot3` has a variance of **170.28** which is higher than the acceptable limit of 100 PSI. Therefore, `Lot3` suspension coils may not be accepted as it is.
  
## Deliverable 3: 

## T-Tests on Suspension Coils

  ### Technical Analysis

Perform **t-tests** to determine if all manufacturing lots and each lot individually are statistically *different* from the population mean of 1,500 pounds per square inch.
  
  - Write an RScript using the t.test() function to determine if the PSI across *all manufacturing lots* is statistically different from the population mean of 1,500 pounds per square inch.

  ![t_test_all_lots](https://user-images.githubusercontent.com/58155187/131078341-a3e24f5b-c436-4798-a22c-97c667384fd0.png)

  - Write three more RScripts in your MechaCarChallenge.RScript using the t.test() function and its subset() argument to determine if the PSI for each manufacturing lot is statistically different from the population mean of 1,500 pounds per square inch.

![t_test_each_lot](https://user-images.githubusercontent.com/58155187/131093772-1c384080-f4c4-4677-8fce-1ea2437e83b9.png)


  ### Summary
  
  a one-sample t-test is used to test the following hypotheses:

  **H<sub>0</sub>** : There is **no statistical difference** between the observed sample mean and its presumed population mean. 

  **H<sub>a</sub>** : There is a statistical difference between the observed sample mean and its presumed population mean.
  
  Assuming our significance level was the common **0.05**, our `p-value` is **1** which is above our significance level. Therefore, we do not have sufficient evidence to reject the null hypothesis, and we would state that the **two means are statistically similar**.
  
  `Lot3` has a `p-value` = 0.1589 which is significantly higher than 0.05; that means, true mean for `Lot2` is higher than population mean.
  
## Deliverable-4: 

## Study Design: MechaCar vs Competition
  
  - Choice of metric:
    fuel-efficiency or `mpg`
  - Null Hypothesis:
    H<sub>0</sub> : There is no relationship between `mpg` and `other variables`.
  - What test and why?
    Multiple linear regression, because it can process more than two independent variables for one target/dependent variable.
  - What data is required?
    We need data where multiple other variables (columns) will have values for different unique samples which may or may not have any relation with `mpg` of MechaCar.
