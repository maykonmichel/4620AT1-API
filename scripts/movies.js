export default {
  select: `
      SELECT *
      FROM movies;
  `,
  selectById: `
      SELECT *
      FROM movies
      WHERE id = $1;
  `,
  insert: `
      INSERT INTO movies(name, genre, rating, price)
      VALUES ($1, $2, $3, $4)
      RETURNING id;
  `,
};
