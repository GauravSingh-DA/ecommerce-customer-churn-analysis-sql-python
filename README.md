# 📊 E-Commerce Customer Churn Analysis

## 📌 Project Overview

This project analyzes customer churn behavior in an e-commerce business to identify patterns, trends, and key factors that lead customers to stop purchasing. The objective is to generate data-driven insights to improve customer retention and long-term business growth.

The analysis was conducted on a dataset containing more than 1 million records across four core business tables.

---

## 🎯 Business Objective

- Analyze customer churn behavior  
- Identify at-risk customers  
- Understand purchasing patterns  
- Evaluate customer value segments  
- Generate actionable business insights  

---

## 🗂️ Dataset Information

Total Records: 1M+ Rows  
Tables Used: 4  

- Customers — Customer location and information  
- Orders — Purchase behavior and order history  
- Payments — Payment method and transaction value  
- Reviews — Customer satisfaction and feedback  

---

## 🛠️ Tools & Technologies

### SQL
- Data Cleaning  
- Duplicate Removal  
- NULL Value Handling  
- Data Transformation  

### Python

Libraries Used:

- Pandas  
- NumPy  
- Matplotlib  
- Seaborn  
- Plotly  

Used For:

- Data Processing  
- Exploratory Data Analysis  
- Customer Segmentation  
- Churn Analysis  
- Data Visualization  

---

## 📁 Project Structure

ecommerce-customer-churn-analysis-sql-python/
│
├── data/
│ ├── customers_sample.csv
│ ├── orders_sample.csv
│ ├── payments_sample.csv
│ └── reviews_sample.csv
│
├── sql/
│ └── data_cleaning.sql
│
├── python/
│ └── customer_churn_analysis.ipynb
│
└── README.md

---

## 🔧 Data Cleaning (SQL)

- Removed duplicate records  
- Handled missing values  
- Standardized categorical values  
- Converted timestamp to date format  
- Created cleaned tables for analysis  

Clean Tables:

- customers_clean  
- orders_clean  
- payments_clean  
- reviews_clean  

---

## 📊 Key Analysis Performed

### Customer Churn Analysis
- Total customers  
- Active vs churned customers  
- Overall churn rate  

### Customer Behavior Analysis
- Average orders per customer  
- Average order value  
- Customer lifetime value  

### RFM Segmentation

Customers segmented based on:

- Recency  
- Frequency  
- Monetary  

Segments:

- High-Value Customers  
- At-Risk Customers  
- Lost Customers  

### Payment Method Analysis
- COD vs UPI vs Credit Card churn  

### Geographic Analysis
- State-wise churn comparison  

### Customer Experience Analysis
- Review score vs churn  

---

## 📈 Key Insights

Total Customers: 49,000  
Active Customers: 48,735  
Churned Customers: 265  
Overall Churn Rate: 0.54%  

Customer Behavior:

- Average Orders per Customer: 20.41  
- Average Order Value: ₹2,547  
- Average Customer Spending: ₹51,990  

RFM Segmentation:

- High-Value Customers: 29,117  
- At-Risk Customers: 19,618  
- Lost Customers: 265  

Additional Findings:

- Churn remained low across payment methods  
- Review scores were similar for churned and active customers  
- State-wise churn differences were minimal  
- Strong overall customer retention observed  

---

## 📌 Conclusion

The analysis indicates strong customer retention with a very low churn rate of 0.54 percent. Most customers remain active and demonstrate consistent purchasing behavior.

RFM segmentation highlights a large proportion of high-value customers, suggesting strong customer loyalty and stable revenue generation.

Although churn is minimal, monitoring at-risk customers and maintaining engagement strategies can further improve customer retention and long-term business growth.

---

## 📌 Dataset Note

Due to large dataset size (1M+ rows), only sample datasets (100 rows) are uploaded to this repository.  
The full dataset was used during analysis.

---

## 👨‍💻 Author

**Gaurav Singh**  
Data Analyst  

📧 Email: gauravsingh20305566@gmail.com  
🔗 LinkedIn: www.linkedin.com/in/gaurav-singh-1083013b7
---

## ⭐ Skills Demonstrated

- SQL  
- Python  
- Data Cleaning  
- Exploratory Data Analysis  
- Customer Churn Analysis  
- RFM Segmentation  
- Data Visualization  
- Business Insights  
