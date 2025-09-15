import 'dart:convert';
import 'package:flutter_tutorialss/Flutter/loginwithusername.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginOptn(phoneNumber: '123456789', name: "name"),
    ),
  );
}

class LoginOptn extends StatefulWidget {
  final String phoneNumber;
  final String name;

  const LoginOptn({super.key, required this.phoneNumber, required this.name});

  @override
  _LoginOptnState createState() => _LoginOptnState();
}

class _LoginOptnState extends State<LoginOptn> {
  bool isLocationGranted = false;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    isLocationGranted = true; // Enable the button for testing
    // _requestLocationPermission();
  }

  // Future<void> _requestLocationPermission() async {
  //   setState(() {
  //     isLoading = true;
  //   });

  //   LocationPermission permission = await Geolocator.checkPermission();

  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //   }

  //   if (permission == LocationPermission.deniedForever) {
  //     // Open settings if permission is permanently denied
  //     _showPermissionDialog();
  //     setState(() {
  //       isLoading = false;
  //     });
  //     return;
  //   }

  //   if (permission == LocationPermission.whileInUse ||
  //       permission == LocationPermission.always) {
  //     setState(() {
  //       isLocationGranted = true;
  //       isLoading = false;
  //     });
  //   } else {
  //     setState(() {
  //       isLoading = false;
  //     });
  //     if (mounted) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         const SnackBar(
  //             content: Text('Location permission is required to continue.')),
  //       );
  //     }
  //   }
  // }

  void _showPermissionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // Prevent closing without action
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: Text(
          "Location Permission Required",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: const Color(0xFF55033f),
          ),
        ),
        content: Text(
          "This app requires location access to proceed. Please enable it in settings.",
          style: GoogleFonts.poppins(
            color: Colors.black87,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await openAppSettings();
              if (mounted) {
                Navigator.pop(context);
                // _requestLocationPermission();
              }
            },
            child: Text(
              "Open Settings",
              style: GoogleFonts.poppins(
                color: const Color(0xFF060977),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false, // Disable back button
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFF55033f),
                Color(0xFF060977),
              ],
            ),
          ),
          child: SafeArea(
            child: Stack(
              children: [
                // Background design elements
                Positioned(
                  top: -50,
                  right: -50,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -80,
                  left: -80,
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),

                // Main content
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 40),

                      // Logo section
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/company_logo.png',
                              height: 80,
                              width: 200,
                              fit: BoxFit.contain,
                            ),
                            const Spacer(),
                          ],
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Welcome message
                      Text(
                        "Financial Freedom\nAt Your Fingertips",
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1.3,
                        ),
                      ),

                      const SizedBox(height: 15),
                      Text(
                        "Take control of your finances with our intuitive payment solution",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.8),
                          height: 1,
                        ),
                      ),

                      const Spacer(),

                      // Centered animation
                      Center(
                        child: Lottie.asset(
                          'assets/landing.json',
                          height: 350,
                        ),
                      ),

                      const Spacer(),

                      // Login button
                      isLoading
                          ? const Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : _buildLoginButton(
                              'Continue with Username',
                              Icons.arrow_forward_ios,
                              isLocationGranted
                                  ? () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              LoginWithUsername(
                                            phoneNumber: widget.phoneNumber,
                                            name: widget.name,
                                          ),
                                        ),
                                      );
                                    }
                                  : null,
                            ),

                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(
    String text,
    IconData icon,
    VoidCallback? onPressed,
  ) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            Color(0xFF04d628),
            Color(0xFF1cb737),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF04d628).withOpacity(0.4),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 15),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 10),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Icon(
                    icon,
                    color: Colors.white,
                    size: 16,
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
