DROP TABLE IF EXISTS people;

CREATE TABLE people
(
    number INT CONSTRAINT people_pk PRIMARY KEY,
    name   CHARACTER VARYING,
    rg     CHARACTER VARYING
);

DROP TABLE IF EXISTS employee;
CREATE TABLE employee
(
    number INT CONSTRAINT employee_pk PRIMARY KEY,
    FOREIGN KEY (number) references people (number),
    pis    INT,
    active BOOLEAN DEFAULT TRUE,
    admission date,
    user_access CHARACTER VARYING,
    password    CHARACTER VARYING
);


DROP TABLE IF EXISTS custumer;
CREATE TABLE custumer
(
    number INT CONSTRAINT custumer_pk PRIMARY KEY,
    FOREIGN KEY (number) references people (number),
    cpf    INT
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

DROP TABLE IF EXISTS media;
CREATE TABLE media
(
    id  SERIAL  CONSTRAINT media_pk PRIMARY KEY,
    movie_id SERIAL,
    FOREIGN KEY (movie_id) references movies (id),
    location date
)

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










