# M-dulo-3---Fundamentos-de-Bases-de-Datos-Relacionales


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
