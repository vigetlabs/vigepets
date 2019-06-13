import React, { useState } from "react";
import gql from "graphql-tag";
import { Mutation } from "react-apollo";

const CREATE_PUPPER = gql`
  mutation(
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
  const [age, setAge] = useState(undefined);
  const [favoriteToy, setFavoriteToy] = useState(undefined);
  const [ownerName, setOwnerName] = useState(undefined);

  return (
    <Mutation
      mutation={CREATE_PUPPER}
      onCompleted={() => {
        setName("");
        setAge(undefined);
        setFavoriteToy(undefined);
        setOwnerName(undefined);
      }}
    >
      {(submit, { data, loading, error }) => {
        return (
          <form
            onSubmit={e => {
              e.preventDefault();
              submit({ variables: { age, name, favoriteToy, ownerName } });
            }}
          >
            <input
              name="name"
              type="text"
              placeholder="Name"
              value={name}
              onChange={e => setName(e.target.value)}
            />
            <input
              name="age"
              type="number"
              placeholder="Age"
              value={age}
              onChange={e => {
                setAge(parseInt(e.target.value));
              }}
            />
            <input
              name="favoriteToy"
              type="text"
              placeholder="Favorite Toy"
              value={favoriteToy}
              onChange={e => setFavoriteToy(e.target.value)}
            />
            <input
              name="ownerName"
              type="text"
              placeholder="Owner Name"
              value={ownerName}
              onChange={e => setOwnerName(e.target.value)}
            />
            <input type="submit" value="Create Pupper" />
          </form>
        );
      }}
    </Mutation>
  );
}

export default NewPupper;
