import 'package:liar/model/usual.dart';
import 'package:redux/redux.dart';

final usualReducer = combineReducers<Usual>([
  TypedReducer<Usual, RefreshUserAction>(_refresh),
]);

///定义处理 Action 行为的方法，返回新的 State
Usual _refresh(Usual usual, action) {
  usual = action.user;
  return usual;
}

class RefreshUserAction {
  final Usual usual;

  RefreshUserAction(this.usual);
}
