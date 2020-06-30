export default {
  select: `
      SELECT *
      FROM rent
      ORDER BY id;
  `,
  selectById: `
      SELECT *
      FROM rent
      WHERE id = $1;
  `,
   insert: `
          INSERT INTO rent(id_empregado,id_cliente,id_media)
          VALUES ($1, $2,$3)
          RETURNING id;
  `,
  refund: `
          UPDATE rent
          SET id_empregado = $2,
              id_cliente   = $3,
              id_media = $4,
              data_devolucao = now()
          WHERE id = $1;
  `,
  remove: `
      DELETE
      FROM rent
      WHERE id = $1
      RETURNING *;
  `,
};
