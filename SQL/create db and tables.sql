-- Create database library and use it.
CREATE DATABASE [LIBRARY];
GO

-- Create tables
-- Client table
USE [LIBRARY];
CREATE TABLE [CLIENT]
([CPF] CHAR(11) NOT NULL,
[NAME] VARCHAR(100),
[REGISTRATION DATE] DATE,
CONSTRAINT PK_CLIENT_ID PRIMARY KEY CLUSTERED ([CPF]));
GO

-- Author table
USE [LIBRARY];
CREATE TABLE [AUTHOR]
([AUTHOR ID] INT IDENTITY (1,1) NOT NULL,
[NAME] VARCHAR(100),
[REGISTRATION DATE] DATE,
CONSTRAINT PK_AUTHOR_ID PRIMARY KEY CLUSTERED ([AUTHOR ID]));
GO

-- Category table
USE [LIBRARY];
CREATE TABLE [CATEGORY]
([CATEGORY ID] INT IDENTITY (1,1) NOT NULL,
[NAME] VARCHAR(100),
CONSTRAINT PK_CATEGORY_ID PRIMARY KEY CLUSTERED ([CATEGORY ID]));
GO

-- Book
USE [LIBRARY];
CREATE TABLE [BOOK]
([ISBN] CHAR(13),
[AUTHOR ID] INT NOT NULL,
[CATEGORY ID] INT NOT NULL,
[TITLE] VARCHAR(100),
[QUANTITY] INT,
CONSTRAINT PK_BOOK_ID PRIMARY KEY CLUSTERED ([ISBN]),
CONSTRAINT FK_AUTHOR_ID FOREIGN KEY ([AUTHOR ID]) REFERENCES [AUTHOR]([AUTHOR ID]),
CONSTRAINT FK_CATEGORY_ID FOREIGN KEY ([CATEGORY ID]) REFERENCES [CATEGORY]([CATEGORY ID]));
GO

-- Borrowed books
USE [LIBRARY];
CREATE TABLE [BORROWED BOOK]
([ID] INT IDENTITY (1,1) NOT NULL,
[CLIENT ID] CHAR(11) NOT NULL,
[BOOK ID] CHAR(13) NOT NULL,
[BORROWED DATE] DATE,
[LIMIT DATE] DATE,
[RETURNED DATE] DATE,
CONSTRAINT PK_ID PRIMARY KEY CLUSTERED ([ID]),
CONSTRAINT FK_CLIENT_ID FOREIGN KEY ([CLIENT ID]) REFERENCES [CLIENT]([CPF]),
CONSTRAINT FK_BOOK_ID FOREIGN KEY ([BOOK ID]) REFERENCES [BOOK]([ISBN]));
GO