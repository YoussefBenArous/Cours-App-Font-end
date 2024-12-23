import 'package:cours_app/wedget/custom_Tiltle.dart';
import 'package:flutter/material.dart';

class Account extends StatelessWidget {
  const Account({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align content to the left
            children: [
              const SizedBox(height: 50),
              const CustomTitre(text: "Account", color: Colors.black),
              const SizedBox(height: 16),
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/image/appbar.png'), // Replace with your image path
                ),
              ),
              const SizedBox(height: 32),
              // "Favourite" button spanning the full screen width
              SizedBox(
                width: screenWidth,
                height: 48,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                   shape: MaterialStateProperty.all(const RoundedRectangleBorder(borderRadius: BorderRadius.zero),),
                  ),
                  onPressed: () {
                    // Implement your "Favourite" functionality
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Favourite",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff1F1F39),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: screenWidth,
                height: 48,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.zero,),),
                  ),
                  onPressed: () {
                    // Implement your "Edit Account" functionality
                  },
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Edit Account",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff1F1F39),
                      ),
                    ),
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
