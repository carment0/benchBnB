import { RECEIVE_CURRENT_USER, RECEIVE_ERRORS } from '../actions/session_action';

export const sessionReducer = (state = {}, action) => {
  Object.freeze();
  switch (action.type) {
    case RECEIVE_CURRENT_USER:
      const newState = {"currentUser": action.currentUser};
      return Object.assign({}, state, newState);
    case RECEIVE_ERRORS:

      break;
    default:
        return state;
  }
};
