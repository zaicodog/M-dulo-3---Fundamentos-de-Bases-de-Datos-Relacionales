CREATE DATABASE AlkeWallet;

USE AlkeWallet;

CREATE TABLE Usuario (
    user_id INT PRIMARY KEY,
    nombre VARCHAR(50),
    correo_electronico VARCHAR(50),
    contraseña VARCHAR(50),
    saldo DECIMAL(10, 2)
);

CREATE TABLE Moneda (
    currency_id INT PRIMARY KEY,
    currency_name VARCHAR(50),
    currency_symbol VARCHAR(10)
);

CREATE TABLE Transaccion (
    transaction_id INT PRIMARY KEY,
    sender_user_id INT,
    receiver_user_id INT,
    currency_id INT,
    importe DECIMAL(10, 2),
    transaction_date DATE,
    FOREIGN KEY (sender_user_id) REFERENCES Usuario(user_id),
    FOREIGN KEY (receiver_user_id) REFERENCES Usuario(user_id),
    FOREIGN KEY (currency_id) REFERENCES Moneda(currency_id)
);

-- llenar datos en la tabla Usuario
INSERT INTO Usuario (user_id, nombre, correo_electronico, contraseña, saldo) VALUES 
(1, 'Juan', 'juan@gmail.com', 'seguridad1', 1000.00),
(2, 'Maria', 'maria@gmail.com', 'seguridad2', 2000.00),
(3, 'Carlos', 'carlos@gmail.com', 'seguridad3', 1500.00);

-- llenar datos en la tabla Moneda
INSERT INTO Moneda (currency_id, currency_name, currency_symbol) VALUES 
(1, 'Dólar', '$'),
(2, 'Euro', '€'),
(3, 'Yen', '¥');

-- llenar datos en la tabla Transaccion
INSERT INTO Transaccion (transaction_id, sender_user_id, receiver_user_id, importe, transaction_date) VALUES 
(1, 1, 2, 100.00, '2024-03-29'),
(2, 2, 3, 200.00, '2024-03-30'),
(3, 3, 1, 150.00, '2024-03-31');

SELECT Usuario.nombre, Transaccion.importe, Moneda.currency_name
FROM Transaccion
JOIN Usuario ON Transaccion.sender_user_id = Usuario.user_id
JOIN Moneda ON Transaccion.currency_id = Moneda.currency_id
ORDER BY Usuario.nombre;

-- Consulta para obtener el nombre de la moneda elegida por un usuario específico
SELECT currency_name FROM Moneda WHERE currency_id IN (SELECT currency_id FROM Usuario WHERE user_id = 1);

-- Consulta para obtener todas las transacciones registradas
SELECT * FROM Transaccion;

-- Consulta para obtener todas las transacciones realizadas por un usuario específico
SELECT * FROM Transaccion WHERE sender_user_id = 1 OR receiver_user_id = 1;

-- modificar el campo correo electrónico de un usuario específico
 UPDATE Usuario SET correo_electronico = trabajador1@gmail.com WHERE user_id = 1;

-- Sentencia para eliminar los datos de una transacción
DELETE FROM Transaccion WHERE transaction_id = 3;