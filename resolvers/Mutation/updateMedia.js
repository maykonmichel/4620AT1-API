import {props} from 'ramda';

import medias from '../../scripts/medias';

export default async (parent, {input: {id, ...input}}, {db}) => {
  const {
    rows: [data],
  } = await db.query(medias.selectById, [id]);

  const media = {...data, ...input};

  await db.query(medias.update, props(['id', 'location', 'available'], media));

  return media;
};
