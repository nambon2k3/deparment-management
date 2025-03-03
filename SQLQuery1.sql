USE [DepartmentManagementDB]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 7/5/2024 4:28:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nvarchar](100) NOT NULL,
	[ManagerID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomImages]    Script Date: 7/5/2024 4:28:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomImages](
	[ImageID] [int] IDENTITY(1,1) NOT NULL,
	[RoomID] [int] NOT NULL,
	[ImageURL] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ImageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rooms]    Script Date: 7/5/2024 4:28:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rooms](
	[RoomID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[RoomNumber] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](255) NULL,
	[Price] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoomServices]    Script Date: 7/5/2024 4:28:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoomServices](
	[RoomServiceID] [int] IDENTITY(1,1) NOT NULL,
	[RoomID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoomServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 7/5/2024 4:28:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[ServiceID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceName] [nvarchar](100) NOT NULL,
	[ServiceDescription] [nvarchar](255) NULL,
	[Price] [decimal](10, 2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRooms]    Script Date: 7/5/2024 4:28:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRooms](
	[UserRoomID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[RoomID] [int] NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NULL,
	[status] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserRoomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/5/2024 4:28:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[PasswordHash] [nvarchar](255) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[FullName] [nvarchar](100) NULL,
	[Role] [nvarchar](20) NOT NULL,
	[RegistrationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserServices]    Script Date: 7/5/2024 4:28:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserServices](
	[UserServiceID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[Status] [nvarchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserServiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName], [ManagerID]) VALUES (2, N'Department A', 2)
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName], [ManagerID]) VALUES (3, N'Department B', 2)
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName], [ManagerID]) VALUES (4, N'Department C', 2)
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName], [ManagerID]) VALUES (5, N'Department D', 2)
INSERT [dbo].[Departments] ([DepartmentID], [DepartmentName], [ManagerID]) VALUES (6, N'Department E', 2)
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomImages] ON 

INSERT [dbo].[RoomImages] ([ImageID], [RoomID], [ImageURL]) VALUES (1, 2, N'https://img.freepik.com/free-photo/japandi-living-room-interior-design_53876-145502.jpg')
INSERT [dbo].[RoomImages] ([ImageID], [RoomID], [ImageURL]) VALUES (2, 2, N'https://cf.bstatic.com/xdata/images/hotel/max1024x768/482241348.jpg?k=b2b224709fdec8df749e7914ec9b99d6d06334199d22234e70b7033652124c54&o=&hp=1')
INSERT [dbo].[RoomImages] ([ImageID], [RoomID], [ImageURL]) VALUES (3, 2, N'https://www.livingspaces.com/globalassets/images/inspiration/rooms/living/modern-living-room-with-japandi-sofa-loveseat-set_room.jpg?w=580&h=440&mode=pad')
INSERT [dbo].[RoomImages] ([ImageID], [RoomID], [ImageURL]) VALUES (4, 3, N'https://www.vanorohotel.com/wp-content/uploads/2021/07/drz-vanoro_6737.jpg')
INSERT [dbo].[RoomImages] ([ImageID], [RoomID], [ImageURL]) VALUES (5, 4, N'https://www.vanorohotel.com/wp-content/uploads/2021/07/drz-vanoro_6737.jpg')
INSERT [dbo].[RoomImages] ([ImageID], [RoomID], [ImageURL]) VALUES (6, 5, N'https://www.vanorohotel.com/wp-content/uploads/2021/07/drz-vanoro_6737.jpg')
INSERT [dbo].[RoomImages] ([ImageID], [RoomID], [ImageURL]) VALUES (7, 6, N'https://www.vanorohotel.com/wp-content/uploads/2021/07/drz-vanoro_6737.jpg')
INSERT [dbo].[RoomImages] ([ImageID], [RoomID], [ImageURL]) VALUES (8, 7, N'https://www.vanorohotel.com/wp-content/uploads/2021/07/drz-vanoro_6737.jpg')
INSERT [dbo].[RoomImages] ([ImageID], [RoomID], [ImageURL]) VALUES (9, 8, N'https://www.vanorohotel.com/wp-content/uploads/2021/07/drz-vanoro_6737.jpg')
INSERT [dbo].[RoomImages] ([ImageID], [RoomID], [ImageURL]) VALUES (10, 9, N'https://www.vanorohotel.com/wp-content/uploads/2021/07/drz-vanoro_6737.jpg')
INSERT [dbo].[RoomImages] ([ImageID], [RoomID], [ImageURL]) VALUES (11, 10, N'https://www.vanorohotel.com/wp-content/uploads/2021/07/drz-vanoro_6737.jpg')
INSERT [dbo].[RoomImages] ([ImageID], [RoomID], [ImageURL]) VALUES (12, 11, N'https://www.vanorohotel.com/wp-content/uploads/2021/07/drz-vanoro_6737.jpg')
INSERT [dbo].[RoomImages] ([ImageID], [RoomID], [ImageURL]) VALUES (13, 12, N'https://www.vanorohotel.com/wp-content/uploads/2021/07/drz-vanoro_6737.jpg')
INSERT [dbo].[RoomImages] ([ImageID], [RoomID], [ImageURL]) VALUES (14, 13, N'https://www.vanorohotel.com/wp-content/uploads/2021/07/drz-vanoro_6737.jpg')
INSERT [dbo].[RoomImages] ([ImageID], [RoomID], [ImageURL]) VALUES (15, 14, N'https://www.vanorohotel.com/wp-content/uploads/2021/07/drz-vanoro_6737.jpg')
INSERT [dbo].[RoomImages] ([ImageID], [RoomID], [ImageURL]) VALUES (16, 15, N'https://www.vanorohotel.com/wp-content/uploads/2021/07/drz-vanoro_6737.jpg')
INSERT [dbo].[RoomImages] ([ImageID], [RoomID], [ImageURL]) VALUES (17, 2, N'https://images.pexels.com/photos/1669799/pexels-photo-1669799.jpeg?cs=srgb&dl=pexels-fotoaibe-1669799.jpg&fm=jpg')
SET IDENTITY_INSERT [dbo].[RoomImages] OFF
GO
SET IDENTITY_INSERT [dbo].[Rooms] ON 

