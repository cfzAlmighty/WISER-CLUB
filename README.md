# WISER CLUB Final Project

## Project Introduction

This is a comprehensive data science project for the Final of WISERCLUB 2019-2020.  <br/>
The project is about Business Analytics and Data Mining. It consists of three parts: <br/>
  Part 1: Explorative Data Analysis <br/>
  Part 2: Data Preprocessing    <br/>
  Part 3: Model Training and Prediction <br/>
Each part has seversal problems. We have got two csv files, named data.csv and holiday.csv, derived from
a new retail specialty coffee operator. The task is to use data and models to find hidden information.

For SECURITY reasons, the files with extension .csv will not be uploaded.

## Packages used in the project

pandas, numpy, matplotlib, scipy, math, datetime, sklearn, xgboost, imblearn

## Methods used in the project

Aggregate Functions (groupby in Pandas), Hypothesis Testing (T test, F test), String Format, Lambda Expression,
Adaboost, Random Forest, Cross Validation, Xgboost, GridSearchCV, Oversampling, Undersampling

## Contents

### Part 1: Explorative Data Analysis

<font size=4, face="Calibri">
    
1.	Find the time span of the order data. <br/>

2.	Find the number of orders each day. <br/>
&emsp;a.	<font color = 'blue'>Boss: we need to design two different strategies for sales in workdays and sales in weekends.</font> <br/> &emsp;&emsp;True or False? Explain. <br/>

3.	Find the number of users. <br/>

4.	Find ten commodities with the highest sales and draw graphs with x-axis the commodity name and y-axis<br/> 
    the # of orders. <br/>

5.  Find the discount rate of each order and concat it onto the original dataset with column name *<font>discount_rate</font>*.<br/>
    You may use *<font>pay_money</font>*, *<font>coffeestore_share_money</font>*, *<font>commodity_origin_money</font>* and *<font>commodity_income</font>*. <br/>

6.	Find the average discount of each week. One week should consist of Sunday to Saturday. <br/>

7.	Find the *<font>Retention Rate</font>* of any five days. It is the ratio of users purchasing again on the next day. <br/>
    For example, if you want to compute the *<font>Retention Rate</font>* on 2019-02-10, then you need to find users who <br/>
    bought goods on 02-09 and 02-10. <br/>

8.  Find the *<font>Week Retention Rate</font>* of any day, which means finding users buying at that day and buying again <br/>
    within the next seven days. <br/>

9.  Find the *<font>Week Retention Rate</font>* of any day for *<font>new users</font>*  , which means finding users buying at that day <br/>*<font>for the first time</font>*  and buying again within the next seven days. <br/>

10. Find the *<font>Retention Rate</font>* *<font>WITHIN</font>* one week of new users. You could choose any week you want, but it must consist of Sunday to Saturday. You need to find users buying the first product and buying again within that week. <br/>

11. Find “Active Users” (which means the number of orders of one user is greater equal to 5). <br/>

12. Write the table you get in 11 as a csv file with filename *<font>ActiveUser.csv</font>*. <br/>

13. Provide a description of the number of orders for each active user (# of ActiveUser, mean, range, std, variance,<br/>
    skewness and kurtosis). 
</font>

### Part 2: Data Preprocessing

<font size=4, face="Calibri">
    
1. Remove the first column of the data in *<font>data.csv</font>* , because it is just a copy of index.<br/>

2.	<font color = blue>Boss: To implement Collaborative Filtering in recommendation systems, we need a user-item table to show the number of orders for each user and each item.</font> <br/>
&emsp;Try to construct *<font>user-item</font>* table. An example of user-item pair: (Phone_No, 标准美式)<br/>

3.	<font color = blue>Boss: Life is not like a Markov Chain, which means everyone's past behavior is correlated with his present one.  
    And that is why we could exploit past purchase behavior to predict their future buying trends.</font>  <br/>
    Try to construct a dataset to show this past purchasing behavior trend. For convenience, several instructions are proposed as follows <br/>
&emsp;a.	Two days correspond to one dimension. <br/>
&emsp;b.	The last two days of the time span of the data should be the *<font>future</font>* , which means it corresponds to the *<font>target</font>*  field for the following data mining models. <br/>
&emsp;c.	The length of each user vector must be maximized. <br/>
&emsp;d.	The dataset should be a <font face="Cambria Math">DataFrame</font> in Pandas, so you could customize the columns as you wish. <br/>
&emsp;For example, if the time span is from 2019-02-01 to 2019-02-10, then there are 10 days altogether. So each user corresponds to  
&emsp;a 5-dimensional vector, with $4$ features and $1$ target dimension. The vector <font face="Cambria Math">[4, 0, 0, 0, 1]</font> means this user bought one good  
&emsp;between 02-09 and 02-10, and four goods between 02-01 and 02-02. Additionally, the length of each user vector MUST BE $5$  
&emsp;because of the rule c.
</font>

### Part 3: Model Training and Prediction

<font size=4, face="Calibri">
    
1.	Transform the data you got from the last section into an <font face="Cambria Math">array</font> in Numpy.<br/>

2.	Split the data into features <font face="Cambria Math">X</font> and targets <font face="Cambria Math">Y</font>.<br/>
3.	Use *<font>Adaboost</font>*, *<font>Random Forest</font>* in Sklearn to construct the model for prediction with 3-fold cross validation  
    &emsp;a.	(Optional) Use *<font>Xgboost</font>*.  <br/>
    &emsp;b.	<font size=4, color = blue>Boss: Please do not use *<font>Naive-Bayes</font>* or *<font>Support Vector Machine</font>* in this project.</font>  <br/>
    &emsp;&emsp;True or False? Explain.<br/>
4.	Tune your model and report the best metrics you could get for your model and the corresponding confusion matrix and model name.<br/>
    At least Adaboost and Random Forest should be used for tuning. Here are some suggestions.   
    &emsp;a.	Try to do oversampling or undersampling. This is an imbalanced classification problem. <br/>
    &emsp;b.	Change the parameters of each model (e.g. *<font>scale_pos_weight</font>* in *<font>Xgboost</font>* and probability threshold), more information could be found in the Official Documentations.   <br/>
    &emsp;c.	Accuracy is not suitable to be an evaluation metric in this case. Use F1-measure.   <br/>
    &emsp;d.	Try to not record the # of orders for each user. Record whether he bought the goods instead, 1 if he bought and 0 otherwise.   <br/>
    &emsp;e.	Try to record the active-user feature. Many users did not only buy one cup of drink during two days, so whether one user is active should be taken into consideration. <br/>
    &emsp;f.  Try to split the data with respect to Workdays and Weekends and train two different models. If that is the best choice, then you should report two metrics, one for Workdays Model and the other one for Weekends Model. <br/>
5.	After tuning, try to explain why your model works better.
</font>
