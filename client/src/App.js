import { InMemoryCache } from "apollo-cache-inmemory";
import { ApolloClient } from "apollo-client";
import { HttpLink } from "apollo-link-http";
import gql from "graphql-tag";
import React from "react";
import { ApolloProvider, Query } from "react-apollo";
import "./App.css";

const HTTP_URI = "http://localhost:4000";

function App() {
  const client = new ApolloClient({
    link: new HttpLink({ uri: HTTP_URI }),
    cache: new InMemoryCache()
  });

  const LIST_PUPPERS = gql`
    {
      listPuppers {
        id
        age
        name
        avatarUrl
        favoriteToy
        ownerName
      }
    }
  `;

  return (
    <ApolloProvider client={client}>
      <h1>Puppers!</h1>
      <Query query={LIST_PUPPERS}>
        {({ loading, error, data }) => {
          if (loading) return "Loading...";
          if (error) return `Error! ${error.message}`;

          return (
            <ul>
              {data.listPuppers.map(pupper => (
                <li>
                  {pupper.name} belongs to {pupper.ownerName}, is {pupper.age}{" "}
                  years old and loves to play with {pupper.favoriteToy}
                </li>
              ))}
            </ul>
          );
        }}
      </Query>
    </ApolloProvider>
  );
}

export default App;
