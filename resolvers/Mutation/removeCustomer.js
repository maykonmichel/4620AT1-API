import customers from '../../scripts/customers';

export default async (parent, {id}, {db}) => {
  const {
    rows: [customer],
  } = await db.query(customers.selectById, [id]);

  await db.query(customers.delete, [id]);

  return customer;
};
