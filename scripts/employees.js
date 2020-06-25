export default {
  select: `
      SELECT e.id  id, pis
      FROM employee e
               INNER JOIN people p ON e.id = p.id
      ORDER BY e.id;
  `,
  selectById: `
      SELECT e.id id, pis
      FROM employee e
               INNER JOIN people p ON e.id = p.id
      WHERE e.id = $1;
  `,
  insert: [
    `
          INSERT INTO people(name, rg)
          VALUES ($1, $2)
          RETURNING id;
    `,
    `
          INSERT INTO employee(pis)
          VALUES ($1)
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
          UPDATE employee
          SET pis = $2
          WHERE id = $1;
    `,
  ],
  delete: `
      DELETE
      FROM employee
      WHERE id = $1
      RETURNING *;
  `,
};
