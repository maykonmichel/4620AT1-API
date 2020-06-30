import rents from '../../scripts/rents';

export default async (parent, args, {db}) => {
  const {rows} = await db.query(rents.select);
  return rows;
};
