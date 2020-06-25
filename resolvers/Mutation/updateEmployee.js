import {props} from 'ramda';

import customers from '../../scripts/employees';

export default async (parent, {input: {id, ...input}}, {db}) => {
  const {
    rows: [data],
  } = await db.query(employees.selectById, [id]);

  const customer = {...data, ...input};

  await Promise.all([
    db.query(employees.update[0], props(['id', 'name', 'rg'], employee)),
    db.query(employees.update[1], props(['id', 'pis'], employee)),
  ]);

  return employee;
};
