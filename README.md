# 🍽️ Swiggy Analytics Dashboard Project – SQL + Excel + Power BI + Tableau

This end-to-end project visualizes Swiggy’s customer and order data across three BI platforms – **Excel**, **Power BI**, and **Tableau**, with **MySQL** as the backend. Insights are extracted using SQL queries, data modeling, and DAX measures.

---

---


## 🧱 Architecture Overview

```plaintext
Excel / CSV Files
       ⬇
     MySQL
       ⬇
 ┌──────────────┐              ┌──────────────────────────┐
 │ Power BI     │  <--------  │ MySQL: Direct Table Load │
 │              │              └──────────────────────────┘
 └──────────────┘

 ┌──────────────┐              ┌──────────────────────┐
 │ Tableau      │  <--------  │ SQL View:             │
 │              │             │ Swiggy_Final_View     │
 └──────────────┘              └──────────────────────┘
````

---

## 🧰 Tools Used

| Tool         | Purpose                               |
| ------------ | ------------------------------------- |
| **MySQL**    | Data import, joins, SQL view creation |
| **Excel**    | Quick KPIs, slicers, pivot visuals    |
| **Power BI** | DAX Measures, complex data modeling   |
| **Tableau**  | Visual storytelling using SQL View    |

---

## 🗃️ SQL View (Used in Tableau)

```sql

USE swiggy_dashboard_db;

CREATE VIEW Swiggy_Final_View AS
SELECT 
    o.OrderID,
    o.`Order Date`,
    o.`Customer ID`,
    c.Name AS CustomerName,
    c.Gender,
    c.Preferences,
    c.LoyaltyPoints,
    c.MembershipStatus,
    
    o.`Restaurant ID`,
    r.Name AS RestaurantName,
    r.Location AS RestaurantLocation,
    r.`Cuisine Type`,
    r.`Average Rating`AS RestaurantRating,
    
    o.`Total Amount`,
    o.`Discount Applied`,
    o.`Fina lAmount Paid`,
    o.Status AS OrderStatus,
    o.`Payment Method`,
    o.`Order Source`,
    
    d.`Delivery Agent ID`,
    da.Name AS AgentName,
    da.`Vehicle Type`,
    da.Ratings AS AgentRating,
    
    d.`Pickup Time`,
    d.`Actual Delivery Time`,
    d.`Expected Delivery Time`,
    d.`Delivery Status`,
    d.`Delivery Feedback Rating` AS DeliveryRating,
    
    ca.City,
    ca.`Address Type`
    
FROM Orders o
LEFT JOIN Customers c ON o.`Customer ID` = c.`Customer ID`
LEFT JOIN Restaurant r ON o.`Restaurant ID` = r.RestaurantID
LEFT JOIN Delivery d ON o.OrderID = d.`Order ID`
LEFT JOIN DeliveryAgent da ON d.`Delivery Agent ID` = da.`Delivery AgentID`
LEFT JOIN CustomerAddress ca ON o.`Customer ID` = ca.`Customer ID`;

```

---

## 📊 Excel Dashboard

![Excel Dashboard](https://github.com/Rajkumar-dataanalyst/Swiggy_Analysis-Project/blob/main/excel_dashboard.png?raw=true)

### KPIs:

* Total Orders, Revenue, AOV, Repeat %
* Profit by Cuisine, City
* Payment Summary (Donut Chart)
* Monthly Trend (Line Chart)

---

## 📊 Power BI Dashboard (3 Pages)

### Page 1 – Overview

![Power BI Page 1](screenshots/powerbi_dashboard_page1.png)

* KPIs: Orders, Revenue, AOV
* Cuisine Profit, Payment Split
* Monthly Trend

### Page 2 – Customers & Orders

![Power BI Page 2](screenshots/powerbi_dashboard_page2.png)

* CLV, Category Preference
* Cancellation %, Profit by City

### Page 3 – Delivery Analysis

![Power BI Page 3](screenshots/powerbi_dashboard_page3.png)

* COGS vs Profit
* On-Time Delivery %
* Status Distribution

---

## 📊 Tableau Dashboard (2 Pages)

### Page 1 – Orders & Metrics

![Tableau Page 1](screenshots/tableau_dashboard_page1.png)

* Profit by Cuisine
* Monthly Orders
* Payment Breakdown

### Page 2 – Customers & Delivery

![Tableau Page 2](screenshots/tableau_dashboard_page2.png)

* Cancel % by City
* Top Customers
* Delivery Agent Status

---

## 🔍 Business Insights

* **Delhi** has highest customer volume
* **Italian** cuisine is most profitable
* **October** saw peak order activity
* **Repeat customers** make up 42% of total
* **COGS** was ₹6.26M while **Profit** was ₹4M

---

## 🚀 Conclusion & Future Developments

This project successfully integrated multiple data sources and BI tools to deliver a comprehensive view of Swiggy’s business performance. The combination of **SQL data modeling**, **Excel’s agility**, **Power BI’s powerful analytics**, and **Tableau’s rich visual storytelling** provided stakeholders with actionable insights to optimize operations and customer engagement.

### Future Enhancements:

- **Real-time Data Integration:**  
  Implement streaming data pipelines from Swiggy’s operational systems to enable near real-time dashboard updates.

- **Advanced Analytics:**  
  Incorporate machine learning models for demand forecasting, customer segmentation, and churn prediction.

- **Mobile-friendly Dashboards:**  
  Develop responsive dashboards for mobile access to empower field teams and management on the go.

- **Deeper Delivery Analytics:**  
  Analyze delivery agent performance, route optimization, and customer feedback integration.

- **Automation:**  
  Automate data extraction, transformation, and loading (ETL) processes using tools like Apache Airflow or Azure Data Factory.

- **Enhanced User Interactivity:**  
  Add dynamic filtering, drill-down capabilities, and storytelling features in dashboards for deeper exploration.

By continuously evolving this analytics framework, Swiggy can stay ahead in the competitive food delivery market and drive data-driven decision-making at every level.

---







