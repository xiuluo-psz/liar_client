import 'package:liar/model/user.dart';
import 'package:liar/model/usual.dart';
import 'package:liar/redux/user_redux.dart';
import 'package:liar/redux/usual_redux.dart';

class GlobalState {
  User user;
  Usual usual;

  GlobalState({
    this.user,
    this.usual,
  });
}

GlobalState appReducer(GlobalState state, action) {
  return GlobalState(
    user: userReducer(state.user, action),
    usual: usualReducer(state.usual, action),
  );
}
