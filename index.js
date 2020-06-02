import {GraphQLServer} from 'graphql-yoga';
import {Pool} from 'pg';

import resolvers from './resolvers';

const db = new Pool();

new GraphQLServer({
  typeDefs: 'schema.graphql',
  resolvers,
  context: () => ({db}),
})
  .start(
    {port: process.env.PORT || 4000},
    ({port}) => console.log(`Server is running on localhost:${port}`), // eslint-disable-line no-console
  )
  .then();
