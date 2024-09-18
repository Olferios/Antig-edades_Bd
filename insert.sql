use antiguedades;

-- Insertar en tipoidentificacion
INSERT INTO tipoidentificacion (nombre) VALUES 
('DNI'),
('Pasaporte'),
('Residencia');

-- Insertar en rol
INSERT INTO rol (nombre) VALUES 
('Admin'),
('Usuario'),
('Invitado');

-- Insertar en permiso
INSERT INTO permiso (nombre) VALUES 
('Leer'),
('Escribir'),
('Modificar');

-- Insertar en tipoantiguedad
INSERT INTO tipoantiguedad (nombre) VALUES 
('Antiguo'),
('Moderno'),
('Raro');

-- Insertar en estadoconservacion
INSERT INTO estadoconservacion (nombre) VALUES 
('Nuevo'),
('Usado'),
('Antiguo');

-- Insertar en tipoestadoentrega
INSERT INTO tipoestadoentrega (nombre) VALUES 
('Pendiente'),
('Enviado'),
('Entregado');

INSERT INTO tipoestadopieza (id, nombre) VALUES
(1, 'Disponible'),
(2, 'en arreglo'),
(3, 'Vendido');


-- Insertar en tipotransaccion
INSERT INTO tipotransaccion (nombre) VALUES 
('Compra'),
('Venta'),
('Devolución');

-- Insertar en metododepago
INSERT INTO metododepago (nombre) VALUES 
('Efectivo'),
('Tarjeta de Crédito'),
('Transferencia');

-- Insertar en persona
INSERT INTO persona (nombre, apellido, idtipoidentificacion, numeroidentificacion, idrol, idpermiso) VALUES 
('Juan', 'Pérez', 1, '12345678A', 1, 1),
('Ana', 'García', 2, '87654321B', 2, 2),
('Luis', 'Martínez', 3, '11223344C', 3, 3);

-- Insertar en pieza
INSERT INTO pieza (nombre, idtipoantiguedad, descripcion, foto, epoca, idestadoconservacion, precio, idpropietario) VALUES 
('Pintura Renacentista', 1, 'Pintura del siglo XV', 'pintura1.jpg', '1450-01-01', 1, 50000.00, 1),
('Escultura Moderna', 2, 'Escultura contemporánea', 'escultura1.jpg', '2000-01-01', 2, 15000.00, 2),
('Joya Antigua', 3, 'Joya del siglo XIX', 'joya1.jpg', '1800-01-01', 3, 20000.00, 3);

-- Insertar en inventario
INSERT INTO inventario (idpieza, cantidad) VALUES 
(1, 1,1),
(2, 5,1),
(3, 2,2);

-- Insertar en transaccion_venta
INSERT INTO transaccion_venta (precioventa, idpersona, idtipotransaccion, idmetodopago, idpieza,fecha_venta) VALUES 
(50000.00, 1, 1, 1, 1,'2024-02-05'),
(15000.00, 2, 2, 2, 2,'2024-08-28'),
(20000.00, 3, 3, 3, 3,'2023-12-12');

-- Insertar en estadoentrega
INSERT INTO estadoentrega (idtransaccion, idtipoentrega) VALUES 
(1, 1),
(2, 2),
(3, 3);
