import 'package:failed_in/utilities/colors.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: kColorWhite,
      child: const Center(
        child: CircularProgressIndicator(
          color: kColorBlue,
        ),
      ),
    );
  }
}
