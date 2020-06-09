export default {
  select: `
      SELECT *
      FROM movies
      WHERE available = true
      ORDER BY id;
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
  update: `
      UPDATE movies
      SET name      = $2,
          genre     = $3,
          rating    = $4,
          price     = $5,
          available = $6
      WHERE id = $1;
  `,
  remove: `
      UPDATE movies
      SET available = false
      WHERE id = $1
      RETURNING *;
  `,
};
