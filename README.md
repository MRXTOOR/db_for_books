# db_for_books
База данных для хранения информации о книгах в электронной библиотеке.


## Таблицы базы данных

### Books
| Поле             | Тип            | Описание                       |
|------------------|----------------|-------------------------------|
| BookID           | int (PK)       | Уникальный идентификатор       |
| Title            | nvarchar(100)  | Название книги                |
| Author           | nvarchar(100)  | Автор книги                   |
| Genre            | nvarchar(50)   | Жанр книги                    |
| PublicationYear  | int            | Год публикации                |
| ISBN             | nvarchar(20)   | Международный стандартный номер книги |
| PageCount        | int            | Количество страниц в книге    |
| Format           | nvarchar(20)   | Формат книги (например, мягкая обложка, твердый переплет) |
| Language         | nvarchar(50)   | Язык книги                    |
| Description      | nvarchar(max)  | Описание книги                |
| URL              | nvarchar(max)  | URL, связанный с книгой       |
| URL_IMAGES       | nvarchar(max)  | URL для изображений книги     |

### BookCopies
| Поле             | Тип            | Описание                       |
|------------------|----------------|-------------------------------|
| CopyID           | int (PK)       | Уникальный идентификатор       |
| BookID           | int (FK)       | Внешний ключ, ссылающийся на Books(BookID) |
| Availability     | nvarchar(20)   | Статус доступности экземпляра книги (например, доступен, выдан) |
| Condition        | nvarchar(20)   | Состояние экземпляра книги (например, хорошее, удовлетворительное) |

### Users
| Поле             | Тип            | Описание                       |
|------------------|----------------|-------------------------------|
| UserID           | int (PK)       | Уникальный идентификатор       |
| FirstName        | nvarchar(50)   | Имя пользователя              |
| LastName         | nvarchar(50)   | Фамилия пользователя           |
| Email            | nvarchar(100)  | Адрес электронной почты пользователя |
| Password         | nvarchar(100)  | Пароль пользователя (хешированный и безопасный) |
| Role             | nvarchar(20)   | Роль пользователя (например, администратор, обычный) |

### Orders
| Поле             | Тип            | Описание                       |
|------------------|----------------|-------------------------------|
| OrderID          | int (PK)       | Уникальный идентификатор       |
| UserID           | int (FK)       | Внешний ключ, ссылающийся на Users(UserID) |
| CopyID           | int (FK)       | Внешний ключ, ссылающийся на BookCopies(CopyID) |
| OrderDate        | date           | Дата размещения заказа        |
| OrderStatus      | nvarchar(20)   | Статус заказа (например, обработка, отправлен) |

```sql
INSERT INTO Books (BookID, Title, Author, Genre, PublicationYear, ISBN, PageCount, Format, Language, Description, URL, URL_IMAGES)
VALUES (1, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', 1960, '9780061120084', 281, 'Paperback', 'English', 'The unforgettable novel of a childhood in a sleepy Southern town and the crisis of conscience that rocked it.', 'd:\d\d\1\d', 'images\1');

INSERT INTO BookCopies (CopyID, BookID, Availability, Condition)
VALUES (1, 1, 'Available', 'Good');

INSERT INTO Users (UserID, FirstName, LastName, Email, Password, Role)
VALUES (1, 'John', 'Doe', 'johndoe@example.com', 'password123', 'Member');

INSERT INTO Orders (OrderID, UserID, CopyID, OrderDate, OrderStatus)
VALUES (1, 1, 1, '2022-01-15', 'Pending');
```
