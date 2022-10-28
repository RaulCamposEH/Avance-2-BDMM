drop database if exists db_cyberkong;
create database db_cyberkong;
use db_cyberkong;

create table t_usuarios(
USER_ID int auto_increment, -- PK
email varchar(40) not null unique,
username varchar(30) not null unique,
user_password varchar(65) not null,
user_nombre varchar(50) not null,
user_apPat varchar(25) not null,
user_apMat varchar(25) not null,
user_sex tinyint not null,
fecha_nac date not null,
fecha_in datetime not null,
imagen_usuario mediumblob not null,
image_type varchar(15) not null,

ROL_ID int not null, -- FK
ESTADO_ID int not null, -- FK

constraint PK_usuarios
	primary key(USER_ID)
);

create table t_static_rol(
ROL_ID int, -- PK
user_rol varchar(10),

constraint PK_rol
	primary key(ROL_ID)
);

create table t_static_state(
ESTADO_ID int, -- PKt_multimedia
descripcion varchar(30),

constraint PK_state
	primary key(ESTADO_ID)
);

create table t_token(
TOKEN_ID int auto_increment, -- PK
token varchar(45) DEFAULT NULL,
fecha_registro datetime DEFAULT NULL,

USER_ID int not null, -- FK
ESTADO_ID int not null, -- FK

constraint PK_token
	primary key(TOKEN_ID)
);

create table t_productos(
PRODUCTO_ID int auto_increment,
prod_nombre varchar(30) not null,
prod_description text not null,
precio decimal(8,2),
prod_cantidad int,
prod_valoracion tinyint,

ESTADO_ID int not null, -- FK
USER_ID int, -- FK

constraint PK_productos
	primary key(PRODUCTO_ID)
);

create table t_multimedia(
MEDIA_ID int auto_increment,
media_data mediumblob not null,
media_type varchar(15) not null,
fecha_subida datetime not null,

PRODUCTO_ID int, -- FK

constraint PK_multimedia
	primary key(MEDIA_ID)
);

-- tabla asociativa
-- create table t_media_productos(
-- MEDIA_ID int,  -- FK
-- PRODUCTO_ID int, -- FK
-- );

create table t_comentarios(
COMENTARIO_ID int auto_increment, -- PK
com_contenido text not null,
com_valoracion int not null,
com_fecha datetime not null,

PRODUCTO_ID int, -- FK
USER_ID int, -- FK

constraint PK_comentarios
	primary key (COMENTARIO_ID)
);

create table t_lista_deseados(
LISTA_ID int auto_increment, -- PK
lista_descripcion text not null,
lista_longitud int not null,

USER_ID int, -- FK
ESTADO_ID int, -- FK

constraint PK_lista_deseados
	primary key(LISTA_ID)
);

-- tabla asociativa 
create table t_lista_prod(
PRODUCTO_ID int, -- FK
LISTA_ID int, -- FK
fecha_ag datetime not null
);

create table t_carrito(
listado_carrito json default null,

USER_ID int, -- FK
ESTADO_ID int -- FK
);

create table t_venta(
VENTA_ID int auto_increment, -- PK
fecha_venta date not null,

total decimal(8,2), 
USER_ID int, -- FK

constraint PK_venta
	primary key(VENTA_ID)
);

create table t_venta_detalle(
DETALLE_VENTA_ID int auto_increment, -- PK

cantidad int not null,
precio decimal(8,2) not null,
importe decimal(8,2),

VENTA_ID int, -- FK
PRODUCTO_ID int, -- FK

constraint PK_detalle_venta
	primary key(DETALLE_VENTA_ID)
);

create table t_categorias(
CATEGORIA_ID int auto_increment, -- PK
cat_nombre varchar(20) not null,
cat_descripcion varchar(250) not null,

USER_ID int, -- FK

constraint PK_cat
	primary key(CATEGORIA_ID)
);

