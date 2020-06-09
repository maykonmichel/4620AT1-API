import movies from '../../scripts/movies';

export default async (parent, {id}, {db}) => {
  const {
    rows: [movie],
  } = await db.query(movies.remove, [id]);

  return movie;
};
