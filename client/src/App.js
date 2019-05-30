import React from "react";
import { ApolloProvider } from "react-apollo";
import "./App.css";
import { createClient } from "./util/apollo";
import Puppers from "./Puppers";

function App() {
  const client = createClient();

  return (
    <ApolloProvider client={client}>
      <Puppers />
    </ApolloProvider>
  );
}

export default App;
