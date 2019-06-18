import React, { useState} from "react";
import gql from "graphql-tag";
import { Mutation } from "react-apollo"

const CREATE_WOOF = gql`
  mutation CreateWoof($body: String!) {
     createWoof(body: $body) {
       id
     }
   }
 `;

const CREATE_SUBWOOF = gql`
  mutation CreateSubwoof($woofId: String!, $body: String!) {
    createSubwoof(woofId: $woofId, body: $body) {
      id
    }
  }
`;

const NewItem = ({ feedType, params }) => {
  const [body, setBody] = useState("");
  const [pupperId, setPupperId] = useState("");

  const mutation = feedType === "subwoof" ? CREATE_SUBWOOF : CREATE_WOOF;

  return (
    <Mutation mutation={mutation}
      onCompleted={() => {
        setBody("");
        setPupperId(undefined);
      }}
    >
      {(submit, { data, loading, error }) => {
        return (
          <form
            onSubmit={(e) => {
              e.preventDefault();
              submit({ variables: { body, pupperId } });
            }}
          >
            <input
              name="body"
              type="textarea"
              rows="3"
              placeholder="What's on your mind?"
              value={body}
              onChange={(e) => setBody(e.target.value)}
            />
            <input
              name="pupperId"
              type="number"
              placeholder="pupperid"
              value={pupperId}
              onChange={(e) => setPupperId(parseInt(e.target.value))}
            />
            <input type="submit" value="Create Woof" />
          </form>
        );
      }}
    </Mutation>
  );
};

export default NewItem
