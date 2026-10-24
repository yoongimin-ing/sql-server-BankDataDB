USE EcommerceDB;
GO

-- 1. Insertar Categorías
INSERT INTO Categorias (NombreCategoria) 
VALUES 
('Tecnología'),
('Ropa y Calzado'),
('Hogar y Muebles'),
('Deportes');

-- 2. Insertar Productos
INSERT INTO Productos (NombreProducto, Precio, Stock, CategoriaID) 
VALUES 
('Laptop Gamer ASUS', 1200.00, 15, 1),
('Smartphone Samsung Galaxy S23', 850.00, 25, 1),
('Audífonos Inalámbricos Sony', 150.00, 50, 1),
('Zapatillas Deportivas Nike', 110.00, 30, 2),
('Chaqueta de Cuero', 180.00, 12, 2),
('Silla Ergonómica de Oficina', 220.00, 20, 3),
('Mesa de Centro de Madera', 140.00, 8, 3),
('Mancuernas 10kg (Par)', 60.00, 40, 4),
('Mat de Yoga Antideslizante', 25.00, 60, 4);

-- 3. Insertar Clientes
INSERT INTO Clientes (Nombre, Apellido, Email) 
VALUES 
('Carlos', 'Mendoza', 'carlos.mendoza@email.com'),
('Ana', 'García', 'ana.garcia@email.com'),
('Luis', 'Torres', 'luis.torres@email.com'),
('María', 'Rojas', 'maria.rojas@email.com'),
('Jorge', 'Fernández', 'jorge.fernandez@email.com');

-- 4. Insertar Pedidos
INSERT INTO Pedidos (ClienteID, FechaPedido, Total) 
VALUES 
(1, '2024-01-15 10:30:00', 1350.00),
(2, '2024-01-18 14:15:00', 110.00),
(3, '2024-02-01 09:00:00', 910.00),
(1, '2024-02-10 16:45:00', 150.00),
(4, '2024-02-12 11:20:00', 360.00),
(5, '2024-02-15 18:00:00', 850.00);

-- 5. Insertar Detalle de los Pedidos
INSERT INTO DetallePedidos (PedidoID, ProductoID, Cantidad, PrecioUnitario) 
VALUES 
-- Pedido 1 (Carlos: Laptop + Audífonos)
(1, 1, 1, 1200.00),
(1, 3, 1, 150.00),

-- Pedido 2 (Ana: Zapatillas)
(2, 4, 1, 110.00),

-- Pedido 3 (Luis: Smartphone + Mancuernas)
(3, 2, 1, 850.00),
(3, 8, 1, 60.00),

-- Pedido 4 (Carlos: Audífonos)
(4, 3, 1, 150.00),

-- Pedido 5 (María: Silla + Mesa)
(5, 6, 1, 220.00),
(5, 7, 1, 140.00),

-- Pedido 6 (Jorge: Smartphone)
(6, 2, 1, 850.00);