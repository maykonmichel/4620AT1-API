import customers from '../../scripts/customers';

export default async ({id_cliente}, args, {db}) => {
  const {
    rows: [customer],
  } = await db.query(customers.selectById, [id_cliente]);
  return customer;
};
