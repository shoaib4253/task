import 'package:api_learning/views/HomeScreen.dart';
import 'package:api_learning/views/message_screen.dart';
import 'package:api_learning/views/overview_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white, // Set drawer background to white
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Smaller Drawer Header
            Container(
              height: 120, // Adjust the height as needed
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    // Replace Image.asset with Image.network for network image
                    SvgPicture.asset(
                      'assets/images/logo.svg', // Ensure this path is correct
                      height: 40,
                      fit: BoxFit.contain,
                    ),

                    SizedBox(width: 10),
                    Text(
                      'alpha',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Main Drawer Items
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  _buildDrawerItem(
                    icon: Icons.dashboard,
                    text: 'Overview',
                    onTap: () {
                      // Handle Overview Tap
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OverviewScreen()),
                      );
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.shopping_cart,
                    text: 'E-Commerce',
                    onTap: () {
                      // Handle E-Commerce Tap
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.calendar_today,
                    text: 'Calendar',
                    isSelected: true, // Highlight this item as selected
                    onTap: () {
                      // Handle Calendar Tap
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CalendarPage()),
                      );
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.mail,
                    text: 'Mail',
                    trailingIcon: Icons.circle, // Add notification dot
                    onTap: () {
                      // Handle Mail Tap
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.chat,
                    text: 'Chat',
                    onTap: () {
                      // Handle Chat Tap
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MessageScreen()),
                      );
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.check_box,
                    text: 'Tasks',
                    onTap: () {
                      // Handle Tasks Tap
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.folder,
                    text: 'Projects',
                    onTap: () {
                      // Handle Projects Tap
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.folder_open,
                    text: 'File Manager',
                    onTap: () {
                      // Handle File Manager Tap
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.note,
                    text: 'Notes',
                    onTap: () {
                      // Handle Notes Tap
                    },
                  ),
                  _buildDrawerItem(
                    icon: Icons.contacts,
                    text: 'Contacts',
                    onTap: () {
                      // Handle Contacts Tap
                    },
                  ),

                  // Divider
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Divider(),
                  ),

                  // Calendar section header with Add Icon
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Space between icon and text
                        Text(
                          'CALENDARS',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(
                          Icons.add,
                          color: Colors.black, // Add icon color
                        ),
                      ],
                    ),
                  ),

                  // Calendar Categories
                  _buildCalendarCategory(
                    color: Colors.orange,
                    text: 'Important',
                  ),
                  _buildCalendarCategory(
                    color: Colors.red,
                    text: 'Meeting',
                  ),
                  _buildCalendarCategory(
                    color: Colors.green,
                    text: 'Event',
                  ),
                  _buildCalendarCategory(
                    color: Colors.purple,
                    text: 'Work',
                  ),
                  _buildCalendarCategory(
                    color: Colors.grey,
                    text: 'Other',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(
      {required IconData icon,
      required String text,
      bool isSelected = false,
      IconData? trailingIcon,
      required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? Colors.blue : Colors.black,
      ),
      title: Text(
        text,
        style: TextStyle(
          color: isSelected ? Colors.blue : Colors.black,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
      trailing: trailingIcon != null
          ? Icon(trailingIcon, color: Colors.orange, size: 12)
          : null,
      onTap: onTap,
      tileColor: isSelected ? Colors.blue.withOpacity(0.1) : null,
    );
  }

  Widget _buildCalendarCategory({required Color color, required String text}) {
    return ListTile(
      leading: CircleAvatar(
        radius: 5,
        backgroundColor: color,
      ),
      title: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.normal,
        ),
      ),
      onTap: () {
        // Handle Calendar Category Tap
      },
    );
  }
}
