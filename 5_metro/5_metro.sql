\c template1

DROP DATABASE metro IF EXISTS;

CREATE DATABASE metro;

\c metro

-- Creació de tabla Tren
CREATE TABLE Tren (
    Id_tren INT CONSTRAINT tren_Id_tren_pk PRIMARY KEY,
    Nom VARCHAR(100),
    Codi_linia VARCHAR(50)
);

-- Creació de tabla Linia
CREATE TABLE Linia (
    Codi_linia VARCHAR(50) CONSTRAINT Linia_Codi_linia_pk PRIMARY KEY,
    Nom VARCHAR(100)
);

-- Creació de tabla Data
CREATE TABLE Data (
    data_inici DATE CONSTRAINT Data_data_inici_pk PRIMARY KEY
);

-- Creació de tabla Estacio
CREATE TABLE Estacio (
    Id_estacio INT CONSTRAINT Estacio_Id_estacio_pk PRIMARY KEY,
    Nom VARCHAR(100)
);

-- Creació de tabla EstacioPerLinia
CREATE TABLE EstacioPerLinia (
    Codi_linia VARCHAR(50),
    data_inici DATE,
    Id_estacio INT,
    data_fi DATE,
    CONSTRAINT EstacioPerLinia_Codi_linia_pk PRIMARY KEY (Codi_linia, data_inici, Id_estacio),
    CONSTRAINT EstacioPerLinia_Codi_linia_fk FOREIGN KEY (Codi_linia) REFERENCES Linia(Codi_linia),
    CONSTRAINT EstacioPerLinia_data_inici_fk FOREIGN KEY (data_inici) REFERENCES Data(data_inici),
    CONSTRAINT EstacioPerLinia_Id_estacio_fk FOREIGN KEY (Id_estacio) REFERENCES Estacio(Id_estacio)
);

-- Creació de tabla Acces
CREATE TABLE Acces (
    Id_acces INT PRIMARY KEY,
    Nom VARCHAR(100),
    Ascensor BOOLEAN,
    Id_estacio INT,
    CONSTRAINT Acces_Id_estacio_fk FOREIGN KEY (Id_estacio) REFERENCES Estacio(Id_estacio)
);

-- Creació de tabla Cotxeres
CREATE TABLE Cotxeres (
    Id_cotxera INT PRIMARY KEY,
    Nom VARCHAR(100),
    Id_estacio INT,
    CONSTRAINT Cotxeres_Id_estacio_fk FOREIGN KEY (Id_estacio) REFERENCES Estacio(Id_estacio)
);

-- Afegir la clau foranea a Tren
ALTER TABLE Tren
ADD FOREIGN KEY (Codi_linia) REFERENCES Linia(Codi_linia);
ADD FOREIGN KEY (Id_cotxera) REFERENCES Cotxeres(Id_cotxeres);


