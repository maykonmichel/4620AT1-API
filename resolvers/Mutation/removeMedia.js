import medias from '../../scripts/medias';

export default async (parent, {id}, {db}) => {
  const {
    rows: [media],
  } = await db.query(medias.remove, [id]);

  return media;
};
