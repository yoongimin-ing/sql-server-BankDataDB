CREATE DATABASE BankDataDB;
GO

USE BankDataDB;
GO

CREATE TABLE Clientes (
	ClienteID INT IDENTITY(1,1) PRIMARY KEY,
	TipoDocumento VARCHAR(10) NOT NULL, 
	NumeroDocumento VARCHAR(15) NOT NULL UNIQUE,
	Nombre VARCHAR(50) NOT NULL,
	Apellido VARCHAR(50) NOT NULL,
	FechaNacimiento DATE NOT NULL,
	EstadoRiesgo VARCHAR(20) DEFAULT 'Normal'
);

CREATE TABLE CuentasBancarias (
	CuentaID INT IDENTITY(1,1) PRIMARY KEY,
	NumeroCuenta VARCHAR(20) NOT NULL UNIQUE,
	TipoCuenta VARCHAR(20) NOT NULL,
	Saldo DECIMAL(12,2) NOT NULL DEFAULT 0.00,
	Moneda VARCHAR(3) NOT NULL DEFAULT 'PEN',
	FechaApertura DATE DEFAULT GETDATE(),
	ClienteID INT NOT NULL, 
	FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

CREATE TABLE Transacciones (
	TransaccionID INT IDENTITY(1,1) PRIMARY KEY,
	TipoTransaccion VARCHAR(20) NOT NULL,
	Monto DECIMAL(12,2) NOT NULL,
	FechaTransaccion DATETIME DEFAULT GETDATE(),
	CuentaID INT NOT NULL,
	FOREIGN KEY (CuentaID) REFERENCES CuentasBancarias(CuentaID)
);

