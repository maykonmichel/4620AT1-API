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
