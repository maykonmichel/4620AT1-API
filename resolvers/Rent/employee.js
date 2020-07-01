import employees from '../../scripts/employees';

export default async ({id_empregado}, args, {db}) => {
  const {
    rows: [employee],
  } = await db.query(employees.selectById, [id_empregado]);
  return employee;
};
