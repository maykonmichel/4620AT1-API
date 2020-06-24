import customers from '../../scripts/customers';

export default async (parent, args, {db}) => {
  const {rows} = await db.query(customers.select);
  return rows;
};
