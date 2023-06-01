CREATE DATABASE dine_smart_db;

/* -------------------USUARIOS Y ROLES-----------------------*/

CREATE TABLE roles(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name varchar(50) NOT NULL,
	description varchar(512) NOT NULL,
	UNIQUE(name)
);

CREATE TABLE state_users(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name varchar(50) NOT NULL,
	description varchar(512) NOT NULL,
	UNIQUE(name)
);

create table users (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    rol_id int NOT NULL,
	state_user_id int NOT NULL,
	email varchar(128) NOT NULL,
	password varchar(64) NOT NULL,
	salt varchar(256) NOT NULL,
	date_creation datetime  NOT NULL,
	image_perfil varchar(255),
	FOREIGN KEY(rol_id) REFERENCES roles(id),
	FOREIGN KEY(state_user_id) REFERENCES state_users(id),
	UNIQUE (email)
);

create table modules(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name varchar(50) NOT NULL,
	description varchar(512) NOT NULL,
	UNIQUE(name)
);

create table operations(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    module_id int not null,
    name varchar(50) NOT NULL,
	description varchar(512) NOT NULL,
	FOREIGN KEY (module_id) REFERENCES modules(id),
	UNIQUE(name)
);

create table rol_operations(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    rol_id int NOT NULL,
    operation_id int not null,
	FOREIGN KEY (rol_id) REFERENCES roles(id),
	FOREIGN KEY (operation_id) REFERENCES operations(id)
);


/*--------------------------------------------Estados----------------------------------------*/

create table states(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name varchar(50) not null,
    description varchar(255) not null
);


/*------------------------------------------- Empleados-----------------------------------*/
-- Create Employees table
CREATE TABLE employees (
    id INT not null PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    lastname VARCHAR(100) NOT NULL,
    address VARCHAR(200) not null,
    phone_number VARCHAR(15) not null,
    email VARCHAR(100) not null,
    date_of_birth DATE not null,
    gender VARCHAR(10) not null,
    marital_tatus VARCHAR(20) not null,
    identification_number VARCHAR(20) NOT NULL,
    nationality VARCHAR(50) not null,
    salary DECIMAL(10,2),
    date_creation datetime  NOT NULL,
    UNIQUE(identification_number,email,phone_number)
);

