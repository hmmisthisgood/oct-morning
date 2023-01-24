import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:start_app/bloc/auth/auth_cubit.dart';
import 'package:start_app/widget/custom_textfield.dart';

class SignupScreen extends StatefulWidget {
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

      BlocProvider.of<AuthCubit>(context).signUpWithEmail(_email, _password);
    }
  }

  Widget buildLoadingIndicator() {
    // if (state is AuthLoading)
    return Container(
      height: 20,
      width: 20,
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: CircularProgressIndicator(
        color: Colors.white,
        strokeWidth: 1.5,
        // value: 0.3,
        // valueColor: AlwaysStoppedAnimation(Colors.black),
      ),
    );
    // else
    //   return Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.blue,
      body: SafeArea(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            // if (state is AuthSuccess) {
            //   Navigator.pop(context);
            // }
          },
          builder: (context, state) {
            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Form(
                    key: formKey,
                    autovalidateMode: AutovalidateMode.disabled,
                    child: ListView(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20),
                        Text("Hello",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                        Text("Create an Account",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                        SizedBox(height: 40),

                        /// using common textfield widgets
                        CustomTextField(
                          controller: emailController,
                          validator:
                              EmailValidator(errorText: "Email must be valid"),
                          prefix: Icon(Icons.email_outlined),
                          hintText: "test@test.com",
                        ),

                        CustomTextField(
                          controller: passwordController,
                          hintText: "Enter your password",
                          validator: MultiValidator([
                            RequiredValidator(
                                errorText: "Password is required"),
                            MinLengthValidator(5,
                                errorText:
                                    "Password must be more than 5 characters"),
                            PatternValidator(r'(?=.*?[#?!@$%^&*])',
                                errorText:
                                    "Password must contain 1 special character")
                          ]),
                          prefix: Icon(Icons.lock_outline),
                          suffix: InkWell(
                            onTap: () {
                              _hidePassword = !_hidePassword; // false

                              setState(() {});
                              print("password is hidden: ");
                            },
                            child: Icon((_hidePassword == true)
                                ? Icons.visibility
                                : Icons.visibility_off_outlined),
                          ),
                        ),
                        SizedBox(height: 20),
                        // Container(
                        //   height: 100,
                        //   width: 100,
                        //   child: CircularProgressIndicator(
                        //       color: Colors.white,
                        //       strokeWidth: 3,
                        //       value: 0.6,
                        //       backgroundColor: Colors.grey,
                        //       valueColor: AlwaysStoppedAnimation(Colors.blue)),
                        // ),
                        IgnorePointer(
                          /// only when loading is true, clicks are ignored
                          ignoring: (state is AuthLoading),
                          child: MaterialButton(
                              onPressed: submit,
                              minWidth: double.infinity,
                              color: Colors.purple,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("SIGN UP",
                                      style: TextStyle(color: Colors.white)),
                                  if (state is AuthLoading)
                                    buildLoadingIndicator()
                                ],
                              )),
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
                if (state is AuthLoading)
                  Container(
                    color: Colors.blue.withOpacity(0.3),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
              ],
            );
          },
        ),
      ),
    );
  }
}


/// Form
/// TextField : cannot validate
/// TextFormField: can validate input
/// condition ? ---condition satisfy----- : ,,,,

/// IgnorePointer: wiget used to ignore the clicks or presses. 