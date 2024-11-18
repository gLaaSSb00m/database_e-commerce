-- Customer Table
CREATE TABLE Customer (
    CustomerId INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    DateOfBirth DATE,
    Phone VARCHAR(15),
    Age INT
);

-- Order Table
CREATE TABLE `Order` (
    OrderId INT AUTO_INCREMENT PRIMARY KEY,
    ShippingDate DATE,
    OrderDate DATE,
    OrderAmount DECIMAL(10, 2),
    Cart_CartID INT,
    FOREIGN KEY (Cart_CartID) REFERENCES Cart(cartId) ON DELETE CASCADE
);

-- OrderItem Table
CREATE TABLE OrderItem (
    Order_OrderId INT,
    Product_ProductId INT,
    MRP DECIMAL(10, 2),
    Quantity INT,
    PRIMARY KEY (Order_OrderId, Product_ProductId),
    FOREIGN KEY (Order_OrderId) REFERENCES `Order`(OrderId) ON DELETE CASCADE,
    FOREIGN KEY (Product_ProductId) REFERENCES Product(productId) ON DELETE CASCADE
);

-- Product Table
CREATE TABLE Product (
    productId INT AUTO_INCREMENT PRIMARY KEY,
    ProductName VARCHAR(100),
    sellerId INT,
    MRP DECIMAL(10, 2),
    CategoryID INT,
    Stock INT,
    Brand VARCHAR(50),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID) ON DELETE SET NULL,
    FOREIGN KEY (sellerId) REFERENCES Seller(sellerId) ON DELETE SET NULL
);

-- Review Table
CREATE TABLE Review (
    ReviewId INT AUTO_INCREMENT PRIMARY KEY,
    Description TEXT,
    Ratings INT CHECK (Ratings BETWEEN 1 AND 5),
    Product_ProductId INT,
    Customer_CustomerID INT,
    FOREIGN KEY (Product_ProductId) REFERENCES Product(productId) ON DELETE CASCADE,
    FOREIGN KEY (Customer_CustomerID) REFERENCES Customer(CustomerId) ON DELETE CASCADE
);

-- Cart Table
CREATE TABLE Cart (
    cartId INT AUTO_INCREMENT PRIMARY KEY,
    Customer_customerId INT,
    GrandTotal DECIMAL(10, 2),
    ItemsTotal INT,
    FOREIGN KEY (Customer_customerId) REFERENCES Customer(CustomerId) ON DELETE CASCADE
);

-- Category Table
CREATE TABLE Category (
    CategoryID INT AUTO_INCREMENT PRIMARY KEY,
    CategoryName VARCHAR(50),
    Description TEXT
);

-- Seller Table
CREATE TABLE Seller (
    sellerId INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100),
    Phone VARCHAR(15),
    Total_Sales DECIMAL(10, 2)
);

-- Payment Table
CREATE TABLE Payment (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    Order_OrderId INT,
    PaymentMode VARCHAR(50),
    Customer_CustomerId INT,
    PaymentDate DATE,
    FOREIGN KEY (Order_OrderId) REFERENCES `Order`(OrderId) ON DELETE CASCADE,
    FOREIGN KEY (Customer_CustomerId) REFERENCES Customer(CustomerId) ON DELETE CASCADE
);
