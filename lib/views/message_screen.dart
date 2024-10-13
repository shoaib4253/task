import 'package:api_learning/views/chat_screen.dart';
import 'package:api_learning/widgets/CustomAppBar.dart';
import 'package:api_learning/widgets/CustomDrawer.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MessageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set screen background color to white
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align sections to the left
            children: [
              // Search Bar
              Container(
                padding:
                    EdgeInsets.symmetric(vertical: 10), // Only vertical padding
                decoration: BoxDecoration(
                  color: Colors.white, // White background for the search bar
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.grey),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search...",
                          border:
                              InputBorder.none, // No border for the TextField
                          contentPadding: EdgeInsets
                              .zero, // Remove default padding inside the TextField
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 10),

              // Pinned Section
              _buildSectionTitle('PINNED'),
              _buildChatTile(
                context,
                name: 'Alphaboard',
                message: 'Jane: Hello, Mark! I am writing to...',
                imageUrl: 'assets/images/avatar1.svg',
                isPinned: true,
                hasNotification: true,
              ),
              _buildChatTile(
                context,
                name: 'Design Team',
                message: 'Your: Hello. Can you drop the...',
                imageUrl: 'assets/images/avatar2.svg',
                isPinned: true,
              ),
              _buildChatTile(
                context,
                name: 'Dustin Williamson',
                message: 'Dustin is typing...',
                imageUrl: 'assets/images/avatar3.svg',
                isPinned: true,
                hasNotification: true,
              ),

              SizedBox(height: 10),
              _buildSectionTitle('ALL MESSAGES'),

              // All messages
              ListView(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap:
                    true, // Prevent ListView from scrolling independently
                children: [
                  _buildChatTile(
                    context,
                    name: 'Jane Witson',
                    message: 'Hi! How are you, Steve? 😃',
                    imageUrl: 'assets/images/avatar4.svg',
                  ),
                  _buildChatTile(
                    context,
                    name: 'Brandon Pena',
                    message: 'How about going somewhere...',
                    imageUrl: 'assets/images/avatar5.svg',
                  ),
                  _buildChatTile(
                    context,
                    name: 'Nathan Fox',
                    message: 'Hello. We have a meeting...',
                    imageUrl: 'assets/images/avatar4.svg',
                  ),
                  _buildChatTile(
                    context,
                    name: 'Jacob Hawkins',
                    message: 'Well done! 👍',
                    imageUrl: 'assets/images/avatar3.svg',
                    hasNotification: true,
                  ),
                  _buildChatTile(
                    context,
                    name: 'Shane Black',
                    message: 'Paul’s having a party tomorrow...',
                    imageUrl: 'assets/images/avatar3.svg',
                  ),
                  _buildChatTile(
                    context,
                    name: 'Priscilla Edwards',
                    message: 'It’s up to you.',
                    imageUrl: 'assets/images/avatar1.svg',
                  ),
                  _buildChatTile(
                    context,
                    name: 'Kristin Mccoy',
                    message: 'It looks amazing!',
                    imageUrl: 'assets/images/avatar5.svg',
                  ),
                  _buildChatTile(
                    context,
                    name: 'Bruce Russell',
                    message: 'Hi, any progress on the project?',
                    imageUrl: 'assets/images/avatar4.svg',
                    hasNotification: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildChatTile(
    BuildContext context, {
    required String name,
    required String message,
    required String imageUrl,
    bool isPinned = false,
    bool hasNotification = false,
  }) {
    return Card(
      // Use Card for chat items
      color: Color.fromARGB(255, 251, 249, 249),
      margin: EdgeInsets.symmetric(vertical: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(2),
      ),
      elevation: 0, // No elevation
      child: ListTile(
        leading: CircleAvatar(
          radius: 25,
          child: SvgPicture.asset(
            imageUrl,
            height: 50, // Adjust height as needed
            width: 50, // Adjust width as needed
            fit: BoxFit.cover, // Ensure the SVG fits within the circle
          ),
        ),
        title: Text(
          name,
          style: TextStyle(
            fontWeight: isPinned ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        subtitle: Text(message, overflow: TextOverflow.ellipsis),
        trailing: hasNotification
            ? Icon(Icons.circle, color: Colors.orange, size: 12)
            : null,
        onTap: () {
          // Navigate to ChatScreen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChatScreen()),
          );
        },
      ),
    );
  }
}
