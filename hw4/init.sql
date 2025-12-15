-- Создание тестовой таблицы
CREATE TABLE IF NOT EXISTS sales_data (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    quantity INTEGER,
    price DECIMAL(10, 2),
    sale_date DATE,
    region VARCHAR(50)
);

-- Очистка таблицы (если она уже существовала)
TRUNCATE TABLE sales_data;

-- Вставка тестовых данных
INSERT INTO sales_data (product_name, category, quantity, price, sale_date, region) VALUES
('Ноутбук Dell XPS', 'Электроника', 5, 125000.00, '2024-01-15', 'Москва'),
('Смартфон iPhone 15', 'Электроника', 12, 89990.00, '2024-01-16', 'Санкт-Петербург'),
('Наушники Sony', 'Аксессуары', 25, 15990.00, '2024-01-17', 'Москва'),
('Клавиатура Logitech', 'Аксессуары', 18, 4590.00, '2024-01-18', 'Новосибирск'),
('Монитор Samsung', 'Электроника', 7, 34990.00, '2024-01-19', 'Москва'),
('Мышь беспроводная', 'Аксессуары', 30, 2490.00, '2024-01-20', 'Санкт-Петербург'),
('Ноутбук MacBook Pro', 'Электроника', 3, 199990.00, '2024-01-21', 'Москва'),
('Планшет iPad', 'Электроника', 9, 65990.00, '2024-01-22', 'Новосибирск'),
('Колонка JBL', 'Аудио', 15, 12990.00, '2024-01-23', 'Санкт-Петербург'),
('Внешний диск', 'Хранение', 22, 7990.00, '2024-01-24', 'Москва');

-- Создание дополнительной таблицы для JOIN операций
CREATE TABLE IF NOT EXISTS regions (
    region_id SERIAL PRIMARY KEY,
    region_name VARCHAR(50),
    manager VARCHAR(100),
    target_sales DECIMAL(15, 2)
);

INSERT INTO regions (region_name, manager, target_sales) VALUES
('Москва', 'Иванов Иван', 5000000.00),
('Санкт-Петербург', 'Петрова Мария', 3000000.00),
('Новосибирск', 'Сидоров Алексей', 1500000.00);

-- Создание представления
CREATE OR REPLACE VIEW sales_summary AS
SELECT
    category,
    COUNT(*) as total_transactions,
    SUM(quantity) as total_quantity,
    SUM(quantity * price) as total_revenue,
    AVG(price) as avg_price
FROM sales_data
GROUP BY category;

COMMIT;