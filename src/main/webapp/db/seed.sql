-- Users Table: Inserting sample users (both customers and staff)
INSERT INTO users (name, email, password, phone, address, role) VALUES
('John Doe', 'john@example.com', 'hashed_password_123', '123-456-7890', '123 Main St, City, Country', 'CUSTOMER'),
('Jane Smith', 'jane@example.com', 'hashed_password_456', '987-654-3210', '456 Oak St, City, Country', 'CUSTOMER'),
('Michael Johnson', 'michael@example.com', 'hashed_password_789', '555-123-4567', '789 Pine St, City, Country', 'STAFF'),
('Sarah Lee', 'sarah@example.com', 'hashed_password_101', '555-234-5678', '101 Maple St, City, Country', 'ADMIN'),
('Robert Brown', 'robert@example.com', 'hashed_password_112', '555-345-6789', '202 Birch St, City, Country', 'STAFF'),
('Emily Davis', 'emily@example.com', 'hashed_password_131', '555-456-7890', '303 Cedar St, City, Country', 'CUSTOMER'),
('David Wilson', 'david@example.com', 'hashed_password_141', '555-567-8901', '404 Elm St, City, Country', 'CUSTOMER'),
('Olivia White', 'olivia@example.com', 'hashed_password_151', '555-678-9012', '505 Ash St, City, Country', 'STAFF'),
('William Moore', 'william@example.com', 'hashed_password_161', '555-789-0123', '606 Redwood St, City, Country', 'ADMIN'),
('Sophia Taylor', 'sophia@example.com', 'hashed_password_171', '555-890-1234', '707 Pine St, City, Country', 'CUSTOMER');

-- Categories Table: Inserting sample product categories
INSERT INTO categories (name, description) VALUES
('Laptops', 'High-performance laptops for work and gaming'),
('Accessories', 'Computer accessories including keyboards, mice, etc.'),
('Components', 'Computer parts and components such as CPUs, GPUs, RAM'),
('Monitors', 'High-quality monitors for gaming and professional use'),
('Storage', 'Storage devices including SSDs and HDDs');

-- Products Table: Inserting sample products
INSERT INTO products (name, description, price, stock, category_id) VALUES
('HP Laptop', 'A powerful laptop with Intel i7 processor, 16GB RAM, and 512GB SSD', 1200.00, 50, 1),
('Wireless Mouse', 'Ergonomic wireless mouse for comfortable use', 25.00, 200, 2),
('Corsair RAM 16GB', '16GB DDR4 RAM for high-speed performance', 85.00, 150, 3),
('Samsung 24-inch Monitor', 'Full HD 24-inch monitor for work and gaming', 200.00, 80, 4),
('Samsung 1TB SSD', 'Fast and reliable 1TB SSD for faster data access', 100.00, 120, 5),
('Logitech Keyboard', 'Mechanical keyboard with RGB lighting', 75.00, 180, 2),
('NVIDIA RTX 3070', 'High-performance GPU for gaming and content creation', 500.00, 30, 3),
('Dell Inspiron Laptop', 'Laptop with Intel i5 processor, 8GB RAM, 256GB SSD', 800.00, 60, 1),
('Acer Predator Monitor', 'Curved gaming monitor with 144Hz refresh rate', 350.00, 40, 4),
('WD 500GB HDD', '500GB hard drive for reliable storage', 50.00, 200, 5);

-- Product Images Table: Inserting sample product images
INSERT INTO product_images (product_id, image_url) VALUES
(1, 'https://example.com/images/hp_laptop.jpg'),
(2, 'https://example.com/images/wireless_mouse.jpg'),
(3, 'https://example.com/images/corsair_ram.jpg'),
(4, 'https://example.com/images/samsung_monitor.jpg'),
(5, 'https://example.com/images/samsung_ssd.jpg'),
(6, 'https://example.com/images/logitech_keyboard.jpg'),
(7, 'https://example.com/images/rtx_3070.jpg'),
(8, 'https://example.com/images/dell_laptop.jpg'),
(9, 'https://example.com/images/acer_predator_monitor.jpg'),
(10, 'https://example.com/images/wd_hdd.jpg');

-- Orders Table: Inserting sample orders for customers
INSERT INTO orders (user_id, total_price) VALUES
(1, 1300.00),
(2, 400.00),
(3, 50.00),
(4, 1000.00),
(5, 600.00),
(6, 1200.00),
(7, 500.00),
(8, 850.00),
(9, 500.00),
(10, 700.00);

-- Order Items Table: Inserting sample order items for each order
INSERT INTO order_items (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 1200.00),
(1, 2, 2, 25.00),
(2, 3, 1, 85.00),
(2, 4, 1, 200.00),
(3, 5, 1, 100.00),
(4, 6, 2, 75.00),
(5, 7, 1, 500.00),
(6, 8, 1, 800.00),
(7, 9, 1, 350.00),
(8, 10, 1, 50.00);

-- Delivery Details Table: Inserting sample delivery details for each order
INSERT INTO delivery_details (order_id, address, phone, delivery_status) VALUES
(1, '123 Main St, City, Country', '123-456-7890', 'PENDING'),
(2, '456 Oak St, City, Country', '987-654-3210', 'ON_DELIVERY'),
(3, '789 Pine St, City, Country', '555-123-4567', 'DELIVERED'),
(4, '101 Maple St, City, Country', '555-234-5678', 'PENDING'),
(5, '202 Birch St, City, Country', '555-345-6789', 'ON_DELIVERY'),
(6, '303 Cedar St, City, Country', '555-456-7890', 'PENDING'),
(7, '404 Elm St, City, Country', '555-567-8901', 'DELIVERED'),
(8, '505 Ash St, City, Country', '555-678-9012', 'PENDING'),
(9, '606 Redwood St, City, Country', '555-789-0123', 'ON_DELIVERY'),
(10, '707 Pine St, City, Country', '555-890-1234', 'DELIVERED');

-- Payments Table: Inserting sample payment records for orders
INSERT INTO payments (order_id, user_id, amount, payment_method, payment_status) VALUES
(1, 1, 1300.00, 'CREDIT_CARD', 'COMPLETED'),
(2, 2, 400.00, 'DEBIT_CARD', 'COMPLETED'),
(3, 3, 100.00, 'PAYPAL', 'FAILED'),
(4, 4, 1000.00, 'CASH_ON_DELIVERY', 'PENDING'),
(5, 5, 600.00, 'CREDIT_CARD', 'COMPLETED'),
(6, 6, 1200.00, 'DEBIT_CARD', 'COMPLETED'),
(7, 7, 500.00, 'PAYPAL', 'PENDING'),
(8, 8, 850.00, 'CASH_ON_DELIVERY', 'COMPLETED'),
(9, 9, 500.00, 'CREDIT_CARD', 'FAILED'),
(10, 10, 700.00, 'CREDIT_CARD', 'COMPLETED');
