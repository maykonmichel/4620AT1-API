export default {
  select: `
      SELECT *
      FROM movies;
  `,
  insert: `
      INSERT INTO movies(name, genre, rating, price)
      VALUES ($1, $2, $3, $4)
  `,
};
