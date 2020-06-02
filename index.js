import {GraphQLServer} from 'graphql-yoga';
import {Pool} from 'pg';

import resolvers from './resolvers';

const db = new Pool();

new GraphQLServer({
  typeDefs: 'schema.graphql',
  resolvers,
  context: () => ({db}),
})
  .start(() => console.log('Server is running on localhost:4000')) // eslint-disable-line no-console
  .then();
