import 'package:pm_criando_gerenciamento_estado/contracts/observable_state.dart';
import 'package:pm_criando_gerenciamento_estado/controllers/change_state.dart';

class StateObservable<T> extends ChangeState implements ObservableState<T> {
   T _state;

  @override
  T get state => _state;

  set state(T newState) {
    if (newState == _state) return;
    _state = newState;
    notifyCallback();
  }

  StateObservable(this._state);
}
