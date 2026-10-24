--hola, mi nombre es Abi c:
-- Creación de la base de datos
CREATE DATABASE EcommerceDB;
GO
USE EcommerceDB;
GO

-- Tabla Clientes
CREATE TABLE Clientes (
    ClienteID INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    FechaRegistro DATE DEFAULT GETDATE()
);

-- Tabla Categorías
CREATE TABLE Categorias (
    CategoriaID INT IDENTITY(1,1) PRIMARY KEY,
    NombreCategoria VARCHAR(50) NOT NULL
);

-- Tabla Productos
CREATE TABLE Productos (
    ProductoID INT IDENTITY(1,1) PRIMARY KEY,
    NombreProducto VARCHAR(100) NOT NULL,
    Precio DECIMAL(10,2) NOT NULL,
    Stock INT NOT NULL DEFAULT 0,
    CategoriaID INT,
    FOREIGN KEY (CategoriaID) REFERENCES Categorias(CategoriaID)
);

-- Tabla Pedidos
CREATE TABLE Pedidos (
    PedidoID INT IDENTITY(1,1) PRIMARY KEY,
    ClienteID INT NOT NULL,
    FechaPedido DATETIME DEFAULT GETDATE(),
    Total DECIMAL(10,2) DEFAULT 0.00,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

-- Tabla DetallePedidos
CREATE TABLE DetallePedidos (
    DetalleID INT IDENTITY(1,1) PRIMARY KEY,
    PedidoID INT NOT NULL,
    ProductoID INT NOT NULL,
    Cantidad INT NOT NULL,
    PrecioUnitario DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID),
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID)
);