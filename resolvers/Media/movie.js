import movies from '../../scripts/movies';

export default async ({id}, args, {db}) => {
  const {
    rows: [movie],
  } = await db.query(movies.selectByMedia, [id]);
  return movie;
};
