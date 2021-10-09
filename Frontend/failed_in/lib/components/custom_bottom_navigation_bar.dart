import 'package:failed_in/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({
    Key? key,
    required this.onTap,
    required this.currentIndex,
  }) : super(key: key);

  final Function onTap;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 5,
      selectedItemColor: kColorBlueDark,
      unselectedItemColor: kColorGrey,
      onTap: (int index) {
        onTap(index);
      }, // new
      currentIndex: currentIndex,
      showSelectedLabels: true,
      showUnselectedLabels: false,
      selectedLabelStyle: const TextStyle(
        fontSize: 12,
      ),
      backgroundColor: kColorWhite,
      selectedIconTheme: const IconThemeData(
        size: 30,
      ),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.plusCircle),
          label: "Post",
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.globeAsia),
          label: "Explore",
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.userCircle),
          label: "Profile",
        )
      ],
    );
  }
}
