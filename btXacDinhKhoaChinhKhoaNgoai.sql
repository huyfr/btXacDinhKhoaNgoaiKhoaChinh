CREATE TABLE `customers` (
  `customer_number` int NOT NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` int NOT NULL,
  PRIMARY KEY (`customer_number`)
);

CREATE TABLE `accounts` (
  `account_number` int NOT NULL,
  `account_type` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `balance` float NOT NULL,
  `customer_number` int NOT NULL,
  PRIMARY KEY (`account_number`),
  KEY `accounts_fk` (`customer_number`),
  CONSTRAINT `accounts_fk` FOREIGN KEY (`customer_number`) REFERENCES `customers` (`customer_number`)
);

CREATE TABLE `transactions` (
  `tran_number` int NOT NULL,
  `account_number` int NOT NULL,
  `date` date NOT NULL,
  `amounts` double DEFAULT NULL,
  `descriptions` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tran_number`),
  KEY `transactions_fk` (`account_number`),
  CONSTRAINT `transactions_fk` FOREIGN KEY (`account_number`) REFERENCES `accounts` (`account_number`)
);