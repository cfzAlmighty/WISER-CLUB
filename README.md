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
&emsp;a.	<font color = blue>Boss: we need to design two different strategies for sales in workdays and sales in weekends.</font> <br/> &emsp;&emsp;True or False? Explain. <br/>

3.	Find the number of users. <br/>

4.	Find ten commodities with the highest sales and draw graphs with x-axis the commodity name and y-axis<br/> &emsp;the # of orders. <br/>

5.  Find the discount rate of each order and concat it onto the original dataset with column name *<font>discount_rate</font>*.<br/>&emsp;You may use *<font>pay_money</font>*, *<font>coffeestore_share_money</font>*, *<font>commodity_origin_money</font>* and *<font>commodity_income</font>*. <br/>

6.	Find the average discount of each week. One week should consist of Sunday to Saturday. <br/>

7.	Find the *<font>Retention Rate</font>* of any five days. It is the ratio of users purchasing again on the next day. <br/>&emsp;For example, if you want to compute the *<font>Retention Rate</font>* on 2019-02-10, then you need to find users who <br/>&emsp;bought goods on 02-09 and 02-10. <br/>

8. Find the *<font>Week Retention Rate</font>* of any day, which means finding users buying at that day and buying again <br/>&emsp;within the next seven days. <br/>

9. Find the *<font>Week Retention Rate</font>* of any day for *<font>new users</font>*  , which means finding users buying at that day <br/>&emsp;*<font>for the first time</font>*  and buying again within the next seven days. <br/>

10. Find the *<font>Retention Rate</font>* *<font>WITHIN</font>* one week of new users. You could choose any week you want, but it must <br/> &emsp;&ensp;consist of Sunday to Saturday. You need to find users buying the first product and buying again within that week. <br/>

11. Find “Active Users” (which means the number of orders of one user is greater equal to 5). <br/>

12. Write the table you get in 11 as a csv file with filename *<font>ActiveUser.csv</font>*. <br/>

13. Provide a description of the number of orders for each active user (# of ActiveUser, mean, range, std, variance,<br/>&emsp;&ensp;skewness and kurtosis). 
</font>
