import 'package:failed_in/utilities/user_api.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();

    print(UserApi.instance.email!);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
