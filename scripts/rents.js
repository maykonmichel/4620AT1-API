export default {
   insert: `
          INSERT INTO rent(id_empregado,id_cliente,id_media)
          VALUES ($1, $2,$3)
          RETURNING id;
  `,
  update: `
          UPDATE rent
          SET id_empregado = $2,
              id_cliente   = $3,
              id_media = $4
          WHERE id = $1;
  `,
  remove: `
      DELETE
      FROM rent
      WHERE id = $1
      RETURNING *;
  `,
};
