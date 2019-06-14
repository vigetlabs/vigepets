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
        subwoofs {
          body
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
                <li key={woof.id} class='l1'>
                  {woof.pupper.name} says:
                  <div>{woof.body}</div>
                  <div>
                    <ul>
                      {woof.subwoofs.map(subwoof => (
                        <li key={subwoof.id}>
                          <div>{subwoof.body}</div>
                        </li>
                      ))}
                    </ul>
                  </div>
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


//{/* <Query query={WOOF_SUBWOOFS}>
  //                    <ul>
    //                  
      //                </ul>
        //            </Query> */}