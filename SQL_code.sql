mysql> CREATE TABLE luckin_data1(Unnamed0 INT NOT NULL,
Unnamed1 INT NOT NULL,
dt DATE NOT NULL,
phone_no VARCHAR(13) NOT NULL,
member_id INT NOT NULL,
commodity_code VARCHAR(6) NOT NULL,
commodity_name VARCHAR(15) NOT NULL,
commodity_origin_money DECIMAL(4,1) NOT NULL,
coupon_id	 DECIMAL(6,1) NOT NULL,
coupon_money DECIMAL(6,2) NOT NULL,
one_category_name VARCHAR(4) NOT NULL,
two_category_name VARCHAR(10) NOT NULL,
commodity_income DECIMAL(4,2) NOT NULL,
pay_money DECIMAL(6,2) NOT NULL,
coffeestore_share_money DECIMAL(4,2) NOT NULL);
Query OK, 0 rows affected (0.01 sec)

mysql> LOAD DATA INFILE 'C:/Users/cfz/Desktop/WISER CLUB/final_project/data.csv'
INTO TABLE luckin_data CHARACTER SET utf8
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"' escaped by '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 LINES;
Query OK, 2351855 rows affected, 65535 warnings (26.09 sec)
Records: 2351855  Deleted: 0  Skipped: 0  Warnings: 1046239

CREATE TABLE luckin_holiday(dt DATE PRIMARY KEY,
month INT NOT NULL,
weekday INT NOT NULL,
week_of_year INT NOT NULL,
type INT NOT NULL,
last_type INT NOT NULL,
holiday_distance INT NOT NULL,
holiday_code INT NOT NULL);
Query OK, 0 rows affected (0.01 sec)

## Part 1: Explorative Data Analysis
# Problem 1 Find the time span of the order data.
mysql> SELECT dt FROM luckin_data GROUP BY dt LIMIT 1;
+------------+
| dt         |
+------------+
| 2019-01-20 |
+------------+
1 row in set (0.00 sec)

mysql> SELECT dt FROM luckin_data GROUP BY dt ORDER BY dt DESC LIMIT 1;
+------------+
| dt         |
+------------+
| 2019-03-01 |
+------------+
1 row in set (0.00 sec)

# Problem 2 Find the number of orders each day.
mysql> SELECT dt, COUNT(dt) AS daily_orders FROM luckin_data GROUP BY dt;
+------------+--------------+
| dt         | daily_orders |
+------------+--------------+
| 2019-01-20 |        69859 |
| 2019-01-21 |       117686 |
| 2019-01-22 |       118409 |
| 2019-01-23 |       126331 |
| 2019-01-24 |       125764 |
| 2019-01-25 |       122092 |
| 2019-01-26 |        77779 |
| 2019-01-27 |        66399 |
| 2019-01-28 |       106025 |
| 2019-01-29 |       104704 |
| 2019-01-30 |       101047 |
| 2019-01-31 |        97701 |
| 2019-02-01 |        87458 |
| 2019-02-02 |        64267 |
| 2019-02-03 |        43106 |
| 2019-02-04 |         7113 |
| 2019-02-05 |         8516 |
| 2019-02-06 |         7769 |
| 2019-02-07 |         7655 |
| 2019-02-08 |         7822 |
| 2019-02-09 |         8452 |
| 2019-02-10 |         8241 |
| 2019-02-11 |        40365 |
| 2019-02-12 |        43334 |
| 2019-02-13 |        50789 |
| 2019-02-14 |        49092 |
| 2019-02-15 |        49836 |
| 2019-02-16 |        29672 |
| 2019-02-17 |        25179 |
| 2019-02-18 |        52260 |
| 2019-02-19 |        51624 |
| 2019-02-20 |        53121 |
| 2019-02-21 |        51817 |
| 2019-02-22 |        53685 |
| 2019-02-23 |        31964 |
| 2019-02-24 |        27414 |
| 2019-02-25 |        53969 |
| 2019-02-26 |        50018 |
| 2019-02-27 |        48970 |
| 2019-02-28 |        51272 |
| 2019-03-01 |        53279 |
+------------+--------------+
41 rows in set (2.16 sec)

