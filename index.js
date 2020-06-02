import {GraphQLServer} from 'graphql-yoga';

import resolvers from './resolvers';

new GraphQLServer({typeDefs: 'schema.graphql', resolvers})
  .start(() => console.log('Server is running on localhost:4000')) // eslint-disable-line no-console
  .then();
