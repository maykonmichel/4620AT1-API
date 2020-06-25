import employess from '../../scripts/employees';

export default async (parent, args, {db}) => {
  const {rows} = await db.query(employess.select);
  return rows;
};
