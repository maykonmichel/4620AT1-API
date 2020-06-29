import {props} from 'ramda';

import customers from '../../scripts/employees';

export default async (parent, {input}, {db}) => {
  await db.query(employees.insert[0], props(['name', 'rg'], input));
  const {
    rows: [{id}],
  } = await db.query(employees.insert[1], props(['pis'], input));
  return {
    id,
    ...input,
  };
};
