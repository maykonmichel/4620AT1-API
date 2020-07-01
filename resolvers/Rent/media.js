import medias from '../../scripts/medias';

export default async ({id_media}, args, {db}) => {
  const {
    rows: [media],
  } = await db.query(medias.selectById, [id_media]);
  return media;
};
