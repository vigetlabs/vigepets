import React, { useState } from "react";
import gql from "graphql-tag";
import { Mutation } from "react-apollo";

const CREATE_PUPPER = gql`
  mutation CreatePupper(
    $name: String!
    $age: Int
    $avatarUrl: String
    $favoriteToy: String
    $ownerName: String
  ) {
    createPupper(
      name: $name
      age: $age
      avatarUrl: $avatarUrl
      favoriteToy: $favoriteToy
      ownerName: $ownerName
    ) {
      id
    }
  }
`;

function NewPupper(props) {
  const [name, setName] = useState("");
  const [age, setAge] = useState("");
  return (
    <Mutation
      mutation={CREATE_PUPPER}
      onCompleted={() => {
        setName("");
        setAge("");
      }}
    >
      {(submit, { data, loading, error }) => {
        return (
          <form
            onSubmit={e => {
              e.preventDefault();
              submit({ variables: { age, name } });
            }}
          >
            <input
              type="text"
              placeholder="Name"
              value={name}
              onChange={e => setName(e.target.value)}
            />
            <input
              type="number"
              placeholder="Age"
              value={age}
              onChange={e => setAge(parseInt(e.target.value))}
            />
            <input type="submit" value="Create Pupper" />
          </form>
        );
      }}
    </Mutation>
  );
}

export default NewPupper;
