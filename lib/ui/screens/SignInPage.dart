import 'package:firebase/providers/EmailProvider.dart';
import 'package:flutter/material.dart';

class SignInPagee extends StatefulWidget {
  const SignInPagee({Key? key}) : super(key: key);

  @override
  State<SignInPagee> createState() => _SignInPageeState();
}

class _SignInPageeState extends State<SignInPagee> {
  final _formKey= GlobalKey<FormState>();

  bool isLogIn = false;

  String email = "";
  String password = "";
  String username = "";

  _handleSignUpData() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      isLogIn ? signUp(email, password) : signIn(email, password);
    }
  }







  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("FireBase Everything"),
          centerTitle: true,
        ),
        body: Center(
          child: ListView(
            children: [
              Column(
                children: [
                  Text("Sign In"),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: "Enter Email or Phone Number",
                          ),
                        ),
                        TextFormField(
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            labelText: "Password",
                          ),
                        ),

                      ],
                    ),
                  ),
                ],
              )
            ] ,
          ),
        ),
      ),
    );
  }
}
