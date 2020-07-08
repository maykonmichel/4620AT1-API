export default {
  select: `
      SELECT c.id id, name, rg, cpf
      FROM customer c
               INNER JOIN people p ON c.id = p.id
      ORDER BY c.id;
  `,
  selectById: `
      SELECT c.id id, name, rg, cpf
      FROM customer c
               INNER JOIN people p ON c.id = p.id
      WHERE c.id = $1;
  `,
  insert: [
    `
          INSERT INTO people(name, rg)
          VALUES ($1, $2)
          RETURNING id;
    `,
    `
          INSERT INTO customer(id, cpf)
          VALUES ($1, $2)
          RETURNING id;
    `,
  ],
  update: [
    `
          UPDATE people
          SET name = $2,
              rg   = $3
          WHERE id = $1;
    `,
    `
          UPDATE customer
          SET cpf = $2
          WHERE id = $1;
    `,
  ],
  delete: `
      DELETE
      FROM customer
      WHERE id = $1
      RETURNING *;
  `,
};
