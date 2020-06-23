DROP TABLE IF EXISTS medias;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS people;


CREATE TABLE people
(
    number INT
        CONSTRAINT people_pk
            PRIMARY KEY,
    name   CHARACTER VARYING,
    rg     CHARACTER VARYING
);

DROP TABLE IF EXISTS employee;

CREATE TABLE employee
(
    number INT
        CONSTRAINT employee_people_fk references people (number),
    pis    INT,
    active BOOLEAN DEFAULT TRUE,
    admission date,
    user_access CHARACTER VARYING,
    password    CHARACTER VARYING
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


DROP TABLE IF EXISTS movies;
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



DROP TABLE IF EXISTS rent;

CREATE TABLE rent
(
    id     SERIAL
        CONSTRAINT rent_pk
            PRIMARY KEY,
    data_aluguel  DATE,
    data_devolucao DATE,
    number INT
    CONSTRAINT employee_people_fk references employee (number),
    number INT
    CONSTRAINT custumer_people_fk references custumer (number),
    number INT
    CONSTRAINT _people_fk references people (number),

)








>>>>>>> Primeira versão Script SQL

