# Scalping Method Using Logistic Reggresion in R studio.
## Background and Problem Definition
In this era, most teenagers are familiar with the word “investment”. Investment is the activity of placing capital in the form of money or other valuable assets into an object, institution, or party with the hope that the investor will gain the benefit after a certain period of time. Trading is one of the investments, where the transaction process takes place in the financial market where the system works is to frequently sell and buy assets. In trading, there are several important variables that must be considered in order to achieve the main goal which is profit, starting from knowing the trends, the latest news of a company, the company's future plans, etc. To maximize the output obtained for us, we must first understand the knowledge and strategy of punctuality in making decisions of trading transactions. However, what if we predict the stock value in the future from the value data variable and the increase in stock value. 

Scalping is a short term trading method to gain profit from trading volume faster. Scalping is one of the models that is often used for trading. In trading, scalping becomes a priority strategy in making high volumes from small profits.
### PT Bank MNC Internasional Tbk
PT Bank MNC Internasional Tbk is a subsidiary of MNC Financial Services which is engaged in banking. MNC Bank started its commercial operations on January 12, 1990. The bank is part of the MNC Group where the main parent company is PT. MNC Investama Tbk. PT Bank MNC Internasional Tbk has a structured history of stock data and the data held by MNC regarding stock is sufficient for us to carry out our analysis topics. Therefore, we will try to do a scalping model using logistic regression on stock values of PT Bank MNC Internasional Tbk.
## Objectives in This Project
By utilizing using SMART goals model, the objectives of the study are as follows:

Specific : Create a scalping model using logistic regression that can be understood by traders regarding the stock value of PT Bank MNC Internasional Tbk.

Measurable : Combine and measure the stock value data variable of PT Bank MNC Internasional Tbk. so as to get a conclusion in the scalping model.

Attainable : In order to facilitate decision making and future strategies to trade shares of PT Bank MNC Internasional Tbk. in the short term.

Relevant : The greater the percentage of data analysis results that can be concluded in, the better the conclusions obtained.

Time-Bounded : Get analysis conclusions and predictions for traders in the short term because it is in accordance with the scalping model.

So if we drag all the points, we have a goals to constructing a model of stock values of PT Bank MNC Internasional Tbk using logistic regression (statistical analysis that is often used for predictive modeling) with stock data variables of their company in order to give the reader a suggestion in scalping trade.
# The Scope of Data that We Use
- Data open price time of the day in MNCBank from 2014-2021.
- Data change Price time of the day in MNCBank from 2014-2021.
- Data change volume time of the day (using lot) in MNCBank from 2014-2021.
- Data interval high open in MNCBank from 2014-2021.
- Data interval open from the last day in MNCBank from 2014-2021.
# Methodology
For the purposes of this statistical research, we used secondary data that we found from Kaggle, an online community of data scientists and machine learning practitioners. Kaggle allows users to find and publish datasets, from that we then find a dataset of MNC Bank’s stock value from 2014-2021.

https://www.kaggle.com/datasets/aryopanji/saham-mnc-bank-2014-2021-indonesia-stock

# Statistical Method
The methodology that we agreed to use for this analysis is the Binary Logistic Regression Analysis that could later be used to calculate the probability of rise or fall of the price of MNC Bank shares within a day. Regression analysis presents the association between a response variable and one or more explanatory variables. Since the business issue is whether the model can predict the rise or fall of MNC Bank share price, we decided to use binary logistic regression as the most appropriate method to answer the business issue.

We decided to use Binary Logistic Regression because of the problem that we want to solve. Since we decided to use ‘Change’ as the dependent variable and selected 2 main factors to be predicted.
For more information about the coding in R, i will give the file of coding in R studio

# Conclusion
From the model we constructed, we reject the first model while not rejecting the second model since in comparison, the residual deviance of the second model shows significant improvement over the first model. The second model consists of the variable ‘Change’ as the dependent variable(predicted variable) and ‘Open’, ‘Volume’, ‘Interval_High_Open’, and ‘Interval_Open_From_LastDay’ as the independent variables (predictor variable). The model representation is:

e^0.385 - 0.0000009(X1) - 0.028(X2) + 0.8713(X3) + 0.7557(X4) 

In order to prove that our model fulfills the assumption of binary logistic (no multicollinearity), we conduct a Variance Inflation Factor (VIF) and also construct a correlation plot for visualization. We found that statistically, our model does not represent any multicollinearity, which means that the model is proper enough to be used. Our analysis of Pseudo R² explains that 36.73% of the total variation of changes can be explained by the four independent variables that we selected.
# Implications
The forecasting model we develop could allow us to evaluate whether the changes of the prices within a day (scalping trade) will result in rises or fall of MNC Bank stock price, in the case that we knew the open price of the day before and that current date, the interval between the highest price point and the opening price of that current date, and the trading volume that happen on the day before. With the application of this model, we may help amateur traders who are interested in scalping trade to determine whether or not the current date is feasible to buy or sell the shares of MNC Bank that they currently have. This statistical analysis would also help people who are interested in learning about scalping trade but are confused on the calculation that the traders already have. Further technical analysis of shares may be needed in order to analyze the estimation of the all-time high prices of stock  and volume shares traded during a day period that are needed in using our model.

### File of My Coding in R Studio
[Final Project.R.zip](https://github.com/SultanJumhur123/My-File-Data-Science/files/9290654/Final.Project.R.zip)

