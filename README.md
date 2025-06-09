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
CREATE VIEW Swiggy_Final_View AS
SELECT
    o.OrderID,
    c.CustomerName,
    ca.City,
    r.RestaurantName,
    m.CuisineType,
    m.Category,
    p.PaymentMethod,
    o.OrderAmount,
    o.OrderDate,
    d.Status AS DeliveryStatus,
    da.AgentName
FROM Orders o
JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN CustomerAddress ca ON c.CustomerID = ca.CustomerID
JOIN Restaurant r ON o.RestaurantID = r.RestaurantID
JOIN Menu m ON o.MenuID = m.MenuID
JOIN Payment p ON o.PaymentID = p.PaymentID
JOIN Delivery d ON o.OrderID = d.OrderID
JOIN DeliveryAgent da ON d.AgentID = da.AgentID;
```

---

## 📊 Excel Dashboard

![Excel Dashboard](screenshots/excel_dashboard.png)

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








