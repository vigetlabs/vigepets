import React from "react";
import { ApolloProvider } from "react-apollo";
import "./App.css";
import { createClient } from "./util/apollo";
import Puppers from "./Puppers";
import NewPupper from "./NewPupper";
import Woofs from "./Woofs";

function App() {
  const client = createClient();

  return (
    <ApolloProvider client={client}>
      <Puppers />
      <NewPupper />
      <Woofs />
    </ApolloProvider>
  );
}

export default App;
