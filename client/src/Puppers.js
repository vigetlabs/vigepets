import gql from "graphql-tag";
import React from "react";
import { Query } from "react-apollo";

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

  return (
    <div>
      <h1>Puppers!</h1>
      <Query query={LIST_PUPPERS}>
        {({ loading, error, data }) => {
          if (loading) return "Loading...";
          if (error) return `Error! ${error.message}`;

          return (
            <ul>
              {data.listPuppers.map(pupper => (
                <li key={pupper.id}>
                  {pupper.name} belongs to {pupper.ownerName}, is {pupper.age}{" "}
                  years old and loves to play with {pupper.favoriteToy}
                </li>
              ))}
            </ul>
          );
        }}
      </Query>
    </div>
  );
}
export default Puppers;
