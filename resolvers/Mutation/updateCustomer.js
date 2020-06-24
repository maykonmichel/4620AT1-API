import {props} from 'ramda';

import customers from '../../scripts/customers';

export default async (parent, {input: {id, ...input}}, {db}) => {
  const {
    rows: [data],
  } = await db.query(customers.selectById, [id]);

  const customer = {...data, ...input};

  await Promise.all([
    db.query(customers.update[0], props(['id', 'name', 'rg'], customer)),
    db.query(customers.update[1], props(['id', 'cpf'], customer)),
  ]);

  return customer;
};
