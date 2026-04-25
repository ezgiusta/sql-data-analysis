-- SQL Data Analysis Project

-- Dataset: flo_data_20K
-- Description: Customer behavior analysis

-- DATA PREVIEW

-- Sample Data
SELECT TOP 10 * FROM dbo.flo_data_20K;

-- Total Rows
SELECT COUNT(*) FROM dbo.flo_data_20K;

-- Unique Customers
SELECT COUNT(DISTINCT master_id) FROM dbo.flo_data_20K;

-- ANALYSIS QUERIES

-- 1. OVERVIEW METRICS

-- Total Orders and Total Revenue
SELECT
    SUM(order_num_total_ever_online + order_num_total_ever_offline) AS total_orders,
    ROUND(SUM(customer_value_total_ever_online + customer_value_total_ever_offline), 2) AS total_revenue
FROM dbo.flo_data_20K;

-- Average Revenue per Order
SELECT
    ROUND(
        SUM(customer_value_total_ever_online + customer_value_total_ever_offline) * 1.0
        / NULLIF(SUM(order_num_total_ever_online + order_num_total_ever_offline), 0),
        2
    ) AS average_revenue_per_order
FROM dbo.flo_data_20K;

-- 2. CHANNEL ANALYSIS

-- Revenue and Order Volume by Last Order Channel
SELECT
    last_order_channel,
    SUM(order_num_total_ever_online + order_num_total_ever_offline) AS total_orders,
    ROUND(SUM(customer_value_total_ever_online + customer_value_total_ever_offline), 2) AS total_revenue
FROM dbo.flo_data_20K
GROUP BY last_order_channel
ORDER BY total_revenue DESC;

-- Average Revenue per Order by Last Order Channel
SELECT
    last_order_channel,
    ROUND(
        SUM(customer_value_total_ever_online + customer_value_total_ever_offline) * 1.0
        / NULLIF(SUM(order_num_total_ever_online + order_num_total_ever_offline), 0),
        2
    ) AS average_revenue_per_order
FROM dbo.flo_data_20K
GROUP BY last_order_channel
ORDER BY average_revenue_per_order DESC;

-- 3. STORE TYPE ANALYSIS

-- Total Revenue by Store Type
SELECT
    store_type,
    ROUND(SUM(customer_value_total_ever_online + customer_value_total_ever_offline), 2) AS total_revenue
FROM dbo.flo_data_20K
GROUP BY store_type
ORDER BY total_revenue DESC;

-- Most Preferred Store Type
SELECT TOP 1
    store_type,
    COUNT(*) AS frequency
FROM dbo.flo_data_20K
GROUP BY store_type
ORDER BY frequency DESC, store_type ASC;

-- 4. TIME-BASED ANALYSIS

-- Order Volume by Customer Acquisition Year
SELECT
    YEAR(first_order_date) AS acquisition_year,
    SUM(order_num_total_ever_online + order_num_total_ever_offline) AS total_orders
FROM dbo.flo_data_20K
GROUP BY YEAR(first_order_date)
ORDER BY acquisition_year;

-- 5. CUSTOMER BEHAVIOR ANALYSIS

-- Top 10 Most Frequent Category Combinations in the Last 12 Months
SELECT TOP 10
    interested_in_categories_12,
    COUNT(*) AS category_frequency
FROM dbo.flo_data_20K
GROUP BY interested_in_categories_12
ORDER BY category_frequency DESC;

-- 6. CUSTOMER-LEVEL INSIGHTS

-- Customer ID with the Highest Order Volume
SELECT TOP 1
    master_id,
    SUM(order_num_total_ever_online + order_num_total_ever_offline) AS total_orders
FROM dbo.flo_data_20K
GROUP BY master_id
ORDER BY total_orders DESC, master_id;

-- Purchase Frequency of Top 100 Customers by Revenue
SELECT TOP 100
    master_id,
    SUM(customer_value_total_ever_online + customer_value_total_ever_offline) AS total_revenue,
    SUM(order_num_total_ever_online + order_num_total_ever_offline) AS total_orders,
    ROUND(
        SUM(customer_value_total_ever_online + customer_value_total_ever_offline) * 1.0
        / NULLIF(SUM(order_num_total_ever_online + order_num_total_ever_offline), 0),
        2
    ) AS avg_revenue_per_order
FROM dbo.flo_data_20K
GROUP BY master_id
ORDER BY total_revenue DESC;

-- Customer IDs with the Most Recent Purchase Date
SELECT
    master_id,
    last_order_date
FROM dbo.flo_data_20K
WHERE last_order_date = (
    SELECT MAX(last_order_date)
    FROM dbo.flo_data_20K
)
ORDER BY master_id;





























