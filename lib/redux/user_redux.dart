import 'package:liar/model/user.dart';
import 'package:redux/redux.dart';

final userReducer = combineReducers<User>([
  TypedReducer<User, RefreshUserAction>(_refresh),
]);

///定义处理 Action 行为的方法，返回新的 State
User _refresh(User user, action) {
  user = action.user;
  return user;
}

class RefreshUserAction {
  final User user;

  RefreshUserAction(this.user);
}