# 查询行数
mysql> SELECT COUNT(*) FROM (SELECT dt, COUNT(dt) FROM luckin_data GROUP BY dt) AS date;
+----------+
| COUNT(*) |
+----------+
|       41 |
+----------+
1 row in set (2.68 sec)

# Problem 3 Find the number of users.
mysql> SELECT COUNT(*) AS user_num FROM (SELECT member_id FROM luckin_data GROUP BY member_id) AS user;
+----------+
| user_num |
+----------+
|   466886 |
+----------+
1 row in set (2.61 sec)

# Problem 4 Find ten commodities with the highest sales.
mysql> SELECT commodity_name, COUNT(commodity_name) AS orders FROM luckin_data GROUP BY commodity_name ORDER BY orders DESC LIMIT 10;
+----------------+--------+
| commodity_name | orders |
+----------------+--------+
| 拿铁           | 425514 |
| 榛果拿铁       | 219627 |
| 澳瑞白         | 155506 |
| 标准美式       | 148666 |
| 香草拿铁       | 136841 |
| 卡布奇诺       | 115475 |
| 摩卡           | 113754 |
| 加浓美式       | 110526 |
| 焦糖玛奇朵     | 105081 |
| 焦糖拿铁       |  81120 |
+----------------+--------+
10 rows in set (3.19 sec)

# Problem 5 Find the discount rate of each order and concat it onto the original dataset with column name discount_rate.
mysql> SELECT commodity_income/commodity_origin_money FROM luckin_data LIMIT 5;
+-----------------------------------------+
| commodity_income/commodity_origin_money |
+-----------------------------------------+
|                                0.280000 |
|                                0.000000 |
|                                0.180000 |
|                                0.280000 |
|                                0.480000 |
+-----------------------------------------+
5 rows in set (0.01 sec)

mysql> SELECT luckin_data.*, d_rate.discount_rate FROM luckin_data, (SELECT Unnamed0, commodity_income/commodity_origin_money AS discount_rate FROM luckin_data) AS d_rate WHERE luckin_data.Unnamed0=d_rate.Unnamed0 LIMIT 5;
+----------+----------+------------+-------------+-----------+----------------+----------------+------------------------+-----------+--------------+-------------------+-------------------+------------------+-----------+-------------------------+---------------+
| Unnamed0 | Unnamed1 | dt         | phone_no    | member_id | commodity_code | commodity_name | commodity_origin_money | coupon_id | coupon_money | one_category_name | two_category_name | commodity_income | pay_money | coffeestore_share_money | discount_rate |
+----------+----------+------------+-------------+-----------+----------------+----------------+------------------------+-----------+--------------+-------------------+-------------------+------------------+-----------+-------------------------+---------------+
|        0 |        0 | 2019-01-25 | 13901387938 |     14442 | SP025          | 榛果拿铁       |                   27.0 |    7045.0 |        19.44 | 饮品              | 现磨咖啡          |             7.56 |      7.56 |                    0.00 |      0.280000 |
|        1 |        1 | 2019-01-27 | 13901387938 |     14442 | SP209          | NFC鲜榨橙汁    |                   24.0 |       0.0 |         0.00 | 饮品              | 鲜榨果蔬汁        |             0.00 |      0.00 |                    0.00 |      0.000000 |
|        2 |        2 | 2019-01-23 | 13901387938 |     14442 | SP025          | 榛果拿铁       |                   27.0 |    5589.0 |        22.14 | 饮品              | 现磨咖啡          |             4.86 |      4.86 |                    0.00 |      0.180000 |
|        3 |        3 | 2019-02-01 | 13901387938 |     14442 | SP025          | 榛果拿铁       |                   27.0 |    6604.0 |        19.44 | 饮品              | 现磨咖啡          |             7.56 |      7.56 |                    0.00 |      0.280000 |
|        4 |        4 | 2019-01-27 | 13901387938 |     14442 | SP010          | 巧克力瑞纳冰   |                   27.0 |    6947.0 |        14.04 | 饮品              | 瑞纳冰            |            12.96 |     12.96 |                    0.00 |      0.480000 |
+----------+----------+------------+-------------+-----------+----------------+----------------+------------------------+-----------+--------------+-------------------+-------------------+------------------+-----------+-------------------------+---------------+
5 rows in set (3.13 sec)

# To be continued...

2020-04-16
