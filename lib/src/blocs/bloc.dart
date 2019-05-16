import 'dart:async';

import 'package:login_bloc/src/blocs/validators.dart';

class Bloc with Validators {
  final _emailStream = StreamController<String>();
  final _passwordStream = StreamController<String>();

  // Add values to stream
  Function(String) get changeEmail => _emailStream.sink.add;
  Function(String) get changePassword => _passwordStream.sink.add;

  // get values from stream
  Stream<String> get email => _emailStream.stream.transform(validateEmail);
  Stream<String> get password =>
      _passwordStream.stream.transform(validatePassword);

  // close the stream sink
  void dispose() {
    _emailStream.close();
    _passwordStream.close();
  }
}
