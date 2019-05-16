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
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) => TextField(
            // obscureText: true,
            keyboardType: TextInputType.text,
            onChanged: bloc.changePassword,
            decoration: InputDecoration(
              hintText: "password",
              labelText: "Password",
              errorText: snapshot.error,
            ),
          ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) => RaisedButton(
            shape: StadiumBorder(),
            onPressed: snapshot.hasData ? bloc.submit : null,
            color: Colors.lightBlueAccent,
            child: Text(
              "Login",
              style: TextStyle(color: Colors.white),
            ),
          ),
    );
  }
}
