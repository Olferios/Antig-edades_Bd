create database antiguedades;
use antiguedades;

CREATE TABLE tipoidentificacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE rol (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE permiso (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE tipoantiguedad (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE estadoconservacion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);
create table tipoestadopieza(
	id int auto_increment primary key,
	nombre varchar(50) not null
);

CREATE TABLE tipoestadoentrega (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE tipotransaccion (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE metododepago (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL
);

CREATE TABLE persona (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    idtipoidentificacion INT,
    numeroidentificacion VARCHAR(20) NOT NULL,
    idrol INT NOT NULL,
    idpermiso INT NOT NULL,
    FOREIGN KEY (idtipoidentificacion) REFERENCES tipoidentificacion(id),
    FOREIGN KEY (idrol) REFERENCES rol(id),
    FOREIGN KEY (idpermiso) REFERENCES permiso(id)
);

CREATE TABLE pieza (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    idtipoantiguedad INT NOT NULL,
    descripcion VARCHAR(50) NOT NULL,
    foto VARCHAR(50) NOT NULL,
    epoca DATE NOT NULL,
    idestadoconservacion INT NOT NULL,
    precio FLOAT(10,2) NOT NULL,
    idpropietario INT NOT NULL,
    FOREIGN KEY (idtipoantiguedad) REFERENCES tipoantiguedad(id),
    FOREIGN KEY (idestadoconservacion) REFERENCES estadoconservacion(id),
    FOREIGN KEY (idpropietario) REFERENCES persona(id)
);

CREATE TABLE inventario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    idpieza INT NOT NULL,
    cantidad INT NOT NULL,
    idestado
    FOREIGN KEY (idpieza) REFERENCES pieza(id),
    FOREIGN KEY (idestado) REFERENCES tipoestadopieza(id)
);

CREATE TABLE transaccion_venta (
    id INT AUTO_INCREMENT PRIMARY KEY,
    precioventa FLOAT(10,2),
    idpersona INT,
    idtipotransaccion INT NOT NULL,
    idmetodopago INT NOT NULL,
    idpieza INT NOT NULL,
    fecha_venta DATE NOT NULL,  -- Nueva columna añadida
    FOREIGN KEY (idpersona) REFERENCES persona(id),
    FOREIGN KEY (idtipotransaccion) REFERENCES tipotransaccion(id),
    FOREIGN KEY (idmetodopago) REFERENCES metododepago(id),
    FOREIGN KEY (idpieza) REFERENCES pieza(id)
);


CREATE TABLE estadoentrega (
    idtransaccion INT,
    idtipoentrega INT,
    PRIMARY KEY (idtransaccion, idtipoentrega),
    FOREIGN KEY (idtransaccion) REFERENCES transaccion_venta(id),
    FOREIGN KEY (idtipoentrega) REFERENCES tipoestadoentrega(id)
);
