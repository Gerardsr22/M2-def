\c template1

DROP DATABASE cinefil IF EXISTS;

CREATE DATABASE cinefil;

c\ cinefil

-- Creació de les taules

-- Taula Tema
CREATE TABLE Tema (
    Id_tema VARCHAR(5) CONSTRAINT Tema_Id_tema_pk PRIMARY KEY,
    Nom VARCHAR(100) NOT NULL
);

-- Taula Companyia
CREATE TABLE Companyia (
    Id_companyia VARCHAR(5) CONSTRAINT Companyia_Id_companyia_pk PRIMARY KEY,
    Nom VARCHAR(100) NOT NULL
);

-- Taula Ciutat
CREATE TABLE Ciutat (
    Id_ciutat VARCHAR(5) CONSTRAINT Ciutat_Id_ciutat_pk PRIMARY KEY,
    Nom VARCHAR(100) NOT NULL
);

-- Taula Actor
CREATE TABLE Actor (
    Id_actor VARCHAR(5) CONSTRAINT Actor_Id_actor_pk PRIMARY KEY,
    Paper VARCHAR(100),
    Premis INTEGER
);

-- Taula Pel·licula
CREATE TABLE Pellicula (
    Id_peli VARCHAR(5) CONSTRAINT Pellicula_Id_peli_pk PRIMARY KEY,
    Nom VARCHAR(200) NOT NULL,
    any SMALLINT,
    pressupost DECIMAL(15,2),
    director VARCHAR(100),
    Id_tema VARCHAR(5) CONSTRAINT Pellicula_Id_tema_fk FOREIGN KEY (Id_tema) REFERENCES Tema(Id_tema),
    Id_companyia VARCHAR(5) CONSTRAINT Pellicula_Id_companyia_fk FOREIGN KEY (Id_companyia) REFERENCES Companyia(Id_companyia)
);

--Taula Data
CREATE TABLE Data (
    data_inici DATE CONSTRAINT Data_data_inici_pk PRIMARY KEY
);

-- Taula TemaXAct
CREATE TABLE TemaXAct (
    Id_tema VARCHAR(5) CONSTRAINT TemaXAct_Id_tema_fk FOREIGN KEY (Id_tema) REFERENCES Tema(Id_tema),
    Id_actor VARCHAR(5) CONSTRAINT TemaXAct_Id_actor_fk FOREIGN KEY (Id_actor) REFERENCES Actor(Id_actor),
    habilitat INTEGER,
    CONSTRAINT TemaXAct_pk PRIMARY KEY (Id_tema, Id_actor)
);

-- Taula Subs
CREATE TABLE Subs (
    Id_actor VARCHAR(5) CONSTRAINT Subs_Id_actor_fk FOREIGN KEY (id_actor) REFERENCES Actor(Id_actor),
    Id_actor_subs VARCHAR(5) CONSTRAINT Subs_Id_actor_subs_fk FOREIGN KEY (Id_actor_subs) REFERENCES Actor(Id_actor),
    grau INTEGER,
    CONSTRAINT Subs_pk PRIMARY KEY (Id_actor, Id_actor_subs)
);

-- Taula Compatible
CREATE TABLE Compatible (
    Id_actor VARCHAR(5) CONSTRAINT Compatible_Id_actor_fk FOREIGN KEY (Id_actor) REFERENCES Actor(Id_actor),
    Id_actor_compatible VARCHAR(5) CONSTRAINT Compatible_Id_actor_compatible_fk FOREIGN KEY (Id_actor_compatible) REFERENCES Actor(Id_actor),
    CONSTRAINT Compatible_pk PRIMARY KEY (Id_actor, Id_actor_compatible)
);

