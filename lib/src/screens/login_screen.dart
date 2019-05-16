import 'package:flutter/material.dart';
import 'package:login_bloc/src/blocs/bloc.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          EmailField(),
          PasswordField(),
          SubmitButton(),
        ],
      ),
    );
  }
}

class EmailField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) => TextField(
            onChanged: bloc.changeEmail,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "you@example.com",
              labelText: "Email address",
              errorText: snapshot.error,
            ),
          ),
    );
  }
}

class PasswordField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      // obscureText: true,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: "password",
        labelText: "Password",
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {},
      color: Colors.lightBlueAccent,
      child: Text(
        "Login",
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
