export default {
  select: `
      SELECT *
      FROM rents
      ORDER BY id;
  `,
  selectById: `
      SELECT *
      FROM rents
      WHERE id = $1;
  `,
  insert: `
          INSERT INTO rents(id_empregado,id_cliente,id_media)
          VALUES ($1, $2,$3)
          RETURNING id;
  `,
  refund: `
          UPDATE rents
          SET data_devolucao = now()
          WHERE id = $1;
  `,
  remove: `
      DELETE
      FROM rent
      WHERE id = $1
      RETURNING *;
  `,
};