-- Taula Representació
CREATE TABLE Representacio (
    Id_ciutat VARCHAR(5) CONSTRAINT Representacio_Id_ciutat_fk FOREIGN KEY (Id_ciutat) REFERENCES Ciutat(Id_ciutat),
    Id_companyia VARCHAR(5) CONSTRAINT Representacio_Id_companyia_fk FOREIGN KEY (Id_companyia) REFERENCES Companyia(Id_companyia),
    CONSTRAINT Representacio_pk PRIMARY KEY (Id_ciutat, Id_companyia)
);

-- Taula Contacte
CREATE TABLE Contacte (
    data_inici DATE,
    Id_actor VARCHAR(5) CONSTRAINT Contacte_Id_actor_fk FOREIGN KEY (Id_actor) REFERENCES Actor(Id_actor),
    Id_companyia VARCHAR(5) CONSTRAINT Contacte_Id_companyia_fk FOREIGN KEY (Id_companyia) REFERENCES Companyia(Id_companyia),
    data_final DATE,
    CONSTRAINT Contacte_pk PRIMARY KEY (data_inici, Id_actor)
);

-- Taula Repart
CREATE TABLE Repart (
    Id_peli VARCHAR(5) CONSTRAINT Repart_Id_peli_fk FOREIGN KEY (Id_peli) REFERENCES Pellicula(Id_peli),
    Id_actor VARCHAR(5) CONSTRAINT Repart_Id_actor_fk FOREIGN KEY (Id_actor) REFERENCES Actor(Id_actor),
    Id_premi INTEGER,
    paper VARCHAR(100),
    CONSTRAINT Repart_pk PRIMARY KEY (id_peli, id_actor)
);

-- Taula Rodatge
CREATE TABLE Rodatge (
    Id_ciutat VARCHAR(5) CONSTRAINT Rodatge_Id_ciutat_fk FOREIGN KEY (Id_ciutat) REFERENCES Ciutat(Id_ciutat),
    data_inici DATE CONSTRAINT Rodatge_data_inici_fk FOREIGN KEY (data_inici) REFERENCES Data(data_inici),
    Id_peli VARCHAR(5) CONSTRAINT Rodatge_Id_peli_fk FOREIGN KEY (Id_peli) REFERENCES Pellicula(Id_peli),
    data_final DATE,
    CONSTRAINT Rodatge_pk PRIMARY KEY (Id_ciutat, data_inici, Id_peli)
);

-- Inserts d'exemple

-- Insert Tema
INSERT INTO Tema (Nom) 
VALUES ('Ciència-ficció');

-- Insert Companyia
INSERT INTO Companyia (Nom) 
VALUES ('Mediapro');

-- Insert Ciutat
INSERT INTO Ciutat (Nom) 
VALUES ('Barcelona');

-- Insert Actor
INSERT INTO Actor (Paper, Premis) 
VALUES ('Protagonista', 3);

-- Insert Pel·lícula
INSERT INTO Pellicula (Nom, any, pressupost, director, Id_tema, Id_companyia) 
VALUES ('Els últims dies', 2023, 1000000.00, 'Alex Pastor', 1, 1);

-- Insert TemaXAct
INSERT INTO TemaXAct (Id_tema, Id_actor, habilitat) 
VALUES (1, 1, 9);

-- Insert Subs
INSERT INTO Subs (Id_actor, Id_actor_subs, grau) 
VALUES (1, 1, 5);

-- Insert Compatible
INSERT INTO Compatible (Id_actor, Id_actor_compatible) 
VALUES (1, 1);

-- Insert Representació
INSERT INTO Representacio (Id_ciutat, Id_companyia) 
VALUES (1, 1);

-- Insert Contacte
INSERT INTO Contacte (data_inici, Id_actor, Id_companyia, data_final) 
VALUES ('2025-01-01', 1, 1, '2025-12-31');

-- Insert Repart
INSERT INTO Repart (id_peli, id_actor, id_premi, paper) 
VALUES (1, 1, 1, 'Marc');

-- Insert Rodatge
INSERT INTO Rodatge (Id_ciutat, data_inici, Id_peli, data_final) 
VALUES (1, '2024-06-01', 1, '2024-12-31');