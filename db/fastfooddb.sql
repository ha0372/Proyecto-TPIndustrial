CREATE DATABASE dine_smart_db;

/* -------------------USUARIOS Y ROLES-----------------------*/

CREATE TABLE "roles"(
	"id" int  NOT NULL AUTO_INCREMENT,
	"name" varchar(64)  NOT NULL,
	"description" varchar(512) NOT NULL,
	PRIMARY KEY (id),
	UNIQUE(name)
);

CREATE TABLE "user_states"(
	"id" int NOT NULL AUTO_INCREMENT,
	""
);

create table "users" (
	"id" int  NOT NULL AUTO_INCREMENT,
	"email" varchar(128) NOT NULL,
	"password" varchar(64) NOT NULL,
	"salt" varchar(256) NOT NULL,
	"date_creation" datetime  NOT NULL,
	"rol_id" int NOT NULL,
	"user_state_id" NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (rol_id) REFERENCES "roles"(id)
	FOREIGN KEY (user_state_id) REFERENCES user_states(id),
	UNIQUE (email)
);



/* -----------------------------Inventario Y Productos-------------------------------*/
-- Tabla de Sucursal
CREATE TABLE branches (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    phone VARCHAR(24),
    UNIQUE (name,address,phone)
);

-- Create "products" table
CREATE TABLE products (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    description VARCHAR(255),
    price DECIMAL(10, 2),
    quantity INT,
    unit VARCHAR(50),
    branch_id INT,
    FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
);

-- Create "suppliers" table
CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY,
    name VARCHAR(100),
    address VARCHAR(255),
    phone VARCHAR(20),
    email VARCHAR(100)
);

-- Create "inventory_entries" table
CREATE TABLE inventory_entries (
    entry_id INT PRIMARY KEY,
    product_id INT,
    supplier_id INT,
    date DATE,
    quantity INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

-- Create "inventory_exits" table
CREATE TABLE inventory_exits (
    exit_id INT PRIMARY KEY,
    product_id INT,
    date DATE,
    quantity INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Create "inventory_adjustments" table
CREATE TABLE inventory (
    id INT PRIMARY KEY,
    product_id INT,
    date DATE,
    previous_quantity INT,
    new_quantity INT,
    reason VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

