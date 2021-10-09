import 'package:failed_in/utilities/colors.dart';
import 'package:failed_in/utilities/routes.dart';
import 'package:failed_in/utilities/spacing.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    loadUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorBlue,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text(
              'FailedIn',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 24,
                color: kColorWhite,
              ),
            ),
            kSpace50Ver,
            CircularProgressIndicator(
              color: kColorWhite,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loadUserInfo() async {
    await Future.delayed(const Duration(milliseconds: 3000));

    Navigator.pushReplacementNamed(context, Routes.loginScreen);

    // TODO: Check login status and load user data
  }
}
