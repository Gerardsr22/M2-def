\c template1

DROP DATABASE carreteres IF EXISTS;

CREATE DATABASE carreteres:

\c carreteres;

-- Creació de la taula Carretera
CREATE TABLE Carretera (
    Id_carretera SERIAL PRIMARY KEY,
    Nom VARCHAR(100) NOT NULL
);

-- Creació de la taula Municipi
CREATE TABLE Municipi (
    Id_municipi CONSTRAINT Municipi_Id_municipi_pk PRIMARY KEY,
    Nom VARCHAR(100) NOT NULL
);

-- Creació de la taula Area
CREATE TABLE Area (
    Id_area CONSTRAINT Area_Id_area_ pk PRIMARY KEY,
    Nom VARCHAR(100) NOT NULL
);

-- Creació de la taula Tram
CREATE TABLE Tram (
    Id_tram CONSTRAINT Tram_Id_tram_pk PRIMARY KEY,
    Nom VARCHAR(100) NOT NULL,
    Id_carretera INT NOT NULL,
    Id_area INT NOT NULL,
    CONSTRAINT fk_tram_carretera FOREIGN KEY (Id_carretera) REFERENCES Carretera (Id_carretera),
    CONSTRAINT fk_tram_area FOREIGN KEY (Id_area) REFERENCES Area (Id_area)
);

-- Creació de la taula TramXMunicipi
CREATE TABLE TramXMunicipi (
    Id_tram INT NOT NULL,
    Id_municipi INT NOT NULL,
    km_entrada DECIMAL(10, 2) NOT NULL,
    km_sortida DECIMAL(10, 2) NOT NULL,
    CONSTRAINT TramXMunicipi_pk PRIMARY KEY (Id_tram, Id_municipi),
    CONSTRAINT fk_tramxm_tram FOREIGN KEY (Id_tram) REFERENCES Tram (Id_tram),
    CONSTRAINT fk_tramxm_municipi FOREIGN KEY (Id_municipi) REFERENCES Municipi (Id_municipi)
);

-- Insercions de dades
INSERT INTO Carretera (Nom) VALUES ('C-31');
INSERT INTO Municipi (Nom) VALUES ('Barcelona');
INSERT INTO Area (Nom) VALUES ('Àrea Metropolitana');
INSERT INTO Tram (Nom, Id_carretera, Id_area) VALUES ('Tram 1', 1, 1);
INSERT INTO TramXMunicipi (Id_tram, Id_municipi, km_entrada, km_sortida) VALUES (1, 1, 0.00, 5.50);
