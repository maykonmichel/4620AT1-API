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





CREATE or replace FUNCTION refundaluguel()
RETURNS trigger AS $update$
BEGIN
    IF (TG_OP = 'UPDATE') THEN
    UPDATE medias set available = false WHERE id  = NEW.id_media;
    END IF;
    RETURN NEW;
END;
$update$
LANGUAGE plpgsql;

CREATE TRIGGER aluguel_trigger
AFTER INSERT ON rent
FOR EACH ROW
EXECUTE PROCEDURE aluguel();

INSERT INTO people
VALUES (1,'João',10);

INSERT INTO people
VALUES (2,'Maria',20);

INSERT INTO people
VALUES (3,'José',30);

INSERT INTO employee
VALUES (1,11);

INSERT INTO employee
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


INSERT INTO rent
VALUES (8,1,3,94,now());

INSERT INTO rent
VALUES (98,1,3,95,now());
INSERT INTO rent
VALUES (96,1,3,95);

SELECT * from rent;







--SELECT r.id id, mo.name, m.available, p.name
--   FROM rent r
--   INNER JOIN medias m ON r.id_media = m.id
--   INNER JOIN movies mo ON m.movie = mo.id
--   INNER JOIN people p on r.id_cliente = p.id
--    ORDER BY r.id;


--SELECT c.id id, name, rg, cpf
--  FROM customer c
--  INNER JOIN people p ON c.id = p.id
--    ORDER BY c.id;

--INSERT INTO rent
--VALUES (id,id_empregado,id_cliente,id_media,data_aluguel,data_devolucao);