-- tabla asociativa
create table t_cat_prod(
CATEGORIA_ID int, -- FK
PRODUCTO_ID int -- FK
);

-- FK Constraints

alter table t_usuarios
	add constraint FK_usuarios_rol
		foreign key(ROL_ID)
		references t_static_rol(ROL_ID),
    add constraint FK_usuarios_state
		foreign key(ESTADO_ID)
		references t_static_state(ESTADO_ID);

alter table t_token
	add constraint FK_token_user
		foreign key(USER_ID)
        references t_usuarios(USER_ID),
	add constraint FK_token_state
		foreign key(ESTADO_ID)
        references t_static_state(ESTADO_ID);

alter table t_productos
	add constraint FK_prod_state
		foreign key(ESTADO_ID)        
		references t_static_state(ESTADO_ID),
	add constraint FK_prod_user
		foreign key(USER_ID)
        references t_usuarios(USER_ID);

alter table t_multimedia
	add constraint FK_Multimedia_Prod
		foreign key(PRODUCTO_ID)        
		references t_productos(PRODUCTO_ID);

alter table t_comentarios
	add constraint FK_comment_prod
		foreign key(PRODUCTO_ID)
        references t_productos(PRODUCTO_ID),
	add constraint FK_comment_user
		foreign key(USER_ID)
        references t_usuarios(USER_ID);
        
alter table t_lista_deseados
	add constraint FK_lista_user
		foreign key(USER_ID)
        references t_usuarios(USER_ID),
	add constraint FK_lista_state
		foreign key(ESTADO_ID)
        references t_static_state(ESTADO_ID);
        
alter table t_lista_prod
	add constraint FK_prod_li
		foreign key(PRODUCTO_ID)
        references t_productos(PRODUCTO_ID),
	add constraint FK_lista_li
		foreign key(LISTA_ID)
        references t_lista_deseados(LISTA_ID);
        
alter table t_carrito
	add constraint FK_carrito_user
		foreign key(USER_ID)
        references t_usuarios(USER_ID),
	add constraint FK_carrito_state
		foreign key(ESTADO_ID)
        references t_static_state(ESTADO_ID);
        
alter table t_venta
	add constraint FK_venta_comprador
		foreign key(USER_ID)
        references t_usuarios(USER_ID);
        
alter table t_venta_detalle
	add constraint FK_detalleVenta_venta
		foreign key(VENTA_ID)
        references t_venta(VENTA_ID),
	add constraint FK_detalleVenta_producto
		foreign key(PRODUCTO_ID)
        references t_productos(PRODUCTO_ID);
        
alter table t_categorias
	add constraint FK_cat_user
		foreign key(USER_ID)
        references t_usuarios(USER_ID);

alter table t_cat_prod
	add constraint FK_categoria
		foreign key(CATEGORIA_ID)
        references t_categorias(CATEGORIA_ID),
	add constraint FK_producto_cat
		foreign key(PRODUCTO_ID)
        references t_productos(PRODUCTO_ID);

-- static inserts

insert into t_static_state(ESTADO_ID, descripcion)
values
(1, "USUARIO PUBLICO"),
(2, "USUARIO PRIVADO"),
(3, "USUARIO ELIMINADO"),
(4, "LISTA PUBLICA"),
(5, "LISTA PRIVADA"),
(6, "CARRITO ACTIVO"),
(7, "CARRITO VACIO"),
(8, "PRODUCTO AGOTADO"),
(9, "PRODUCTO COTIZABLE"),
(10, "PRODUCTO DISPONIBLE"),
(11, "PRODUCTO ELIMINADO"),
(12, "TOKEN ACTIVO"),
(13, "TOKEN INACTIVO"); 

insert into t_static_rol(ROL_ID, user_rol)
values
(1, "COMPRADOR"),
(2, "VENDEDOR"),
(3, "ADMIN"),
(4, "SUPER_AD");
