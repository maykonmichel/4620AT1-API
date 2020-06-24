DROP TABLE IF EXISTS medias;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS people;

CREATE TABLE movies
(
    id        SERIAL
        CONSTRAINT movies_pk
            PRIMARY KEY,
    name      CHARACTER VARYING,
    genre     CHARACTER VARYING,
    rating    INT,
    price     FLOAT,
    available BOOLEAN DEFAULT TRUE
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

CREATE TABLE people
(
    id   SERIAL
        CONSTRAINT people_pk
            PRIMARY KEY,
    name CHARACTER VARYING,
    rg   CHARACTER VARYING
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

