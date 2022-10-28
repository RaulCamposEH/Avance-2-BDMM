CREATE PROCEDURE `sp_ProductActions` (
in _action int,
in _nombre varchar(30),
in _descripcion text,
in _precio decimal(8,2),
in _cantidad int,

in _valoracion tinyint,
in _estado int,
in _usuario int,
inout _prod_id int
)
BEGIN
	if _action = 1 then
		insert into t_productos
        (prod_nombre, prod_description, precio, prod_cantidad)
        values
        (_nombre, _descripcion, precio, _cantidad);
        
        set _prod_id = (select max(PRODUCTO_ID) from t_productos);
	elseif _action = 2 then
		update t_productos  set
		prod_nombre = ifnull(_nombre, prod_nombre),
		prod_description = ifnull(_descripcion, prod_description),
        precio = ifnull(_precio, precio),
        prod_cantidad = ifnull(_cantidad, prod_cantidad),
        ESTADO_ID = ifnull(_estado, ESTADO_ID),
        prod_valoracion = ifnull(_valoracion, prod_valoracion)
        where PRODUCTO_ID = _prod_id;
	elseif _action = 3 then
		select 3;
    end if;
END
