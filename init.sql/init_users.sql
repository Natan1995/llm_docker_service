
-- Table Structure
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE product_catalogue (
    id SERIAL PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL,
    description VARCHAR(255)
);

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    stock INTEGER NOT NULL DEFAULT 0,
    category_id INTEGER REFERENCES product_catalogue(id)
);

CREATE TABLE sales (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    product_id INTEGER REFERENCES products(id) ON DELETE CASCADE,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    amount NUMERIC(10, 2) NOT NULL CHECK (amount >= 0),
    day DATE NOT NULL DEFAULT CURRENT_DATE
);

-- Table Data
INSERT INTO users (user_name, email) VALUES
('Juan Pérez', 'juan.perez@example.com'),
('María López', 'maria.lopez@example.com'),
('Carlos García', 'carlos.garcia@example.com'),
('Ana Sánchez', 'ana.sanchez@example.com'),
('Luis Torres', 'luis.torres@example.com'),
('Sofía Martínez', 'sofia.martinez@example.com'),
('Diego Fernández', 'diego.fernandez@example.com'),
('Laura Gómez', 'laura.gomez@example.com'),
('Andrés Ramírez', 'andres.ramirez@example.com'),
('Elena Vargas', 'elena.vargas@example.com');

INSERT INTO product_catalogue (category_name, description) VALUES
('Alimentos', 'Comida para diferentes tipos de mascotas'),
('Juguetes', 'Juguetes para el entretenimiento de mascotas'),
('Accesorios', 'Accesorios como collares, correas, etc.'),
('Camas y Mantas', 'Productos para el descanso de las mascotas'),
('Higiene', 'Productos para el cuidado e higiene'),
('Ropa', 'Ropa para perros, gatos y otras mascotas'),
('Transporte', 'Jaulas, mochilas y transportadoras'),
('Salud', 'Vitaminas, suplementos y productos veterinarios'),
('Acuáticos', 'Accesorios para acuarios y peces'),
('Adiestramiento', 'Herramientas para entrenar mascotas');

-- Insertar productos de prueba relacionados con las categorías
INSERT INTO products (product_name, stock, category_id) VALUES
('Croquetas para perro', 50, 1),
('Comida húmeda para gato', 30, 1),
('Pelota de goma para perros', 100, 2),
('Rascador para gatos', 20, 2),
('Collar de cuero', 75, 3),
('Cama ortopédica para perros', 15, 4),
('Champú antipulgas', 40, 5),
('Abrigo impermeable para perros', 25, 6),
('Transportadora de plástico', 10, 7),
('Vitaminas para cachorros', 60, 8);

INSERT INTO sales (user_id, product_id, quantity, amount, day) VALUES
(7, 4, 5, 85.22, '2025-03-04'),
(8, 7, 4, 46.88, '2025-06-20'),
(8, 5, 4, 63.34, '2025-10-24'),
(3, 7, 1, 12.63, '2025-02-15'),
(9, 4, 3, 26.97, '2025-06-09'),
(2, 6, 2, 78.50, '2025-01-22'),
(5, 3, 4, 44.75, '2025-04-18'),
(1, 9, 3, 59.90, '2025-08-12'),
(4, 2, 1, 31.45, '2025-09-05'),
(10, 8, 5, 95.30, '2025-11-29'),
(6, 1, 2, 73.88, '2025-03-15'),
(7, 5, 3, 50.99, '2025-05-07'),
(8, 10, 4, 89.65, '2025-12-10'),
(9, 6, 1, 28.45, '2025-07-22'),
(3, 3, 5, 67.12, '2025-02-28'),
(2, 4, 2, 53.80, '2025-04-03'),
(5, 7, 4, 91.40, '2025-06-14'),
(1, 9, 1, 38.75, '2025-09-18'),
(4, 8, 3, 79.50, '2025-10-22'),
(10, 2, 5, 42.99, '2025-12-31'),
(6, 5, 2, 63.55, '2025-01-11'),
(7, 3, 3, 88.20, '2025-03-30'),
(8, 6, 4, 47.75, '2025-05-19'),
(9, 1, 1, 55.65, '2025-08-25'),
(3, 4, 5, 76.88, '2025-11-14'),
(2, 9, 2, 34.10, '2025-02-05'),
(5, 8, 4, 69.99, '2025-06-01'),
(1, 10, 3, 58.45, '2025-09-12'),
(4, 7, 1, 82.30, '2025-12-03'),
(10, 5, 5, 40.80, '2025-01-27'),
(6, 2, 2, 74.55, '2025-03-22'),
(7, 9, 4, 61.90, '2025-05-09'),
(8, 1, 3, 93.25, '2025-08-18'),
(9, 3, 1, 29.99, '2025-10-05'),
(3, 6, 5, 85.75, '2025-11-21'),
(2, 8, 2, 54.60, '2025-02-20'),
(5, 4, 3, 78.45, '2025-04-15'),
(1, 7, 1, 49.35, '2025-07-06'),
(4, 9, 4, 88.10, '2025-09-27'),
(10, 3, 2, 33.50, '2025-12-19'),
(6, 8, 3, 72.99, '2025-01-03'),
(7, 5, 5, 59.40, '2025-03-13'),
(8, 10, 1, 95.75, '2025-05-26'),
(9, 2, 4, 43.85, '2025-08-02'),
(3, 1, 3, 81.20, '2025-10-14'),
(2, 4, 1, 37.90, '2025-11-30'),
(5, 9, 5, 66.40, '2025-02-14'),
(1, 6, 2, 48.15, '2025-04-01'),
(4, 3, 4, 92.55, '2025-06-29'),
(10, 7, 1, 35.80, '2025-09-10');
