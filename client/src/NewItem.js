import React, { useState} from "react";
import gql from "graphql-tag";
import { Mutation } from "react-apollo"

const CREATE_WOOF = gql`
mutation CreateWoof($body: String!, $pupper: Int!) {
   createWoof(body: $body, pupperId: $pupper) {
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
  const [pupper, setPupper] = useState("");

  const mutation = feedType === "subwoof" ? CREATE_SUBWOOF : CREATE_WOOF;

  return (
    <Mutation mutation={mutation}
      onCompleted={() => {
        setBody("");
        setPupper(undefined);
      }}
    >
      {(submit, { data, loading, error }) => {
        return (
          <form
            onSubmit={(e) => {
              e.preventDefault();
              submit({ variables: { body, pupper } });
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
              name="pupper"
              type="number"
              placeholder="pupper id"
              value={pupper}
              onChange={(e) => setPupper(parseInt(e.target.value))}
            />
            <input type="submit" value="Bork" />
          </form>
        );
      }}
    </Mutation>
  );
};

export default NewItem
