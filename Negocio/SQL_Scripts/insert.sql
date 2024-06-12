USE SkinCareBeta;

-- Insertar roles
INSERT INTO Roles (nombre) VALUES ('Admin'), ('Especialista');

-- Insertar usuarios
INSERT INTO Usuarios (id_rol, correo_electronico, contraseña) VALUES 
(1, 'prueba@prueba.com', '1234'), -- Admin
(2, 'especialista1@prueba.com', '5678'); -- Especialista

-- Insertar estados
INSERT INTO Estados (nombre) VALUES ('Vigente'), ('Finalizado'), ('Cancelado');

-- Insertar servicios
INSERT INTO Servicios (nombre, descripcion, duracion, precio) VALUES 
('Limpieza Facial', 'Limpieza facial profunda', 60, 150),
('Masaje Relajante', 'Masaje relajante de cuerpo completo', 90, 200);