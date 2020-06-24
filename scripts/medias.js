export default {
  selectById: `
      SELECT *
      FROM medias
      WHERE id = $1;
  `,
  selectByMovie: `
      SELECT *
      FROM medias
      WHERE movie = $1;
  `,
  insert: `
      INSERT INTO medias(movie, location)
      VALUES ($1, $2)
      RETURNING *;
  `,
  update: `
      UPDATE medias
      SET location  = $2,
          available = $3
      WHERE id = $1;
  `,
  remove: `
      DELETE
      FROM medias
      WHERE id = $1
      RETURNING *;
  `,
};