INSERT [dbo].[Rooms] ([RoomID], [DepartmentID], [RoomNumber], [Description], [Price]) VALUES (2, 2, N'Room 101', N'Standard Room with a view', 150)
INSERT [dbo].[Rooms] ([RoomID], [DepartmentID], [RoomNumber], [Description], [Price]) VALUES (3, 2, N'Room 102', N'Deluxe Room with balcony', 200)
INSERT [dbo].[Rooms] ([RoomID], [DepartmentID], [RoomNumber], [Description], [Price]) VALUES (4, 2, N'Room 103', N'Suite with kitchenette', 300)
INSERT [dbo].[Rooms] ([RoomID], [DepartmentID], [RoomNumber], [Description], [Price]) VALUES (5, 2, N'Room 201', N'Standard Room with garden view', 160)
INSERT [dbo].[Rooms] ([RoomID], [DepartmentID], [RoomNumber], [Description], [Price]) VALUES (6, 3, N'Room 202', N'Deluxe Room with sea view', 220)
INSERT [dbo].[Rooms] ([RoomID], [DepartmentID], [RoomNumber], [Description], [Price]) VALUES (7, 2, N'Room 203', N'Executive Suite', 350)
INSERT [dbo].[Rooms] ([RoomID], [DepartmentID], [RoomNumber], [Description], [Price]) VALUES (8, 3, N'Room 301', N'Standard Room near lobby', 140)
INSERT [dbo].[Rooms] ([RoomID], [DepartmentID], [RoomNumber], [Description], [Price]) VALUES (9, 3, N'Room 302', N'Junior Suite', 250)
INSERT [dbo].[Rooms] ([RoomID], [DepartmentID], [RoomNumber], [Description], [Price]) VALUES (10, 3, N'Room 303', N'Presidential Suite', 500)
INSERT [dbo].[Rooms] ([RoomID], [DepartmentID], [RoomNumber], [Description], [Price]) VALUES (11, 4, N'Room 401', N'Standard Room with city view', 180)
INSERT [dbo].[Rooms] ([RoomID], [DepartmentID], [RoomNumber], [Description], [Price]) VALUES (12, 4, N'Room 402', N'Deluxe Room with river view', 240)
INSERT [dbo].[Rooms] ([RoomID], [DepartmentID], [RoomNumber], [Description], [Price]) VALUES (13, 4, N'Room 403', N'Luxury Suite', 400)
INSERT [dbo].[Rooms] ([RoomID], [DepartmentID], [RoomNumber], [Description], [Price]) VALUES (14, 5, N'Room 501', N'Standard Room with mountain view', 170)
INSERT [dbo].[Rooms] ([RoomID], [DepartmentID], [RoomNumber], [Description], [Price]) VALUES (15, 5, N'Room 502', N'Family Suite', 280)
INSERT [dbo].[Rooms] ([RoomID], [DepartmentID], [RoomNumber], [Description], [Price]) VALUES (16, 6, N'Room 503', N'Penthouse Suite', 600)
INSERT [dbo].[Rooms] ([RoomID], [DepartmentID], [RoomNumber], [Description], [Price]) VALUES (17, 3, N'Room 123466666', N'1234', 51)
INSERT [dbo].[Rooms] ([RoomID], [DepartmentID], [RoomNumber], [Description], [Price]) VALUES (18, 2, N'Room 123', N'123123', 50)
INSERT [dbo].[Rooms] ([RoomID], [DepartmentID], [RoomNumber], [Description], [Price]) VALUES (19, 2, N'Room 123', N'13234', 50)
SET IDENTITY_INSERT [dbo].[Rooms] OFF
GO
SET IDENTITY_INSERT [dbo].[RoomServices] ON 

