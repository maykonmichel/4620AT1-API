import {props} from 'ramda';

import movies from '../../scripts/movies';

export default async (parent, {input: {id, ...input}}, {db}) => {
  const {
    rows: [data],
  } = await db.query(movies.selectById, [id]);

  const movie = {...data, ...input};

  await db.query(
    movies.update,
    props(['id', 'name', 'genre', 'rating', 'price', 'available'], movie),
  );

  return movie;
};
