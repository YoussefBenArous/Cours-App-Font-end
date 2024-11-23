import 'package:cours_app/Screens/Home_Screen.dart';
import 'package:cours_app/home/login_screen.dart';
import 'package:cours_app/wedget/costom_text.dart';
import 'package:cours_app/wedget/custom_Tiltle.dart';
import 'package:cours_app/wedget/custom_input_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var _obscureText = true;
  final formKey = GlobalKey<FormState>();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              color: const Color(0xfff0f0f2),
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.all(20.0),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomTitre(
                    text: 'Sign Up',
                    color: Color(0xff1F1F39),
                  ),
                  CustomTitle(title: 'Enter your details below & free sign up'),
                ],
              ),
            ),
            Container(
              color: const Color(0xffffffff),
              padding: const EdgeInsets.all(20.0),
              alignment: Alignment.center,
              child: Form(
                key: formKey, // FormKey is now used here.
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomTitle(title: 'Your Email'),
                    const SizedBox(height: 2),
                    CustomInputText(
                      hintText: 'Enter Your Email',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!value.contains('@')) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    const CustomTitle(title: 'Password'),
                    const SizedBox(
                      height: 2,
                    ),
                    CustomInputText(
                      hintText: 'Enter Your Password',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        if (value.length < 8) {
                          return 'Password must be at least 8 characters long';
                        }
                        if (!value.contains(RegExp(r'[A-Za-z]'))) {
                          return 'Password must contain at least one letter';
                        }
                        if (!value.contains(RegExp(r'[0-9]'))) {
                          return 'Password must contain at least one number';
                        }
                        return null;
                      },
                      obscureText: _obscureText,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: isChecked
                            ? () {
                                if (formKey.currentState!.validate()) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const HomeScreen(),
                                    ),
                                  );
                                }
                              }
                            : null, // Disabled if not checked
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3D5CFF),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          fixedSize: const Size(327, 50),
                        ),
                        child: const Text(
                          'Create account',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value ?? false;
                            });
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          activeColor: Colors.blue,
                        ),
                        const Expanded(
                          child: Text(
                            'By creating an account you have to agree \n with our them & condication.',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff858597),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text.rich(
                        TextSpan(
                          children: <TextSpan>[
                            const TextSpan(
                              text: 'Already have an account? ',
                              style: TextStyle(
                                color: Color(0xff858597),
                                fontSize: 16,
                              ),
                            ),
                            TextSpan(
                              text: 'Log in',
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff3D5CFF),
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginScreen(),
                                    ),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
