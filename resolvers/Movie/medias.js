import medias from '../../scripts/medias';

export default async ({id}, args, {db}) => {
  const {rows} = await db.query(medias.selectByMovie, [id]);
  return rows;
};
