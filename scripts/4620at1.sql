DROP TABLE IF EXISTS rents;
DROP TABLE IF EXISTS medias CASCADE ;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS customer CASCADE ;
DROP TABLE IF EXISTS employees CASCADE ;
DROP TABLE IF EXISTS people;

CREATE TABLE people
(
    id SERIAL CONSTRAINT people_pk PRIMARY KEY,
    name   CHARACTER VARYING,
    rg     CHARACTER VARYING
);

CREATE TABLE employees
(
    id SERIAL CONSTRAINT employees_pk PRIMARY KEY
            CONSTRAINT employees_people_number_fk
                    REFERENCES people ON DELETE CASCADE,
    pis    CHARACTER VARYING
);

CREATE TABLE customer
(
    id  SERIAL
        CONSTRAINT customer_pk
            PRIMARY KEY
        CONSTRAINT customer_people_id_fk
            REFERENCES people ON DELETE CASCADE,
    cpf CHARACTER VARYING
);

CREATE TABLE movies
(
 id        SERIAL
 CONSTRAINT movies_pk PRIMARY KEY,
    name      CHARACTER VARYING,
    genre     CHARACTER VARYING,
    rating    INT,
    price     FLOAT
);

CREATE TABLE medias
(
    id        SERIAL
        CONSTRAINT medias_pk
            PRIMARY KEY,
    movie      INTEGER
        REFERENCES movies ON DELETE CASCADE,
    location CHARACTER VARYING,
    available BOOLEAN DEFAULT TRUE
);

CREATE TABLE rents
(
    id  SERIAL PRIMARY KEY,
    id_empregado SERIAL REFERENCES employees,
    id_cliente SERIAL REFERENCES customer,
    id_media SERIAl REFERENCES medias,
    data_aluguel  timestamp DEFAULT now(),
    data_devolucao timestamp DEFAULT null
);

DROP FUNCTION IF EXISTS aluguel() CASCADE;
DROP FUNCTION IF EXISTS refundaluguel() CASCADE;

CREATE or replace FUNCTION aluguel()
RETURNS trigger AS $$
BEGIN
    IF (TG_OP = 'INSERT') THEN
    UPDATE medias set available = false WHERE id  = NEW.id_media;
    END IF;
    RETURN NEW;
END;
$$
LANGUAGE plpgsql;

CREATE TRIGGER aluguel_trigger
AFTER INSERT ON rents
FOR EACH ROW
EXECUTE PROCEDURE aluguel();


CREATE or replace FUNCTION refundaluguel()
RETURNS trigger AS $update$
BEGIN
    IF (TG_OP = 'UPDATE') THEN
    UPDATE medias set available = true WHERE id  = NEW.id_media;
    END IF;
    RETURN NEW;
END;
$update$
LANGUAGE plpgsql;

CREATE TRIGGER devolucao_trigger
AFTER UPDATE ON rents
FOR EACH ROW
EXECUTE PROCEDURE refundaluguel();

INSERT INTO people
VALUES (1,'João',10);

INSERT INTO people
VALUES (2,'Maria',20);

INSERT INTO people
VALUES (3,'José',30);

INSERT INTO employees
VALUES (1,11);

INSERT INTO employees
VALUES (2,22);

INSERT INTO  customer
VALUES (3,30);

INSERT INTO movies
VALUES (10,'Bacurau','Gênero Foda',5,55.10);

INSERT INTO movies
VALUES (11,'Branquelas','Gênero Media',6,55.10);

INSERT INTO medias
VALUES (91,10,'A',default);
INSERT INTO medias
VALUES (92,11,'A',default);
INSERT INTO medias
VALUES (93,11,'A',default);
INSERT INTO medias
VALUES (94,10,'A',default);
INSERT INTO medias
VALUES (95,11,'A',default);
INSERT INTO medias
VALUES (96,10,'A',default);
INSERT INTO medias
VALUES (97,10,'A',default);


INSERT INTO rents
VALUES (22,1,3,94,now());

INSERT INTO rents
VALUES (34,1,3,95,now());