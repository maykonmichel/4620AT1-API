import {props} from 'ramda';

import customers from '../../scripts/customers';

export default async (parent, {input}, {db}) => {
  await db.query(customers.insert[0], props(['name', 'rg'], input));
  const {
    rows: [{id}],
  } = await db.query(customers.insert[1], props(['cpf'], input));
  return {
    id,
    ...input,
  };
};
