import 'package:api_learning/views/message_screen.dart';
import 'package:api_learning/views/overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showProfileImage;

  const CustomAppBar({
    Key? key,
    this.title = '',
    this.showProfileImage = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false, // Disable default back button
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.black), // Menu icon for drawer
            onPressed: () {
              Scaffold.of(context).openDrawer(); // Open the drawer
            },
          ),
          if (title.isNotEmpty)
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.search, color: Colors.black),
                onPressed: () {
                  // Implement search functionality
                },
              ),
              IconButton(
                icon: Icon(Icons.settings, color: Colors.black),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OverviewScreen()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.notifications, color: Colors.black),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MessageScreen()),
                  );
                },
              ),
              if (showProfileImage)
                SvgPicture.asset(
                  'assets/images/avatar2.svg', // Ensure this path is correct
                  height: 40,
                  fit: BoxFit.contain,
                ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
