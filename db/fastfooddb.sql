create database ""

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
