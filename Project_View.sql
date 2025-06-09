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

 
