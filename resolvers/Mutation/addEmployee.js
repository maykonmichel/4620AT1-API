import {props} from 'ramda';

import employees from '../../scripts/employees';

export default async (parent, {input}, {db}) => {
  const {
    rows: [people],
  } = await db.query(employees.insert[0], props(['name', 'rg'], input));
  const {
    rows: [{id}],
  } = await db.query(employees.insert[1], [people.id, input.pis]);
  return {
    id,
    ...input,
  };
};
