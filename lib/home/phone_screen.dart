import 'package:cours_app/home/SignUp_screen.dart';
import 'package:cours_app/verefication/verify_Screen.dart';
import 'package:cours_app/wedget/custom_Tiltle.dart';
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
        backgroundColor: const Color(0xfff0f0f2),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignupScreen(),
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              // Header Section
              Expanded(
                flex: 3,
                child: Container(
                  color: const Color(0xfff0f0f2),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTitre(
                        text: 'Continue with Phone',
                        color: Color(0xff1F1F39),
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

              // Input Section
              Expanded(
                flex: 4,
                child: Container(
                  color: Colors.white,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Enter Your Phone Number",
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 20),

                      // Phone Field and Button
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: IntrinsicHeight(
                          // Ensures both elements have the same height
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // Phone Field
                              Expanded(
                                flex: 2,
                                child: IntlPhoneField(
                                  validator: (phone) {
                                    if (phone == null || phone.number.isEmpty) {
                                      return 'Phone number is required';
                                    }
                                    final cleanNumber = phone.number
                                        .replaceAll(RegExp(r'[\s\-\(\)]'), '');
                                    if (!RegExp(r'^\d+$')
                                        .hasMatch(cleanNumber)) {
                                      return 'Phone number should contain only digits';
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                    labelText: 'Phone Number',
                                    border: OutlineInputBorder(),
                                  ),
                                  initialCountryCode: 'US',
                                  onChanged: (phone) {
                                    print(phone.completeNumber);
                                  },
                                ),
                              ),

                              const SizedBox(width: 10),

                              ElevatedButton(
                                onPressed: () {
                                  if (_formkey.currentState!.validate()) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const VerificationScreen(),
                                      ),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff3D5CFF),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  fixedSize: const Size(124, 54), // Button size
                                ),
                                child: const Text(
                                  "Continue",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.white),
                                ),
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
      ),
    );
  }
}
