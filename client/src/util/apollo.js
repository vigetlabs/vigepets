import ApolloClient from "apollo-client";
import { InMemoryCache } from "apollo-cache-inmemory";
import * as AbsintheSocket from "@absinthe/socket";
import { createAbsintheSocketLink } from "@absinthe/socket-apollo-link";
import { Socket as PhoenixSocket } from "phoenix";
import { createHttpLink } from "apollo-link-http";
import { hasSubscription } from "@jumpn/utils-graphql";
import { split } from "apollo-link";

// TODO: Make production ready
const HTTP_URI = "http://localhost:4000";
const WS_URI = "ws://localhost:4000/socket";

export const createClient = ({ fetch } = {}) => {
  let link = createHttpLink({ uri: HTTP_URI, fetch });
  let absintheSocket = AbsintheSocket.create(
    new PhoenixSocket(WS_URI, {
      params: () => {
        return {};
      }
    })
  );

  const socketLink = createAbsintheSocketLink(absintheSocket);
  link = split(operation => hasSubscription(operation.query), socketLink, link);

  const cache = new InMemoryCache();
  cache.restore(window.__APOLLO_STATE__);

  const client = new ApolloClient({
    cache,
    link
  });

  return { client, absintheSocket };
};
