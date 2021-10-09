import 'package:failed_in/utilities/colors.dart';
import 'package:flutter/material.dart';

class UploadPostScreen extends StatefulWidget {
  const UploadPostScreen({Key? key}) : super(key: key);

  @override
  _UploadPostScreenState createState() => _UploadPostScreenState();
}

class _UploadPostScreenState extends State<UploadPostScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kColorWhite,
      body: Center(
        child: Text('Upload post'),
      ),
    );
  }
}