create table employee_users(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    employee_id int not null,
    users_id int not null;
    FOREIGN KEY (employees) REFERENCES employees(id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);

-- Create table ContactoEmergencia
CREATE TABLE emergency_contacts (
    id INT not null PRIMARY KEY AUTO_INCREMENT,
    employee_id int not null,
    name_contact VARCHAR(100) not null,
    relation VARCHAR(50) not null,
    phone_contact VARCHAR(15) not null,
    email_contact VARCHAR(100),
    FOREIGN KEY (employee_id) REFERENCES employees(id)
);

create table job_vacancies(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name varchar(50) NOT NULL,
	description varchar(512) NOT NULL,
	min_salary decimal(10,2),
	max_salary decimal(10,2),
	UNIQUE(name)
);

create table employee_positions(
    id INT not null PRIMARY KEY AUTO_INCREMENT,
    employee_id int not null,
    job_vacancies_id int not null,
    FOREIGN KEY (employee_id) REFERENCES employees(id),
    FOREIGN KEY (job_vacancies_id) REFERENCES job_vacancies(id)
);



-- Create table Horarios
CREATE TABLE schedule (
    id INT not null PRIMARY KEY AUTO_INCREMENT,
    employee_positions_id INT not null,
    start_time DATETIME not null,
    end_time DATETIME not null,
    weekday VARCHAR(20) not null,
    FOREIGN KEY (employee_positions_id) REFERENCES employee_positions(id)
);

-- Create table Vacaciones
CREATE TABLE vacaciones (
    id INT not null PRIMARY KEY AUTO_INCREMENT,
    employee_positions_id INT not null,
    start_date DATE not null,
    end_date DATE not null,
    FOREIGN KEY (employee_positions_id) REFERENCES employee_positions(id)
);

-- Create table Permisos
CREATE TABLE permisos (
    id INT not null PRIMARY KEY AUTO_INCREMENT,
    employee_positions_id INT not null,
    start_date DATE not null,
    end_date DATE not null,
    reason VARCHAR(100) not null,
    FOREIGN KEY (employee_positions_id) REFERENCES employee_positions(id)
);

-- Create table Registro de Asistencia
CREATE TABLE work_attendance (
    id INT not null PRIMARY KEY AUTO_INCREMENT,
    employee_positions_id INT not null,
    "date" DATE not null,
    arrival_time TIME not null,
    departure_time TIME not null,
    FOREIGN KEY (employee_positions_id) REFERENCES employee_positions(id)
);




/* -----------------------------Inventario Y Productos-------------------------------*/
-- TABLA DE SUCURSAL
CREATE TABLE branches (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    state_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone VARCHAR(24) NOT NULL,
    FOREIGN KEY (state_id) REFERENCES states(id),
    UNIQUE (name,address,phone)
);

-- TABLA DE PRODUCTOS
CREATE TABLE products (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    state_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    brand VARCHAR(100) NOT NULL,
    description VARCHAR(255),
--    price DECIMAL(10, 2) NOT NULL,
--    quantity INT NOT NULL,
    unit VARCHAR(50),
    FOREIGN KEY (state_id) REFERENCES states(id)
--    expiration_date date not null
--    branch_id INT NOT NULL,
--    FOREIGN KEY (branch_id) REFERENCES branches(branch_id)
);

-- TABLA DE INVENTARIO
CREATE TABLE inventory_products (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    state_id int not null,
    branch_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    entry_date datetime not null,
    expiration_date date not null,
    FOREIGN KEY (state_id) REFERENCES states(id),
    FOREIGN KEY (branch_id) REFERENCES branches(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- historial de inventario
CREATE TABLE inventory_product_histories (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    product_id INT not null,
    "date" DATETIME  not null,
    quantity INT not null,
    previous_quantity INT not null,
    new_quantity INT not null,
    reason VARCHAR(255),
    sucess varchar(50) not null,
    FOREIGN KEY (product_id) REFERENCES products(id)
);


/* -------------------Categorias y Menu  combos ----------------*/


/*-------------------- Proveedor y Compras------------------------------------------*/
-- TABLA DE PROVEEDORES
CREATE TABLE suppliers (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    state_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL,
    web VARCHAR(255),
    FOREIGN KEY (state_id) REFERENCES states(id)
);

-- tabla de Compras
CREATE TABLE purchase_orders (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    state_id int not null,
    supplier_id INT not null,
    purchase_code varchar(255) not null,
    start_date datetime not null,
    end_date datetime not null,
    total DECIMAL(10, 2) not null,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(id),
    FOREIGN KEY (state_id) REFERENCES states(id),
    unique(purchase_code)
);

-- Tabla de detalle compra
CREATE TABLE purchase_order_details (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    purchase_id INT not null,
    product_id INT not null,
    quantity INT not null,
    unit_price DECIMAL(10, 2) not null,
    sub_total DECIMAL(10, 2) not null,
    FOREIGN KEY (purchase_id) REFERENCES purchase_orders(purchase_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Tabla de Historial de ordenes

/*----------------------------------- Clientes , Pedidos y Ventas-----------------------*/

-- tabla de clientes
create table customers(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name varchar(100) not null,
    last_name varchar(100) not null,
    address varchar(255) not null,
    phone varchar(50) not null
);

create table customer_users(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    customer_id int not null,
    users_id int not null;
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (users_id) REFERENCES users(id)
);


-- tabla de ordenes
CREATE TABLE transactions (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    customer_id int not null,
    transactions_name varchar(100) not null,
    transaction_date DATETIME not null,
    total DECIMAL(10, 2) not null,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- Create "order_details" table
CREATE TABLE transaction_details (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    transaction_id INT not null,
    menu_id INT not null,
    quantity INT not null,
    unit_price DECIMAL(10, 2) not null,
    subtotal DECIMAL(10, 2) not null,
    FOREIGN KEY (transaction_id) REFERENCES transactions(id),
    FOREIGN KEY (menu_id) REFERENCES menu(id)
);

CREATE TABLE order_types(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name varchar(50) NOT NULL,
	description varchar(512) NOT NULL,
	UNIQUE(name)
);

CREATE TABLE orders (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    transaction_id INT not null,
    order_type_id int not null,
    state_id int not null,
    order_code varchar(255) not null,
    start_date datetime not null,
    end_date datetime not null,
    FOREIGN KEY (transaction_id) REFERENCES transactions(id),
    FOREIGN KEY (order_type_id) REFERENCES order_types(id),
    FOREIGN KEY (state_id) REFERENCES states(id),
    UNIQUE(order_code)
);


CREATE TABLE assignment_types(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name varchar(50) NOT NULL,
	description varchar(512) NOT NULL,
	UNIQUE(name)
);

create table order_assignments(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    order_id int not null,
    employee_id int not null,
    assignment_type_id int not null,
    state_id int not null,
    start_date datetime not null,
    end_date datetime not null,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (employee_id) REFERENCES employees(id),
    FOREIGN KEY (assignment_type_id) REFERENCES assignment_types(id),
    FOREIGN KEY (state_id) REFERENCES states(id)
);

CREATE TABLE sales (
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    transaction_id INT not null,
    state_id int not null,
    employee_id int not null,
    sale_code varchar(255) not null,
    start_date datetime not null,
    end_date datetime not null,
    FOREIGN KEY (transaction_id) REFERENCES transactions(id),
    FOREIGN KEY (employee_id) REFERENCES employees(id),
    FOREIGN KEY (state_id) REFERENCES states(id),
    UNIQUE(order_code)
);


CREATE TABLE payment_type(
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name varchar(50) NOT NULL,
	description varchar(512) NOT NULL,
	UNIQUE(name)
);

create  table payments(
    id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sale_id int not null,
    payment_type_id int not null,
    state_id int not null,
    start_date datetime not null,
    end_date datetime not null,
    FOREIGN KEY (sale_id) REFERENCES sales(id),
    FOREIGN KEY (payment_type_id) REFERENCES payment_type(id),
    FOREIGN KEY (state_id) REFERENCES states(id)
);











