CREATE TABLE Users (
    UserID INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(100)       NOT NULL,
    Email NVARCHAR(150)      NOT NULL UNIQUE,
    Phone NVARCHAR(20)       NULL,
    PasswordHash VARBINARY(256) NOT NULL,
    Role NVARCHAR(20)        NOT NULL DEFAULT 'Customer'
);

CREATE TABLE Categories (
    CategoryID INT IDENTITY PRIMARY KEY,
    CategoryName NVARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Products (
    ProductID INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(150)        NOT NULL,
    Description NVARCHAR(500) NULL,
    Price DECIMAL(10,2)       NOT NULL,
    OldPrice DECIMAL(10,2)    NULL,
    ImageUrl NVARCHAR(255)    NULL,
    CategoryID INT            NULL
        FOREIGN KEY REFERENCES Categories(CategoryID)
);

CREATE TABLE Orders (
    OrderID INT IDENTITY PRIMARY KEY,
    UserID INT NOT NULL
        FOREIGN KEY REFERENCES Users(UserID),
    OrderDate DATETIME NOT NULL DEFAULT GETDATE(),
    Total DECIMAL(10,2) NOT NULL,
    Status NVARCHAR(30) NOT NULL DEFAULT 'Нове'
);

CREATE TABLE OrderItems (
    OrderItemID INT IDENTITY PRIMARY KEY,
    OrderID INT NOT NULL
        FOREIGN KEY REFERENCES Orders(OrderID) ON DELETE CASCADE,
    ProductID INT NOT NULL
        FOREIGN KEY REFERENCES Products(ProductID),
    Quantity INT NOT NULL CHECK (Quantity > 0),
    Price DECIMAL(10,2) NOT NULL
);


CREATE TABLE Contacts (
    ContactID INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(100)  NOT NULL,
    Email NVARCHAR(150) NOT NULL,
    Phone NVARCHAR(20)  NULL,
    Message NVARCHAR(1000) NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE()
);

-- Категорії
INSERT INTO Categories (CategoryName)
VALUES (N'Торти'), (N'Чизкейки'), (N'Круасани'), (N'Інше');

-- Продукти (для тесту)
INSERT INTO Products (Name, Description, Price, OldPrice, ImageUrl, CategoryID)
VALUES
 (N'Торт Наполеон', N'Класичний багатошаровий торт', 150, 180, N'images/napoleon.jpg', 1),
 (N'Чизкейк Класичний', N'Ніжний сирний десерт', 100, 120, N'images/cheesecake.jpg', 2),
 (N'Круасан Французький', N'Свіжий хрусткий круасан', 160, 200, N'images/croissant.jpg', 3);