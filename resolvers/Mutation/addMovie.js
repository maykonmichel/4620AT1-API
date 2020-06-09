import {props} from 'ramda';

import movies from '../../scripts/movies';

export default async (parent, {input}, {db}) => {
  const {
    rows: [{id}],
  } = await db.query(
    movies.insert,
    props(['name', 'genre', 'rating', 'price'], input),
  );
  return {
    id,
    ...input,
    available: true,
  };
};
