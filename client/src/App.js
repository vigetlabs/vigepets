import React from "react";
import { ApolloProvider } from "react-apollo";
import { BrowserRouter, Switch, Route } from "react-router-dom";
import "./App.css";
import { createClient } from "./util/apollo";
import Puppers from "./Puppers";
import NewPupper from "./NewPupper";
import Woofs from "./Woofs";

function App() {
  const client = createClient();

  return (
    <ApolloProvider client={client}>
      <BrowserRouter>
        <Switch>
          <Route exact path="/puppers" component={Puppers} />
          <Route exact path="/puppers/new" component={NewPupper} />
          <Route exact path="/woofs" component={Woofs} />
        </Switch>
      </BrowserRouter>
    </ApolloProvider>
  );
}

export default App;
