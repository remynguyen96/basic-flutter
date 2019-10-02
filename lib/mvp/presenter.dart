import 'package:first_app/mvp/mvp_view.dart';

class Presenter<T extends MvpView> {
  T view;

  attachView(T view) {
    this.view = view;
  }

  deAttachView() {
    this.view = null;
  }

  T getView() {
    return view;
  }
}
