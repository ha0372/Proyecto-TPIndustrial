-- Crear la tabla "rol"
go
CREATE TABLE "rol" (
  id INT IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL
);

-- Crear tabla "usuario" con relación a "rol"
CREATE TABLE usuario (
  id INT IDENTITY(1,1) PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  password VARCHAR(100) NOT NULL,
  email VARCHAR(100) NOT NULL,
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  rol_id INT,
  FOREIGN KEY (rol_id) REFERENCES rol(id)
);

CREATE TABLE empleado (
  id INT IDENTITY(1,1) PRIMARY KEY,
  nombre VARCHAR(50) NOT NULL,
  apellido VARCHAR(50) NOT NULL,
  direccion VARCHAR(100) NOT NULL,
  telefono VARCHAR(20) NOT NULL,
  usuario_id INT,
  FOREIGN KEY (usuario_id) REFERENCES usuario(id)
);
-- Crear tabla "pedido"
CREATE TABLE pedido (
  id INT IDENTITY(1,1) PRIMARY KEY,
  fecha_pedido DATE NOT NULL,
  total DECIMAL(10,2) NOT NULL,
  estado VARCHAR(20) NOT NULL,
  producto_id INT,
  cantidad INT,
  FOREIGN KEY (producto_id) REFERENCES inventario(id)
);

-- Crear tabla "compra"
CREATE TABLE compra (
  id INT IDENTITY(1,1) PRIMARY KEY,
  fecha_compra DATE NOT NULL,
  total DECIMAL(10,2) NOT NULL,
  proveedor VARCHAR(50) NOT NULL,
  producto_id INT,
  cantidad INT,
  FOREIGN KEY (producto_id) REFERENCES inventario(id)
);

-- Crear tabla "inventario"
CREATE TABLE inventario (
  id INT IDENTITY(1,1) PRIMARY KEY,
  producto VARCHAR(50) NOT NULL,
  cantidad INT NOT NULL,
  precio DECIMAL(10,2) NOT NULL
);
