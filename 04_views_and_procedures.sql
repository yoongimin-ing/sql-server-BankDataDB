USE EcommerceDB;
GO

-- Procedimiento Almacenado: Registrar una venta y actualizar stock
CREATE PROCEDURE sp_RegistrarVenta
    @ClienteID INT,
    @ProductoID INT,
    @Cantidad INT
AS
BEGIN
    SET NOCOUNT ON;
    
    -- Validar si hay stock suficiente
    IF (SELECT Stock FROM Productos WHERE ProductoID = @ProductoID) >= @Cantidad
    BEGIN
        DECLARE @Precio DECIMAL(10,2);
        DECLARE @NuevoPedidoID INT;
        
        SELECT @Precio = Precio FROM Productos WHERE ProductoID = @ProductoID;
        
        -- Crear el pedido
        INSERT INTO Pedidos (ClienteID, Total) 
        VALUES (@ClienteID, @Precio * @Cantidad);
        
        SET @NuevoPedidoID = SCOPE_IDENTITY();
        
        -- Insertar el detalle
        INSERT INTO DetallePedidos (PedidoID, ProductoID, Cantidad, PrecioUnitario)
        VALUES (@NuevoPedidoID, @ProductoID, @Cantidad, @Precio);
        
        -- Descontar del inventario
        UPDATE Productos 
        SET Stock = Stock - @Cantidad 
        WHERE ProductoID = @ProductoID;
        
        PRINT 'Venta registrada con éxito.';
    END
    ELSE
    BEGIN
        RAISERROR('Stock insuficiente para realizar la compra.', 16, 1);
    END
END;