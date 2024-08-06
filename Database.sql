CREATE DATABASE LaptopShop_Grp3
go
USE [LaptopShop_Grp3]
GO
/****** Object:  Table [dbo].[BlogPost]    Script Date: 7/19/2024 11:27:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogPost](
	[BlogPost_ID] [int] IDENTITY(1,1) NOT NULL,
	[BlogPost_Title] [nvarchar](200) NOT NULL,
	[BlogPost_Content] [nvarchar](max) NOT NULL,
	[User_ID] [int] NOT NULL,
	[BlogPost_Date] [datetime] NOT NULL,
	[Img_url] [varchar](max) NULL,
	[Description] [varchar](max) NULL,
	[TypeID] [varchar](50) NOT NULL,
	[BLog_Status] [bit] NOT NULL,
 CONSTRAINT [PK_BlogPost] PRIMARY KEY CLUSTERED 
(
	[BlogPost_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlogPost_Type]    Script Date: 7/19/2024 11:27:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlogPost_Type](
	[TypeID] [varchar](50) NOT NULL,
	[TypeName] [varchar](100) NOT NULL,
 CONSTRAINT [PK_BlogPost_Type] PRIMARY KEY CLUSTERED 
(
	[TypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 7/19/2024 11:27:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[Brand_Hotline] [varchar](11) NOT NULL,
	[BrandID] [varchar](10) NOT NULL,
	[Brand_Name] [varchar](50) NOT NULL,
	[Brand_Address] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Brand] PRIMARY KEY CLUSTERED 
(
	[BrandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 7/19/2024 11:27:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Category_ID] [varchar](10) NOT NULL,
	[Category_Name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Category_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChangeHistory]    Script Date: 7/19/2024 11:27:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChangeHistory](
	[Change_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [int] NOT NULL,
	[Changer_ID] [int] NOT NULL,
	[Change_Name] [nvarchar](255) NOT NULL,
	[Change_Email] [nvarchar](255) NOT NULL,
	[Change_Phone] [nvarchar](255) NOT NULL,
	[Change_Date] [datetime] NOT NULL,
 CONSTRAINT [PK_ChangeHistory] PRIMARY KEY CLUSTERED 
(
	[Change_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 7/19/2024 11:27:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[Customer_Phone] [varchar](10) NOT NULL,
	[Customer_Name] [nvarchar](30) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Message] [nvarchar](max) NULL,
	[Contact_ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[Contact_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 7/19/2024 11:27:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[Customer_Phone] [varchar](10) NOT NULL,
	[Customer_Name] [nvarchar](30) NOT NULL,
	[Customer_Address] [nvarchar](100) NOT NULL,
	[Customer_Gender] [varchar](10) NULL,
	[Customer_Birthday] [date] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Customer_Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 7/19/2024 11:27:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[FeedbackID] [int] IDENTITY(1,1) NOT NULL,
	[User_ID] [int] NOT NULL,
	[Product_ID] [varchar](10) NOT NULL,
	[Star] [int] NOT NULL,
	[Comment] [varchar](max) NULL,
	[Time] [datetime] NOT NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[FeedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/19/2024 11:27:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Order_ID] [varchar](40) NOT NULL,
	[Customer_Phone] [varchar](10) NOT NULL,
	[Order_TotalPrice] [float] NOT NULL,
	[OrderStatus_ID] [int] NOT NULL,
	[Order_Date] [date] NOT NULL,
	[Order_PaymentMethod] [varchar](20) NOT NULL,
	[Order_ShippingFee] [float] NOT NULL,
	[Sale_Staff] [varchar](40) NULL,
	[Warehouse_Staff] [varchar](40) NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Order_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Detail]    Script Date: 7/19/2024 11:27:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Detail](
	[OrderDetail_ID] [int] IDENTITY(1,1) NOT NULL,
	[Order_ID] [varchar](40) NOT NULL,
	[Product_ID] [varchar](10) NOT NULL,
	[Quantity] [int] NOT NULL,
	[ProductPrice] [float] NOT NULL,
	[OrderDetail_Note] [nvarchar](max) NULL,
	[ProductSerial] [varchar](20) NULL,
 CONSTRAINT [PK_Order_Detail] PRIMARY KEY CLUSTERED 
(
	[OrderDetail_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order_Status]    Script Date: 7/19/2024 11:27:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order_Status](
	[OrderStatus_ID] [int] NOT NULL,
	[OrderStatus_Name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Order_Status] PRIMARY KEY CLUSTERED 
(
	[OrderStatus_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/19/2024 11:27:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Product_Warranty] [int] NOT NULL,
	[Product_ID] [varchar](10) NOT NULL,
	[Brand_ID] [varchar](10) NOT NULL,
	[Product_Name] [varchar](100) NOT NULL,
	[Product_Description] [varchar](max) NOT NULL,
	[Product_Price] [float] NOT NULL,
	[Product_SalePrice] [float] NOT NULL,
	[Product_Image] [varchar](max) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Category]    Script Date: 7/19/2024 11:27:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Category](
	[Category_ID] [varchar](10) NOT NULL,
	[Product_ID] [varchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Detail]    Script Date: 7/19/2024 11:27:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Detail](
	[Laptop_OS] [varchar](20) NOT NULL,
	[Product_ID] [varchar](10) NOT NULL,
	[Laptop_CPU] [varchar](50) NOT NULL,
	[Laptop_Ram] [varchar](50) NOT NULL,
	[Laptop_Storage] [varchar](50) NOT NULL,
	[Laptop_GPU] [varchar](50) NOT NULL,
	[Laptop_Screen] [varchar](50) NOT NULL,
	[Laptop_Battery] [varchar](50) NOT NULL,
	[Laptop_Weight] [varchar](50) NOT NULL,
	[Laptop_Color] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Product_Laptop] PRIMARY KEY CLUSTERED 
(
	[Product_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Img]    Script Date: 7/19/2024 11:27:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Img](
	[Product_ID] [varchar](10) NOT NULL,
	[ProductImg_url] [varchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_Serial]    Script Date: 7/19/2024 11:27:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Serial](
	[ProductSerial_ID] [varchar](20) NOT NULL,
	[Product_ID] [varchar](10) NOT NULL,
	[ProductSerial_Status] [varchar](20) NOT NULL,
	[ProductSerial_CheckInDate] [date] NOT NULL,
	[ProductSerial_CheckOutDate] [date] NULL,
 CONSTRAINT [PK_Product_Serial] PRIMARY KEY CLUSTERED 
(
	[ProductSerial_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSerial_Status]    Script Date: 7/19/2024 11:27:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSerial_Status](
	[ID] [varchar](20) NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_ProductSerial_Status] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Response]    Script Date: 7/19/2024 11:27:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Response](
	[Response_ID] [int] IDENTITY(1,1) NOT NULL,
	[Response_Text] [nvarchar](max) NOT NULL,
	[User_ID] [int] NOT NULL,
	[Contact_ID] [int] NOT NULL,
 CONSTRAINT [PK_Response] PRIMARY KEY CLUSTERED 
(
	[Response_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/19/2024 11:27:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Role_ID] [varchar](10) NOT NULL,
	[Role_Name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Role_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Slider]    Script Date: 7/19/2024 11:27:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Slider](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](500) NULL,
	[image] [nvarchar](500) NULL,
	[backlink] [nvarchar](500) NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_Sliders] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/19/2024 11:27:58 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[User_ID] [int] IDENTITY(1,1) NOT NULL,
	[User_Name] [nvarchar](30) NULL,
	[User_Password] [varchar](50) NOT NULL,
	[User_Email] [varchar](30) NOT NULL,
	[Role_ID] [varchar](10) NOT NULL,
	[User_Image] [varchar](max) NULL,
	[User_Phone] [varchar](10) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BlogPost] ON 

INSERT [dbo].[BlogPost] ([BlogPost_ID], [BlogPost_Title], [BlogPost_Content], [User_ID], [BlogPost_Date], [Img_url], [Description], [TypeID], [BLog_Status]) VALUES (1, N'This USB flash drive is actually a blazing-fast SSD – and it’s 20% off  ', N'<p>If it looks like a thumb drive and acts like a thumb drive… well, it might not actually be a thumb drive. The SK Hynix Tube T31 is, in fact, a full-on, super-portable 512GB SSD—and it’s on sale right now for $80 (20% off). This 512GB stick SSD may look like a standard USB thumb drive, but it performs like an external SSD. It performs so well that it even made it on our list of best external drives. In our review of the SK Hynix Tube T31, we gave it a solid 4.5 out of 5 stars and praised its fast speeds, portability, and universally connectable design. Whether you’re on Windows, macOS, PS4, PS5, Xbox Series X/S, or even Xbox One, this SSD has got you covered. “If you want the speed of an external SSD, but the convenience of a captive Type-A connector and a svelte form factor, the Tube T31 is what you seek,” PCWorld’s Jon Jacobi notes in the review. Using the Tube T31 is as easy as plugging it into your device with the help of the built-in USB-A 3.2 Gen 2 connector. Its compact size and shape make it the perfect go-anywhere storage drive. And with lightning-fast data transfer speeds of up to 1,000MB/s (10Gbps), you can back up your data in a flash. Don’t miss this chance to grab the SK Hynix Tube T31 at a fantastic price. It’s not just a storage device—it’s a game-changer for anyone needing a speedy, portable, and durable data storage solution.</p>', 5, CAST(N'2024-07-10T09:35:39.000' AS DateTime), N'https://www.pcworld.com/wp-content/uploads/2024/05/SK-Hynix-Tube-T31-1.jpg?resize=1024%2C576&quality=50&strip=all', N'If you want an external SSD in the form of a thumb drive, the SK Hynix Tube T31 is the way to go.', N'3', 1)
INSERT [dbo].[BlogPost] ([BlogPost_ID], [BlogPost_Title], [BlogPost_Content], [User_ID], [BlogPost_Date], [Img_url], [Description], [TypeID], [BLog_Status]) VALUES (2, N'The best USB-C charger for Samsung phones falls under $20', N'Tired of slow charging speeds for your Samsung phone but don’t want to spend much on an upgrade? You’re in luck.

The Anker 313 Super Fast Charger is now available for just $20, down from its normal price of $24. The only caveat? This deal is for Prime members only. (Try Prime for free with a 30-day trial!)

This 45W powerhouse charger is perfect for quickly getting your phone to 100%, ensuring you stay powered up and ready for anything.

Specifically designed for Samsung devices, you’ll need a device with Super Fast Charging 2.0 (SFC 2.0) capability to take full advantage. SFC 2.0 is available on Galaxy S20 Ultra, Note 10+, Tab S7+ and higher.

Imagine charging a Galaxy S24 Ultra to full capacity in under 60 minutes! The beauty of using one of these chargers is that you can spend less time tethered to an outlet and more time enjoying your day.

Our Executive Editor Gordon Ung wrote about his experience with the Anker 313 and his own Galaxy smartphone:

“Using the Anker 313 and 5-amp cable, I could go from 1 percent to 25 percent in 10 minutes and reach a 50 percent charge in about 20 minutes. The total charge time to near full is basically an hour with several minutes of slow charging at the end, which all devices do to limit battery damage.”

Another major benefit of this swift charger is the freedom it provides. Forget the power bank at home. If you can make a quick pit stop at an outlet, this is the only charger you’ll need for your phone.

The Anker 313 Super Fast Charger is a fairly small device, but that doesn’t mean it doesn’t pack a punch. Its foldable design makes it incredibly portable, able to fit into any bag or pocket.

This charger also prioritizes safety thanks to its built-in safety features, such as short-circuit protection, high-voltage protection, and temperature control. You can charge your phone with peace of mind, knowing you’re in good hands.

So, get the Anker 313 Super Fast Charger today for a fantastic price if you’re a Prime member. If you aren’t yet, you can set up an account in a few minutes and snag a 30-day free trial.', 5, CAST(N'2024-05-27T00:00:00.000' AS DateTime), N'https://www.pcworld.com/wp-content/uploads/2024/05/Anker-313-45W-Super-Fast-Charger-1.jpg?resize=1024%2C576&quality=50&strip=all', N'With this super-fast charger, you can recharge your Samsung phone to full in under an hour.', N'3', 1)
INSERT [dbo].[BlogPost] ([BlogPost_ID], [BlogPost_Title], [BlogPost_Content], [User_ID], [BlogPost_Date], [Img_url], [Description], [TypeID], [BLog_Status]) VALUES (3, N'Get Alienware’s crazy-fast 500Hz monitor for 52% off its launch price', N'About a year ago, we got the opportunity to review the Alienware AW2524H, the first-ever gaming monitor with a blistering 500Hz refresh rate. One of the main reasons why we gave this monitor 4 out of 5 stars was its price, which, at the time, was $830.

Well, now it’s on sale for $400.

This 500Hz gaming monitor is a rare find and an absolute game-changer for dedicated PC gamers. In our review, we didn’t just like the high refresh rate but also that it comes with Nvidia G-Sync support and Nvidia Reflex Analyzer.

Imagine the advantage you’ll have in fast-paced games with such a high refresh rate—every millisecond counts, and this monitor ensures you’re always ahead of the competition.

“The Alienware AW2524H is a motion clarity monster. It’s so good, in fact, that it’s hard to imagine future monitors somehow improving on this,” notes PCWorld’s expert Matthew S. Smith.

At a screen size of 24.5 inches, the AW2524H offers Full HD 1080p resolution, ensuring crisp visuals. Sure, it falls short of the 4K resolution we’ve grown accustomed to in recent years, but you can’t have everything—especially at this price.

With response times as low as 0.5 ms, you can expect minimal lag and ultra-smooth gameplay. The monitor has loads of ports as well, including HDMI, DisplayPort, and multiple USB 3.2 Gen 1 ports, making it easy to connect all your peripherals.

More than just a monitor, the Alienware AW2524H is a gateway to a superior gaming experience. Don’t miss out on this opportunity to own a cutting-edge piece of tech at an unbeatable price.', 4, CAST(N'2024-05-27T00:00:00.000' AS DateTime), N'https://www.pcworld.com/wp-content/uploads/2024/05/Alienware-AW2524H-1.jpg?resize=1024%2C575&quality=50&strip=all', N'This Alienware gaming monitor is the first of its kind with its 500Hz refresh rate—and you can grab it now at a steep discount.', N'3', 1)
INSERT [dbo].[BlogPost] ([BlogPost_ID], [BlogPost_Title], [BlogPost_Content], [User_ID], [BlogPost_Date], [Img_url], [Description], [TypeID], [BLog_Status]) VALUES (4, N'Samsung’s luxurious 55-inch Odyssey Ark 2 monitor is 40% off', N'There are great monitors, and then there’s the Samsung Odyssey Ark 2nd gen. Even though it’s only been a few months since this ginormous mini-LED monitor was released, we’re already seeing a jaw-dropping 40 percent discount, its biggest deal so far. Instead of spending $2999.99 on it, you can get it for just $1799.99. That’s still a good chunk of change, but not when you consider everything this model has to offer. 

The Odyssey Ark is just one of the insane deals going on as part of Samsung’s huge “Discover Samsung Sale” this week, which has staggering discounts on highly rated Samsung devices like Galaxy Book4 laptops and Galaxy laptops, as well as SSDs, TVs, and more.

The Samsung Odyssey Ark 2nd gen is a massive 55-inch behemoth with a 1000R curved display. Whether you’re playing some World of Warcraft with your guildies or shooting up zombies, you’ll be sucked right into that world thanks to the stunning 4K visuals. They’re made even more luscious thanks to the inclusion of quantum mini-LED backlighting, an OLED alternative, and the HDR10+ support that technology unlocks. 

Gamers will also appreciate the blistering 165Hz refresh rate and 1ms response time, which translate into buttery smooth visuals. Plus, the AMD FreeSync Premium Pro promises tear-free and stutter-free gameplay. 

Of course, the Samsung Odyssey Ark 2nd gen isn’t just for gaming. You can connect up to four different devices at the same time, switching between them as needed. Frankly, that’s ideal for all those gaming sessions you squeeze in between work meetings (it’s not just me who does that, right?). Thanks to the Multi View feature, you can keep an eye on your work chat while playing. 

One super cool thing is that the Ark has a built-in KVM switch, which enables you to control multiple PCs with a single mouse and keyboard, efficiently simplifying your workflow. Simply brilliant.

The Samsung Odyssey Ark Gen 2 has so much to offer. While we admit it’s a pricey monitor, it’s a worthwhile purchase, especially now that it’s $1200 off. The finest things in life are never cheap, but one of the finest monitors ever unveiled can be yours for a whole lot cheaper than usual today.', 5, CAST(N'2024-05-27T00:00:00.000' AS DateTime), N'https://www.pcworld.com/wp-content/uploads/2024/05/Samsung-Odyssey-Ark-2nd-gen-2.jpg?resize=1024%2C576&quality=50&strip=all', N'You can save a ton of money on one of the most impressive monitors you could get right now.', N'3', 1)
SET IDENTITY_INSERT [dbo].[BlogPost] OFF
GO
INSERT [dbo].[BlogPost_Type] ([TypeID], [TypeName]) VALUES (N'1', N'Reviews')
INSERT [dbo].[BlogPost_Type] ([TypeID], [TypeName]) VALUES (N'2', N'Tech Tips')
INSERT [dbo].[BlogPost_Type] ([TypeID], [TypeName]) VALUES (N'3', N'Accessories')
INSERT [dbo].[BlogPost_Type] ([TypeID], [TypeName]) VALUES (N'4', N'Event')
INSERT [dbo].[BlogPost_Type] ([TypeID], [TypeName]) VALUES (N'5', N'Laptop Gaming')
GO
INSERT [dbo].[Brand] ([Brand_Hotline], [BrandID], [Brand_Name], [Brand_Address]) VALUES (N'1900969601', N'AC', N'ACER', N'9 Dao Duy Anh, Phuong Lien, Dong Da, Ha Noi')
INSERT [dbo].[Brand] ([Brand_Hotline], [BrandID], [Brand_Name], [Brand_Address]) VALUES (N'18006588', N'AS', N'ASUS', N'1 Thai Ha, Trung Liet, Dong Da, Ha Noi')
INSERT [dbo].[Brand] ([Brand_Hotline], [BrandID], [Brand_Name], [Brand_Address]) VALUES (N'02435375858', N'DE', N'DELL', N'24 Yen Lang, Lang Ha, Dong Da, Ha Noi')
INSERT [dbo].[Brand] ([Brand_Hotline], [BrandID], [Brand_Name], [Brand_Address]) VALUES (N'02435371525', N'GGB', N'GIGABYTE', N'33 Thai Ha, Trung Liet, Dong Da, Ha Noi')
INSERT [dbo].[Brand] ([Brand_Hotline], [BrandID], [Brand_Name], [Brand_Address]) VALUES (N'1800588868', N'HP', N'HP', N'74 Cua Bac, Quan Thanh, Ha Noi')
INSERT [dbo].[Brand] ([Brand_Hotline], [BrandID], [Brand_Name], [Brand_Address]) VALUES (N'18001503', N'LG', N'LG', N'23 Lang Ha, Dong Da, Ha Noi')
INSERT [dbo].[Brand] ([Brand_Hotline], [BrandID], [Brand_Name], [Brand_Address]) VALUES (N'18006318', N'LNV', N'LENOVO', N'156 Thai Thinh, Lang Ha, Ha Noi')
INSERT [dbo].[Brand] ([Brand_Hotline], [BrandID], [Brand_Name], [Brand_Address]) VALUES (N'0926345444', N'MS', N'MICROSOFT', N'161 Thai Ha, Lang Ha, Dong Da, Ha Noi')
INSERT [dbo].[Brand] ([Brand_Hotline], [BrandID], [Brand_Name], [Brand_Address]) VALUES (N'0961581581', N'MSI', N'MSI', N'20 Tran Kim Xuyen, Yen Hoa, Cau Giay, Ha Noi')
GO
INSERT [dbo].[Category] ([Category_ID], [Category_Name]) VALUES (N'1', N'Dev')
INSERT [dbo].[Category] ([Category_ID], [Category_Name]) VALUES (N'2', N'Office')
INSERT [dbo].[Category] ([Category_ID], [Category_Name]) VALUES (N'3', N'Business')
INSERT [dbo].[Category] ([Category_ID], [Category_Name]) VALUES (N'4', N'Design')
INSERT [dbo].[Category] ([Category_ID], [Category_Name]) VALUES (N'5', N'Gaming')
GO
SET IDENTITY_INSERT [dbo].[ChangeHistory] ON 

INSERT [dbo].[ChangeHistory] ([Change_ID], [User_ID], [Changer_ID], [Change_Name], [Change_Email], [Change_Phone], [Change_Date]) VALUES (6, 5, 2, N'Ryuman', N'ryoma123@gmail.com', N'0399574234', CAST(N'2024-07-10T00:00:00.000' AS DateTime))
INSERT [dbo].[ChangeHistory] ([Change_ID], [User_ID], [Changer_ID], [Change_Name], [Change_Email], [Change_Phone], [Change_Date]) VALUES (7, 5, 2, N'Ryoma', N'nguyenvana@example.com', N'0123456789', CAST(N'2024-07-10T00:00:00.000' AS DateTime))
INSERT [dbo].[ChangeHistory] ([Change_ID], [User_ID], [Changer_ID], [Change_Name], [Change_Email], [Change_Phone], [Change_Date]) VALUES (8, 5, 2, N'Ryoman', N'ryoma@gmail.com', N'0399573876', CAST(N'2024-07-10T00:00:00.000' AS DateTime))
INSERT [dbo].[ChangeHistory] ([Change_ID], [User_ID], [Changer_ID], [Change_Name], [Change_Email], [Change_Phone], [Change_Date]) VALUES (9, 5, 2, N'Ryomanuki', N'ryoma@gmail.com', N'0399573876', CAST(N'2024-07-10T00:00:00.000' AS DateTime))
INSERT [dbo].[ChangeHistory] ([Change_ID], [User_ID], [Changer_ID], [Change_Name], [Change_Email], [Change_Phone], [Change_Date]) VALUES (11, 5, 2, N'Ryomanidnaiwdnsa', N'Ryoma@gmail.com', N'0349726183', CAST(N'2024-07-10T21:58:03.000' AS DateTime))
INSERT [dbo].[ChangeHistory] ([Change_ID], [User_ID], [Changer_ID], [Change_Name], [Change_Email], [Change_Phone], [Change_Date]) VALUES (12, 5, 2, N'Ryoma', N'Ryoma@gmail.com', N'0349726183', CAST(N'2024-07-10T22:31:07.000' AS DateTime))
INSERT [dbo].[ChangeHistory] ([Change_ID], [User_ID], [Changer_ID], [Change_Name], [Change_Email], [Change_Phone], [Change_Date]) VALUES (13, 5, 2, N'Ryoma', N'Ryoma@gmail.com', N'0349726183', CAST(N'2024-07-10T22:31:32.000' AS DateTime))
INSERT [dbo].[ChangeHistory] ([Change_ID], [User_ID], [Changer_ID], [Change_Name], [Change_Email], [Change_Phone], [Change_Date]) VALUES (14, 5, 2, N'Ryoma', N'Ryoma@gmail.com', N'0349726183', CAST(N'2024-07-10T22:34:21.000' AS DateTime))
INSERT [dbo].[ChangeHistory] ([Change_ID], [User_ID], [Changer_ID], [Change_Name], [Change_Email], [Change_Phone], [Change_Date]) VALUES (15, 5, 2, N'Ryoma', N'Ryoma@gmail.com', N'0349726183', CAST(N'2024-07-10T22:35:29.000' AS DateTime))
INSERT [dbo].[ChangeHistory] ([Change_ID], [User_ID], [Changer_ID], [Change_Name], [Change_Email], [Change_Phone], [Change_Date]) VALUES (16, 5, 2, N'Ryoma', N'Ryoma@gmail.com', N'0349726183', CAST(N'2024-07-10T22:35:57.000' AS DateTime))
INSERT [dbo].[ChangeHistory] ([Change_ID], [User_ID], [Changer_ID], [Change_Name], [Change_Email], [Change_Phone], [Change_Date]) VALUES (17, 7, 2, N'Peter Parker', N'Peter@mail.com', N'0546821947', CAST(N'2024-07-10T22:37:17.000' AS DateTime))
INSERT [dbo].[ChangeHistory] ([Change_ID], [User_ID], [Changer_ID], [Change_Name], [Change_Email], [Change_Phone], [Change_Date]) VALUES (18, 7, 2, N'Peter Parker', N'Peter@mail.com', N'0546821947', CAST(N'2024-07-10T22:37:22.000' AS DateTime))
INSERT [dbo].[ChangeHistory] ([Change_ID], [User_ID], [Changer_ID], [Change_Name], [Change_Email], [Change_Phone], [Change_Date]) VALUES (19, 7, 2, N'Peter Pan', N'Peter@mail.com', N'0546821947', CAST(N'2024-07-10T22:39:38.000' AS DateTime))
INSERT [dbo].[ChangeHistory] ([Change_ID], [User_ID], [Changer_ID], [Change_Name], [Change_Email], [Change_Phone], [Change_Date]) VALUES (20, 7, 2, N'Peter Pan', N'Peter@mail.com', N'0546821947', CAST(N'2024-07-10T22:40:06.000' AS DateTime))
INSERT [dbo].[ChangeHistory] ([Change_ID], [User_ID], [Changer_ID], [Change_Name], [Change_Email], [Change_Phone], [Change_Date]) VALUES (21, 7, 2, N'Peter Pan Parker', N'Peter@mail.com', N'0546821947', CAST(N'2024-07-10T22:41:11.000' AS DateTime))
INSERT [dbo].[ChangeHistory] ([Change_ID], [User_ID], [Changer_ID], [Change_Name], [Change_Email], [Change_Phone], [Change_Date]) VALUES (22, 6, 2, N'Minasan', N'Mina@gmail.com', N'0413598267', CAST(N'2024-07-11T00:11:32.000' AS DateTime))
INSERT [dbo].[ChangeHistory] ([Change_ID], [User_ID], [Changer_ID], [Change_Name], [Change_Email], [Change_Phone], [Change_Date]) VALUES (23, 8, 2, N'Johnny', N'John@gmail.com', N'0618351936', CAST(N'2024-07-11T00:51:39.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[ChangeHistory] OFF
GO
INSERT [dbo].[Customer] ([Customer_Phone], [Customer_Name], [Customer_Address], [Customer_Gender], [Customer_Birthday]) VALUES (N'0349726183', N'Vuong', N'123 Nguyen Chi Thanh, Lang Ha, Dong Da, Ha Noi', N'male', CAST(N'2003-10-06' AS Date))
INSERT [dbo].[Customer] ([Customer_Phone], [Customer_Name], [Customer_Address], [Customer_Gender], [Customer_Birthday]) VALUES (N'0349726187', N'Viet Anh', N'338 Xa Dan, Phuong Lien, Dong Da, Ha Noi', N'male', CAST(N'2003-12-07' AS Date))
INSERT [dbo].[Customer] ([Customer_Phone], [Customer_Name], [Customer_Address], [Customer_Gender], [Customer_Birthday]) VALUES (N'0413598267', N'Bao Nghia', N'164 Thai Ha, Trung Liet, Dong Da, Ha Noi', N'male', CAST(N'2003-04-06' AS Date))
INSERT [dbo].[Customer] ([Customer_Phone], [Customer_Name], [Customer_Address], [Customer_Gender], [Customer_Birthday]) VALUES (N'0865341745', N'Lê Tấn Kim', N'fffff, Ben Nghe, District 1, Ho Chi Minh City', NULL, NULL)
INSERT [dbo].[Customer] ([Customer_Phone], [Customer_Name], [Customer_Address], [Customer_Gender], [Customer_Birthday]) VALUES (N'0975935040', N'Vu Tien Vuong', N'115 B5 Thành Công, Tien Thinh Commune, Me Linh District, Ha Noi City', NULL, NULL)
INSERT [dbo].[Customer] ([Customer_Phone], [Customer_Name], [Customer_Address], [Customer_Gender], [Customer_Birthday]) VALUES (N'0978564528', N'Nguyen Ba Trung', N'asdasdasd, Hoa Xuan Ward, Cam Le District, Da Nang City', NULL, NULL)
INSERT [dbo].[Customer] ([Customer_Phone], [Customer_Name], [Customer_Address], [Customer_Gender], [Customer_Birthday]) VALUES (N'1312312312', N'Dang Nguyen Bao', N'876, Thoi Tam Thon Commune, Hoc Mon District, Ho Chi Minh City', NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([FeedbackID], [User_ID], [Product_ID], [Star], [Comment], [Time]) VALUES (1, 5, N'NBAC0399', 3, N'Abxc demo', CAST(N'2024-07-13T22:30:09.327' AS DateTime))
INSERT [dbo].[Feedback] ([FeedbackID], [User_ID], [Product_ID], [Star], [Comment], [Time]) VALUES (2, 5, N'NBAC0399', 4, N'Abxc dem 567', CAST(N'2024-07-13T22:30:40.010' AS DateTime))
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
INSERT [dbo].[Order] ([Order_ID], [Customer_Phone], [Order_TotalPrice], [OrderStatus_ID], [Order_Date], [Order_PaymentMethod], [Order_ShippingFee], [Sale_Staff], [Warehouse_Staff]) VALUES (N'1H17M-18-7-2024U0975935040', N'0975935040', 1640, 4, CAST(N'2024-07-18' AS Date), N'Cash', 10, N'sale', N'whsale')
INSERT [dbo].[Order] ([Order_ID], [Customer_Phone], [Order_TotalPrice], [OrderStatus_ID], [Order_Date], [Order_PaymentMethod], [Order_ShippingFee], [Sale_Staff], [Warehouse_Staff]) VALUES (N'3H56M-18-7-2024U1312312312', N'1312312312', 3800, 4, CAST(N'2024-07-18' AS Date), N'Cash', 10, N'sale', N'whsale')
INSERT [dbo].[Order] ([Order_ID], [Customer_Phone], [Order_TotalPrice], [OrderStatus_ID], [Order_Date], [Order_PaymentMethod], [Order_ShippingFee], [Sale_Staff], [Warehouse_Staff]) VALUES (N'3H57M-18-7-2024U0978564528', N'0978564528', 3250, 4, CAST(N'2024-07-18' AS Date), N'Cash', 10, N'sale', N'whsale')
INSERT [dbo].[Order] ([Order_ID], [Customer_Phone], [Order_TotalPrice], [OrderStatus_ID], [Order_Date], [Order_PaymentMethod], [Order_ShippingFee], [Sale_Staff], [Warehouse_Staff]) VALUES (N'5H8M-18-7-2024U0975935040', N'0975935040', 620, 1, CAST(N'2024-07-18' AS Date), N'VnPay', 10, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Order_Detail] ON 

INSERT [dbo].[Order_Detail] ([OrderDetail_ID], [Order_ID], [Product_ID], [Quantity], [ProductPrice], [OrderDetail_Note], [ProductSerial]) VALUES (1, N'1H17M-18-7-2024U0975935040', N'NBAC0419', 1, 980, NULL, NULL)
INSERT [dbo].[Order_Detail] ([OrderDetail_ID], [Order_ID], [Product_ID], [Quantity], [ProductPrice], [OrderDetail_Note], [ProductSerial]) VALUES (2, N'1H17M-18-7-2024U0975935040', N'NBAC0398', 1, 650, NULL, NULL)
INSERT [dbo].[Order_Detail] ([OrderDetail_ID], [Order_ID], [Product_ID], [Quantity], [ProductPrice], [OrderDetail_Note], [ProductSerial]) VALUES (3, N'3H56M-18-7-2024U1312312312', N'NBAC0387', 1, 1300, NULL, NULL)
INSERT [dbo].[Order_Detail] ([OrderDetail_ID], [Order_ID], [Product_ID], [Quantity], [ProductPrice], [OrderDetail_Note], [ProductSerial]) VALUES (4, N'3H56M-18-7-2024U1312312312', N'NBAC0423', 1, 2010, NULL, NULL)
INSERT [dbo].[Order_Detail] ([OrderDetail_ID], [Order_ID], [Product_ID], [Quantity], [ProductPrice], [OrderDetail_Note], [ProductSerial]) VALUES (5, N'3H56M-18-7-2024U1312312312', N'NBAS1288', 1, 480, NULL, NULL)
INSERT [dbo].[Order_Detail] ([OrderDetail_ID], [Order_ID], [Product_ID], [Quantity], [ProductPrice], [OrderDetail_Note], [ProductSerial]) VALUES (6, N'3H57M-18-7-2024U0978564528', N'NBAC0399', 1, 920, NULL, NULL)
INSERT [dbo].[Order_Detail] ([OrderDetail_ID], [Order_ID], [Product_ID], [Quantity], [ProductPrice], [OrderDetail_Note], [ProductSerial]) VALUES (7, N'3H57M-18-7-2024U0978564528', N'NBAC0399', 1, 920, NULL, NULL)
INSERT [dbo].[Order_Detail] ([OrderDetail_ID], [Order_ID], [Product_ID], [Quantity], [ProductPrice], [OrderDetail_Note], [ProductSerial]) VALUES (8, N'3H57M-18-7-2024U0978564528', N'NBAC0399', 1, 920, NULL, NULL)
INSERT [dbo].[Order_Detail] ([OrderDetail_ID], [Order_ID], [Product_ID], [Quantity], [ProductPrice], [OrderDetail_Note], [ProductSerial]) VALUES (9, N'3H57M-18-7-2024U0978564528', N'NBAS1288', 1, 480, NULL, NULL)
INSERT [dbo].[Order_Detail] ([OrderDetail_ID], [Order_ID], [Product_ID], [Quantity], [ProductPrice], [OrderDetail_Note], [ProductSerial]) VALUES (10, N'5H8M-18-7-2024U0975935040', N'NBAS1277', 1, 610, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Order_Detail] OFF
GO
INSERT [dbo].[Order_Status] ([OrderStatus_ID], [OrderStatus_Name]) VALUES (1, N'Pending')
INSERT [dbo].[Order_Status] ([OrderStatus_ID], [OrderStatus_Name]) VALUES (2, N'Confirm')
INSERT [dbo].[Order_Status] ([OrderStatus_ID], [OrderStatus_Name]) VALUES (3, N'Shipping')
INSERT [dbo].[Order_Status] ([OrderStatus_ID], [OrderStatus_Name]) VALUES (4, N'Complete')
INSERT [dbo].[Order_Status] ([OrderStatus_ID], [OrderStatus_Name]) VALUES (5, N'Cancel')
GO
INSERT [dbo].[Product] ([Product_Warranty], [Product_ID], [Brand_ID], [Product_Name], [Product_Description], [Product_Price], [Product_SalePrice], [Product_Image]) VALUES (12, N'NBAC0387', N'AC', N'Laptop Gaming Acer Nitro 16 Phoenix AN16-41-R60F NH.QLKSV.003', N'Acer Gaming Nitro 16 Phoenix Laptop is a sophisticated combination of unique design, powerful performance and specialized features for gamers. With its own logo and design style Completely new design, highlighting the Nitro Gaming product line.', 1400, 1300, N'https://anphat.com.vn/media/product/45838_acer_nitro_16_phoenix_an16_41_r50z_nh_qlksv_001_3s1.jpg')
INSERT [dbo].[Product] ([Product_Warranty], [Product_ID], [Brand_ID], [Product_Name], [Product_Description], [Product_Price], [Product_SalePrice], [Product_Image]) VALUES (12, N'NBAC0398', N'AC', N'Laptop Acer Gaming Aspire 5 A515-58GM-59LJ NX.KQ4SV.001', N'Overall, the Acer Aspire 5 Gaming A515 58GM laptop possesses performance that is considered quite outstanding in its segment, simple design structure, high versatility and comes with a preferential price. This Acer Aspire laptop model is a more suitable choice for students who both satisfy work requirements and meet high entertainment needs.', 800, 650, N'https://anphat.com.vn/media/product/46515_laptop_acer_aspire_5_a515_58gm_59lj_nx_kq4sv__2_.jpg')
INSERT [dbo].[Product] ([Product_Warranty], [Product_ID], [Brand_ID], [Product_Name], [Product_Description], [Product_Price], [Product_SalePrice], [Product_Image]) VALUES (12, N'NBAC0399', N'AC', N'Laptop Acer Aspire 7 A715-76G-73FM NH.QMYSV.004', N'Dubbed the multi-style warrior, the Aspire Aspire 7 A715-76G-73FM Laptop possesses a Gaming-Hiend Laptop configuration but carries a bold office style with aesthetics that quite impress customers. The machine is finished with high-quality aluminum and has no creaking or flex phenomenon. With an office design suitable for many subjects and multi-purpose, this machine does not stand out too much from the crowd but is very luxurious with mysterious black', 950, 920, N'https://anphat.com.vn/media/product/46519_acer_aspire_7_a715_76g_73fm_nh_qmysv_004_3s1.jpg')
INSERT [dbo].[Product] ([Product_Warranty], [Product_ID], [Brand_ID], [Product_Name], [Product_Description], [Product_Price], [Product_SalePrice], [Product_Image]) VALUES (12, N'NBAC0419', N'AC', N'Laptop Acer Swift Go SFG14-72-73YV NX.KRKSV.005', N'ACER Swift Go is equipped with RAM and SSD hard drive for smoothness and comfort. The capacity is suitable for users who need to store basic data such as documents, images, videos, etc. At the same time, the SSD hard drive also helps increase data read/write and boot speed and fast operating system.', 1150, 980, N'https://anphat.com.vn/media/product/47339_laptop_acer_swift_go_sfg14_72_73yv_nx_krksv_005__intel_core_ultra_7___1_.jpg')
INSERT [dbo].[Product] ([Product_Warranty], [Product_ID], [Brand_ID], [Product_Name], [Product_Description], [Product_Price], [Product_SalePrice], [Product_Image]) VALUES (12, N'NBAC0423', N'AC', N'Laptop Acer Predator Helios Neo 16 PHN16-72-71UM NH.QNMSV.002', N'Acer Predator has always been popular with gamers with its appeal not only from performance, screen, but also countless other factors. And in 2023, laptop company Acer has launched an attractive new version - Acer Predator Helios Neo. This Acer core i7 gaming laptop/laptop model promises to make gamers sought after in its price range. Super sharp 16-inch Full HD+ screen, smooth 165Hz refresh rate, no screen tearing or lag. Along with that is 100% sRGB color standard for the ultimate display experience', 2200, 2010, N'https://anphat.com.vn/media/product/47969_laptop_acer_predator_helios_neo_16_phn16_72_71um_nh_qnmsv_002__2_.jpg')
INSERT [dbo].[Product] ([Product_Warranty], [Product_ID], [Brand_ID], [Product_Name], [Product_Description], [Product_Price], [Product_SalePrice], [Product_Image]) VALUES (24, N'NBAS1261', N'AS', N'Laptop Asus Vivobook 15 OLED A1505VA-L1114W', N'Asus Vivobook 15 OLED A1505VA-L1114W laptop brings great work and entertainment experiences with extremely impressive configuration parameters. The device helps you complete all tasks quickly when integrating a leading processor. With a brilliant OLED screen, the Asus Vivobook laptop also opens up a world of extremely rich and realistic entertainment. The Asus Vivobook 15 OLED is equipped with the 13th generation Intel Core i5-13500H processor, the laptop helps you handle all tasks extremely smoothly and quickly. With 12 cores and a clock speed of up to 4.7GHz, the processor helps you increase your productivity, as well as provide impressive entertainment experiences.', 830, 680, N'https://anphat.com.vn/media/product/44648_ee.jpg')
INSERT [dbo].[Product] ([Product_Warranty], [Product_ID], [Brand_ID], [Product_Name], [Product_Description], [Product_Price], [Product_SalePrice], [Product_Image]) VALUES (24, N'NBAS1263 ', N'AS', N'Laptop Asus Vivobook 14 OLED A1405VA-KM095W', N'Shine to the world with the powerful ASUS Vivobook 14, a feature-packed laptop with a realistic display. Everything is made easier thanks to user-friendly conveniences including a 180-degree flat-opening hinge, physical webcam cover and dedicated function keys. Protect your health with ASUS antibacterial Guard Plus on frequently touched surfaces.', 870, 690, N'https://anphat.com.vn/media/product/44758_laptop_asus_vivobook_14_oled_a1405va_km095w__2_.jpg')
INSERT [dbo].[Product] ([Product_Warranty], [Product_ID], [Brand_ID], [Product_Name], [Product_Description], [Product_Price], [Product_SalePrice], [Product_Image]) VALUES (24, N'NBAS1277', N'AS', N'Laptop Asus Vivobook 15 X1504VA NJ070W', N'Start an active new day with the ASUS Vivobook 15 (X1504) laptop that makes everyday tasks easier with the latest 13th generation Intel processor and many essential tools to help complete multitasking. Fast service everywhere. User-friendly design, using a 180-degree straightening hinge ready for screen sharing, physical webcam cover ensures privacy and convenient, safe one-touch fingerprint security. ASUS Vivobook 15 (X1504) is also equipped with ASUS Antibacterial Guard Plus to help protect frequently touched surfaces from harmful bacteria, protecting user health.', 790, 610, N'https://anphat.com.vn/media/product/44632_x1504va_nj070w__1_.jpg')
INSERT [dbo].[Product] ([Product_Warranty], [Product_ID], [Brand_ID], [Product_Name], [Product_Description], [Product_Price], [Product_SalePrice], [Product_Image]) VALUES (24, N'NBAS1288', N'AS', N'Laptop Asus Vivobook Go 14 E1404FA-NK177W', N'As a product of the Asus Vivobook series, the Asus Vivobook Go 14 E1404FA-NK177W laptop possesses many features of this series. Besides, many upgraded features provide optimal support during user use.', 570, 480, N'https://anphat.com.vn/media/product/45325_laptop_asus_vivobook_go_14_e1404fa_nk177w.jpg')
INSERT [dbo].[Product] ([Product_Warranty], [Product_ID], [Brand_ID], [Product_Name], [Product_Description], [Product_Price], [Product_SalePrice], [Product_Image]) VALUES (24, N'NBAS1322', N'AS', N'Laptop Asus Vivobook 14X A1403ZA-LY143W', N'The appearance of the Intel Core i3 1220P processor has helped the Asus laptop perfectly handle all daily learning and working tasks, accompanied by an Intel UHD Graphics card that satisfies the user''s creative passion with Basic photo editing and design work.', 450, 390, N'https://anphat.com.vn/media/product/47104_laptop_asus_vivobook_14x_a1403za_ly143w12123.jpg')
INSERT [dbo].[Product] ([Product_Warranty], [Product_ID], [Brand_ID], [Product_Name], [Product_Description], [Product_Price], [Product_SalePrice], [Product_Image]) VALUES (24, N'NBAS1363', N'AS', N'Laptop Asus Zenbook S 13 OLED UX5304MA-NQ117W', N'Asus Zenbook S 13 OLED Laptop UX5304MA-NQ117W is a thin and light laptop with a weight of 1kg and an impressive thickness of 1.18 cm. The Asus Zenbook laptop model also has a configuration with an Intel Ultra 7 155U 1.7 GHz chip with outstanding 32GB RAM. Along with that is a 13.3-inch HDR NanoEdge screen with 3K resolution that displays vividly.', 1750, 1720, N'https://anphat.com.vn/media/product/48785_laptop_asus_zenbook_s_13_oled_ux5304ma_nq117w__1_.jpg')
INSERT [dbo].[Product] ([Product_Warranty], [Product_ID], [Brand_ID], [Product_Name], [Product_Description], [Product_Price], [Product_SalePrice], [Product_Image]) VALUES (24, N'NBAS1366', N'AS', N'Laptop Asus ROG Strix G16 G614JV-N4156W', N'NBAC0398', 1765, 1730, N'https://anphat.com.vn/media/product/48568_laptop_asus_rog_strix_g16_g614jv_n4156w__3_.jpg')
INSERT [dbo].[Product] ([Product_Warranty], [Product_ID], [Brand_ID], [Product_Name], [Product_Description], [Product_Price], [Product_SalePrice], [Product_Image]) VALUES (12, N'NBDE0851', N'DE', N'Laptop Dell Inspiron 3530 71011775', N'Dell Inspiron laptop is equipped with advanced Intel Core i7 1355U CPU to help optimize the system, improve processing performance, and operate smoothly all daily office, study and entertainment tasks. In addition, with Intel UHD Graphics integrated graphics card, you can also run heavy graphics applications such as graphic design on Photoshop, AI, Canva, play hot games or watch videos.', 900, 710, N'https://anphat.com.vn/media/product/45276_laptop_dell_inspiron_3530_71011775_anphatpc_1.jpg')
INSERT [dbo].[Product] ([Product_Warranty], [Product_ID], [Brand_ID], [Product_Name], [Product_Description], [Product_Price], [Product_SalePrice], [Product_Image]) VALUES (12, N'NBDE0857', N'DE', N'Laptop Dell Vostro 5630 THT7N', N'If you are looking for a laptop with a large screen, used for studying, working or even playing games with light configuration, the Dell Vostro 5630 THT7N will be a notable choice. Although it measures 356 x 251 x 17.9 mm and weighs 1.8kg, you can still carry this laptop in your pocket and dynamically to work. The exterior is a gray aluminum shell and feels quite smooth to the touch, leaving no fingerprints', 1255, 1090, N'https://anphat.com.vn/media/product/46600_laptop_dell_vostro_3530_v5i5267w1__1_.jpg')
INSERT [dbo].[Product] ([Product_Warranty], [Product_ID], [Brand_ID], [Product_Name], [Product_Description], [Product_Price], [Product_SalePrice], [Product_Image]) VALUES (12, N'NBDE0887', N'DE', N'Laptop Dell Vostro 3530 V5I5267W1', N'Dell Vostro 3530 is aimed at business, office, and programming users. The machine is perfectly optimized to handle work-related tasks for the above users, and also brings with it outstanding advantages such as high perfection, long life and design. Flexible and scientific. In particular, the machine is also equipped with a lifetime license for Windows and Office, helping you use the machine safely and securely - an advantage that currently only Dell provides for its products. Let''s join An Khang to see in more detail the advantages and disadvantages of this laptop line through the Dell Vostro 3530 V5I5267W1 version, which is currently the best-selling in the line.', 705, 590, N'https://anphat.com.vn/media/product/46600_laptop_dell_vostro_3530_v5i5267w1__1_.jpg')
INSERT [dbo].[Product] ([Product_Warranty], [Product_ID], [Brand_ID], [Product_Name], [Product_Description], [Product_Price], [Product_SalePrice], [Product_Image]) VALUES (12, N'NBDE0913', N'DE', N'Laptop Dell Latitude 3440 L34401335U08512G', N'The Dell Latitude 3440 L34401335U08512G laptop is a powerful business device, equipped with a 13th generation Intel Core i5 processor, 8GB RAM and a 512GB SSD hard drive, ensuring smooth performance and ample storage space. The device has a durable design, sharp 14-inch Full HD screen, and advanced security features, suitable for office work and frequent travel.', 810, 750, N'https://anphat.com.vn/media/product/43122_laptop_dell_latitude_9430_2_in_1_anphatpc6.jpg')
INSERT [dbo].[Product] ([Product_Warranty], [Product_ID], [Brand_ID], [Product_Name], [Product_Description], [Product_Price], [Product_SalePrice], [Product_Image]) VALUES (36, N'NBDE0914', N'DE', N'Laptop Dell Mobile Precision Workstation 3581 CTO', N'The Dell Mobile Precision Workstation 3581 CTO laptop is a powerful mobile workstation, designed for high-end engineering and graphics tasks. It features a powerful Intel processor, dedicated graphics card, and expandable RAM and hard drive capabilities, ensuring optimal performance for demanding applications. The machine''s sturdy design and advanced security features suit professional working needs.', 2200, 1980, N'https://anphat.com.vn/media/product/48976_bvc.jpg')
INSERT [dbo].[Product] ([Product_Warranty], [Product_ID], [Brand_ID], [Product_Name], [Product_Description], [Product_Price], [Product_SalePrice], [Product_Image]) VALUES (12, N'NBDE0933', N'DE', N'Laptop Dell XPS 13 9340 71034922', N'Dell XPS 13 9340 71034922 laptop is equipped with the latest and most powerful Intel Core Ultra 5 125H processor today. Operating with 14 cores and 18 threads, maximum speed up to 4.5Ghz GHz and large cache of 18MB, this laptop is capable of meeting all your work and entertainment needs smoothly and quickly.', 2080, 2020, N'https://anphat.com.vn/media/product/48647_laptop_dell_xps_13_9340_71034922__2_.jpg')
INSERT [dbo].[Product] ([Product_Warranty], [Product_ID], [Brand_ID], [Product_Name], [Product_Description], [Product_Price], [Product_SalePrice], [Product_Image]) VALUES (36, N'NBDE0948', N'DE', N'Laptop Dell Mobile Precision Workstation 7680 71024681', N'Dell Precision 7680 is a workstation line designed to meet the needs of work related to graphics, audio and video processing, product design, software development and tasks that require computing. Powerful math. The Dell Precision 7680 2023 is equipped with high-end components, including a powerful processor, high-end graphics card, RAM and large capacity SSD memory. This helps the Dell Precision 7680 Mobile Workstation handle complex tasks. efficiently and quickly, while providing flexible expansion and upgrade capabilities for users. Workstations are commonly used in fields such as graphic design, film production, video games and other digital applications.', 3180, 3060, N'https://anphat.com.vn/media/product/46981_laptop_dell_mobile_precision_workstation_7680_71024681__2_.jpg')
INSERT [dbo].[Product] ([Product_Warranty], [Product_ID], [Brand_ID], [Product_Name], [Product_Description], [Product_Price], [Product_SalePrice], [Product_Image]) VALUES (12, N'NBHP0844', N'HP', N'Laptop HP Pavilion 14-dv2074TU 7C0P3PA', N'The HP Pavilion 14 dv2074TU i5 laptop (7C0P3PA) not only possesses a trendy design with eye-catching yellow tones but also has optimal power from the Intel Gen 12 U series processor, a study laptop file - office worth adding to your cart.', 770, 630, N'https://anphat.com.vn/media/product/44046_laptop_hp_pavilion_14_dv2074tu_7c0p3pa_anphatpc_2.jpg')
INSERT [dbo].[Product] ([Product_Warranty], [Product_ID], [Brand_ID], [Product_Name], [Product_Description], [Product_Price], [Product_SalePrice], [Product_Image]) VALUES (12, N'NBHP0879', N'HP', N'Laptop HP VICTUS 16-r0129TX 8C5N4PA', N'HP Victus 16-r0129TX 8C5N4PA laptop is one of HP''s notable modern products, featuring many features and powerful performance. With a stylish design, powerful configuration, and many convenient features, this laptop is not only an effective working tool but also great entertainment.', 1300, 1130, N'https://anphat.com.vn/media/product/46165_last.jpg')
INSERT [dbo].[Product] ([Product_Warranty], [Product_ID], [Brand_ID], [Product_Name], [Product_Description], [Product_Price], [Product_SalePrice], [Product_Image]) VALUES (12, N'NBLG0041TL', N'LG', N'Laptop LG Gram 2023 16ZD90R-G.AX55A5', N'LG Gram 2023 16ZD90R-G.AX55A5 With thin and light features along with powerful performance, LG gram offers great portability and productivity.LG gram has even passed military durability tests MIL-STD-810H. Made from lightweight yet durable materials, this product ensures strength as well as portability.', 1570, 1180, N'https://anphat.com.vn/media/product/44919_laptop_lg_gram_2023_14z90r_g_ah53a5_anphatpc_3.jpg')
INSERT [dbo].[Product] ([Product_Warranty], [Product_ID], [Brand_ID], [Product_Name], [Product_Description], [Product_Price], [Product_SalePrice], [Product_Image]) VALUES (36, N'NBLN0763', N'LNV', N'Laptop Lenovo ThinkPad P14s Gen 3 21AK006WVA', N'Lenovo Thinkpad P14s G3 laptop is a great choice for professionals who require high performance and security in daily work.', 1700, 1420, N'https://anphat.com.vn/media/product/44430_laptop_lenovo_thinkpad_p14s_g3_21ak006wva.jpg')
INSERT [dbo].[Product] ([Product_Warranty], [Product_ID], [Brand_ID], [Product_Name], [Product_Description], [Product_Price], [Product_SalePrice], [Product_Image]) VALUES (36, N'NBLN0766', N'LNV', N'Laptop Lenovo Yoga Slim 6 14IRH8 OLED 83E00008VN', N'With its compact design and great performance, the Lenovo Yoga Slim 6 14IRH8 83E00008VN is perfect for those looking for the perfect combination of portability and power. With the ability to withstand MIL-STD 810H military testing, this laptop can face environmental challenges without being affected.', 990, 870, N'https://anphat.com.vn/media/product/46445_laptop_lenovo_yoga_slim_6_14irh8_83e00008vn__5_.jpg')
INSERT [dbo].[Product] ([Product_Warranty], [Product_ID], [Brand_ID], [Product_Name], [Product_Description], [Product_Price], [Product_SalePrice], [Product_Image]) VALUES (24, N'NBLN0842', N'LNV', N'Laptop Lenovo IdeaPad Slim 5 14IMH9 83DA0020VN', N'Lenovo Ideapad Slim 5 14IMH9 83DA0020VN laptop is suitable for basic needs such as studying, working, and entertainment. This Lenovo Ideapad laptop product is quite thin and light but very sturdy, so it is easy for users to carry anytime, anywhere without worrying too much about the device''s ability to protect itself.', 1090, 1060, N'https://anphat.com.vn/media/product/48216_laptop_lenovo_ideapad_slim_5_14imh9_83da0020vn__2_.jpg')
INSERT [dbo].[Product] ([Product_Warranty], [Product_ID], [Brand_ID], [Product_Name], [Product_Description], [Product_Price], [Product_SalePrice], [Product_Image]) VALUES (36, N'NBLN0848', N'LNV', N'Laptop Lenovo ThinkPad X1 Carbon Gen 12 21KC008MVN ', N'Lenovo Thinkpad X1 Carbon Gen 12 is a high-end flagship that Lenovo invests in both appearance and performance. The product is equipped with a powerful Intel Core Ultra Series processor, suitable for all office and entertainment tasks.', 2130, 2080, N'https://anphat.com.vn/media/product/48809_laptop_lenovo_thinkpad_x1_carbon_gen_12_21kc008mvn__1_.jpg')
INSERT [dbo].[Product] ([Product_Warranty], [Product_ID], [Brand_ID], [Product_Name], [Product_Description], [Product_Price], [Product_SalePrice], [Product_Image]) VALUES (24, N'NBMS0372TL', N'MSI', N'Laptop MSI Modern 14 C7M 221VN', N'MSI Modern 14 C7M 221VN Laptop is a thin, light, fashionable laptop aimed at creative users and office workers. The device is equipped with an AMD Ryzen 7 processor, 8GB RAM, and 512GB SSD hard drive, ensuring fast performance and spacious storage space. The 14-inch Full HD screen and durable design make it the ideal choice for mobility and daily work needs.', 630, 470, N'https://anphat.com.vn/media/product/44836_laptop_msi_modern_14_c13m_608vn_anphatpc_3.jpg')
INSERT [dbo].[Product] ([Product_Warranty], [Product_ID], [Brand_ID], [Product_Name], [Product_Description], [Product_Price], [Product_SalePrice], [Product_Image]) VALUES (12, N'NBMS0374', N'MSI', N'Laptop MSI Thin GF63 12UCX-841VN', N'MSI Thin GF63 12UCX-841VN Laptop is a thin and light gaming laptop that combines powerful performance and portable design. The device is equipped with a 12th generation Intel Core i5 processor, NVIDIA GeForce RTX 2050 graphics card, 8GB RAM and 512GB SSD hard drive, ensuring smooth processing of heavy games and applications. The 15.6-inch Full HD screen with thin bezels provides a vivid visual experience, suitable for both gaming and graphics work.', 710, 630, N'https://anphat.com.vn/media/product/46550_laptop_msi_thin_gf63_12ucx_841vn.jpg')
INSERT [dbo].[Product] ([Product_Warranty], [Product_ID], [Brand_ID], [Product_Name], [Product_Description], [Product_Price], [Product_SalePrice], [Product_Image]) VALUES (24, N'NBMS0385', N'MSI', N'Laptop MSI Thin 15 B12UCX-1419VN', N'MSI''s breakthrough Gaming Laptop with Intel Gen 12th CPU and NVIDIA GeForce RTX 20 series VGA, delivers outstanding power and smooth performance for medium to heavy tasks. Unique design inspired by "Blade Runner" and "Dune", with a transparent part above the keyboard, combined with a bold Cyberpunk border, MSI Thin 15 provides a classy experience space.', 710, 680, N'https://anphat.com.vn/media/product/48775_laptop_msi_thin_15_b12ucx_1419vn__2_.jpg')
INSERT [dbo].[Product] ([Product_Warranty], [Product_ID], [Brand_ID], [Product_Name], [Product_Description], [Product_Price], [Product_SalePrice], [Product_Image]) VALUES (24, N'NBMS0386', N'MSI', N'Laptop MSI Sword 16 HX B14VEKG-039VN', N'In the competitive world of gaming laptops, MSI Sword 16 has made a difference with its design inspired by the boundless sword. With outstanding performance from the latest Intel CPU and current Nvidia GeForce RTX GPU, this laptop smoothly meets all users'' entertainment, learning and gaming needs.', 1450, 1380, N'https://anphat.com.vn/media/product/48898_laptop_msi_sword_16_hx_b14vekg_039vn__1_.jpg')
GO
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'1', N'NBAC0387')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'1', N'NBMS0374')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'1', N'NBAC0423')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'1', N'NBAS1366')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'2', N'NBLN0766')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'2', N'NBLG0041TL')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'2', N'NBDE0887')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'2', N'NBHP0879')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'2', N'NBAC0399')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'2', N'NBDE0851')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'2', N'NBDE0913')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'2', N'NBLN0763')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'2', N'NBMS0372TL')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'2', N'NBDE0857')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'2', N'NBHP0844')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'3', N'NBLN0848')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'3', N'NBDE0914')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'3', N'NBDE0933')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'3', N'NBDE0948')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'3', N'NBLN0842')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'3', N'NBAS1288')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'3', N'NBHP0844')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'4', N'NBDE0913')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'4', N'NBAS1261')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'4', N'NBAS1363')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'4', N'NBAC0387')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'4', N'NBMS0374')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'4', N'NBLN0842')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'4', N'NBAS1263')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'4', N'NBAS1277')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'4', N'NBAS1288')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'4', N'NBAS1322')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'5', N'NBAC0398')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'5', N'NBAC0399')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'5', N'NBAS1366')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'5', N'NBAC0423')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'5', N'NBMS0374')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'5', N'NBMS0385')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'5', N'NBMS0386')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'1', N'NBMS0386')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'1', N'NBMS0385')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'1', N'NBAC0399')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'1', N'NBAC0398')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'1', N'NBAC0419')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'1', N'NBDE0887')
INSERT [dbo].[Product_Category] ([Category_ID], [Product_ID]) VALUES (N'1', N'NBMS0372TL')
GO
INSERT [dbo].[Product_Detail] ([Laptop_OS], [Product_ID], [Laptop_CPU], [Laptop_Ram], [Laptop_Storage], [Laptop_GPU], [Laptop_Screen], [Laptop_Battery], [Laptop_Weight], [Laptop_Color]) VALUES (N'Windows 11 Home', N'NBAC0387', N'AMD Ryze 7 7840HS', N'8GB', N'512GB', N'NVIDIA® GeForce RTX 4050', N'16" WQXGA', N'90 WHrs', N'2.7 kg', N'Black')
INSERT [dbo].[Product_Detail] ([Laptop_OS], [Product_ID], [Laptop_CPU], [Laptop_Ram], [Laptop_Storage], [Laptop_GPU], [Laptop_Screen], [Laptop_Battery], [Laptop_Weight], [Laptop_Color]) VALUES (N'Windows 11 Home', N'NBAC0398', N'Intel Core i5-13420H', N'8GB', N'512GB', N'NVIDIA® GeForce RTX 2050', N'15.6inch FHD', N'50Whrs', N'1.7 kg', N'Gray')
INSERT [dbo].[Product_Detail] ([Laptop_OS], [Product_ID], [Laptop_CPU], [Laptop_Ram], [Laptop_Storage], [Laptop_GPU], [Laptop_Screen], [Laptop_Battery], [Laptop_Weight], [Laptop_Color]) VALUES (N'Windows 11 Home', N'NBAC0399', N'Intel Core i7-12650H', N'16GB', N'512GB', N'NVIDIA GeForce RTX 2050 with 4GB of dedicated', N'15.6 inch FHD', N'3 cell 50 Wh', N'2.1 kg', N'Black')
INSERT [dbo].[Product_Detail] ([Laptop_OS], [Product_ID], [Laptop_CPU], [Laptop_Ram], [Laptop_Storage], [Laptop_GPU], [Laptop_Screen], [Laptop_Battery], [Laptop_Weight], [Laptop_Color]) VALUES (N'Windows 11 Home', N'NBAC0419', N'Intel Core Ultra 7 processor 155H', N'16GB', N'512GB', N'Intel Arc Graphics', N'14 inch 2.2K', N'3 cell 65Wh Li-ion', N'1.3kg', N'Gray')
INSERT [dbo].[Product_Detail] ([Laptop_OS], [Product_ID], [Laptop_CPU], [Laptop_Ram], [Laptop_Storage], [Laptop_GPU], [Laptop_Screen], [Laptop_Battery], [Laptop_Weight], [Laptop_Color]) VALUES (N'Windows 11 Home', N'NBAC0423', N'Intel Core i7-14700HX', N'16GB', N'1024GB', N'NVIDIA GeForce RTX 4070 8GB', N'16 inch WQXGA', N'4-cell 90 Wh', N'2.8 kg', N'Black')
INSERT [dbo].[Product_Detail] ([Laptop_OS], [Product_ID], [Laptop_CPU], [Laptop_Ram], [Laptop_Storage], [Laptop_GPU], [Laptop_Screen], [Laptop_Battery], [Laptop_Weight], [Laptop_Color]) VALUES (N'Windows 11 Home', N'NBAS1261', N'Intel Core i5-13500H', N'16GB', N'512GB', N'Intel Iris Xe Graphics', N'15.6 inch FHD', N'50WHrs', N'1.6Kg', N'Black')
INSERT [dbo].[Product_Detail] ([Laptop_OS], [Product_ID], [Laptop_CPU], [Laptop_Ram], [Laptop_Storage], [Laptop_GPU], [Laptop_Screen], [Laptop_Battery], [Laptop_Weight], [Laptop_Color]) VALUES (N'Windows 11 Home', N'NBAS1263', N'Intel Core i5-13500H', N'16GB', N'512GB', N'Intel Iris Xe Graphics', N'14 inch 2.8K', N'50WHrs', N'1.6 kg', N'Gray')
INSERT [dbo].[Product_Detail] ([Laptop_OS], [Product_ID], [Laptop_CPU], [Laptop_Ram], [Laptop_Storage], [Laptop_GPU], [Laptop_Screen], [Laptop_Battery], [Laptop_Weight], [Laptop_Color]) VALUES (N'Windows 11 Home', N'NBAS1277', N'Intel Core i5-1335U', N'8GB', N'512GB', N'Intel Iris Xe Graphics', N'15.6 inch FHD', N'42WHrs', N'1.70 kg', N'Quiet Blue')
INSERT [dbo].[Product_Detail] ([Laptop_OS], [Product_ID], [Laptop_CPU], [Laptop_Ram], [Laptop_Storage], [Laptop_GPU], [Laptop_Screen], [Laptop_Battery], [Laptop_Weight], [Laptop_Color]) VALUES (N'Windows 11 Home', N'NBAS1288', N'AMD Ryzen 5 7520U', N'16GB', N'512GB', N'AMD Radeon Graphics', N'14 inch FHD', N'42WHrs', N'1.38Kg', N'Gray')
INSERT [dbo].[Product_Detail] ([Laptop_OS], [Product_ID], [Laptop_CPU], [Laptop_Ram], [Laptop_Storage], [Laptop_GPU], [Laptop_Screen], [Laptop_Battery], [Laptop_Weight], [Laptop_Color]) VALUES (N'Windows 11 Home', N'NBAS1322', N'Intel Core i3-1220P', N'8GB', N'512GB', N'Intel UHD Graphics', N'14 inch WUXGA', N'50WHrs', N'1.6Kg', N'Silver')
INSERT [dbo].[Product_Detail] ([Laptop_OS], [Product_ID], [Laptop_CPU], [Laptop_Ram], [Laptop_Storage], [Laptop_GPU], [Laptop_Screen], [Laptop_Battery], [Laptop_Weight], [Laptop_Color]) VALUES (N'Windows 11 Home', N'NBAS1363', N'Intel Core Ultra 7 Processor 155U 1.7 GHz', N'32GB', N'1TB', N'Intel Iris Xe Graphics', N'13.3inch 3K', N'63WHrs, 2S2P, 4-cell Li-ion', N'1 kg', N'Gray')
INSERT [dbo].[Product_Detail] ([Laptop_OS], [Product_ID], [Laptop_CPU], [Laptop_Ram], [Laptop_Storage], [Laptop_GPU], [Laptop_Screen], [Laptop_Battery], [Laptop_Weight], [Laptop_Color]) VALUES (N'Windows 11 Home', N'NBAS1366', N'Intel Core i7-13650HX', N'16GB', N'512GB', N'NVIDIA® GeForce RTX 4060 8GB GDDR6', N'16 inch QHD', N'4-cell, 90WHrs', N'2.50 Kg', N'Gray')
INSERT [dbo].[Product_Detail] ([Laptop_OS], [Product_ID], [Laptop_CPU], [Laptop_Ram], [Laptop_Storage], [Laptop_GPU], [Laptop_Screen], [Laptop_Battery], [Laptop_Weight], [Laptop_Color]) VALUES (N'Windows 11 Home', N'NBDE0851', N' Intel Core i7-1355U', N'8GB', N'512GB', N'Intel Iris Xe Graphics', N'15.6 Inch FHD', N'54Whr', N'1.62 kg', N'Black')
INSERT [dbo].[Product_Detail] ([Laptop_OS], [Product_ID], [Laptop_CPU], [Laptop_Ram], [Laptop_Storage], [Laptop_GPU], [Laptop_Screen], [Laptop_Battery], [Laptop_Weight], [Laptop_Color]) VALUES (N'Windows 11 Home', N'NBDE0857', N'Intel Core i7-1360P', N'16GB', N'512GB', N'NVIDIA RTX 2050 4GB GDDR6', N'16.0 inch FHD', N'54WHrs', N'1.85kg', N'Silver')
INSERT [dbo].[Product_Detail] ([Laptop_OS], [Product_ID], [Laptop_CPU], [Laptop_Ram], [Laptop_Storage], [Laptop_GPU], [Laptop_Screen], [Laptop_Battery], [Laptop_Weight], [Laptop_Color]) VALUES (N'Windows 11 Home', N'NBDE0887', N'Intel Core i5-1335U', N'8GB', N'256GB', N'Intel Iris Xe Graphics', N'15.6 inch FHD', N'3 Cell, 41 Wh', N'1.9 kg', N'Gray')
INSERT [dbo].[Product_Detail] ([Laptop_OS], [Product_ID], [Laptop_CPU], [Laptop_Ram], [Laptop_Storage], [Laptop_GPU], [Laptop_Screen], [Laptop_Battery], [Laptop_Weight], [Laptop_Color]) VALUES (N'Windows 11 Home', N'NBDE0913', N'Intel Core i5-1335U', N'8GB', N'512GB', N'Intel Iris Xe Graphics', N'14 inch FHD', N'3-cell, 42 Wh', N'1.54 kg', N'Gray Black')
INSERT [dbo].[Product_Detail] ([Laptop_OS], [Product_ID], [Laptop_CPU], [Laptop_Ram], [Laptop_Storage], [Laptop_GPU], [Laptop_Screen], [Laptop_Battery], [Laptop_Weight], [Laptop_Color]) VALUES (N'Windows 11 Home', N'NBDE0914', N'Intel Core i7-13800H', N'16GB', N'512GB', N'NVIDIA RTX A1000 6GB', N'15.6 inch FHD', N'4 Cell 64Wh', N'1.79Kg', N'Gray')
INSERT [dbo].[Product_Detail] ([Laptop_OS], [Product_ID], [Laptop_CPU], [Laptop_Ram], [Laptop_Storage], [Laptop_GPU], [Laptop_Screen], [Laptop_Battery], [Laptop_Weight], [Laptop_Color]) VALUES (N'Windows 11 Home', N'NBDE0933', N' Intel Core Ultra 5 125H', N'16GB', N'1TB', N'Intel Arc Graphics', N'13.4 inch FHD', N'3Cell 55WHrs', N'1.19 kg', N'Gray')
INSERT [dbo].[Product_Detail] ([Laptop_OS], [Product_ID], [Laptop_CPU], [Laptop_Ram], [Laptop_Storage], [Laptop_GPU], [Laptop_Screen], [Laptop_Battery], [Laptop_Weight], [Laptop_Color]) VALUES (N'Windows 11 Home', N'NBDE0948', N'Intel Core i7-13850HX', N'32GB', N'1TB ', N'RTX2000 Ada 8GB', N'16 inch FHD', N'6Cell, 83Whr', N'1.8 kg', N'Black')
INSERT [dbo].[Product_Detail] ([Laptop_OS], [Product_ID], [Laptop_CPU], [Laptop_Ram], [Laptop_Storage], [Laptop_GPU], [Laptop_Screen], [Laptop_Battery], [Laptop_Weight], [Laptop_Color]) VALUES (N'Windows 11 Home', N'NBHP0844', N'Intel Core i5-1235U', N'8GB', N'512GB', N'Intel Iris Xe Graphics', N'14 inch FHD', N'43WHrs', N'1.41 kg', N'Warm Gold')
INSERT [dbo].[Product_Detail] ([Laptop_OS], [Product_ID], [Laptop_CPU], [Laptop_Ram], [Laptop_Storage], [Laptop_GPU], [Laptop_Screen], [Laptop_Battery], [Laptop_Weight], [Laptop_Color]) VALUES (N'Windows 11 Home', N'NBHP0879', N' Intel Core i7-13700H', N'16GB', N'512GB', N'NVIDIA GeForce RTX 3050 6GB GDDR6', N'16.1 inch FHD', N'4-cell, 70 Wh Li-ion', N' 2.31 kg', N'Black')
INSERT [dbo].[Product_Detail] ([Laptop_OS], [Product_ID], [Laptop_CPU], [Laptop_Ram], [Laptop_Storage], [Laptop_GPU], [Laptop_Screen], [Laptop_Battery], [Laptop_Weight], [Laptop_Color]) VALUES (N'Windows 11 Home', N'NBLG0041TL', N'Intel Core i5-1340P', N'16GB', N'512GB', N'Intel Iris Xe Graphics', N'16 inch WQXGA', N'80Wh', N'1199g', N'Black')
INSERT [dbo].[Product_Detail] ([Laptop_OS], [Product_ID], [Laptop_CPU], [Laptop_Ram], [Laptop_Storage], [Laptop_GPU], [Laptop_Screen], [Laptop_Battery], [Laptop_Weight], [Laptop_Color]) VALUES (N'Windows 11 Home', N'NBLN0763', N'Intel Core i7-1260P ', N'8GB', N'512GB', N'NVIDIA Quadro T550 4GB GDDR6', N'14 inch 2.2K', N'3 cell 52.5Wh', N'1.38 kg', N'Black')
INSERT [dbo].[Product_Detail] ([Laptop_OS], [Product_ID], [Laptop_CPU], [Laptop_Ram], [Laptop_Storage], [Laptop_GPU], [Laptop_Screen], [Laptop_Battery], [Laptop_Weight], [Laptop_Color]) VALUES (N'Windows 11 Home', N'NBLN0766', N'Intel Core i7-13700H', N'16GB', N'512GB', N'Intel Iris Xe Graphics', N'14 inch WUXGA', N'65WHrs', N'1.35 kg', N'Gray')
INSERT [dbo].[Product_Detail] ([Laptop_OS], [Product_ID], [Laptop_CPU], [Laptop_Ram], [Laptop_Storage], [Laptop_GPU], [Laptop_Screen], [Laptop_Battery], [Laptop_Weight], [Laptop_Color]) VALUES (N'Windows 11 Home', N'NBLN0842', N'Intel Core Ultra 7 155H', N'32GB', N'1TB', N'Integrated Intel® Arc Graphics', N'14 inch WUXGA', N'57Wh', N'1.48 kg', N'Gray')
INSERT [dbo].[Product_Detail] ([Laptop_OS], [Product_ID], [Laptop_CPU], [Laptop_Ram], [Laptop_Storage], [Laptop_GPU], [Laptop_Screen], [Laptop_Battery], [Laptop_Weight], [Laptop_Color]) VALUES (N'Windows 11 Home', N'NBLN0848', N'Intel Core Ultra 7-155H', N'16GB', N'512GB', N'Integrated Intel Arc Graphics', N'14 inch WUXGA', N'57Wh', N'1.09 kg', N'Black')
INSERT [dbo].[Product_Detail] ([Laptop_OS], [Product_ID], [Laptop_CPU], [Laptop_Ram], [Laptop_Storage], [Laptop_GPU], [Laptop_Screen], [Laptop_Battery], [Laptop_Weight], [Laptop_Color]) VALUES (N'Windows 11 Home', N'NBMS0372TL', N'AMD Ryzen 7 7730U', N'8GB', N'512GB', N'AMD Radeon Graphics', N'14 inch FHD', N'3 Cell, 39Whr', N'1.4 kg', N'Black')
INSERT [dbo].[Product_Detail] ([Laptop_OS], [Product_ID], [Laptop_CPU], [Laptop_Ram], [Laptop_Storage], [Laptop_GPU], [Laptop_Screen], [Laptop_Battery], [Laptop_Weight], [Laptop_Color]) VALUES (N'Windows 11 Home', N'NBMS0374', N'Intel Core i5-12450H', N'8GB', N'512GB', N'NVIDIA GeForce RTX 2050', N'15.6 inch FHD', N'52.4WHrs', N'1.86 kg', N'Black')
INSERT [dbo].[Product_Detail] ([Laptop_OS], [Product_ID], [Laptop_CPU], [Laptop_Ram], [Laptop_Storage], [Laptop_GPU], [Laptop_Screen], [Laptop_Battery], [Laptop_Weight], [Laptop_Color]) VALUES (N'Windows 11 Home', N'NBMS0385', N'Intel Core i5-12450H', N'8GB', N'512GB', N'NVIDIA GeForce RTX 2050 4GB', N'15.6 inch FHD', N'3 Cell 52.4WHr', N'1.86 kg', N'Gray')
INSERT [dbo].[Product_Detail] ([Laptop_OS], [Product_ID], [Laptop_CPU], [Laptop_Ram], [Laptop_Storage], [Laptop_GPU], [Laptop_Screen], [Laptop_Battery], [Laptop_Weight], [Laptop_Color]) VALUES (N'Windows 11 Home', N'NBMS0386', N'Intel Core i7-14700HX Processor', N'16GB', N'1TB', N'NVIDIA® GeForce RTX™ 4050 Laptop GPU 6GB GDDR6', N'16 inch 16:10 FHD', N'4 cell, 65Whr', N'2.3 kg', N'Gray')
GO
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAC0387', N'https://anphat.com.vn/media/product/45871_an16.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAC0387', N'https://anphat.com.vn/media/product/45871_laptop_acer_nitro_16_phoenix_an16_41_r60f__5_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAC0387', N'https://anphat.com.vn/media/product/45871_laptop_acer_nitro_16_phoenix_an16_41_r60f__4_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAC0387', N'https://anphat.com.vn/media/product/45871_laptop_acer_nitro_16_phoenix_an16_41_r60f__1_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAC0398', N'https://anphat.com.vn/media/product/46515_ap5.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAC0398', N'https://anphat.com.vn/media/product/46515_laptop_acer_aspire_5_a514_56p_742f_nx_khrsv_005_7_10.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAC0398', N'https://anphat.com.vn/media/product/46515_laptop_acer_aspire_5_a515_58gm_59lj_nx_kq4sv__1_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAC0398', N'https://anphat.com.vn/media/product/46515_laptop_acer_aspire_5_a515_58gm_59lj_nx_kq4sv__6_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAC0399', N'https://anphat.com.vn/media/product/46519_ap7.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAC0399', N'https://anphat.com.vn/media/product/46519_laptop_acer_aspire_7_a715_76g_73fm_nh_qmysv__1_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAC0399', N'https://anphat.com.vn/media/product/46519_laptop_acer_aspire_7_a715_76g_73fm_nh_qmysv__6_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAC0419', N'https://anphat.com.vn/media/product/47339_laptop_acer_swift_go_sfg14_72_73yv_nx_krksv_005__intel_core_ultra_7___1_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAC0419', N'https://anphat.com.vn/media/product/47339_laptop_acer_swift_go_sfg14_72_73yv_nx_krksv_005__intel_core_ultra_7___5_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAC0419', N'https://anphat.com.vn/media/product/47339_laptop_acer_swift_go_sfg14_72_73yv_nx_krksv_005__intel_core_ultra_7___4_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAC0419', N'https://anphat.com.vn/media/product/47339_laptop_acer_swift_go_sfg14_72_73yv_nx_krksv_005__intel_core_ultra_7___2_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAC0423', N'https://anphat.com.vn/media/product/47969_laptop_acer_predator_helios_neo_16_phn16_72_71um_nh_qnmsv_002__1_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAC0423', N'https://anphat.com.vn/media/product/47969_laptop_acer_predator_helios_neo_16_phn16_72_71um_nh_qnmsv_002__4_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAC0423', N'https://anphat.com.vn/media/product/47969_laptop_acer_predator_helios_neo_16_phn16_72_71um_nh_qnmsv_002__3_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAS1261', N'https://anphat.com.vn/media/product/44648_laptop_asus_vivobook_15_oled_a1505va_l1114w_apc.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAS1261', N'https://anphat.com.vn/media/product/44648_laptop_asus_vivobook_15_oled_a1505va_l1114w__6.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAS1261', N'https://anphat.com.vn/media/product/44648_laptop_asus_vivobook_15_oled_a1505va_l1114w__5.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAS1261', N'https://anphat.com.vn/media/product/44648_laptop_asus_vivobook_15_oled_a1505va_l1114w__3.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAS1263 ', N'https://anphat.com.vn/media/product/44758_laptop_asus_vivobook_14_oled_a1405va_km095w__7_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAS1263 ', N'https://anphat.com.vn/media/product/44758_laptop_asus_vivobook_14_oled_a1405va_km095w__6_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAS1263 ', N'https://anphat.com.vn/media/product/44758_laptop_asus_vivobook_14_oled_a1405va_km095w__4_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAS1263 ', N'https://anphat.com.vn/media/product/44758_laptop_asus_vivobook_14_oled_a1405va_km095w__3_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAS1277', N'https://anphat.com.vn/media/product/44632_laptop_asus_vivobook_15_x1504va_nj070w.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAS1277', N'https://anphat.com.vn/media/product/44632_laptop_asus_vivobook_15_x1504va_nj070w__7.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAS1277', N'https://anphat.com.vn/media/product/44632_laptop_asus_vivobook_15_x1504va_nj070w__6.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAS1277', N'https://anphat.com.vn/media/product/44632_laptop_asus_vivobook_15_x1504va_nj070w__4.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAS1288', N'https://anphat.com.vn/media/product/45325_laptop_asus_vivobook_go_14_e1404fa_nk177w__3_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAS1288', N'https://anphat.com.vn/media/product/45325_laptop_asus_vivobook_go_14_e1404fa_nk177w__2_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAS1288', N'https://anphat.com.vn/media/product/45325_laptop_asus_vivobook_go_14_e1404fa_nk177w__5_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAS1288', N'https://anphat.com.vn/media/product/45325_laptop_asus_vivobook_go_14_e1404fa_nk177w__1_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAS1322', N'https://anphat.com.vn/media/product/47104_laptop_asus_vivobook_14x_a1403za_ly143w.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAS1322', N'https://anphat.com.vn/media/product/47104_7.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAS1322', N'https://anphat.com.vn/media/product/47104_4.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAS1322', N'https://anphat.com.vn/media/product/47104_2.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAS1363', N'https://anphat.com.vn/media/product/48785_laptop_asus_zenbook_s_13_oled_ux5304ma_nq117w__1_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAS1363', N'https://anphat.com.vn/media/product/48785_laptop_asus_zenbook_s_13_oled_ux5304ma_nq117w__4_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAS1363', N'https://anphat.com.vn/media/product/48785_laptop_asus_zenbook_s_13_oled_ux5304ma_nq117w__3_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAS1363', N'https://anphat.com.vn/media/product/48785_laptop_asus_zenbook_s_13_oled_ux5304ma_nq117w__2_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAS1366', N'https://anphat.com.vn/media/product/48568_laptop_asus_rog_strix_g16_g614jv_n4156w__3_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAS1366', N'https://anphat.com.vn/media/product/48568_laptop_asus_rog_strix_g16_g614jv_n4156w__2_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAS1366', N'https://anphat.com.vn/media/product/48568_laptop_asus_rog_strix_g16_g614jv_n4156w__1_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBAS1366', N'https://anphat.com.vn/media/product/48568_laptop_asus_rog_strix_g16_g614jv_n4156w__4_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBDE0851', N'https://anphat.com.vn/media/product/45276_laptop_dell_inspiron_3530_71011775_anphatpc_1.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBDE0851', N'https://anphat.com.vn/media/product/45276_laptop_dell_inspiron_3530_71011775_anphatpc_5.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBDE0851', N'https://anphat.com.vn/media/product/45276_laptop_dell_inspiron_3530_71011775_anphatpc_4.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBDE0851', N'https://anphat.com.vn/media/product/45276_laptop_dell_inspiron_3530_71011775_anphatpc_2.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBDE0857', N'https://anphat.com.vn/media/product/45266_laptop_dell_vostro_3430_71011900_anphatpc6.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBDE0857', N'https://anphat.com.vn/media/product/45266_4.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBDE0857', N'https://anphat.com.vn/media/product/45266_1.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBDE0887', N'https://anphat.com.vn/media/product/46600_laptop_dell_vostro_3530_v5i5267w1__1_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBDE0887', N'https://anphat.com.vn/media/product/46600_laptop_dell_vostro_3530_v5i5267w1__8_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBDE0887', N'https://anphat.com.vn/media/product/46600_laptop_dell_vostro_3530_v5i5267w1__7_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBDE0887', N'https://anphat.com.vn/media/product/46600_laptop_dell_vostro_3530_v5i5267w1__6_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBDE0913', N'https://anphat.com.vn/media/product/47820_laptop_dell_latitude_3440_l34401335u08512g__4_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBDE0913', N'https://anphat.com.vn/media/product/47820_laptop_dell_latitude_3440_l34401335u08512g__3_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBDE0913', N'https://anphat.com.vn/media/product/47820_laptop_dell_latitude_3440_l34401335u08512g__2_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBDE0914', N'https://anphat.com.vn/media/product/48976_bvc.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBDE0914', N'https://anphat.com.vn/media/product/48976_48190_47459_laptop_dell_mobile_precision_workstation_3581_cto__3_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBDE0914', N'https://anphat.com.vn/media/product/48976_48190_47459_laptop_dell_mobile_precision_workstation_3581_cto__2_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBDE0914', N'https://anphat.com.vn/media/product/48976_48190_47459_laptop_dell_mobile_precision_workstation_3581_cto__1_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBDE0933', N'https://anphat.com.vn/media/product/48647_laptop_dell_xps_13_9340_71034922__2_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBDE0933', N'https://anphat.com.vn/media/product/48647_laptop_dell_xps_13_9340_71034922__1_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBDE0933', N'https://anphat.com.vn/media/product/48647_laptop_dell_xps_13_9340_71034922__4_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBDE0933', N'https://anphat.com.vn/media/product/48647_laptop_dell_xps_13_9340_71034922__3_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBDE0948', N'https://anphat.com.vn/media/product/46981_laptop_dell_mobile_precision_workstation_7680_71024681__2_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBDE0948', N'https://anphat.com.vn/media/product/46981_laptop_dell_mobile_precision_workstation_7680_71024681__1_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBDE0948', N'https://anphat.com.vn/media/product/46981_laptop_dell_mobile_precision_workstation_7680_71024681__5_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBDE0948', N'https://anphat.com.vn/media/product/46981_laptop_dell_mobile_precision_workstation_7680_71024681__3_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBHP0844', N'https://anphat.com.vn/media/product/44046_laptop_hp_pavilion_14_dv2074tu_7c0p3pa_anphatpc_2.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBHP0844', N'https://anphat.com.vn/media/product/44046_laptop_hp_pavilion_14_dv2074tu_7c0p3pa123__5_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBHP0879', N'https://anphat.com.vn/media/product/46165_laptop_hp_victus_16_r0129tx_8c5n4pa_anphatpc.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBHP0879', N'https://anphat.com.vn/media/product/46165_laptop_hp_victus_16_r0129tx_8c5n4pa__1_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBHP0879', N'https://anphat.com.vn/media/product/46165_laptop_hp_victus_16_r0129tx_8c5n4pa__5_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBHP0879', N'https://anphat.com.vn/media/product/46165_laptop_hp_victus_16_r0129tx_8c5n4pa__4_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBLG0041TL', N'https://anphat.com.vn/media/product/44919_laptop_lg_gram_2023_14z90r_g_ah53a5.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBLG0041TL', N'https://anphat.com.vn/media/product/44919_laptop_lg_gram_2023_14z90r_g_ah53a5__8_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBLG0041TL', N'https://anphat.com.vn/media/product/44919_laptop_lg_gram_2023_14z90r_g_ah53a5__6_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBLG0041TL', N'https://anphat.com.vn/media/product/44919_laptop_lg_gram_2023_14z90r_g_ah53a5__5_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBLN0763', N'https://anphat.com.vn/media/product/44430_laptop_lenovo_thinkpad_p14s_g3_21ak006wva.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBLN0763', N'https://anphat.com.vn/media/product/44430_laptop_lenovo_thinkpad_p14s_g3_21ak006wva__7_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBLN0763', N'https://anphat.com.vn/media/product/44430_laptop_lenovo_thinkpad_p14s_g3_21ak006wva__6_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBLN0763', N'https://anphat.com.vn/media/product/44430_laptop_lenovo_thinkpad_p14s_g3_21ak006wva__5_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBLN0766', N'https://anphat.com.vn/media/product/46445_laptop_lenovo_yoga_slim_6_14irh8_83e00008vn__5_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBLN0766', N'https://anphat.com.vn/media/product/46445_laptop_lenovo_yoga_slim_6_14irh8_83e00008vn__1_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBLN0766', N'https://anphat.com.vn/media/product/46445_laptop_lenovo_yoga_slim_6_14irh8_83e00008vn__4_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBLN0766', N'https://anphat.com.vn/media/product/46445_laptop_lenovo_yoga_slim_6_14irh8_83e00008vn__3_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBLN0842', N'https://anphat.com.vn/media/product/48216_laptop_lenovo_ideapad_slim_5_14imh9_83da0020vn__2_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBLN0842', N'https://anphat.com.vn/media/product/48216_laptop_lenovo_ideapad_slim_5_14imh9_83da0020vn__1_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBLN0842', N'https://anphat.com.vn/media/product/48216_laptop_lenovo_ideapad_slim_5_14imh9_83da0020vn__5_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBLN0842', N'https://anphat.com.vn/media/product/48216_laptop_lenovo_ideapad_slim_5_14imh9_83da0020vn__4_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBLN0848', N'https://anphat.com.vn/media/product/48809_laptop_lenovo_thinkpad_x1_carbon_gen_12_21kc008mvn__1_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBLN0848', N'https://anphat.com.vn/media/product/48809_laptop_lenovo_thinkpad_x1_carbon_gen_12_21kc008mvn__4_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBLN0848', N'https://anphat.com.vn/media/product/48809_laptop_lenovo_thinkpad_x1_carbon_gen_12_21kc008mvn__3_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBLN0848', N'https://anphat.com.vn/media/product/48809_laptop_lenovo_thinkpad_x1_carbon_gen_12_21kc008mvn__2_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBMS0372TL', N'https://anphat.com.vn/media/product/45890_laptop_msi_modern_15_b12mo_487vn_anphatpc_3.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBMS0372TL', N'https://anphat.com.vn/media/product/45890_laptop_msi_modern_15_b12mo_487vn__4_.jpg')
GO
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBMS0372TL', N'https://anphat.com.vn/media/product/45890_laptop_msi_modern_15_b12mo_487vn__3_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBMS0372TL', N'https://anphat.com.vn/media/product/45890_laptop_msi_modern_15_b12mo_487vn__2_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBMS0372TL', N'https://anphat.com.vn/media/product/45890_laptop_msi_modern_15_b12mo_487vn__1_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBMS0374', N'https://anphat.com.vn/media/product/46550_laptop_msi_thin_gf63_12ucx_841vn.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBMS0374', N'https://anphat.com.vn/media/product/46550_laptop_msi_thin_gf63_12ucx_841vn__4_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBMS0374', N'https://anphat.com.vn/media/product/46550_laptop_msi_thin_gf63_12ucx_841vn__3_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBMS0374', N'https://anphat.com.vn/media/product/46550_laptop_msi_thin_gf63_12ucx_841vn__2_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBMS0385', N'https://anphat.com.vn/media/product/48775_laptop_msi_thin_15_b12ucx_1419vn__2_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBMS0385', N'https://anphat.com.vn/media/product/48775_laptop_msi_thin_15_b12ucx_1419vn__1_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBMS0385', N'https://anphat.com.vn/media/product/48775_laptop_msi_thin_15_b12ucx_1419vn__4_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBMS0385', N'https://anphat.com.vn/media/product/48775_laptop_msi_thin_15_b12ucx_1419vn__3_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBMS0386', N'https://anphat.com.vn/media/product/48898_laptop_msi_sword_16_hx_b14vekg_039vn__1_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBMS0386', N'https://anphat.com.vn/media/product/48898_laptop_msi_sword_16_hx_b14vekg_039vn__3_.jpg')
INSERT [dbo].[Product_Img] ([Product_ID], [ProductImg_url]) VALUES (N'NBMS0386', N'https://anphat.com.vn/media/product/48898_laptop_msi_sword_16_hx_b14vekg_039vn__2_.jpg')
GO
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACA50001', N'NBAC0398', N'1', CAST(N'2024-06-15' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACA50002', N'NBAC0398', N'1', CAST(N'2024-06-15' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACA50003', N'NBAC0398', N'1', CAST(N'2024-06-15' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACA50004', N'NBAC0398', N'1', CAST(N'2024-06-15' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACA50005', N'NBAC0398', N'1', CAST(N'2024-06-15' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACA50006', N'NBAC0398', N'1', CAST(N'2024-06-15' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACA50007', N'NBAC0398', N'1', CAST(N'2024-06-15' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACA50008', N'NBAC0398', N'1', CAST(N'2024-06-15' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACA50009', N'NBAC0398', N'1', CAST(N'2024-06-15' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACA50010', N'NBAC0398', N'1', CAST(N'2024-06-15' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACA70001', N'NBAC0399', N'1', CAST(N'2024-06-12' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACA70002', N'NBAC0399', N'1', CAST(N'2024-06-12' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACA70003', N'NBAC0399', N'1', CAST(N'2024-06-12' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACA70004', N'NBAC0399', N'1', CAST(N'2024-06-11' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACA70005', N'NBAC0399', N'1', CAST(N'2024-06-12' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACA70006', N'NBAC0399', N'1', CAST(N'2024-06-12' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACA70007', N'NBAC0399', N'1', CAST(N'2024-06-12' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACA70008', N'NBAC0399', N'1', CAST(N'2024-06-12' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACA70009', N'NBAC0399', N'1', CAST(N'2024-06-12' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACA70010', N'NBAC0399', N'1', CAST(N'2024-06-12' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACNT160001', N'NBAC0387', N'1', CAST(N'2024-06-14' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACNT160002', N'NBAC0387', N'1', CAST(N'2024-06-14' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACNT160003', N'NBAC0387', N'1', CAST(N'2024-06-14' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACNT160004', N'NBAC0387', N'1', CAST(N'2024-06-14' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACNT160005', N'NBAC0387', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACNT160006', N'NBAC0387', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACNT160007', N'NBAC0387', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACPHN160001', N'NBAC0423', N'1', CAST(N'2024-06-14' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACPHN160002', N'NBAC0423', N'1', CAST(N'2024-06-14' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACPHN160003', N'NBAC0423', N'1', CAST(N'2024-06-14' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACPHN160004', N'NBAC0423', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACPHN160005', N'NBAC0423', N'1', CAST(N'2024-06-14' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACPHN160006', N'NBAC0423', N'1', CAST(N'2024-06-14' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACPHN160007', N'NBAC0423', N'1', CAST(N'2024-06-14' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACPHN160008', N'NBAC0423', N'1', CAST(N'2024-06-14' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACPHN160009', N'NBAC0423', N'1', CAST(N'2024-06-14' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACPHN160010', N'NBAC0423', N'1', CAST(N'2024-06-14' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACPHN160011', N'NBAC0423', N'1', CAST(N'2024-06-14' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACPHN160012', N'NBAC0423', N'1', CAST(N'2024-06-14' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACPHN160013', N'NBAC0423', N'1', CAST(N'2024-06-14' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACSFG0001', N'NBAC0419', N'1', CAST(N'2024-06-16' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACSFG0002', N'NBAC0419', N'1', CAST(N'2024-06-16' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACSFG0003', N'NBAC0419', N'1', CAST(N'2024-06-16' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACSFG0004', N'NBAC0419', N'1', CAST(N'2024-06-16' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACSFG0005', N'NBAC0419', N'1', CAST(N'2024-06-15' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACSFG0006', N'NBAC0419', N'1', CAST(N'2024-06-15' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACSFG0007', N'NBAC0419', N'1', CAST(N'2024-06-15' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACSFG0008', N'NBAC0419', N'1', CAST(N'2024-06-15' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACSFG0009', N'NBAC0419', N'1', CAST(N'2024-06-15' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACSFG0010', N'NBAC0419', N'1', CAST(N'2024-06-15' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACSFG0011', N'NBAC0419', N'1', CAST(N'2024-06-15' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ACSFG0012', N'NBAC0419', N'1', CAST(N'2024-06-15' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASROGSG160001', N'NBAS1366', N'1', CAST(N'2024-06-15' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASROGSG160002', N'NBAS1366', N'1', CAST(N'2024-06-15' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASROGSG160003', N'NBAS1366', N'1', CAST(N'2024-06-15' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVB14OLED0001', N'NBAS1263 ', N'1', CAST(N'2024-06-12' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVB14OLED0002', N'NBAS1263 ', N'1', CAST(N'2024-06-12' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVB14OLED0003', N'NBAS1263 ', N'1', CAST(N'2024-06-12' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVB14OLED0004', N'NBAS1263 ', N'1', CAST(N'2024-06-12' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVB14OLED0005', N'NBAS1263 ', N'1', CAST(N'2024-06-12' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVB14OLED0006', N'NBAS1263 ', N'1', CAST(N'2024-06-12' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVB14OLED0007', N'NBAS1263 ', N'1', CAST(N'2024-06-12' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVB14OLED0008', N'NBAS1263 ', N'1', CAST(N'2024-06-12' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVB14OLED0009', N'NBAS1263 ', N'1', CAST(N'2024-06-11' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVB14OLED0010', N'NBAS1263 ', N'1', CAST(N'2024-06-11' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVB14OLED0011', N'NBAS1263 ', N'1', CAST(N'2024-06-11' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVB14OLED0012', N'NBAS1263 ', N'1', CAST(N'2024-06-11' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVB14X0001', N'NBAS1322', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVB14X0002', N'NBAS1322', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVB14X0003', N'NBAS1322', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVB14X0004', N'NBAS1322', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVB15OLED0001', N'NBAS1261', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVB15OLED0002', N'NBAS1261', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVB15OLED0003', N'NBAS1261', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVB15OLED0004', N'NBAS1261', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVB15OLED0005', N'NBAS1261', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVB15OLED0006', N'NBAS1261', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVB15OLED0007', N'NBAS1261', N'1', CAST(N'2024-06-12' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVB15OLED0008', N'NBAS1261', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVB15OLED0009', N'NBAS1261', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVB15OLED0010', N'NBAS1261', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVB15OLED0011', N'NBAS1261', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVB15OLED0012', N'NBAS1261', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVB15X0001', N'NBAS1277', N'1', CAST(N'2024-06-14' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVB15X0002', N'NBAS1277', N'1', CAST(N'2024-06-14' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVB15X0003', N'NBAS1277', N'1', CAST(N'2024-06-14' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVB15X0004', N'NBAS1277', N'1', CAST(N'2024-06-14' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVB15X0005', N'NBAS1277', N'1', CAST(N'2024-06-14' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVB15X0006', N'NBAS1277', N'1', CAST(N'2024-06-14' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVB15X0007', N'NBAS1277', N'1', CAST(N'2024-06-14' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVB15X0008', N'NBAS1277', N'1', CAST(N'2024-06-14' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVB15X0009', N'NBAS1277', N'1', CAST(N'2024-06-14' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVB15X0010', N'NBAS1277', N'1', CAST(N'2024-06-14' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVB15X0011', N'NBAS1277', N'1', CAST(N'2024-06-14' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVB15X0012', N'NBAS1277', N'1', CAST(N'2024-06-14' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVB15X0013', N'NBAS1277', N'1', CAST(N'2024-06-14' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVBG140001', N'NBAS1288', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVBG140002', N'NBAS1288', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVBG140003', N'NBAS1288', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVBG140004', N'NBAS1288', N'1', CAST(N'2024-06-13' AS Date), NULL)
GO
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVBG140005', N'NBAS1288', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVBG140006', N'NBAS1288', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASVBG140007', N'NBAS1288', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASZBS13OLED00005', N'NBAS1363', N'1', CAST(N'2024-06-15' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASZBS13OLED0001', N'NBAS1363', N'1', CAST(N'2024-06-15' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASZBS13OLED0002', N'NBAS1363', N'1', CAST(N'2024-06-15' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASZBS13OLED0003', N'NBAS1363', N'1', CAST(N'2024-06-15' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'ASZBS13OLED0004', N'NBAS1363', N'1', CAST(N'2024-06-15' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'DEI35300001', N'NBDE0851', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'DEI35300002', N'NBDE0851', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'DEI35300003', N'NBDE0851', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'DEI35300004', N'NBDE0851', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'DEL34400001', N'NBDE0913', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'DEL34400002', N'NBDE0913', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'DEL34400003', N'NBDE0913', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'DEL34400004', N'NBDE0913', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'DEL34400005', N'NBDE0913', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'DEMPW76800001', N'NBDE0914', N'1', CAST(N'2024-06-14' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'DEMPW76800002', N'NBDE0914', N'1', CAST(N'2024-06-14' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'DEMPW76800003', N'NBDE0914', N'1', CAST(N'2024-06-14' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'DEMPW76800004', N'NBDE0914', N'1', CAST(N'2024-06-14' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'DEMPW76800005', N'NBDE0914', N'1', CAST(N'2024-06-14' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'DEMPW76800006', N'NBDE0914', N'1', CAST(N'2024-06-14' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'DEMPW7680000a', N'NBDE0948', N'1', CAST(N'2024-06-10' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'DEMPW7680000b', N'NBDE0948', N'1', CAST(N'2024-06-10' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'DEMPW7680000c', N'NBDE0948', N'1', CAST(N'2024-06-10' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'DEMPW7680000d', N'NBDE0948', N'1', CAST(N'2024-06-10' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'DEMPW7680000e', N'NBDE0948', N'1', CAST(N'2024-06-10' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'DEV35300001', N'NBDE0887', N'1', CAST(N'2024-06-12' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'DEV35300002', N'NBDE0887', N'1', CAST(N'2024-06-12' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'DEV35300003', N'NBDE0887', N'1', CAST(N'2024-06-12' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'DEV35300004', N'NBDE0887', N'1', CAST(N'2024-06-12' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'DEV56300001', N'NBDE0857', N'1', CAST(N'2024-06-12' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'DEV56300002', N'NBDE0857', N'1', CAST(N'2024-06-12' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'DEV56300003', N'NBDE0857', N'1', CAST(N'2024-06-12' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'DEV56300004', N'NBDE0857', N'1', CAST(N'2024-06-12' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'DEXPS1393400001', N'NBDE0933', N'1', CAST(N'2024-06-10' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'DEXPS1393400002', N'NBDE0933', N'1', CAST(N'2024-06-10' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'DEXPS1393400003', N'NBDE0933', N'1', CAST(N'2024-06-10' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'DEXPS1393400004', N'NBDE0933', N'1', CAST(N'2024-06-10' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'DEXPS1393400005', N'NBDE0933', N'1', CAST(N'2024-06-10' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'DEXPS1393400006', N'NBDE0933', N'1', CAST(N'2024-06-10' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'HPP140001', N'NBHP0844', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'HPP140002', N'NBHP0844', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'HPP140003', N'NBHP0844', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'HPP140004', N'NBHP0844', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'HPVT160001', N'NBHP0879', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'HPVT160002', N'NBHP0879', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'HPVT160003', N'NBHP0879', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'LGG230001', N'NBLG0041TL', N'1', CAST(N'2024-06-12' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'LGG230002', N'NBLG0041TL', N'1', CAST(N'2024-06-12' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'LGG230003', N'NBLG0041TL', N'1', CAST(N'2024-06-12' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'LGG230004', N'NBLG0041TL', N'1', CAST(N'2024-06-14' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'LGG230005', N'NBLG0041TL', N'1', CAST(N'2024-06-14' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'LNTPP14sG30001', N'NBLN0763', N'1', CAST(N'2024-06-12' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'LNTPP14sG30002', N'NBLN0763', N'1', CAST(N'2024-06-12' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'LNTPP14sG30003', N'NBLN0763', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'LNTPP14sG30004', N'NBLN0763', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'LNTPP14sG30005', N'NBLN0763', N'1', CAST(N'2024-06-11' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'LNVIPS50001', N'NBLN0842', N'1', CAST(N'2024-06-15' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'LNVIPS50002', N'NBLN0842', N'1', CAST(N'2024-06-15' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'LNVIPS50003', N'NBLN0842', N'1', CAST(N'2024-06-15' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'LNVIPS50004', N'NBLN0842', N'1', CAST(N'2024-06-15' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'LNVIPS50005', N'NBLN0842', N'1', CAST(N'2024-06-15' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'LNVIPS50006', N'NBLN0842', N'1', CAST(N'2024-06-15' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'LNVTPX1CBG120001', N'NBLN0848', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'LNVTPX1CBG120002', N'NBLN0848', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'LNVTPX1CBG120003', N'NBLN0848', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'LNVTPX1CBG120004', N'NBLN0848', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'LNVTPX1CBG120005', N'NBLN0848', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'LNVTPX1CBG120006', N'NBLN0848', N'1', CAST(N'2024-06-13' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'LNVYS6001', N'NBLN0766', N'1', CAST(N'2024-06-12' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'LNVYS6002', N'NBLN0766', N'1', CAST(N'2024-06-12' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'LNVYS6003', N'NBLN0766', N'1', CAST(N'2024-06-12' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'LNVYS6004', N'NBLN0766', N'1', CAST(N'2024-06-12' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'MSIM14C7M0001', N'NBMS0372TL', N'1', CAST(N'2024-06-11' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'MSIM14C7M0002', N'NBMS0372TL', N'1', CAST(N'2024-06-11' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'MSIM14C7M0003', N'NBMS0372TL', N'1', CAST(N'2024-06-11' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'MSIM14C7M0004', N'NBMS0372TL', N'1', CAST(N'2024-06-11' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'MSIM14C7M0005', N'NBMS0372TL', N'1', CAST(N'2024-06-11' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'MSIM14C7M0006', N'NBMS0372TL', N'1', CAST(N'2024-06-11' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'MSIM14C7M0007', N'NBMS0372TL', N'1', CAST(N'2024-06-11' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'MSISW16HXB14VEKG0001', N'NBMS0386', N'1', CAST(N'2024-06-15' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'MSISW16HXB14VEKG0002', N'NBMS0386', N'1', CAST(N'2024-06-15' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'MSISW16HXB14VEKG0003', N'NBMS0386', N'1', CAST(N'2024-06-15' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'MSISW16HXB14VEKG0004', N'NBMS0386', N'1', CAST(N'2024-06-15' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'MSISW16HXB14VEKG0005', N'NBMS0386', N'1', CAST(N'2024-06-15' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'MSISW16HXB14VEKG0006', N'NBMS0386', N'1', CAST(N'2024-06-15' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'MSISW16HXB14VEKG0007', N'NBMS0386', N'1', CAST(N'2024-06-15' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'MSIT15B12UCX0001', N'NBMS0385', N'1', CAST(N'2024-06-14' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'MSIT15B12UCX0002', N'NBMS0385', N'1', CAST(N'2024-06-14' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'MSIT15B12UCX0003', N'NBMS0385', N'1', CAST(N'2024-06-14' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'MSIT15B12UCX0004', N'NBMS0385', N'1', CAST(N'2024-06-14' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'MSIT15B12UCX0005', N'NBMS0385', N'1', CAST(N'2024-06-14' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'MSIT15B12UCX0006', N'NBMS0385', N'1', CAST(N'2024-06-14' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'MSITGF6312UCX0001', N'NBMS0374', N'1', CAST(N'2024-06-16' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'MSITGF6312UCX0002', N'NBMS0374', N'1', CAST(N'2024-06-16' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'MSITGF6312UCX0003', N'NBMS0374', N'1', CAST(N'2024-06-16' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'MSITGF6312UCX0004', N'NBMS0374', N'1', CAST(N'2024-06-16' AS Date), NULL)
INSERT [dbo].[Product_Serial] ([ProductSerial_ID], [Product_ID], [ProductSerial_Status], [ProductSerial_CheckInDate], [ProductSerial_CheckOutDate]) VALUES (N'MSITGF6312UCX0005', N'NBMS0374', N'1', CAST(N'2024-06-17' AS Date), NULL)
GO
INSERT [dbo].[ProductSerial_Status] ([ID], [Name]) VALUES (N'1', N'Instock')
INSERT [dbo].[ProductSerial_Status] ([ID], [Name]) VALUES (N'2', N'Sold')
GO
INSERT [dbo].[Role] ([Role_ID], [Role_Name]) VALUES (N'1', N'Admin')
INSERT [dbo].[Role] ([Role_ID], [Role_Name]) VALUES (N'2', N'Marketing')
INSERT [dbo].[Role] ([Role_ID], [Role_Name]) VALUES (N'3', N'Sale')
INSERT [dbo].[Role] ([Role_ID], [Role_Name]) VALUES (N'4', N'Customer')
GO
SET IDENTITY_INSERT [dbo].[Slider] ON 

INSERT [dbo].[Slider] ([id], [title], [image], [backlink], [status]) VALUES (2, N'ABc', N'https://cablevey.com/wp-content/uploads/2020/11/The-Complete-Guide-on-Snack-Foods.jpg', N'https://cablevey.com/wp-content/uploads/2020/11/The-Complete-Guide-on-Snack-Foods.jpg', 1)
SET IDENTITY_INSERT [dbo].[Slider] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([User_ID], [User_Name], [User_Password], [User_Email], [Role_ID], [User_Image], [User_Phone]) VALUES (1, N'MrA', N'123', N'MrA@gmail.com', N'1', N'https://static.vecteezy.com/system/resources/previews/011/459/666/original/people-avatar-icon-png.png', N'0618352816')
INSERT [dbo].[User] ([User_ID], [User_Name], [User_Password], [User_Email], [Role_ID], [User_Image], [User_Phone]) VALUES (2, N'MrB', N'123', N'MrB@gmail.com', N'2', N'https://cdn-icons-png.flaticon.com/512/5556/5556468.png', N'0382915381')
INSERT [dbo].[User] ([User_ID], [User_Name], [User_Password], [User_Email], [Role_ID], [User_Image], [User_Phone]) VALUES (3, N'MrC', N'123', N'MrC@gmail.com', N'3', N'https://cdn-icons-png.flaticon.com/512/3641/3641963.png', N'0861836153')
INSERT [dbo].[User] ([User_ID], [User_Name], [User_Password], [User_Email], [Role_ID], [User_Image], [User_Phone]) VALUES (4, N'MrD', N'123', N'MrD@gmail.com', N'3', N'https://cdn-icons-png.flaticon.com/512/5556/5556487.png', N'0618351036')
INSERT [dbo].[User] ([User_ID], [User_Name], [User_Password], [User_Email], [Role_ID], [User_Image], [User_Phone]) VALUES (5, N'Ryoma', N'456', N'Ryoma@gmail.com', N'4', N'https://cdn-icons-png.flaticon.com/256/5953/5953679.png', N'0349726183')
INSERT [dbo].[User] ([User_ID], [User_Name], [User_Password], [User_Email], [Role_ID], [User_Image], [User_Phone]) VALUES (6, N'Minasan', N'456', N'Mina@gmail.com', N'4', N'https://static.vecteezy.com/system/resources/thumbnails/002/002/257/small_2x/beautiful-woman-avatar-character-icon-free-vector.jpg', N'0413598267')
INSERT [dbo].[User] ([User_ID], [User_Name], [User_Password], [User_Email], [Role_ID], [User_Image], [User_Phone]) VALUES (7, N'Peter Pan Parker', N'456', N'Peter@mail.com', N'4', N'https://img.lovepik.com/free-png/20211130/lovepik-cartoon-avatar-png-image_401205251_wh1200.png', N'0546821947')
INSERT [dbo].[User] ([User_ID], [User_Name], [User_Password], [User_Email], [Role_ID], [User_Image], [User_Phone]) VALUES (8, N'Johnny', N'456', N'John@gmail.com', N'4', N'https://cdn-icons-png.flaticon.com/512/2021/2021959.png', N'0618351936')
INSERT [dbo].[User] ([User_ID], [User_Name], [User_Password], [User_Email], [Role_ID], [User_Image], [User_Phone]) VALUES (9, N'Jayden', N'456', N'Jaden@gmail.com', N'4', N'https://cdn-icons-png.flaticon.com/256/2307/2307556.png', N'0349726182')
INSERT [dbo].[User] ([User_ID], [User_Name], [User_Password], [User_Email], [Role_ID], [User_Image], [User_Phone]) VALUES (10, N'Steven', N'456', N'Steven@gmail.com', N'4', N'https://png.pngtree.com/png-clipart/20230914/original/pngtree-avatar-the-last-airbender-vector-png-image_12153555.png', N'0232816381')
INSERT [dbo].[User] ([User_ID], [User_Name], [User_Password], [User_Email], [Role_ID], [User_Image], [User_Phone]) VALUES (11, N'sale', N'123', N'sale@gmail.com', N'3', N'https://cdn-icons-png.flaticon.com/512/5556/5556468.png', NULL)
INSERT [dbo].[User] ([User_ID], [User_Name], [User_Password], [User_Email], [Role_ID], [User_Image], [User_Phone]) VALUES (12, N'Vuong', N'123', N'vuong@gmail.com', N'4', N'https://static.vecteezy.com/system/resources/thumbnails/002/002/257/small_2x/beautiful-woman-avatar-character-icon-free-vector.jpg', N'0975935040')
INSERT [dbo].[User] ([User_ID], [User_Name], [User_Password], [User_Email], [Role_ID], [User_Image], [User_Phone]) VALUES (13, N'whsale', N'123', N'whsale@gmail.com', N'3', N'png.flaticon.com/512/3641/3641963.png', N'0785485698')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__564718C44650B9F8]    Script Date: 7/19/2024 11:27:58 AM ******/
ALTER TABLE [dbo].[Customer] ADD UNIQUE NONCLUSTERED 
(
	[Customer_Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Product_Name]  DEFAULT ((0)) FOR [Product_Name]
GO
ALTER TABLE [dbo].[BlogPost]  WITH CHECK ADD  CONSTRAINT [FK_BlogPost_BlogPost_Type] FOREIGN KEY([TypeID])
REFERENCES [dbo].[BlogPost_Type] ([TypeID])
GO
ALTER TABLE [dbo].[BlogPost] CHECK CONSTRAINT [FK_BlogPost_BlogPost_Type]
GO
ALTER TABLE [dbo].[BlogPost]  WITH CHECK ADD  CONSTRAINT [FK_BlogPost_User] FOREIGN KEY([User_ID])
REFERENCES [dbo].[User] ([User_ID])
GO
ALTER TABLE [dbo].[BlogPost] CHECK CONSTRAINT [FK_BlogPost_User]
GO
ALTER TABLE [dbo].[ChangeHistory]  WITH CHECK ADD  CONSTRAINT [FK_ChangeHistory_User] FOREIGN KEY([User_ID])
REFERENCES [dbo].[User] ([User_ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ChangeHistory] CHECK CONSTRAINT [FK_ChangeHistory_User]
GO
ALTER TABLE [dbo].[Contact]  WITH CHECK ADD  CONSTRAINT [FK_Contact_Customer] FOREIGN KEY([Customer_Phone])
REFERENCES [dbo].[Customer] ([Customer_Phone])
GO
ALTER TABLE [dbo].[Contact] CHECK CONSTRAINT [FK_Contact_Customer]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Product] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product] ([Product_ID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Product]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_User] FOREIGN KEY([User_ID])
REFERENCES [dbo].[User] ([User_ID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_User]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([Customer_Phone])
REFERENCES [dbo].[Customer] ([Customer_Phone])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Order_Status] FOREIGN KEY([OrderStatus_ID])
REFERENCES [dbo].[Order_Status] ([OrderStatus_ID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Order_Status]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_Detail_Order] FOREIGN KEY([Order_ID])
REFERENCES [dbo].[Order] ([Order_ID])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_Order_Detail_Order]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_Detail_Product] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product] ([Product_ID])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_Order_Detail_Product]
GO
ALTER TABLE [dbo].[Order_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Order_Detail_Product_Serial] FOREIGN KEY([ProductSerial])
REFERENCES [dbo].[Product_Serial] ([ProductSerial_ID])
GO
ALTER TABLE [dbo].[Order_Detail] CHECK CONSTRAINT [FK_Order_Detail_Product_Serial]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Brand] FOREIGN KEY([Brand_ID])
REFERENCES [dbo].[Brand] ([BrandID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Brand]
GO
ALTER TABLE [dbo].[Product_Category]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category_Category] FOREIGN KEY([Category_ID])
REFERENCES [dbo].[Category] ([Category_ID])
GO
ALTER TABLE [dbo].[Product_Category] CHECK CONSTRAINT [FK_Product_Category_Category]
GO
ALTER TABLE [dbo].[Product_Category]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category_Product] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product] ([Product_ID])
GO
ALTER TABLE [dbo].[Product_Category] CHECK CONSTRAINT [FK_Product_Category_Product]
GO
ALTER TABLE [dbo].[Product_Detail]  WITH CHECK ADD  CONSTRAINT [FK_Product_Detail_Product] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product] ([Product_ID])
GO
ALTER TABLE [dbo].[Product_Detail] CHECK CONSTRAINT [FK_Product_Detail_Product]
GO
ALTER TABLE [dbo].[Product_Img]  WITH CHECK ADD  CONSTRAINT [FK_Product_Img_Product1] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product] ([Product_ID])
GO
ALTER TABLE [dbo].[Product_Img] CHECK CONSTRAINT [FK_Product_Img_Product1]
GO
ALTER TABLE [dbo].[Product_Serial]  WITH CHECK ADD  CONSTRAINT [FK_Product_Serial_Product] FOREIGN KEY([Product_ID])
REFERENCES [dbo].[Product] ([Product_ID])
GO
ALTER TABLE [dbo].[Product_Serial] CHECK CONSTRAINT [FK_Product_Serial_Product]
GO
ALTER TABLE [dbo].[Product_Serial]  WITH CHECK ADD  CONSTRAINT [FK_Product_Serial_ProductSerial_Status] FOREIGN KEY([ProductSerial_Status])
REFERENCES [dbo].[ProductSerial_Status] ([ID])
GO
ALTER TABLE [dbo].[Product_Serial] CHECK CONSTRAINT [FK_Product_Serial_ProductSerial_Status]
GO
ALTER TABLE [dbo].[Response]  WITH CHECK ADD  CONSTRAINT [FK_Response_Contact] FOREIGN KEY([Contact_ID])
REFERENCES [dbo].[Contact] ([Contact_ID])
GO
ALTER TABLE [dbo].[Response] CHECK CONSTRAINT [FK_Response_Contact]
GO
ALTER TABLE [dbo].[Response]  WITH CHECK ADD  CONSTRAINT [FK_Response_User] FOREIGN KEY([User_ID])
REFERENCES [dbo].[User] ([User_ID])
GO
ALTER TABLE [dbo].[Response] CHECK CONSTRAINT [FK_Response_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([Role_ID])
REFERENCES [dbo].[Role] ([Role_ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
