import gql from "graphql-tag";
import React from "react";
import { Query } from "react-apollo";

function Woofs() {
  const LIST_WOOFS = gql`
    {
      listWoofs {
        id
        body
        pupper {
          name
        }
      }
    }
  `;

  return (
    <div>
      <h1>Woofs!</h1>
      <Query query={LIST_WOOFS}>
        {({ loading, error, data }) => {
          if (loading) return "Loading...";
          if (error) return `Error! ${error.message}`;

          return (
            <ul>
              {data.listWoofs.map(woof => (
                <li key={woof.id}>
                  {woof.pupper.name} says:
                  <div>{woof.body}</div>
                </li>
              ))}
            </ul>
          );
        }}
      </Query>
    </div>
  );
}
export default Woofs;