INSERT [dbo].[RoomServices] ([RoomServiceID], [RoomID], [ServiceID]) VALUES (2, 2, 1)
INSERT [dbo].[RoomServices] ([RoomServiceID], [RoomID], [ServiceID]) VALUES (3, 2, 2)
INSERT [dbo].[RoomServices] ([RoomServiceID], [RoomID], [ServiceID]) VALUES (4, 9, 1)
INSERT [dbo].[RoomServices] ([RoomServiceID], [RoomID], [ServiceID]) VALUES (5, 2, 2)
INSERT [dbo].[RoomServices] ([RoomServiceID], [RoomID], [ServiceID]) VALUES (7, 3, 1)
INSERT [dbo].[RoomServices] ([RoomServiceID], [RoomID], [ServiceID]) VALUES (8, 4, 1)
INSERT [dbo].[RoomServices] ([RoomServiceID], [RoomID], [ServiceID]) VALUES (9, 4, 2)
INSERT [dbo].[RoomServices] ([RoomServiceID], [RoomID], [ServiceID]) VALUES (10, 4, 4)
INSERT [dbo].[RoomServices] ([RoomServiceID], [RoomID], [ServiceID]) VALUES (11, 5, 1)
INSERT [dbo].[RoomServices] ([RoomServiceID], [RoomID], [ServiceID]) VALUES (12, 5, 2)
INSERT [dbo].[RoomServices] ([RoomServiceID], [RoomID], [ServiceID]) VALUES (13, 5, 6)
INSERT [dbo].[RoomServices] ([RoomServiceID], [RoomID], [ServiceID]) VALUES (14, 6, 1)
INSERT [dbo].[RoomServices] ([RoomServiceID], [RoomID], [ServiceID]) VALUES (15, 6, 2)
INSERT [dbo].[RoomServices] ([RoomServiceID], [RoomID], [ServiceID]) VALUES (16, 6, 7)
INSERT [dbo].[RoomServices] ([RoomServiceID], [RoomID], [ServiceID]) VALUES (17, 7, 1)
INSERT [dbo].[RoomServices] ([RoomServiceID], [RoomID], [ServiceID]) VALUES (18, 7, 2)
INSERT [dbo].[RoomServices] ([RoomServiceID], [RoomID], [ServiceID]) VALUES (19, 7, 5)
INSERT [dbo].[RoomServices] ([RoomServiceID], [RoomID], [ServiceID]) VALUES (20, 8, 1)
INSERT [dbo].[RoomServices] ([RoomServiceID], [RoomID], [ServiceID]) VALUES (21, 8, 2)
INSERT [dbo].[RoomServices] ([RoomServiceID], [RoomID], [ServiceID]) VALUES (22, 9, 4)
INSERT [dbo].[RoomServices] ([RoomServiceID], [RoomID], [ServiceID]) VALUES (23, 2, 4)
SET IDENTITY_INSERT [dbo].[RoomServices] OFF
GO
SET IDENTITY_INSERT [dbo].[Services] ON 

