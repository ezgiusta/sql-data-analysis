# SQL Data Analysis Project – Customer Behavior Analysis

## Overview

This project analyzes the `flo_data_20K` dataset to understand customer purchasing behavior, revenue distribution, and channel performance.

The goal is to move beyond SQL queries and extract insights that can support business decisions.

## Business Objective

To identify key drivers of revenue, evaluate channel performance, and understand customer behavior to uncover growth opportunities.

## Dataset

- Total Rows: 19,945
- Unique Customers: 19,945

Each row represents a unique customer, which makes the dataset suitable for customer-level analysis.

The dataset includes:

- Order counts
- Customer value
- Sales channels
- Store types
- Category preferences
- Order dates

## Key Findings

### 1. Overall Performance

- Total Orders: 100,219
- Total Revenue: ~14.98M
- Average Order Value: 149.51

Revenue is supported by a high number of orders, while the average order value gives a baseline for customer spending behavior.

### 2. Channel Performance

- Android App generates the highest revenue (~5.6M)
- Offline channel follows (~4.4M)
- Mobile, Desktop, and iOS generate lower total revenue

This indicates that Android App and Offline are the strongest channels in terms of total revenue and order volume.

### 3. Customer Value by Channel

- iOS has the highest average revenue per order (164.64)
- Desktop follows with 155.92
- Android App has the highest total revenue but a lower average revenue per order than iOS

This suggests that iOS and Desktop customers may have higher spending per order, even though they generate lower total revenue.

### 4. Store Type Analysis

- Store Type A generates the highest revenue (~10.8M)
- Store Type A is also the most frequent store type with 15,453 customers

This shows that Store Type A is the dominant store type in both revenue and customer count.

### 5. Customer Acquisition Trends

- Order volume increases from 2013 to 2019
- 2019 has the highest order volume
- A decline is observed after 2019

This suggests that customer acquisition or customer activity was strongest in 2019 and weakened afterward.

### 6. Category Preferences

- Active Sports is the most frequent category combination
- Women is the second most frequent category
- Some customers also show interest in multiple category combinations

This indicates that Active Sports and Women categories are important areas of customer interest.

### 7. High-Value Customer Behavior

- The customer with the highest order volume has 202 orders
- Among the top customers by revenue, some have high order frequency while others have high average revenue per order

This shows that high-value customers are not all the same: some generate value through frequent purchases, while others generate value through larger purchases.

### 8. Recent Customer Activity

- The most recent purchase date in the dataset is 2021-05-30
- The query identifies customers whose last purchase date matches this latest date

These customers represent the most recently active customer group in the dataset.

## Recommendations

- Increase average order value through cross-sell and bundle strategies
- Maintain the strength of Android App and Offline channels
- Improve iOS and Desktop performance to capture higher-spending customers
- Focus on Store Type A while also investigating why other store types underperform
- Analyze the factors behind the 2019 peak to understand what drove higher customer activity

## Files

- `analysis_queries.sql`: SQL queries used in the analysis

## Notes

This project demonstrates SQL-based data analysis combined with business-oriented thinking and insight generation.
