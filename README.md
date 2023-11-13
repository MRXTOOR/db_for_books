# db_for_books
База данных для хранения информации о книгах в электронной библиотеке.


## Tables

### Books
- BookID (int, primary key)
- Title (nvarchar(100))
- Author (nvarchar(100))
- Genre (nvarchar(50))
- PublicationYear (int)
- ISBN (nvarchar(20))
- PageCount (int)
- Format (nvarchar(20))
- Language (nvarchar(50))
- Description (nvarchar(max))
- URL (nvarchar(max))
- URL_IMAGES (nvarchar(max))

### BookCopies
- CopyID (int, primary key)
- BookID (int, foreign key references Books(BookID))
- Availability (nvarchar(20))
- Condition (nvarchar(20))

### Users
- UserID (int, primary key)
- FirstName (nvarchar(50))
- LastName (nvarchar(50))
- Email (nvarchar(100))
- Password (nvarchar(100))
- Role (nvarchar(20))

### Orders
- OrderID (int, primary key)
- UserID (int, foreign key references Users(UserID))
- CopyID (int, foreign key references BookCopies(CopyID))
- OrderDate (date)
- OrderStatus (nvarchar(20)
