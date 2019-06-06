import gql from "graphql-tag";
import React from "react";
// { useEffect }
import { Query } from "react-apollo";

import Subscriber from "./containers/Subscriber";

function Puppers() {
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

  const PUPPERS_SUBSCRIPTION = gql`
    subscription onPupperCreated($pupperId: String) {
      pupperCreated(id: $pupperId) {
        id
        name
      }
    }
  `;

  return (
    <div>
      <h1>Puppers!</h1>
      <Query query={LIST_PUPPERS}>
        {({ client, loading, error, data, subscribeToMore }) => {
          if (loading) return "Loading...";
          if (error) return `Error! ${error.message}`;

          return (
            <Subscriber
              subscribeToNew={() => {
                console.log("Setting subscribeToMore");
                subscribeToMore({
                  document: PUPPERS_SUBSCRIPTION,
                  updateQuery: (prev, next) => {
                    console.log("Whatup heeey");
                  }
                })();
                console.log("subscribeToMore set");
              }}
            >
              <ul>
                {data.listPuppers.map(pupper => (
                  <li key={pupper.id}>
                    {pupper.name} belongs to {pupper.ownerName}, is {pupper.age}{" "}
                    years old and loves to play with {pupper.favoriteToy}
                  </li>
                ))}
              </ul>
            </Subscriber>
          );
        }}
      </Query>
      <div />
    </div>
  );
}
export default Puppers;
