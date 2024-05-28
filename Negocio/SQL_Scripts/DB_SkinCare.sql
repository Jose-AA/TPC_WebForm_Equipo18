Create Database SkinCareAlfa;
GO
USe SkinCareAlfa
GO

CREATE TABLE Roles (
    id_rol INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(50) NOT NULL UNIQUE
);
GO
CREATE TABLE Usuarios (
    id_rol INT NOT NULL,
    usuario_id INT PRIMARY KEY IDENTITY(1,1),
    correo_electronico VARCHAR(255) NOT NULL UNIQUE,
    contraseña VARCHAR(50) NOT NULL,
    creado_en DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_rol) REFERENCES Roles(id_rol)    
);
GO
CREATE TABLE Datos_Personales (
    usuario_id INT NOT NULL PRIMARY KEY,
    nombre VARCHAR(50),
	apellido VARCHAR(50),
    telefono VARCHAR(25),
    direccion VARCHAR(100),
    FOREIGN KEY (usuario_id) REFERENCES Usuarios(usuario_id)
);
GO
CREATE TABLE Servicios (
    servicio_id INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(50) NOT NULL,
    descripcion VARCHAR(100),
    duracion INT NOT NULL CHECK(duracion > 0), -- duracion en minutos
    precio MONEY NOT NULL CHECK (precio > 0)
);
GO
CREATE TABLE ServiciosxEspecialistas (
    especialista_id INT NOT NULL,
    servicio_id INT NOT NULL,
    FOREIGN KEY (especialista_id) REFERENCES Usuarios(usuario_id),
    FOREIGN KEY (servicio_id) REFERENCES Servicios(servicio_id),
	PRIMARY KEY(especialista_id, servicio_id)
);
GO
CREATE TABLE Imagenes(
	imagen_id INT NOT NULL PRIMARY KEY identity(1,1),
	url_imagen VARCHAR(255) NOT NULL,
)
GO
CREATE TABLE ImagenesxServicios (
    servicio_id INT NOT NULL,
	imagen_id INT NOT NULL,
    FOREIGN KEY (servicio_id) REFERENCES Servicios(servicio_id),
	FOREIGN KEY (imagen_id) REFERENCES Imagenes(imagen_id)
);
GO
CREATE TABLE Estados(
	estado_id INT NOT NULL PRIMARY KEY Identity(1,1),
	nombre VARCHAR(50) DEFAULT 'Vigente', --Vigente, Finalizado, cancelado
)
GO
CREATE TABLE Turnos (
    turno_id INT PRIMARY KEY IDENTITY(1,1),
    cliente_id INT NOT NULL,
    especialista_id INT NOT NULL,
    servicio_id INT NOT NULL,
	estado_id INT NOT NULL,
    fecha_turno DATETIME NOT NULL CHECK(fecha_turno >= GETDATE()),
    creado_en DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cliente_id) REFERENCES Usuarios(usuario_id),
    FOREIGN KEY (especialista_id) REFERENCES Usuarios(usuario_id),
    FOREIGN KEY (servicio_id) REFERENCES Servicios(servicio_id),
	FOREIGN KEY (estado_id) REFERENCES Estados(estado_id)
);
GO
CREATE TABLE Historia_Clinica (
    historia_clinica_id INT PRIMARY KEY IDENTITY(1,1),
    turno_id INT NOT NULL,
    notas VARCHAR(100) NULL,
    FOREIGN KEY (turno_id) REFERENCES Turnos(turno_id)
);
GO
CREATE TABLE Reseñas (
    reseña_id INT PRIMARY KEY IDENTITY(1,1),
    cliente_id INT NOT NULL,
    especialista_id INT NOT NULL,
    servicio_id INT NOT NULL,
    calificacion INT NOT NULL CHECK (calificacion >= 1 AND calificacion <= 5),
    comentario VARCHAR(100) NOT NULL,
    creado_en DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cliente_id) REFERENCES Usuarios(usuario_id),
    FOREIGN KEY (especialista_id) REFERENCES Usuarios(usuario_id),
    FOREIGN KEY (servicio_id) REFERENCES Servicios(servicio_id)
);

