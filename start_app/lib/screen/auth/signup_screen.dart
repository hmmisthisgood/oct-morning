import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:start_app/widget/custom_textfield.dart';

class SignupScreen extends StatefulWidget {
  SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool _hidePassword = true;

  final formKey = GlobalKey<FormState>();

  void submit() async {
    final _email = emailController.text;
    final _password = passwordController.text;

    /// to hide the keyboard
    FocusScope.of(context).unfocus();
    final state = formKey.currentState;

    if (state != null) {
      bool isValidated = state.validate();

      if (isValidated == false) {
        return;
      }

      //// CREATE USER WITH FIREBASE

      try {
        final userCreds = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: _email, password: _password);

        final currentUser = FirebaseAuth.instance.currentUser;
        Fluttertoast.showToast(msg: "Account created successfully!");
        Navigator.pop(context);
        if (currentUser == null) {
          return;
        }
        await currentUser.sendEmailVerification();
        print(userCreds.user.toString());
      } on FirebaseAuthException catch (e, s) {
        print(e.code);
        print(e.message);
        print(s);
        Fluttertoast.showToast(msg: e.message ?? "An error occurred");
      } catch (e, s) {
        print(e);
        print(s);
      }
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
                Text("Create an Account",
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 40),

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
                    "SIGN UP",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(height: 15),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Already have an account? Back to Sign In",
                    style: TextStyle(fontSize: 16),
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