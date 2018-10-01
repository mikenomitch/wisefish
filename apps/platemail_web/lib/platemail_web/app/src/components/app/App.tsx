import * as React from "react";
import Loadable from "react-loadable";
import { BrowserRouter as Router, Link, Route } from "react-router-dom";

import "sanitize.css";
import "./App.scss";

import Loader from "../loader/Loader";

const LoadableGoodbye = Loadable({
  loader: () => import("../goodbye/Goodbye"),
  loading: Loader
});

const LoadableHello = Loadable({
  loader: () => import("../hello/HelloContainer"),
  loading: Loader
});

const LoadableWidgets = Loadable({
  loader: () => import("../widgets/WidgetsContainer"),
  loading: Loader
});

const App = () => (
  <Router>
    <div>
      <ul>
        <li>
          <Link to="/">Hello</Link>
        </li>
        <li>
          <Link to="/bye">Goodbye</Link>
        </li>
        <li>
          <Link to="/widgets">Widgets</Link>
        </li>
      </ul>

      <hr />

      <Route exact={true} path="/" component={LoadableHello} />
      <Route path="/bye" component={LoadableGoodbye} />
      <Route path="/widgets" component={LoadableWidgets} />
    </div>
  </Router>
);

export default App;
