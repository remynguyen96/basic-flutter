import 'dart:async';

import 'package:first_app/helper/validation.dart';
import 'package:rxdart/rxdart.dart';

class LoginViewModel {
  final _emailSubject = BehaviorSubject<String>();
  final _passSubject = BehaviorSubject<String>();
  final _btnSubject = BehaviorSubject<bool>();

  StreamTransformer emailValidation = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      sink.add(Validation.validateEmail(email));
    },
  );

  StreamTransformer passValidation = StreamTransformer<String, String>.fromHandlers(
    handleData: (pass, sink) {
      sink.add(Validation.validatePass(pass));
    },
  );

  Stream<String> get emailStream => _emailSubject.stream.transform(emailValidation);
  Sink<String> get emailSink => _emailSubject.sink;

  Stream<String> get passStream => _passSubject.stream.transform(passValidation);
  Sink<String> get passSink => _passSubject.sink;

  Stream<bool> get btnStream => _btnSubject.stream;
  Sink<bool> get btnSink => _btnSubject.sink;

  LoginViewModel() {
    Observable.combineLatest2(_emailSubject, _passSubject, (email, pass) {
      return Validation.validateEmail(email) == null && Validation.validatePass(pass) == null;
    }).listen((isEnable) {
      btnSink.add(isEnable);
    });
  }

  dispose() {
    _emailSubject.close();
    _passSubject.close();
    _btnSubject.close();
  }
}
