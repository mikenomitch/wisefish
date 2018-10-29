import { put } from "redux-saga/effects";

import { callError, callStart, callSuccess } from "../data/calls";
import api from "../lib/api";

export function* __fetchWtihTracking(
  apiCall,
  endpoint,
  params,
  options,
  callKey?: string
) {
  try {
    if (callKey) {
      yield put(callStart(callKey));
    }

    const res = yield apiCall(endpoint, params, options);
    if (callKey) {
      yield put(callSuccess(callKey));
    }
    return res;
  } catch (err) {
    if (callKey) {
      yield put(callError(callKey));
    }
  }
}

// =====================
//   PUBLIC GENERATORS
// ====================

// Tracked API Call generators
// Used by other sagas.

// I.E.
// const { data } = yield apiGet(...)

export function* apiGet(endpoint, params, options, callKey?: string) {
  return yield __fetchWtihTracking(api.get, endpoint, params, options, callKey);
}

export function* apiPost(endpoint, params, options, callKey?: string) {
  return yield __fetchWtihTracking(
    api.post,
    endpoint,
    params,
    options,
    callKey
  );
}

export function* apiPut(endpoint, params, options, callKey?: string) {
  return yield __fetchWtihTracking(api.put, endpoint, params, options, callKey);
}

// Like the others but with slightly different params
export function* apiDelete(endpoint, options, callKey?: string) {
  try {
    if (callKey) {
      yield put(callStart(callKey));
    }

    const res = yield api.delete(endpoint, options);
    if (callKey) {
      yield put(callSuccess(callKey));
    }

    return res;
  } catch (err) {
    if (callKey) {
      yield put(callError(callKey));
    }
  }
}