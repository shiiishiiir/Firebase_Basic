import 'package:firebase/providers/EmailProvider.dart';
import 'package:flutter/material.dart';

class SignInPagee extends StatefulWidget {
  const SignInPagee({Key? key}) : super(key: key);

  @override
  State<SignInPagee> createState() => _SignInPageeState();
}

class _SignInPageeState extends State<SignInPagee> {
  final _formKey = GlobalKey<FormState>();

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
          title: Text("FireBase Email Sign In"),
          centerTitle: true,
        ),
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        isLogIn
                            ? TextFormField(
                          key: ValueKey("Username"),
                          decoration: InputDecoration(
                            hintText: "Enter Your Username",
                          ),
                          validator: (value) {
                            if (value.toString().length < 3) {
                              return "Username is Small";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            setState(() {
                              username = value!;
                            });
                          },
                        )
                            : Container(),
                        TextFormField(
                          key: ValueKey("Email"),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            labelText: "Enter Email or Phone Number",
                          ),
                          validator: (value) {
                            if (!(value.toString().contains("@"))) {
                              return "Invalid Email";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            setState(() {
                              email = value!;
                            });
                          },
                        ),
                        TextFormField(
                          obscureText: true,
                          key: ValueKey("Password"),
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                            labelText: "Password",
                          ),
                          validator: (value) {
                            if (value.toString().length < 6) {
                              return "Password is Small";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (value) {
                            setState(() {
                              password = value!;
                            });
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: _handleSignUpData,
                            child: isLogIn ? Text("Sign Up") : Text("Log In"),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              isLogIn = !isLogIn;
                            });
                          },
                          child: isLogIn
                              ? Text("Already SignUp? LogIn")
                              : Text("Don't Have an Account? SignUp"),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
