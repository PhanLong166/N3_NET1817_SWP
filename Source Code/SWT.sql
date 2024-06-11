CREATE TABLE `Account` (
  `AccountID` int PRIMARY KEY AUTO_INCREMENT,
  `Name` varchar(255) NOT NULL,
  `PhoneNumber` varchar(13) NOT NULL,
  `Username` varchar(25) NOT NULL,
  `Password` varchar(25) NOT NULL,
  `Role` varchar(25) NOT NULL,
  `IsActive` boolean NOT NULL
);

CREATE TABLE `Notification` (
  `NotificationID` int PRIMARY KEY AUTO_INCREMENT,
  `IsRead` boolean NOT NULL,
  `Date` datetime NOT NULL,
  `Message` text,
  `AccountID` int
);

CREATE TABLE `Customer` (
  `CusomerID` int PRIMARY KEY AUTO_INCREMENT,
  `Birthday` date,
  `Gender` boolean NOT NULL,
  `Address` varchar(255)
);

CREATE TABLE `BillDiscount` (
  `BillDiscountID` int PRIMARY KEY AUTO_INCREMENT,
  `StartDate` datetime,
  `EndDate` datetime,
  `PercentDiscount` decimal(3,2) NOT NULL,
  `OrderID` int
);

CREATE TABLE `Order` (
  `OrderID` int PRIMARY KEY AUTO_INCREMENT,
  `OrderDate` datetime,
  `CompleteDate` datetime,
  `CusomerID` int,
  `OrderStatus` varchar(25) NOT NULL,
  `IsActive` boolean NOT NULL,
  `AccountDeliveryID` int,
  `AccountSaleID` int
);

CREATE TABLE `OrderLine` (
  `OrderLineID` int PRIMARY KEY AUTO_INCREMENT,
  `Quantity` int NOT NULL,
  `OrderID` int,
  `DiamondID` int,
  `ProductID` int
);

CREATE TABLE `Diamond` (
  `DiamondID` int PRIMARY KEY AUTO_INCREMENT,
  `Name` varchar(255),
  `Cut` varchar(25),
  `Price` decimal(14,2),
  `Color` varchar(25),
  `WeightCarat` decimal(5,2),
  `PercentDepth` decimal(3,2),
  `LengthOnWidthRatio` decimal(3,2),
  `Description` varchar(255),
  `IsActive` boolean NOT NULL,
  `Fluorescence` varchar(25),
  `Clarity` varchar(25),
  `PercentTable` decimal(3,2),
  `Polish` varchar(25),
  `Symmetry` varchar(25),
  `ChargeRate` decimal(10,2),
  `Shape` varchar(255),
  `ProductID` int
);

CREATE TABLE `Certificate` (
  `Name` varchar(255),
  `CerID` int PRIMARY KEY AUTO_INCREMENT,
  `DiamondID` int
);

CREATE TABLE `MaterialJewelry` (
  `MaterialID` int PRIMARY KEY AUTO_INCREMENT,
  `BuyPrice` decimal(20,2),
  `SalePrice` decimal(20,2),
  `UpdateTime` datetime,
  `Name` varchar(25)
);

CREATE TABLE `Shell` (
  `ShellID` int PRIMARY KEY AUTO_INCREMENT,
  `ProductionCost` decimal(25,2) NOT NULL,
  `IsActive` boolean NOT NULL,
  `Weight` decimal(5,2) NOT NULL,
  `JewelryTypeID` int,
  `MarterialJewelryID` int
);

CREATE TABLE `Product` (
  `ProductID` int PRIMARY KEY AUTO_INCREMENT,
  `ShellID` int NOT NULL,
  `IsActive` boolean NOT NULL
);

CREATE TABLE `JewelryType` (
  `JewelryTypeID` int PRIMARY KEY AUTO_INCREMENT,
  `Name` varchar(25) NOT NULL
);

CREATE TABLE `Feedback` (
  `FeedbackID` int PRIMARY KEY AUTO_INCREMENT,
  `Stars` int,
  `Comment` text,
  `IsActive` boolean,
  `DiamondID` int,
  `ProductID` int,
  `OrderID` int,
  `AccountID` int
);

ALTER TABLE `Account` ADD FOREIGN KEY (`AccountID`) REFERENCES `Customer` (`CusomerID`);

ALTER TABLE `Notification` ADD FOREIGN KEY (`AccountID`) REFERENCES `Account` (`AccountID`);

ALTER TABLE `BillDiscount` ADD FOREIGN KEY (`OrderID`) REFERENCES `Order` (`OrderID`);

ALTER TABLE `Order` ADD FOREIGN KEY (`CusomerID`) REFERENCES `Customer` (`CusomerID`);

ALTER TABLE `Order` ADD FOREIGN KEY (`AccountDeliveryID`) REFERENCES `Account` (`AccountID`);

ALTER TABLE `Order` ADD FOREIGN KEY (`AccountSaleID`) REFERENCES `Account` (`AccountID`);

ALTER TABLE `OrderLine` ADD FOREIGN KEY (`OrderID`) REFERENCES `Order` (`OrderID`);

ALTER TABLE `OrderLine` ADD FOREIGN KEY (`DiamondID`) REFERENCES `Diamond` (`DiamondID`);

ALTER TABLE `OrderLine` ADD FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`);

ALTER TABLE `Diamond` ADD FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`);

ALTER TABLE `Certificate` ADD FOREIGN KEY (`DiamondID`) REFERENCES `Diamond` (`DiamondID`);

ALTER TABLE `Shell` ADD FOREIGN KEY (`JewelryTypeID`) REFERENCES `JewelryType` (`JewelryTypeID`);

ALTER TABLE `Shell` ADD FOREIGN KEY (`MarterialJewelryID`) REFERENCES `MaterialJewelry` (`MaterialID`);

ALTER TABLE `Product` ADD FOREIGN KEY (`ShellID`) REFERENCES `Shell` (`ShellID`);

ALTER TABLE `Feedback` ADD FOREIGN KEY (`DiamondID`) REFERENCES `Diamond` (`DiamondID`);

ALTER TABLE `Feedback` ADD FOREIGN KEY (`ProductID`) REFERENCES `Product` (`ProductID`);

ALTER TABLE `Feedback` ADD FOREIGN KEY (`OrderID`) REFERENCES `Order` (`OrderID`);

ALTER TABLE `Feedback` ADD FOREIGN KEY (`AccountID`) REFERENCES `Account` (`AccountID`);
