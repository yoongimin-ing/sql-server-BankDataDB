USE BankDataDB;
GO

--Area de atencion pide un reporte, muestra NOMBRE COMPLETO DEL CLIENTE
--NUMERO DE CUENTA, TIPO DE CUENTA, MONEDA Y SALDO
SELECT 
    CONCAT(c.Nombre, ' ', c.Apellido) AS Cliente,
    cb.NumeroCuenta,
    cb.TipoCuenta,
    cb.Moneda,
    cb.Saldo
FROM Clientes c
INNER JOIN CuentasBancarias cb 
    ON c.ClienteID = cb.ClienteID;

--Necesitamos ver la lista de TODOS los clientes registrados en nuestra base de datos. 
--Si el cliente tiene cuenta, muestra su número y saldo; si no tiene cuenta, 
--queremos que aparezca igual en la lista para ofrecerle una apertura
SELECT 
	c.clienteID,
	CONCAT(c.Nombre, ' ', c.Apellido) AS Cliente,
	c.EstadoRiesgo,
	cb.NumeroCuenta,
	cb.Saldo
FROM Clientes c
LEFT JOIN CuentasBancarias cb
	ON c.ClienteID = cb.ClienteID;  

--Necesito la lista únicamente de los clientes de Riesgo 'Alto' que NO tienen 
--ninguna cuenta bancaria con nosotros para coordinar una evaluación manual.
SELECT 
    c.ClienteID,
    CONCAT(c.Nombre, ' ', c.Apellido) AS Cliente,
    c.EstadoRiesgo,
    cb.NumeroCuenta
FROM Clientes c
LEFT JOIN CuentasBancarias cb 
    ON c.ClienteID = cb.ClienteID
WHERE c.EstadoRiesgo = 'Alto'
  AND cb.NumeroCuenta IS NULL;

--¿Cuánto dinero total maneja cada cliente en el banco?
--¿Cuántas cuentas tiene activas?
--¿Cuál es su saldo promedio?
SELECT
	CONCAT(c.Nombre, ' ', c.Apellido) AS Cliente,
	COUNT(cb.CuentaID) AS CantidadCuentas, --cuantas cuentas tiene yoongi?
	SUM(cb.Saldo) AS SaldoTotal, --cuanto dinero tiene en la suma total?
	AVG(cb.Saldo) AS SaldoPromedio --saldo promedio de yoongi
FROM Clientes c
INNER JOIN CuentasBancarias cb
	ON c.ClienteID = cb.ClienteID
GROUP BY c.Nombre, c.Apellido;

--Tráeme solo los clientes que tengan un saldo promedio mayor a S/ 2,000.00
SELECT
	CONCAT(c.Nombre, ' ', c.Apellido) AS Cliente,
	SUM(cb.Saldo) AS SaldoTotal,
	AVG(cb.Saldo) AS SaldoPromedio
FROM Clientes c
INNER JOIN CuentasBancarias cb
	ON c.ClienteID = cb.ClienteID
GROUP BY c.Nombre, c.Apellido
HAVING AVG(cb.Saldo) > 2000.00;

--AREA DE AUDITORIA SOLICITA CLIENTES+CUENTAS+TRANSSACCIONES
SELECT
	CONCAT(c.Nombre, ' ', c.Apellido) AS Cliente,
	cb.NumeroCuenta,
	cb.Moneda,
	t.TipoTransaccion,
	t.Monto,
	t.FechaTransaccion
FROM Clientes c
INNER JOIN CuentasBancarias cb
	ON c.ClienteID = cb.ClienteID
INNER JOIN Transacciones t
	ON cb.CuentaID = t.CuentaID;