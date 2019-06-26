import gql from "graphql-tag";
import React from "react";
import { Query } from "react-apollo";
import renderIf from "render-if";
import produce from "immer";
import Subscriber from "./Subscriber";
import NewItem from "./NewItem";

  export const LIST_WOOFS = gql`
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

  export const WOOFS_SUBSCRIPTION = gql`
    subscription onWoofCreated {
      woofCreated {
        id
        body
        pupper {
          id
          name
          avatar_url
        }
      }
    }
  `;

const Woofs =({subscribeToNew, newItemPosition, createParams}) => {
  return (
    <div>
      <h1>Woofs!</h1>
      <Query query={LIST_WOOFS}>
        {({ loading, error, data, subscribeToMore }) => {
          if (loading) return "Loading...";
          if (error) return `Error! ${error.message}`;

          return (
            <>
            <Subscriber subscribeToNew={() =>
                subscribeToMore({
                  document: WOOFS_SUBSCRIPTION,
                  updateQuery: (prev, { subscriptionData }) => {
                    if (!subscriptionData.data) return prev;
                    const newPost = subscriptionData.data.postCreated;

                    // Check that we don't already have the
                    // post stored.
                    if (prev.posts.find((post) => post.id === newPost.id)) {
                      return prev;
                    }

                    return produce(prev, (next) => {
                      next.posts.unshift(newPost);
                    });
                  },
                })
              }>
              {renderIf(newItemPosition === "top")(
                <NewItem feedType="woofs" params={createParams} />,
              )}
              <ul>
                {data.listWoofs.map(woof => (
                  <li key={woof.id} className='l1'>
                    <img src={woof.pupper.avatar_url}></img>
                    <span>{woof.pupper.name}</span>
                    <div className="post-body">{woof.body}</div>
                    <div className="post-lick">Licks: {woof.licks.map(lick => (lick.pupper.name + " "))}</div>
                    <div>
                      {woof.subwoofs.map(subwoof => (
                        <div className="post-comment">
                          <b>{subwoof.pupper.name}</b> - {subwoof.body}
                        </div>
                      ))}
                    </div>
                  </li>
                ))}
              </ul>
              {renderIf(newItemPosition === "bottom")(
                <NewItem feedType="woofs" params={createParams} />,
              )}
            </Subscriber>
          </>

          );
        }}
      </Query>
    </div>
  );
}
export default Woofs;
