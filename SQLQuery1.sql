CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title NVARCHAR(100),
    Author NVARCHAR(100),
    Genre NVARCHAR(50),
    PublicationYear INT,
    ISBN NVARCHAR(20),
    PageCount INT,
    Format NVARCHAR(20),
    Language NVARCHAR(50),
    Description NVARCHAR(MAX),
	URL NVARCHAR(MAX),
	URL_IMAGES NVARCHAR(MAX)
);

CREATE TABLE BookCopies (
    CopyID INT PRIMARY KEY,
    BookID INT FOREIGN KEY REFERENCES Books(BookID),
    Availability NVARCHAR(20),
    Condition NVARCHAR(20)
);

CREATE TABLE Users (
    UserID INT PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Email NVARCHAR(100),
    Password NVARCHAR(100),
    Role NVARCHAR(20)
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    CopyID INT FOREIGN KEY REFERENCES BookCopies(CopyID),
    OrderDate DATE,
    OrderStatus NVARCHAR(20)
);