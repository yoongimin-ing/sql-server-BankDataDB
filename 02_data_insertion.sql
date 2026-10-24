USE BankDataDB;
GO

INSERT INTO Clientes (TipoDocumento, NumeroDocumento, Nombre, Apellido, FechaNacimiento, EstadoRiesgo)
VALUES
('DNI', '01569872', 'YOONGI', 'MIN', '1990-05-12', 'Normal'),
('DNI', '65489636', 'JUNGKOOK', 'JEON', '1995-09-02', 'Alto'),
('DNI', '78365942', 'JIMIN', 'PARK', '2006-08-03', 'Alto'),
('DNI', '65984214', 'TAEHYUNG', 'KIM', '2000-01-08', 'Alto'),
('DNI', '36549863', 'HOSEOK', 'JUNG', '1997-04-15', 'Normal'),
('CE',  'E9835933', 'NAMJOON', 'KIM', '1994-09-06', 'Normal'),
('CE',  'E9426543', 'SEOKJIN', 'KIM', '1997-12-12', 'Alto'),
('DNI', '35987456', 'ABIGAIL', 'MIN', '2004-07-13', 'Normal'),
('CE',  'E6622559', 'MARIANA', 'PARK', '2003-10-12', 'Normal'),
('DNI', '26594325', 'ANDREW', 'YOUNG', '1999-07-13', 'Alto');

INSERT INTO CuentasBancarias (NumeroCuenta, TipoCuenta, Saldo, Moneda, ClienteID)
VALUES
('191-11223344-0-01', 'Ahorros', 1500.00, 'PEN', 1),
('191-55667788-0-02', 'Sueldo',  4200.50, 'PEN', 1),
('191-99001122-0-03', 'Ahorros',  250.00, 'PEN', 2),
('191-33445566-0-04', 'CTS',     8900.00, 'USD', 3),
('191-44556677-0-05', 'Ahorros', 1200.00, 'PEN', 4),
('191-77889900-0-06', 'Sueldo',  3500.00, 'PEN', 5),
('191-22334455-0-07', 'Ahorros', 5000.00, 'USD', 6);

INSERT INTO Transacciones (TipoTransaccion, Monto, CuentaID)
VALUES
('Deposito',      500.00, 1),
('Retiro',        200.00, 1),
('Transferencia', 1000.00, 2),
('Deposito',     1500.00, 4),
('Retiro',        100.00, 3);