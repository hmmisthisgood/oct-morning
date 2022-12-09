import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool _hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text("Hello",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Text("Welcome to the app",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 40),
                TextFormField(
                  controller: emailController,
                  enabled: true,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  // maxLines: 5,
                  // maxLength: 10,

                  onChanged: (value) {
                    print(value);
                  },
                  // onSubmitted: (val) {
                  //   print(val);
                  // },
                  validator: (val) {
                    if (val == null) {
                      return "Email must not be null";
                    }

                    if (val.isEmpty) {
                      return "Email must not be empty";
                    }
                  },

                  decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "test@test.com",
                      prefixIcon: Icon(Icons.email_outlined),
                      focusedBorder: UnderlineInputBorder(),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue)),
                      disabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange))
                      // border: InputBorder.none,
                      ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: passwordController,
                  // autovalidateMode: AutovalidateMode.disabled,
                  obscureText: _hidePassword,
                  validator: (value) {
                    /// null check
                    if (value == null) {
                      return "Password cannot be null";
                    }

                    /// empty check
                    if (value.isEmpty) {
                      return "Password cannot be empty";
                    }

                    /// more than 5 charaters
                    if (value.length < 5) {
                      return "Password must be more than 5 characters";
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Enter your password",
                    prefixIcon: Icon(Icons.lock_outline),
                    suffixIcon: InkWell(
                      onTap: () {
                        _hidePassword = !_hidePassword; // false

                        setState(() {});
                        print("password is hidden: $_hidePassword");
                      },
                      child: Icon((_hidePassword == true)
                          ? Icons.visibility
                          : Icons.visibility_off_outlined),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                MaterialButton(
                  onPressed: () {
                    final _email = emailController.text;
                    final _password = passwordController.text;

                    print(_email);
                    print(_password);
                  },
                  minWidth: double.infinity,
                  color: Colors.purple,
                  child: Text(
                    "LOGIN",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


/// Form
/// TextField : cannot validate
/// TextFormField: can validate input
/// condition ? ---condition satisfy----- : ,,,,