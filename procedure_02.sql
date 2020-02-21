DELIMITER $$
DROP PROCEDURE IF EXISTS insertar_producto;
CREATE PROCEDURE insertar_producto (
	IN nombre VARCHAR(30),
	IN precio INT
)
BEGIN
	DECLARE id_prod INT;
	SELECT FLOOR( 1 + RAND( ) *60) INTO id_prod;
	INSERT INTO producto
		(id_producto, desc_producto, precio)
		VALUES
		(id_prod, nombre, precio);
END$$
DELIMITER ;