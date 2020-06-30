import employees from '../../scripts/employees';

export default async (parent, {id}, {db}) => {
  const {
    rows: [employee],
  } = await db.query(employees.selectById, [id]);

  await db.query(employees.delete, [id]);

  return employee;
};
