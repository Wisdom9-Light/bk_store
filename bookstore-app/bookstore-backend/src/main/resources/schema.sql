-- Step 1: Create/reset the bookstore database (safe for repeated runs)
CREATE DATABASE IF NOT EXISTS bookstore;
USE bookstore;

-- Step 2: Create books table (manual primary key, audit timestamps with auto-update)
CREATE TABLE IF NOT EXISTS books (
  id BIGINT PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  author VARCHAR(255) NOT NULL,
  category VARCHAR(100) NOT NULL,
  price DECIMAL(10,2) NOT NULL,
  stock INT NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Bank accounts table (required for bank card foreign key)
CREATE TABLE IF NOT EXISTS bank_accounts (
  account_id BIGINT PRIMARY KEY AUTO_INCREMENT,
  account_number VARCHAR(32) NOT NULL UNIQUE,
  account_holder_name VARCHAR(100) NOT NULL,
  bank_name VARCHAR(100) NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Bank cards table (FIXED: column naming for foreign key match, audit timestamps)
CREATE TABLE IF NOT EXISTS bank_card (
  bankID BIGINT PRIMARY KEY AUTO_INCREMENT,
  bank_name VARCHAR(100) NOT NULL,
  bank_number VARCHAR(32) NOT NULL UNIQUE,
  balance DECIMAL(12,2) NOT NULL DEFAULT 0.00,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Seed books data (idempotent, FIXED: unescaped apostrophes, no duplicate columns)
INSERT INTO books (
  id, title, author, category, price, stock, created_at, updated_at
) VALUES
-- Arts
(1, 'Art Forms in Nature', 'Ernst Haeckel', 'Art', 45.99, 30, NOW(), NOW()),
(2, 'Art and Physics - Parallel Visions in Space Time', 'Leonard Shlain', 'Art', 59.09, 30, NOW(), NOW()),
(3, 'Becoming an Artist', 'Scott Christian Sava', 'Art', 19.99, 30, NOW(), NOW()),
(4, 'Book of a Hundred Hands', 'George B. Bridgman', 'Art', 33.86, 30, NOW(), NOW()),
-- Literature
(5, 'A New World Begins: The History of the French Revolution', 'Jeremy D. Popkin', 'Literature', 19.99, 30, NOW(), NOW()),
(6, 'Africa Must Unite', 'Kwanme Nkrumah', 'Literature', 28.42, 30, NOW(), NOW()),
(7, 'Ancient China: Chinese Civilization from the Origins to Tang Dynasty', 'Maurizo Scarpari', 'Literature', 19.99, 30, NOW(), NOW()),
(8, 'Arabic Philosophy', 'Peter Adamson & Richard Taylor', 'Literature',53.68, 30, NOW(), NOW()),
(9, 'Decolonising the Mind', 'Ngugi Wa Thiong''o', 'Literature', 90.91, 30, NOW(), NOW()),
(10, 'Dream of the Red Chamber', 'Cao Xueqin', 'Literature', 33.99, 30, NOW(), NOW()),
(11, 'Harry Potter and the Chamber of Secrets', 'J.K. Rowling', 'Literature', 87.00, 30, NOW(), NOW()),
(12, 'Harry Potter and the Philosopher''s Stone', 'J.K. Rowling', 'Literature', 35.42, 30, NOW(), NOW()),
(13, 'Heir of Prophecy', 'Analeigh Sbrana', 'Literature', 37.19, 30, NOW(), NOW()),
(14, 'Loot', 'Sharon Waxman', 'Literature', 199.00, 30, NOW(), NOW()),
(15, 'Oral Literature In Africa', 'Ruth Finnegan', 'Literature', 202.77, 30, NOW(), NOW()),
(16, 'Rayas Colony Legacy', 'Ginger Booth', 'Literature', 44.00, 30, NOW(), NOW()),
(17, 'Soul Mountain', 'Gao Xingjian', 'Literature', 72.72, 30, NOW(), NOW()),
(18, 'The Art of Listening', 'Eric Fromm', 'Literature', 15.51, 30, NOW(), NOW()),
(19, 'The Art of War', 'Sun Tzu', 'Literature', 11.87, 30, NOW(), NOW()),
(20, 'The Bridge Kingdom', 'Danielle Jensen', 'Literature', 300.88, 30, NOW(), NOW()),
(21, 'The Floating World', 'Axie Oh', 'Literature', 76.56, 30, NOW(), NOW()),
(22, 'The Hidden Treasure of Timbuktu', 'Thames & Hudson', 'Literature', 493.64, 30, NOW(), NOW()),
(23, 'The Kingdom Waalo', 'Boubacar Barry', 'Literature', 72.58, 30, NOW(), NOW()),
(24, 'The Philosophy of Language', 'A. P. Martinich', 'Literature', 28.55, 30, NOW(), NOW()),
(25, 'The Untold History of Polymaths', 'Graham Hancock', 'Literature', 19.99, 30, NOW(), NOW()),
(26, 'The Villain Fell First', 'Mira Ellery', 'Literature', 49.99, 30, NOW(), NOW()),
(27, 'The Wealth of Nations', 'Adam Smith', 'Literature', 94.44, 30, NOW(), NOW()),
-- Science
(28, 'Advanced Calculus', 'James J. Callahan', 'Science', 53.66, 30, NOW(), NOW()),
(29, 'BioBuilder: Synthetic Biology in the Lab', 'Unknown', 'Science', 37.12, 30, NOW(), NOW()),
(30, 'Clean Code', 'Robert C. Martin', 'Science', 9.88, 30, NOW(), NOW()),
(31, 'Computer Science', 'Allen B. Tucker', 'Science', 81.96, 30, NOW(), NOW()),
(32, 'How Computers Work: Microprocessor and Main Memory', 'Roger Young', 'Science', 19.99, 30, NOW(), NOW()),
(33, 'Mathematics for everyman', 'Egmont Colerus', 'Science', 26.37, 30, NOW(), NOW()),
(34, 'Mechatronics', 'William Bolton', 'Science', 62.73, 30, NOW(), NOW()),
(35, 'Nature''s Machines: An Introduction To Organismal Biomechanics', 'David E. Alexander', 'Science', 19.99, 30, NOW(), NOW()),
(36, 'Software Engineering', 'Ravi Sethi', 'Science', 37.26, 30, NOW(), NOW()),
(37, 'The Chemistry Book', 'Derek B. Lowe', 'Science', 73.62, 30, NOW(), NOW()),
(38, 'The Golden Ratio: The Divine Beauty of Mathematics', 'Garry Meisner', 'Science', 19.99, 30, NOW(), NOW())
ON DUPLICATE KEY UPDATE
  title = VALUES(title),
  author = VALUES(author),
  category = VALUES(category),
  price = VALUES(price),
  stock = VALUES(stock),
  updated_at = VALUES(updated_at);

-- Step 3: Create users table (AUTO_INCREMENT already defined, no redundant ALTER)
CREATE TABLE IF NOT EXISTS users (
  userID BIGINT PRIMARY KEY AUTO_INCREMENT,
  userRole VARCHAR(50) NOT NULL
);

-- Step 4: Insert users with duplicate key protection (fixes 1062 error)
INSERT INTO users (userID, userRole) VALUES
  (1, 'admin'),
  (2, 'manager'),
  (3, 'staff'),
  (4, 'customer')
ON DUPLICATE KEY UPDATE userRole = VALUES(userRole);

-- Step 4.1: Create staff table (fixed userID = 3, MySQL-compatible check constraint)
CREATE TABLE IF NOT EXISTS staff (
  staffID BIGINT PRIMARY KEY,
  staffRole VARCHAR(50) NOT NULL,
  userID BIGINT NOT NULL DEFAULT 3,
  CONSTRAINT fk_staff_user FOREIGN KEY (userID) REFERENCES users(userID),
  CONSTRAINT ck_staff_userid CHECK (userID = 3)
);

-- Seed staff roles (idempotent)
INSERT INTO staff (staffID, staffRole, userID) VALUES
  (1, 'technical_staff', 3),
  (2, 'analyst_staff', 3),
  (3, 'service_staff', 3)
ON DUPLICATE KEY UPDATE
  staffRole = VALUES(staffRole),
  userID = VALUES(userID);

-- Step 5: Create customers table (FIXED: foreign key to bank_card, unique email, audit timestamps)
CREATE TABLE IF NOT EXISTS customers (
  customerID BIGINT PRIMARY KEY AUTO_INCREMENT,
  firstName VARCHAR(100) NOT NULL,
  lastName VARCHAR(100) NOT NULL,
  email VARCHAR(255) NOT NULL UNIQUE, -- Enforce unique customer emails
  password VARCHAR(255) NOT NULL,
  age INT,
  nationality VARCHAR(100),
  language VARCHAR(100),
  religion VARCHAR(100),
  profession VARCHAR(150),
  userID BIGINT NOT NULL DEFAULT 4,
  bankID BIGINT, -- Renamed to match bank_card primary key
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_customers_user FOREIGN KEY (userID) REFERENCES users(userID),
  CONSTRAINT fk_customers_bankcard FOREIGN KEY (bankID) REFERENCES bank_card(bankID), -- Valid foreign key
  CONSTRAINT ck_customers_userid CHECK (userID = 4)
);

-- Step 6: Create orders table (RENAMED from `order` to avoid reserved keyword, audit timestamps)
CREATE TABLE IF NOT EXISTS orders (
  orderID BIGINT PRIMARY KEY AUTO_INCREMENT,
  customerID BIGINT NOT NULL,
  orderDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  status VARCHAR(50) NOT NULL DEFAULT 'pending', -- Default order status
  totalAmount DECIMAL(10,2) NOT NULL DEFAULT 0.00,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_orders_customer FOREIGN KEY (customerID) REFERENCES customers(customerID)
);

-- Step 7: Create book_retail_history table (foreign keys, audit timestamps)
CREATE TABLE IF NOT EXISTS book_retail_history (
  retailHistoryID BIGINT PRIMARY KEY AUTO_INCREMENT,
  bookID BIGINT NOT NULL,
  customerID BIGINT NOT NULL,
  quantity INT NOT NULL CHECK (quantity > 0), -- Ensure positive quantity
  unitPrice DECIMAL(10,2) NOT NULL CHECK (unitPrice >= 0),
  totalPrice DECIMAL(10,2) NOT NULL CHECK (totalPrice >= 0),
  retailDate DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_retail_history_book FOREIGN KEY (bookID) REFERENCES books(id),
  CONSTRAINT fk_retail_history_customer FOREIGN KEY (customerID) REFERENCES customers(customerID)
);

-- Step 8: Create admin table (FIXED: default for created_at, audit timestamps)
CREATE TABLE IF NOT EXISTS admin (
  adminID BIGINT PRIMARY KEY AUTO_INCREMENT,
  userID BIGINT NOT NULL,
  username VARCHAR(100) NOT NULL UNIQUE, -- Unique admin username
  password VARCHAR(255) NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_admin_user FOREIGN KEY (userID) REFERENCES users(userID)
);

-- Step 9: Create manager table (FIXED: default for created_at, unique username)
CREATE TABLE IF NOT EXISTS manager (
  managerID BIGINT PRIMARY KEY AUTO_INCREMENT,
  userID BIGINT NOT NULL,
  username VARCHAR(100) NOT NULL UNIQUE, -- Unique manager username
  password VARCHAR(255) NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_manager_user FOREIGN KEY (userID) REFERENCES users(userID)
);

-- Step 10: Create service_staff table (MySQL-compatible constraints, unique username)
CREATE TABLE IF NOT EXISTS service_staff (
  serviceStaffID BIGINT PRIMARY KEY AUTO_INCREMENT,
  userID BIGINT NOT NULL,
  staffID BIGINT NOT NULL DEFAULT 3,
  username VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_service_staff_user FOREIGN KEY (userID) REFERENCES users(userID),
  CONSTRAINT fk_service_staff_staff FOREIGN KEY (staffID) REFERENCES staff(staffID),
  CONSTRAINT ck_service_staff_staffid CHECK (staffID = 3)
);

-- Step 11: Create technical_staff table (fixed column naming, unique username)
CREATE TABLE IF NOT EXISTS technical_staff (
  technicalStaffID BIGINT PRIMARY KEY AUTO_INCREMENT,
  userID BIGINT NOT NULL,
  staffID BIGINT NOT NULL DEFAULT 1,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  username VARCHAR(100) NOT NULL UNIQUE, -- Added unique username (consistent with others)
  password VARCHAR(255) NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_technical_staff_user FOREIGN KEY (userID) REFERENCES users(userID),
  CONSTRAINT fk_technical_staff_staff FOREIGN KEY (staffID) REFERENCES staff(staffID),
  CONSTRAINT ck_technical_staff_staffid CHECK (staffID = 1)
);

-- Step 12: Create analyst_staff table (audit timestamps added)
CREATE TABLE IF NOT EXISTS analyst_staff (
  analystStaffID BIGINT PRIMARY KEY AUTO_INCREMENT,
  userID BIGINT NOT NULL,
  staffID BIGINT NOT NULL DEFAULT 2,
  username VARCHAR(100) NOT NULL UNIQUE,
  password VARCHAR(255) NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_analyst_staff_user FOREIGN KEY (userID) REFERENCES users(userID),
  CONSTRAINT fk_analyst_staff_staff FOREIGN KEY (staffID) REFERENCES staff(staffID),
  CONSTRAINT ck_analyst_staff_staffid CHECK (staffID = 2)
);

-- Optional: Verify table creation
SHOW TABLES;