import movies from '../../scripts/movies';

export default async (parent, args, {db}) => {
  const {rows} = await db.query(movies.select);
  return rows;
};
