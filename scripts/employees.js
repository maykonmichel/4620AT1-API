export default {
  select: `
      SELECT e.id  id, pis
      FROM employees e
               INNER JOIN people p ON e.id = p.id
      ORDER BY e.id;
  `,
  selectById: `
      SELECT e.id id, pis
      FROM employees e
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
          INSERT INTO employees(pis)
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
          UPDATE employees
          SET pis = $2
          WHERE id = $1;
    `,
  ],
  delete: `
      DELETE
      FROM employees
      WHERE id = $1
      RETURNING *;
  `,
};
