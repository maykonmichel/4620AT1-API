import {props} from 'ramda';

import rents from '../../scripts/rents';

export default async (parent, {input: {id, ...input}}, {db}) => {
  const {
    rows: [data],
  } = await db.query(rents.selectById, [id]);

  const rent = {...data, ...input};

  await db.query(
    rents.refund,
    props(['id'], rent),
  );

  return rent;
};
