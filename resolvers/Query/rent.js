import rents from '../../scripts/rents';

export default async (parent, {id}, {db}) => {
  const {
    rows: [rent],
  } = await db.query(rents.selectById, [id]);
  return rent;
};
