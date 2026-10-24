USE BankDataDB;
GO

CREATE VIEW vw_ResumenClientes AS --crea un  objeto llamado... y guardalo
SELECT --me va mostrar estas columnas
    c.ClienteID,
    CONCAT(c.Nombre, ' ', c.Apellido) AS Cliente, --para q se vea limpio
    c.EstadoRiesgo,
    COUNT(cb.CuentaID) AS TotalCuentas, --cuantas cuentas tiene cada cliente?
    ISNULL(SUM(cb.Saldo), 0.00) AS SaldoTotal --si el resultado es NULL, ponle 0.00
FROM Clientes c
LEFT JOIN CuentasBancarias cb --incluir a todos los clientes
    ON c.ClienteID = cb.ClienteID
GROUP BY c.ClienteID, c.Nombre, c.Apellido, c.EstadoRiesgo; --usamos columnas de agregacion, se usa para reclamar aquellos q no suman
GO

--comando para realizar la prueba de la consulta
SELECT * FROM vw_ResumenClientes;

--Cuando presionas el botón "Transferir" o "Depositar"
--¿A qué cuenta? ¿Qué tipo de movimiento es? ¿Cuánto es el monto?
--Stored Procedure es una función automatizada que recibe esos datos y realiza varias acciones en cadena de forma segura.
GO
CREATE PROCEDURE sp_RegistrarTransaccion
    @CuentaID INT,
    @TipoTransaccion VARCHAR(20),
    @Monto DECIMAL(12,2)
AS
BEGIN
    --Guardar el historial en la tabla Transacciones
    INSERT INTO Transacciones (CuentaID, TipoTransaccion, Monto, FechaTransaccion)
    VALUES (@CuentaID, @TipoTransaccion, @Monto, GETDATE());

    --Modificar el dinero en la tabla CuentasBancarias
    IF @TipoTransaccion = 'Deposito'
    BEGIN
        UPDATE CuentasBancarias
        SET Saldo = Saldo + @Monto
        WHERE CuentaID = @CuentaID;
    END
    ELSE IF @TipoTransaccion = 'Retiro'
    BEGIN
        UPDATE CuentasBancarias
        SET Saldo = Saldo - @Monto
        WHERE CuentaID = @CuentaID;
    END
END;
GO

--PRUEBA PARA INVOCAR PROCEDIMIENTO DEL SP_REGISTRAR TRANSACCION
EXEC sp_RegistrarTransaccion 
    @CuentaID = 1, 
    @TipoTransaccion = 'Deposito', 
    @Monto = 500.00;

--COMPRUEBA LOS CAMBIOS REALIZADOS O AFECTADOS
--Verifica que el saldo de la cuenta subió de 1500.00 a 2000.00:
SELECT NumeroCuenta, Saldo FROM CuentasBancarias WHERE CuentaID = 1;

--Verifica que se agregó la nueva transacción con la fecha actual:
SELECT * FROM Transacciones WHERE CuentaID = 1;