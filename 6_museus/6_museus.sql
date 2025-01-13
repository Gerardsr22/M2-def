-- Creació de les taules

-- Taula museu
CREATE TABLE museu (
    idMuseu VARCHAR(5) CONSTRAINT museu_idMuseu_pk PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    adress VARCHAR(200) NOT NULL,
    ciutat VARCHAR(100) NOT NULL,
    pais VARCHAR(100) NOT NULL
);

-- Taula sala
CREATE TABLE sala (
    idSala VARCHAR(5) CONSTRAINT sala_idSala_pk PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    idMuseu VARCHAR(5) CONSTRAINT sala_idMuseu_fk FOREIGN KEY (idMuseu) REFERENCES museu(idMuseu)
);

-- Taula obra
CREATE TABLE obra (
    idObra VARCHAR(5) CONSTRAINT obra_idObra_pk PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    format VARCHAR(50),
    tenica VARCHAR(100),
    material VARCHAR(100),
    estil VARCHAR(100),
    idSala VARCHAR(5) CONSTRAINT obra_idSala_fk FOREIGN KEY (idSala) REFERENCES sala(idSala),
    idMuseu VARCHAR(5) CONSTRAINT obra_idMuseu FOREIGN KEY (idMuseu) REFERENCES museu(idMuseu)
);

-- Taula expo
CREATE TABLE expo (
    idExpo VARCHAR(5) CONSTRAINT expo_idExpo_pk PRIMARY KEY,
    nom VARCHAR(100) NOT NULL
);

-- Taula autor
CREATE TABLE autor (
    idAutor VARCHAR(5) CONSTRAINT autor_idAutor_pk PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    nacionalitat VARCHAR(100)
);

-- Taula data
CREATE TABLE data (
    dataInici DATE CONSTRAINT data_dataInici_pk PRIMARY KEY
);

-- Taules de relació
CREATE TABLE obraXexpo (
    idObra VARCHAR(5) CONSTRAINT obraXexpo_idObra_fk FOREIGN KEY (idObra) REFERENCES obra(idObra),
    idExpo VARCHAR(5) CONSTRAINT obraXexpo_idExpo_fk FOREIGN KEY (idExpo) REFERENCES expo(idExpo),
    CONSTRAINT obraXexpo_pk PRIMARY KEY (idObra, idExpo)
);

CREATE TABLE autorXobra (
    idObra VARCHAR(5) CONSTRAINT autorXobra_idObra_fk FOREIGN KEY (idObra) REFERENCES obra(idObra),
    idAutor VARCHAR(5) CONSTRAINT autorXobra_idAutor_fk FOREIGN KEY (idAutor) REFERENCES autor(idAutor),
    CONSTRAINT autorXobra_pk PRIMARY KEY (idObra, idAutor)
);

CREATE TABLE autorXmuseu (
    idMuseu VARCHAR(5) CONSTRAINT autorXmuseu_idMuseu_fk FOREIGN KEY (idmuseu) REFERENCES museu(idMuseu),
    idAutor VARCHAR(5) CONSTRAINT autorXmuseu_idAutor_fk FOREIGN KEY (idAutor) REFERENCES autor(idAutor),
    dataInici DATE CONSTRAINT autorXmuseu_dataInici_fk FOREIGN KEY (dataInici) REFERENCES data(dataInici),
    dataFi DATE,
    CONSTRAINT autorXmuseu_pk PRIMARY KEY (idMuseu, idAutor)
);

-- Inserció de dades d'exemple

-- Insert a museu
INSERT INTO museu (nom, adress, ciutat, pais) 
VALUES ('Museu Nacional d''Art de Catalunya', 'Palau Nacional, Parc de Montjuïc', 'Barcelona', 'Catalunya');

-- Insert a sala
INSERT INTO sala (nom, idMuseu) 
VALUES ('Sala d''Art Romànic', 1);

-- Insert a obra
INSERT INTO obra (nom, tipo, format, tenica, material, estil, idSala, idMuseu) 
VALUES ('Mare de Déu de Montserrat', 'Pintura', 'Retaule', 'Tremp sobre fusta', 'Fusta policromada', 'Romànic', 1, 1);

-- Insert a expo
INSERT INTO expo (nom) 
VALUES ('El Romànic Català');

-- Insert a autor
INSERT INTO autor (nom, nacionalitat) 
VALUES ('Mestre de Pedret', 'Català');

-- Insert a data
INSERT INTO data (dataInici) 
VALUES ('2025-01-13');

-- Insert a obraXexpo
INSERT INTO obraXexpo (idObra, idExpo) 
VALUES (1, 1);

-- Insert a autorXobra
INSERT INTO autorXobra (idObra, idAutor) 
VALUES (1, 1);

-- Insert a autorXmuseu
INSERT INTO autorXmuseu (idMuseu, idAutor, dataInici, dataFi) 
VALUES (1, 1, '2025-01-13', '2025-12-31');