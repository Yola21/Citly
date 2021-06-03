import React from "react";
import Dashboard from "components/Dashboard";
import { Route, Switch, BrowserRouter as Router } from "react-router-dom";
// import CreateUrl from "./components/Urls/CreateUrl";

const App = () => {
  return (
    <Router>
      <Switch>
        {/* <Route exact path="/urls/create" component={CreateUrl} /> */}
        <Route exact path="/dashboard" component={Dashboard} />
      </Switch>
    </Router>
  );
};

export default App;