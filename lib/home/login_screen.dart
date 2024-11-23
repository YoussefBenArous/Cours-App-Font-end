import 'package:cours_app/Screens/Home_Screen.dart';
import 'package:cours_app/home/SignUp_screen.dart';
import 'package:cours_app/wedget/custom_Tiltle.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cours_app/wedget/costom_text.dart';
import 'package:cours_app/wedget/custom_input_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
              color: const Color(0xFFF5F5F5),
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.all(20.0),
              child: const CustomTitre(
                text: 'Log In',
                color: Color(0xff1F1F39),
              ),
            ),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomTitle(title: "Your Email"),
                    const SizedBox(height: 2),
                    CustomInputText(
                      hintText: "Enter Your Email",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(
                                r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                            .hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    const CustomTitle(title: "Password"),
                    const SizedBox(height: 2),
                    CustomInputText(
                      hintText: "Entre Your Password",
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
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 2),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // Add forget password functionality
                        },
                        child: const Text(
                          "Forget password?",
                          style: TextStyle(
                            color: Color(0xff858597),
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF3D5CFF),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text.rich(
                        TextSpan(
                          children: <TextSpan>[
                            const TextSpan(
                              text: 'Don’t have an account? ',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Color(0xff858597),
                              ),
                            ),
                            TextSpan(
                              text: 'Sign up',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Color(
                                  0xff3D5CFF,
                                ),
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SignupScreen(),
                                    ),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: Color(0xff858597),
                            thickness: 1,
                            endIndent: 10,
                          ),
                        ),
                        Text(
                          'Or login with',
                          style: TextStyle(
                            fontSize: 14,
                            color: Color(0xff858597),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: Color(0xff858597),
                            thickness: 1,
                            indent: 10,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.g_mobiledata,
                            size: 50,
                            color: Colors.red,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.facebook,
                            size: 50,
                            color: Color(0xff0062E0),
                          ),
                        ),
                      ],
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
