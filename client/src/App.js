import React from "react";
import { ApolloProvider } from "react-apollo";
import "./App.css";
import { createClient } from "./util/apollo";
import Puppers from "./Puppers";
import NewPupper from "./NewPupper";

function App() {
  const client = createClient();

  return (
    <ApolloProvider client={client.client}>
      <Puppers />
      <NewPupper />
    </ApolloProvider>
  );
}

export default App;
