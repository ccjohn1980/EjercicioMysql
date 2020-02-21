﻿DELIMITER $$
DROP PROCEDURE IF EXISTS calcular_tipo_cambio;
CREATE PROCEDURE calcular_tipo_cambio (
	IN monto NUMERIC (6,2),
	OUT monto_final NUMERIC (6,2)
)
BEGIN
	DECLARE tipo_cambio NUMERIC (2,1);
	DECLARE cantidad INT;
	DECLARE nombre VARCHAR (30);
	DECLARE id_prod INT;
	-- SET tipo_cambio := 3.5;
	SELECT COUNT(1) 
		INTO cantidad 
		FROM producto;
	SET monto_final = monto * cantidad;
	SELECT LEFT(MD5(RAND()), 8) INTO nombre;
	SELECT FLOOR( 1 + RAND( ) *60) INTO id_prod;
	INSERT INTO producto
		(id_producto, desc_producto, precio)
		VALUES
		(id_prod, nombre, monto_final);
END$$
DELIMITER ;