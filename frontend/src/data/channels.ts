import { BASE_SOCKET_URL } from "../lib/constants";
import { Socket } from "../lib/phoenix";

const defaultState = {
  channels: {},
  socket: null
};

// ===========
//   REDUCER
// ===========

function __addSocket(state) {
  const socket = new Socket(BASE_SOCKET_URL, { params: {} });
  socket.connect(null);

  return Object.assign({}, state, { socket });
}

function __joinChannel(state, { name, params }) {
  const { channels: originalChannels, socket } = state;
  const channel = socket.channel(name, params);

  channel
    .join()
    .receive("ok", resp => {
      console.log("Joined successfully", resp);
    })
    .receive("error", resp => {
      console.log("Unable to join", resp);
    });

  const newChannels = Object.assign({}, originalChannels, {
    [name]: channel
  });

  return Object.assign({}, state, { channels: newChannels });
}

export function channels(state = defaultState, action) {
  switch (action.type) {
    case "CONNECT_TO_SOCKET":
      return __addSocket(state);
    case "JOIN_CHANNEL":
      return __joinChannel(state, action.payload);
    default:
      return state;
  }
}