INSERT [dbo].[Services] ([ServiceID], [ServiceName], [ServiceDescription], [Price]) VALUES (1, N'WiFi Access', N'High-speed internet connection', CAST(10.00 AS Decimal(10, 2)))
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [ServiceDescription], [Price]) VALUES (2, N'Room Cleaning', N'Daily cleaning service', CAST(20.00 AS Decimal(10, 2)))
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [ServiceDescription], [Price]) VALUES (3, N'Breakfast', N'Continental breakfast buffet', CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [ServiceDescription], [Price]) VALUES (4, N'Spa Access', N'Access to onsite spa facilities', CAST(30.00 AS Decimal(10, 2)))
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [ServiceDescription], [Price]) VALUES (5, N'Parking', N'Valet parking service', CAST(25.00 AS Decimal(10, 2)))
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [ServiceDescription], [Price]) VALUES (6, N'Laundry Service', N'Laundry and dry cleaning service', CAST(18.00 AS Decimal(10, 2)))
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [ServiceDescription], [Price]) VALUES (7, N'Room Service', N'In-room dining service', CAST(22.00 AS Decimal(10, 2)))
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [ServiceDescription], [Price]) VALUES (8, N'Airport Shuttle', N'Transportation to and from the airport', CAST(35.00 AS Decimal(10, 2)))
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [ServiceDescription], [Price]) VALUES (9, N'Fitness Center', N'Access to fitness and gym facilities', CAST(12.00 AS Decimal(10, 2)))
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [ServiceDescription], [Price]) VALUES (10, N'Business Center', N'Use of business facilities', CAST(15.00 AS Decimal(10, 2)))
INSERT [dbo].[Services] ([ServiceID], [ServiceName], [ServiceDescription], [Price]) VALUES (11, N'test2', N'test', CAST(50.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Services] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRooms] ON 

INSERT [dbo].[UserRooms] ([UserRoomID], [UserID], [RoomID], [StartDate], [EndDate], [status]) VALUES (1, 1, 2, CAST(N'2024-08-02T00:00:00.000' AS DateTime), CAST(N'2024-07-05T15:39:34.327' AS DateTime), N'Close')
INSERT [dbo].[UserRooms] ([UserRoomID], [UserID], [RoomID], [StartDate], [EndDate], [status]) VALUES (2, 1, 2, CAST(N'2024-02-01T00:00:00.000' AS DateTime), CAST(N'2024-07-05T15:39:31.990' AS DateTime), N'Close')
INSERT [dbo].[UserRooms] ([UserRoomID], [UserID], [RoomID], [StartDate], [EndDate], [status]) VALUES (3, 1, 3, CAST(N'2024-03-01T00:00:00.000' AS DateTime), CAST(N'2024-07-05T15:38:46.143' AS DateTime), N'Close')
INSERT [dbo].[UserRooms] ([UserRoomID], [UserID], [RoomID], [StartDate], [EndDate], [status]) VALUES (4, 1, 4, CAST(N'2024-04-01T00:00:00.000' AS DateTime), NULL, N'Pending')
INSERT [dbo].[UserRooms] ([UserRoomID], [UserID], [RoomID], [StartDate], [EndDate], [status]) VALUES (5, 1, 5, CAST(N'2024-05-01T00:00:00.000' AS DateTime), NULL, N'Rejected')
INSERT [dbo].[UserRooms] ([UserRoomID], [UserID], [RoomID], [StartDate], [EndDate], [status]) VALUES (6, 1, 6, CAST(N'2024-06-01T00:00:00.000' AS DateTime), NULL, N'Rejected')
INSERT [dbo].[UserRooms] ([UserRoomID], [UserID], [RoomID], [StartDate], [EndDate], [status]) VALUES (7, 1, 7, CAST(N'2024-07-01T00:00:00.000' AS DateTime), CAST(N'2024-08-01T00:00:00.000' AS DateTime), N'Close')
INSERT [dbo].[UserRooms] ([UserRoomID], [UserID], [RoomID], [StartDate], [EndDate], [status]) VALUES (8, 1, 8, CAST(N'2024-08-01T00:00:00.000' AS DateTime), CAST(N'2024-09-01T00:00:00.000' AS DateTime), N'Close')
INSERT [dbo].[UserRooms] ([UserRoomID], [UserID], [RoomID], [StartDate], [EndDate], [status]) VALUES (9, 1, 9, CAST(N'2024-09-01T00:00:00.000' AS DateTime), NULL, N'Reject')
INSERT [dbo].[UserRooms] ([UserRoomID], [UserID], [RoomID], [StartDate], [EndDate], [status]) VALUES (10, 1, 10, CAST(N'2024-10-01T00:00:00.000' AS DateTime), NULL, N'Reject')
INSERT [dbo].[UserRooms] ([UserRoomID], [UserID], [RoomID], [StartDate], [EndDate], [status]) VALUES (11, 1, 2, CAST(N'2024-07-05T00:00:00.000' AS DateTime), NULL, N'Active')
SET IDENTITY_INSERT [dbo].[UserRooms] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [Email], [FullName], [Role], [RegistrationDate]) VALUES (1, N'a', N'123', N'user1@example.com', N'User One', N'User', CAST(N'2024-07-04T14:03:30.133' AS DateTime))
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [Email], [FullName], [Role], [RegistrationDate]) VALUES (2, N'b', N'123', N'manager1@example.com', N'Manager One', N'Manager', CAST(N'2024-07-04T14:03:30.133' AS DateTime))
INSERT [dbo].[Users] ([UserID], [Username], [PasswordHash], [Email], [FullName], [Role], [RegistrationDate]) VALUES (3, N'test', N'123', N'user123@gmail.com', N'Hoai Nam Nam', N'User', CAST(N'2024-07-04T16:01:53.777' AS DateTime))
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UserServices] ON 

