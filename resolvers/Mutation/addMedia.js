import {props} from 'ramda';

import medias from '../../scripts/medias';

export default async (parent, {input}, {db}) => {
  const {
    rows: [media],
  } = await db.query(medias.insert, props(['movie', 'location'], input));
  return media;
};
