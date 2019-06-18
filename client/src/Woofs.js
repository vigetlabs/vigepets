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
          avatar_url
        }
        subwoofs {
          body
          pupper{
            name
          }
        }
        licks {
          pupper {
            name
          }
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
                  <img src={woof.pupper.avatar_url}></img>
                  <scan>{woof.pupper.name}</scan>
                  <div class="post-body">{woof.body}</div>
                  <div class="post-lick">Licks: {woof.licks.map(lick => (lick.pupper.name + " "))}</div>
                  <div>
                    {woof.subwoofs.map(subwoof => (
                      <div class="post-comment">
                        <b>{subwoof.pupper.name}</b> - {subwoof.body}
                      </div>
                    ))}
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