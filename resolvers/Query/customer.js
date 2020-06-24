import customers from '../../scripts/customers';

export default async (parent, {id}, {db}) => {
  const {
    rows: [customer],
  } = await db.query(customers.selectById, [id]);
  return customer;
};
