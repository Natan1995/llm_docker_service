
-- Table Structure
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

-- Table Data
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

