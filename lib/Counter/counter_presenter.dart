import 'package:first_app/Counter/counter_view.dart';
import 'package:first_app/mvp/presenter.dart';

class CounterPresenter extends Presenter<CounterView> {
  int count = 0;

  increment() {
    count++;
    getView().onIncrement(count);
  }

  decrement() {
    count--;
    getView().onDecrement(count);
  }
}
