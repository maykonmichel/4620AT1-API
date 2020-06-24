import customers from '../../scripts/employees';

export default async (parent, {id}, {db}) => {
  const {
    rows: [customer],
  } = await db.query(employees.selectById, [id]);
  return employee;
};
