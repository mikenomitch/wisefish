import { IAction } from "../lib/types";
import makeCrudReducer from "./crud";
import withResetState from "./withResetState";

// =========
//   TYPES
// =========

export interface IWidget {
  content: string | null;
  id: number | undefined;
  title: string | null;
  user_id: number | null | undefined;
}

// ===========
//   ACTIONS
// ===========

export function getWidgets(): IAction {
  return {
    type: "GET_WIDGETS"
  };
}

export function getWidget(id: number): IAction {
  return {
    payload: id,
    type: "GET_WIDGET"
  };
}

export function createWidget(params: IWidget): IAction {
  return {
    payload: { params },
    type: "CREATE_WIDGET"
  };
}

export function deleteWidget(id: number): IAction {
  return {
    payload: id,
    type: "DELETE_WIDGET"
  };
}

export function updateWidget(id: number, params: IWidget): IAction {
  return {
    payload: { id, params },
    type: "UPDATE_WIDGET"
  };
}

// ===========
//   REDUCER
// ===========

export const widgets = withResetState({ items: [] }, "SIGN_OUT")(
  makeCrudReducer("WIDGET")
);