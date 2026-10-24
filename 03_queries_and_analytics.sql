USE EcommerceDB;
GO

-- Consulta A: Top 3 clientes que más dinero han gastado
SELECT TOP 3 
    C.ClienteID,
    CONCAT(C.Nombre, ' ', C.Apellido) AS Cliente,
    SUM(P.Total) AS TotalGastado
FROM Clientes C
INNER JOIN Pedidos P ON C.ClienteID = P.ClienteID
GROUP BY C.ClienteID, C.Nombre, C.Apellido
ORDER BY TotalGastado DESC;

-- Consulta B: Ventas totales y cantidad de productos vendidos por categoría
SELECT 
    CAT.NombreCategoria,
    COUNT(DISTINCT P.PedidoID) AS TotalPedidos,
    SUM(DP.Cantidad) AS UnidadesVendidas,
    SUM(DP.Cantidad * DP.PrecioUnitario) AS IngresoTotal
FROM Categorias CAT
INNER JOIN Productos PR ON CAT.CategoriaID = PR.CategoriaID
INNER JOIN DetallePedidos DP ON PR.ProductoID = DP.ProductoID
INNER JOIN Pedidos P ON DP.PedidoID = P.PedidoID
GROUP BY CAT.NombreCategoria
HAVING SUM(DP.Cantidad * DP.PrecioUnitario) > 1000;