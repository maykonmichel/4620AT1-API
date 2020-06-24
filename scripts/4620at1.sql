DROP TABLE IF EXISTS medias;
DROP TABLE IF EXISTS movies;
DROP TABLE IF EXISTS customer;
DROP TABLE IF EXISTS people;


CREATE TABLE people
(
    id SERIAL CONSTRAINT people_pk PRIMARY KEY,
    name   CHARACTER VARYING,
    rg     CHARACTER VARYING
);

DROP TABLE IF EXISTS employee;
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


DROP TABLE IF EXISTS movies;
CREATE TABLE movies
(
 id        SERIAL
 CONSTRAINT movies_pk PRIMARY KEY,
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
    id  SERIAL CONSTRAINT rent_pk PRIMARY KEY,
    data_aluguel  DATE,
    data_devolucao DATE,
    FOREIGN KEY (id) REFERENCES employee (number),
    FOREIGN KEY (id) REFERENCES custumer (number),
    FOREIGN KEY (id) REFERENCES people (number)
)




