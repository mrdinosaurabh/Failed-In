import 'package:failed_in/components/custom_bottom_navigation_bar.dart';
import 'package:failed_in/screens/profile_screen.dart';
import 'package:failed_in/screens/upload_post_screen.dart';
import 'package:failed_in/services/storage_service.dart';
import 'package:failed_in/utilities/colors.dart';
import 'package:failed_in/utilities/routes.dart';
import 'package:failed_in/utilities/user_api.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 1;

  @override
  void initState() {
    super.initState();

    print(UserApi.instance.email!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kColorWhite,
        title: const Text(
          'FailedIn',
          style: TextStyle(
            color: kColorBlueDark,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          getActionButton(),
        ],
      ),
      backgroundColor: kColorWhite,
      body: getCurrentPage(),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Widget getCurrentPage() {
    switch (_currentIndex) {
      case 0:
        return const UploadPostScreen();
      case 1:
        return const HomeScreen();
      case 2:
        return const ProfileScreen();
    }
    return Container();
  }

  Widget getActionButton() {
    switch (_currentIndex) {
      case 0:
        return Container();
      case 1:
        return IconButton(
          icon: const Icon(FontAwesomeIcons.bell),
          color: kColorBlueDark,
          onPressed: () {
            Navigator.pushNamed(context, Routes.notificationScreen);
          },
        );
      case 2:
        return PopupMenuButton(
          icon: const Icon(
            Icons.settings_outlined,
            color: kColorBlueDark,
          ),
          onSelected: (value) async {
            switch (value) {
              case 0:
                Navigator.pushNamed(context, Routes.editProfileScreen);
                break;
              case 1:
                await logout();
                break;
            }
          },
          itemBuilder: (BuildContext buildContext) {
            return [
              const PopupMenuItem(
                value: 0,
                child: Text("Edit profile"),
              ),
              const PopupMenuItem(
                value: 1,
                child: Text("Logout"),
              ),
            ];
          },
        );
    }
    return Container();
  }

  Future<void> logout() async {
    await StorageService.storeJWT("");
    Navigator.pushReplacementNamed(context, Routes.loginScreen);
  }
}
