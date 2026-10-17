INSERT INTO customers (
    first_name,
    last_name,
    email,
    phone
)
VALUES
    ('Ahmet', 'Yılmaz', 'ahmet.yilmaz@example.com', '+905321111111'),
    ('Ayşe', 'Kaya', 'ayse.kaya@example.com', '+905322222222'),
    ('Mehmet', 'Demir', 'mehmet.demir@example.com', '+905323333333'),
    ('Zeynep', 'Çelik', 'zeynep.celik@example.com', '+905324444444'),
    ('Emre', 'Şahin', 'emre.sahin@example.com', '+905325555555'),
    ('Elif', 'Aydın', 'elif.aydin@example.com', '+905326666666'),
    ('Burak', 'Öztürk', 'burak.ozturk@example.com', '+905327777777'),
    ('Merve', 'Arslan', 'merve.arslan@example.com', '+905328888888'),
    ('Can', 'Kurt', 'can.kurt@example.com', '+905329999999'),
    ('Selin', 'Koç', 'selin.koc@example.com', '+905320000000');

INSERT INTO products (
    sku,
    product_name,
    category,
    unit_price,
    stock_quantity,
    is_active
)
VALUES
    ('LAP-001', 'MacBook Air M4', 'Laptop', 45999.00, 18, TRUE),
    ('LAP-002', 'Lenovo ThinkPad E16', 'Laptop', 38999.00, 12, TRUE),
    ('LAP-003', 'Dell Inspiron 15', 'Laptop', 32999.00, 9, TRUE),
    ('MON-001', 'Dell 27 Inch Monitor', 'Monitor', 8999.00, 25, TRUE),
    ('MON-002', 'LG UltraWide 29 Inch', 'Monitor', 10999.00, 14, TRUE),
    ('KEY-001', 'Logitech MX Keys', 'Keyboard', 4299.00, 30, TRUE),
    ('MOU-001', 'Logitech MX Master 3S', 'Mouse', 3499.00, 40, TRUE),
    ('MOU-002', 'Razer DeathAdder V3', 'Mouse', 2899.00, 22, TRUE),
    ('HUB-001', 'Anker USB-C Hub', 'Accessories', 2199.00, 35, TRUE),
    ('SSD-001', 'Samsung 990 EVO 1TB', 'Storage', 4999.00, 17, TRUE);

INSERT INTO orders (
    customer_id,
    order_status,
    ordered_at
)
VALUES
    (1, 'delivered', '2026-09-20 10:15:00+03'),
    (2, 'shipped', '2026-09-21 14:30:00+03'),
    (3, 'paid', '2026-09-22 09:45:00+03'),
    (4, 'delivered', '2026-09-23 16:20:00+03'),
    (5, 'cancelled', '2026-09-24 11:10:00+03'),
    (1, 'delivered', '2026-09-25 13:40:00+03'),
    (6, 'pending', '2026-09-26 18:05:00+03'),
    (7, 'shipped', '2026-09-27 12:25:00+03'),
    (8, 'delivered', '2026-09-28 15:50:00+03'),
    (9, 'paid', '2026-09-29 10:35:00+03'),
    (10, 'delivered', '2026-09-30 17:15:00+03'),
    (2, 'shipped', '2026-10-01 09:20:00+03'),
    (3, 'delivered', '2026-10-02 14:45:00+03'),
    (5, 'paid', '2026-10-03 11:30:00+03'),
    (7, 'pending', '2026-10-04 19:10:00+03');




INSERT INTO order_items (
    order_id,
    product_id,
    quantity,
    unit_price
)
VALUES
    (1, 1, 1, 45999.00),
    (1, 6, 1, 4299.00),
    (1, 9, 2, 2199.00),

    (2, 2, 1, 38999.00),
    (2, 7, 1, 3499.00),

    (3, 4, 2, 8999.00),
    (3, 6, 1, 4299.00),

    (4, 3, 1, 32999.00),
    (4, 8, 1, 2899.00),
    (4, 9, 1, 2199.00),

    (5, 5, 1, 10999.00),

    (6, 1, 1, 45999.00),
    (6, 10, 1, 4999.00),

    (7, 7, 2, 3499.00),

    (8, 2, 1, 38999.00),
    (8, 6, 1, 4299.00),

    (9, 4, 1, 8999.00),
    (9, 5, 1, 10999.00),

    (10, 8, 1, 2899.00),
    (10, 9, 2, 2199.00),

    (11, 1, 1, 45999.00),
    (11, 6, 1, 4299.00),

    (12, 3, 1, 32999.00),
    (12, 7, 1, 3499.00),

    (13, 10, 2, 4999.00),

    (14, 2, 1, 38999.00),
    (14, 9, 1, 2199.00),

    (15, 4, 1, 8999.00),
    (15, 8, 1, 2899.00);

