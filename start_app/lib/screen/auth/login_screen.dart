import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:start_app/util/assets.dart';
import 'package:start_app/util/shared_pref.dart';
import 'package:start_app/widget/custom_textfield.dart';

import '../../navigation/routes.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool _hidePassword = true;

  final formKey = GlobalKey<FormState>();

  void submit() async {
    final _email = emailController.text;
    final _password = passwordController.text;

    print(_email);
    print(_password);

    /// to hide the keyboard
    FocusScope.of(context).unfocus();
    final state = formKey.currentState;

    if (state != null) {
      bool isValidated = state.validate();

      if (isValidated == false) {
        return;
      }
      //// send data to server

      try {
        final userCreds = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);

        Navigator.pushNamedAndRemoveUntil(
            context, Routes.homeScreen, (route) => false);

        SharedPref.setUserLoggedIn(true);
      } on FirebaseAuthException catch (e) {
        print(e.message);
        Fluttertoast.showToast(msg: e.message ?? "An error occurred");
      } catch (e) {
        print(e);
      }
    }
  }

  signInwithGoogle() async {
    // Trigger the authentication flow

    final google = GoogleSignIn();

    // await google.signOut();
    final userAccount = await google.signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await userAccount?.authentication;

    /// OAuth2
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  signInWithFacebook() async {
    final result = await FacebookAuth.instance.login();

    final status = result.status;

    if (status == LoginStatus.failed) {
      Fluttertoast.showToast(msg: "Login failed");
      return;
    }

    if (status == LoginStatus.cancelled) {
      Fluttertoast.showToast(msg: "Login canclled by user");
      return;
    }
    if (status == LoginStatus.success) {
      final token = result.accessToken!.token;

      final credential = FacebookAuthProvider.credential(token);

      final firebaseUserCreds =
          await FirebaseAuth.instance.signInWithCredential(credential);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.disabled,
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text("Hello",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Text("Welcome to the app",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 40),
                // Text("Email"),
                // TextFormField(
                //   controller: emailController,
                //   enabled: true,
                //   keyboardType: TextInputType.emailAddress,
                //   textInputAction: TextInputAction.next,
                //   // autovalidateMode: AutovalidateMode.disabled,
                //   // maxLines: 5,
                //   // maxLength: 10,

                //   onChanged: (value) {
                //     print(value);
                //   },
                //   // onSubmitted: (val) {
                //   //   print(val);
                //   // },
                //   validator: EmailValidator(errorText: "Email must be valid"),
                //   // (val) {
                //   //   if (val == null) {
                //   //     return "Email must not be null";
                //   //   }
                //   //   if (val.isEmpty) {
                //   //     return "Email must not be empty";
                //   //   }
                //   // },

                //   decoration: InputDecoration(
                //     labelText: "Email",
                //     hintText: "test@test.com",
                //     // fillColor: Colors.white,
                //     // filled: true,
                //     prefixIcon: Icon(Icons.email_outlined),
                //     border: InputBorder.none,
                //     focusedBorder: UnderlineInputBorder(),
                //     errorBorder: OutlineInputBorder(
                //         borderSide: BorderSide(color: Colors.green)),
                //     focusedErrorBorder: OutlineInputBorder(
                //         borderSide: BorderSide(color: Colors.blue)),
                //     disabledBorder: UnderlineInputBorder(
                //         borderSide: BorderSide(color: Colors.green)),
                //     enabledBorder: UnderlineInputBorder(
                //         borderSide: BorderSide(color: Colors.orange)),
                //   ),
                // ),

                // SizedBox(height: 10),
                // TextFormField(
                //   controller: passwordController,
                //   // autovalidateMode: AutovalidateMode.disabled,
                //   obscureText: _hidePassword,
                //   validator: MultiValidator([
                //     RequiredValidator(errorText: "Password is required"),
                //     MinLengthValidator(5,
                //         errorText: "Password must be more than 5 characters"),
                //     PatternValidator(r'(?=.*?[#?!@$%^&*])',
                //         errorText: "Password must contain 1 special character")
                //   ]),
                //   //  (value) {
                //   //   /// null check
                //   //   if (value == null) {
                //   //     return "Password cannot be null";
                //   //   }

                //   //   /// empty check
                //   //   if (value.isEmpty) {
                //   //     return "Password cannot be empty";
                //   //   }

                //   //   /// more than 5 charaters
                //   //   if (value.length < 5) {
                //   //     return "Password must be more than 5 characters";
                //   //   }
                //   // },
                //   decoration: InputDecoration(
                //     hintText: "Enter your password",
                //     prefixIcon: Icon(Icons.lock_outline),
                //     suffixIcon: InkWell(
                //       onTap: () {
                //         _hidePassword = !_hidePassword; // false

                //         setState(() {});
                //         print("password is hidden: $_hidePassword");
                //       },
                //       child: Icon((_hidePassword == true)
                //           ? Icons.visibility
                //           : Icons.visibility_off_outlined),
                //     ),
                //   ),
                // ),
                // SizedBox(height: 20),

                // Text("Using common textfield widgets"),

                // SizedBox(height: 20),

                /// using common textfield widgets
                CustomTextField(
                  controller: emailController,
                  validator: EmailValidator(errorText: "Email must be valid"),
                  prefix: Icon(Icons.email_outlined),
                  hintText: "test@test.com",
                ),

                CustomTextField(
                  controller: passwordController,
                  hintText: "Enter your password",
                  validator: MultiValidator([
                    RequiredValidator(errorText: "Password is required"),
                    MinLengthValidator(5,
                        errorText: "Password must be more than 5 characters"),
                    PatternValidator(r'(?=.*?[#?!@$%^&*])',
                        errorText: "Password must contain 1 special character")
                  ]),
                  prefix: Icon(Icons.lock_outline),
                  suffix: InkWell(
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
                SizedBox(height: 20),

                MaterialButton(
                  onPressed: submit,
                  minWidth: double.infinity,
                  color: Colors.purple,
                  child: Text(
                    "LOGIN",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.signupScreen);
                  },
                  child: Text(
                    "Do not have an account yet? Sign Up",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(height: 15),

                MaterialButton(
                  onPressed: signInwithGoogle,
                  // color: Colors.red,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.red)),
                  child: Row(children: [
                    SvgPicture.asset(
                      Assets.googleIcon,
                      height: 25,
                      width: 25,
                      // color: Colors.white,
                    ),
                    SizedBox(width: 20),
                    Text(
                      "Sign in With Google",
                      style: TextStyle(
                          // color: Colors.white,
                          fontSize: 16),
                    ),
                  ]),
                ),

                MaterialButton(
                  onPressed: signInWithFacebook,
                  // color: Colors.red,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.blue)),
                  child: Row(children: [
                    Image.asset(
                      Assets.facebookIcon,
                      height: 25,
                      width: 25,
                      // color: Colors.white,
                    ),
                    SizedBox(width: 20),
                    Text(
                      "Sign in With Facebook",
                      style: TextStyle(
                          // color: Colors.white,
                          fontSize: 16),
                    ),
                  ]),
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