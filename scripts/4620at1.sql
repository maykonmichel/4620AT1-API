DROP TABLE IF EXISTS rent;
DROP TABLE IF EXISTS medias;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS employee;
DROP TABLE IF EXISTS people;


CREATE TABLE people
(
    id SERIAL CONSTRAINT people_pk PRIMARY KEY,
    name   CHARACTER VARYING,
    rg     CHARACTER VARYING
);

CREATE TABLE employee
(
    id SERIAL CONSTRAINT employee_pk PRIMARY KEY
            CONSTRAINT employee_people_number_fk
                    REFERENCES people ON DELETE CASCADE,
    pis    INT
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

CREATE TABLE rent
(
    id  SERIAL PRIMARY KEY,
    id_empregado SERIAL REFERENCES employee,
    id_cliente SERIAL REFERENCES customer,
    id_media SERIAl REFERENCES medias,
    data_aluguel  timestamp DEFAULT now(),
    data_devolucao timestamp DEFAULT null
);

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
AFTER INSERT ON rent
FOR EACH ROW
EXECUTE PROCEDURE aluguel();









