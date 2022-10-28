USE `db_cyberkong`;
DROP procedure IF EXISTS `db_cyberkong`.`sp_UsuarioActions`;
;
DELIMITER $$
USE `db_cyberkong`$$
CREATE PROCEDURE `sp_UsuarioActions`(
in _action tinyint,
in _user_id int,
in _email varchar(40),
in _username varchar(30),
in _userpassword varchar(65),
in _nombre varchar(50),
in _apPat varchar(25),
in _apMat varchar(25),
in _sexo tinyint,
in _fechaNacimiento date,
in _fechaIngreso datetime,
in _img_data mediumblob,
in _img_type varchar(15),
in _rol_id int,
in _state_id int,
in _token varchar(45)
)
BEGIN
	if _action = 1 then
		insert into 
		t_usuarios
		(email, username, user_password, user_nombre, 
		user_apPat, user_apMat, user_sex, fecha_nac, 
		fecha_in, imagen_usuario, image_type, ROL_ID, ESTADO_ID)
		value
		(_email, _username, _userpassword, _nombre, 
		_apPat, _apMat, _sexo, _fechaNacimiento, 
		_fechaIngreso, _img_data, _img_type, _rol_id, _state_id);

		set @user_id := (select max(USER_ID) from t_usuarios);
        
		insert into 
        t_token
        (token, fecha_registro, USER_ID, ESTADO_ID)
        value
        (_token, current_timestamp(), @user_id, 12);
        
    elseif _action = 2 then
		update t_usuarios set 
        email = ifnull(_email, t_usuarios.email),
		username = ifnull(_username, t_usuarios.username),
		user_password = ifnull(_userpassword, t_usuarios.user_password),
		user_nombre = ifnull(_nombre, t_usuarios.user_nombre),
		user_apPat = ifnull(_apPat, t_usuarios.user_apPat),
		user_apMat = ifnull(_apMat, t_usuarios.user_apMat),
		user_sex = ifnull(_sexo, t_usuarios.user_sex),
		fecha_nac = ifnull(_fechaNacimiento, t_usuarios.fecha_nac),
		ROL_ID = ifnull(_rol_id, t_usuarios.ROL_ID),
		image_usuario = ifnull(_img_data, t_usuarios.image_usuario),
		image_type = ifnull(_img_type, t_usuarios.image_type)
		where USER_ID = _user_id;
        
    elseif _action = 3 then
		update t_usuarios 
		set ESTADO_ID = ifnull(_state_id, t_usuario.ESTADO_ID)
		where USER_ID = _user_id;
        
	else 
		SELECT "ACTION NOT EXISTS" AS 'ERROR MESSAGE';
    end if;
END$$

DELIMITER ;
USE `db_cyberkong`;
DROP procedure IF EXISTS `db_cyberkong`.`sp_UsuarioReads`;
;
DELIMITER $$
USE `db_cyberkong`$$
CREATE PROCEDURE `sp_UsuarioReads`(
in _action tinyint,
in _username varchar(30),
in _password varchar(65),
in _userId int,
in _email varchar(40),
in _token varchar(45)
)
BEGIN
	if _action = 1 then
		if _username is not null then
			SELECT 
			u.username as "USUARIO",
			u.user_password as "PASSWORD",
            u.ROL_ID "ROL",
            u.ESTADO_ID "ESTADO",
            t.token as "TOKEN"
			FROM t_usuarios as u
            JOIN t_token as t on u.USER_ID = t.USER_ID
			where u.username = _username;
        end if;
        
		if _email is not null then
			SELECT 
			u.email "EMAIL",
			u.user_password "PASSWORD",
            u.ROL_ID "ROL",
            u.ESTADO_ID "ESTADO",
            t.token "TOKEN"
			FROM t_usuarios as u
            JOIN t_token as t on u.USER_ID = t.USER_ID
			where u.email = _email;
        end if;
	
    elseif _action = 2 then
		if(_username is not null) then
			if (exists(select username from t_usuarios where username = _username)) then
				select 1 as "EXISTS";
			else
				select 0 as "EXISTS";
			end if;
		end if;
        
		if(_email is not null) then
			if (exists(select username from t_usuarios where email = _email)) then
				select 1 as "EXISTS";
			else
				select 0 as "EXISTS";
			end if;
		end if;

    elseif _action = 3 then
		select 
        u.email as "EMAIL",
        u.username as "USUARIO",
        concat(u.user_nombre, " ", u.user_apPat, " ",  u.user_apMat) as "NOMBRE COMPLETO",
        u.user_sex "SEXO",
        u.fecha_nac "FECHA NACIMIENTO",
        u.imagen_usuario "IMG DATA",
        u.image_type "IMG TYPE",
        t.token "TOKEN",
        u.ROL_ID "ROL USUARIO",
        u.ESTADO_ID "ESTADO USUARIO"
        FROM t_usuarios as u
        JOIN t_token as t on u.USER_ID = t.USER_ID
        where u.username = _username;

	elseif _action = 4 then
		select 
        u.email as "EMAIL",
        u.username as "USUARIO",
        concat(u.user_nombre, " ", u.user_apPat, " ",  u.user_apMat) as "NOMBRE COMPLETO",
        u.user_sex "SEXO",
        u.fecha_nac "FECHA NACIMIENTO",
        t.token "TOKEN",
        u.ROL_ID "ROL USUARIO",
        u.ESTADO_ID "ESTADO USUARIO",
        u.imagen_usuario "IMG DATA",
        u.image_type "IMG TYPE"
        FROM t_usuarios as u
        JOIN t_token as t on u.USER_ID = t.USER_ID
        where t.token = _token;
	elseif _action = 5 then
		select 
        u.imagen_usuario "IMG DATA",
        u.image_type "IMG TYPE"
        FROM t_usuarios as u
        JOIN t_token as t on u.USER_ID = t.USER_ID
        -- where t.token = _token;
        where t.token = "b250fc3af2043c0e1297e1c0a411a45c";
    
    end if;
    
END$$

DELIMITER ;
;