INSERT [dbo].[UserServices] ([UserServiceID], [UserID], [ServiceID], [CreatedDate], [Status]) VALUES (1, 1, 3, CAST(N'2024-07-04T15:56:33.260' AS DateTime), N'Active')
INSERT [dbo].[UserServices] ([UserServiceID], [UserID], [ServiceID], [CreatedDate], [Status]) VALUES (2, 1, 5, CAST(N'2024-07-04T15:56:33.260' AS DateTime), N'Pending')
INSERT [dbo].[UserServices] ([UserServiceID], [UserID], [ServiceID], [CreatedDate], [Status]) VALUES (3, 1, 4, CAST(N'2024-07-04T15:56:33.260' AS DateTime), N'Completed')
INSERT [dbo].[UserServices] ([UserServiceID], [UserID], [ServiceID], [CreatedDate], [Status]) VALUES (4, 1, 6, CAST(N'2024-07-04T15:56:33.260' AS DateTime), N'Active')
INSERT [dbo].[UserServices] ([UserServiceID], [UserID], [ServiceID], [CreatedDate], [Status]) VALUES (5, 1, 8, CAST(N'2024-07-04T15:56:33.260' AS DateTime), N'Pending')
INSERT [dbo].[UserServices] ([UserServiceID], [UserID], [ServiceID], [CreatedDate], [Status]) VALUES (6, 1, 3, CAST(N'2024-07-04T15:56:33.260' AS DateTime), N'Active')
INSERT [dbo].[UserServices] ([UserServiceID], [UserID], [ServiceID], [CreatedDate], [Status]) VALUES (7, 1, 2, CAST(N'2024-07-04T15:56:33.260' AS DateTime), N'Active')
INSERT [dbo].[UserServices] ([UserServiceID], [UserID], [ServiceID], [CreatedDate], [Status]) VALUES (8, 1, 9, CAST(N'2024-07-04T15:56:33.260' AS DateTime), N'Pending')
INSERT [dbo].[UserServices] ([UserServiceID], [UserID], [ServiceID], [CreatedDate], [Status]) VALUES (9, 1, 1, CAST(N'2024-07-04T15:56:33.260' AS DateTime), N'Completed')
INSERT [dbo].[UserServices] ([UserServiceID], [UserID], [ServiceID], [CreatedDate], [Status]) VALUES (10, 1, 7, CAST(N'2024-07-04T15:56:33.260' AS DateTime), N'Active')
INSERT [dbo].[UserServices] ([UserServiceID], [UserID], [ServiceID], [CreatedDate], [Status]) VALUES (11, 1, 10, CAST(N'2024-07-04T15:56:33.260' AS DateTime), N'Pending')
INSERT [dbo].[UserServices] ([UserServiceID], [UserID], [ServiceID], [CreatedDate], [Status]) VALUES (12, 1, 6, CAST(N'2024-07-04T15:56:33.260' AS DateTime), N'Active')
INSERT [dbo].[UserServices] ([UserServiceID], [UserID], [ServiceID], [CreatedDate], [Status]) VALUES (13, 1, 2, CAST(N'2024-07-04T15:56:33.260' AS DateTime), N'Active')
INSERT [dbo].[UserServices] ([UserServiceID], [UserID], [ServiceID], [CreatedDate], [Status]) VALUES (14, 1, 5, CAST(N'2024-07-04T15:56:33.260' AS DateTime), N'Completed')
INSERT [dbo].[UserServices] ([UserServiceID], [UserID], [ServiceID], [CreatedDate], [Status]) VALUES (15, 1, 3, CAST(N'2024-07-04T15:56:33.260' AS DateTime), N'Active')
INSERT [dbo].[UserServices] ([UserServiceID], [UserID], [ServiceID], [CreatedDate], [Status]) VALUES (16, 1, 4, CAST(N'2024-07-04T15:56:33.260' AS DateTime), N'Active')
INSERT [dbo].[UserServices] ([UserServiceID], [UserID], [ServiceID], [CreatedDate], [Status]) VALUES (17, 1, 7, CAST(N'2024-07-04T15:56:33.260' AS DateTime), N'Pending')
INSERT [dbo].[UserServices] ([UserServiceID], [UserID], [ServiceID], [CreatedDate], [Status]) VALUES (18, 1, 6, CAST(N'2024-07-04T15:56:33.260' AS DateTime), N'Active')
INSERT [dbo].[UserServices] ([UserServiceID], [UserID], [ServiceID], [CreatedDate], [Status]) VALUES (19, 1, 9, CAST(N'2024-07-04T15:56:33.260' AS DateTime), N'Active')
INSERT [dbo].[UserServices] ([UserServiceID], [UserID], [ServiceID], [CreatedDate], [Status]) VALUES (20, 1, 2, CAST(N'2024-07-04T15:56:33.260' AS DateTime), N'Active')
INSERT [dbo].[UserServices] ([UserServiceID], [UserID], [ServiceID], [CreatedDate], [Status]) VALUES (21, 1, 5, CAST(N'2024-07-04T15:56:33.260' AS DateTime), N'Completed')
SET IDENTITY_INSERT [dbo].[UserServices] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__536C85E45E5D2B87]    Script Date: 7/5/2024 4:28:27 PM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (getdate()) FOR [RegistrationDate]
GO
ALTER TABLE [dbo].[UserServices] ADD  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Departments]  WITH CHECK ADD FOREIGN KEY([ManagerID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[RoomImages]  WITH CHECK ADD FOREIGN KEY([RoomID])
REFERENCES [dbo].[Rooms] ([RoomID])
GO
ALTER TABLE [dbo].[Rooms]  WITH CHECK ADD FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Departments] ([DepartmentID])
GO
ALTER TABLE [dbo].[RoomServices]  WITH CHECK ADD FOREIGN KEY([RoomID])
REFERENCES [dbo].[Rooms] ([RoomID])
GO
ALTER TABLE [dbo].[RoomServices]  WITH CHECK ADD FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Services] ([ServiceID])
GO
ALTER TABLE [dbo].[UserRooms]  WITH CHECK ADD FOREIGN KEY([RoomID])
REFERENCES [dbo].[Rooms] ([RoomID])
GO
ALTER TABLE [dbo].[UserRooms]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserServices]  WITH CHECK ADD FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Services] ([ServiceID])
GO
ALTER TABLE [dbo].[UserServices]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
