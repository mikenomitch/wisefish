import { applyMiddleware, combineReducers, createStore } from "redux";
import { createLogger } from "redux-logger";
import multi from "redux-multi";
import createSagaMiddleware from "redux-saga";

import { authentication } from "../data/authentication";
import { calls } from "../data/calls";
import { channels } from "../data/channels";
import { enthusiasm } from "../data/enthusiasm";
import { ui } from "../data/ui";
import { widgets } from "../data/widgets";
import getFromLocalStorage from "./middleware/getFromLocalStorage";
import saveToLocalStorage from "./middleware/saveToLocalStorage";

import { rootSaga } from "../actions/rootSaga";

const sagaMiddleware = createSagaMiddleware();

const logger = createLogger({
  collapsed: true,
  diff: true
});

const rootReducer = combineReducers({
  authentication,
  calls,
  channels,
  enthusiasm,
  ui,
  widgets
});

const prodMiddleware = [
  multi,
  getFromLocalStorage,
  sagaMiddleware,
  saveToLocalStorage
];

const devMiddleware = [logger].concat(prodMiddleware);

const middleWare =
  process.env.NODE_ENV === "production" ? prodMiddleware : devMiddleware;

const storeMaker = () => {
  const store = createStore(rootReducer, applyMiddleware(...middleWare));
  sagaMiddleware.run(rootSaga, store.dispatch, store.getState);
  return store;
};

export default storeMaker;
