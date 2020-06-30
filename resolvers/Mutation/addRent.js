import {props} from 'ramda';

import rents from '../../scripts/rents';

export default async (parent, {input}, {db}) => {
  const {
    rows: [rent],
  } = await db.query(rents.insert, props(['id_empregado', 'id_cliente','id_media'], input));
  return rent;
};