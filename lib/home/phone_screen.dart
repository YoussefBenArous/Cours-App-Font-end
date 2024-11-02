import 'package:cours_app/home/SignUp_screen.dart';
import 'package:cours_app/verefication/verify_Screen.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart'; // Import the intl_phone_field package

class PhoneScreen extends StatefulWidget {
  const PhoneScreen({super.key});

  @override
  State<PhoneScreen> createState() => _PhoneScreenState();
}

class _PhoneScreenState extends State<PhoneScreen> {
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfff0f0f2),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignupScreen(),
              ),
            );
          },
          icon: const Icon(Icons.keyboard_backspace_outlined),
        ),
      ),
      body: SafeArea(
        key: _formkey,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                color: const Color(0xfff0f0f2),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Continue with Phone',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff1f1f39),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Flexible(
                      child: Image.asset(
                        'assets/image/veref.png',
                        fit: BoxFit.cover,
                        width: 150,
                        height: 150,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                color: Colors.white,
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Enter Your Phone Number",
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(height: 20),
                    IntlPhoneField(
                      validator: (phone) {
                        if (phone != null) {
                          return 'Phone number is required';
                        }

                        // Additional validation checks
                        final number = phone!.number;
                        if (number.isEmpty) {
                          return 'Phone number cannot be empty';
                        }

                        // Remove any spaces or special characters
                        final cleanNumber =
                            number.replaceAll(RegExp(r'[\s\-\(\)]'), '');

                        // Check if the number contains only digits after cleaning
                        if (!RegExp(r'^\d+$').hasMatch(cleanNumber)) {
                          return 'Phone number should contain only digits';
                        }

                        return null;
                      },
                      decoration: const InputDecoration(
                        labelText:
                            'Phone Number', // Label for the phone number field
                        border:
                            OutlineInputBorder(), // Outline border for the input field
                      ),
                      initialCountryCode: 'US', // Default country code (US)
                      onChanged: (phone) {
                        // Triggered whenever the phone number changes
                        print(phone
                            .completeNumber); // Print the full phone number to the console
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VerificationScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff3D5CFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        "Continue",
                        style: TextStyle(fontSize: 16, color: Colors.white),
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
