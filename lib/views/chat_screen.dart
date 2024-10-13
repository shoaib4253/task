import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Row(
          children: [
            Container(
              width: 50, // Set width
              height: 50, // Set height
              child: ClipOval(
                child: SvgPicture.asset(
                  'assets/images/avatar1.svg', // Replace with your SVG
                  fit: BoxFit.cover, // Ensure the SVG fits within the circle
                ),
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Design Team',
                  style: TextStyle(color: Colors.black),
                ),
                Text(
                  '6 Members, 3 Online',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Icon(Icons.more_vert, color: Colors.black),
        ],
      ),
      body: Column(
        children: [
          // Messages List
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              children: [
                _buildMessage(
                  isMe: false,
                  senderName: 'Jane Wilson',
                  message:
                      'Hi Jacob and Brandon, any progress on the project? 😃',
                  time: '10:43',
                  avatarUrl:
                      'assets/images/avatar1.svg', // Replace with your SVG
                ),
                _buildMessage(
                  isMe: true,
                  senderName: 'Jacob Hawkins',
                  message: 'Hi Jane! 👋',
                  time: '10:47',
                  avatarUrl:
                      'assets/images/avatar2.svg', // Replace with your SVG
                ),
                _buildMessage(
                  isMe: true,
                  senderName: 'Jacob Hawkins',
                  message: 'Yes, I just finished developing the Chat template.',
                  time: '10:50',
                  avatarUrl:
                      'assets/images/avatar3.svg', // Replace with your SVG
                  attachedImages: [
                    'https://cdn.dribbble.com/userupload/9508817/file/original-4a443e64eb7000c0234a27647ca72e3d.png?resize=752x',
                    'https://cdn.dribbble.com/userupload/9482257/file/original-fa66dab8b839af460ee8411aab44e924.png?resize=1200x900',
                    'https://cdn.dribbble.com/userupload/7623514/file/original-d01a60f2b01567d4d068f9ac0f38726d.png?resize=752x',
                  ],
                ),
                _buildMessage(
                  isMe: false,
                  senderName: 'Brandon Pena',
                  message:
                      "Hi Jane! I've completed 16 of 20 problems so far. Today or tomorrow I think I'll finish it. 👍",
                  time: '10:52',
                  avatarUrl:
                      'assets/images/avatar4.svg', // Replace with your SVG
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    'Today, 10 June',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                _buildMessage(
                  isMe: false,
                  senderName: 'Jane Wilson',
                  message:
                      'It looks amazing. The customer will be very satisfied. 😁',
                  time: '09:15',
                  avatarUrl:
                      'assets/images/avatar5.svg', // Replace with your SVG
                ),
                _buildMessage(
                  isMe: true,
                  senderName: 'Jacob Hawkins',
                  message: '@Brandon, can you send me the Style Guide?',
                  time: '11:48',
                  avatarUrl:
                      'assets/images/avatar1.svg', // Replace with your SVG
                ),
                _buildFileMessage(
                  senderName: 'Brandon Pena',
                  time: '11:50',
                  fileName: 'Brand Styles Guide',
                  fileSize: '570 KB',
                  avatarUrl:
                      'assets/images/avatar2.svg', // Replace with your SVG
                ),
              ],
            ),
          ),

          // Message Input Box
          _buildMessageInput(),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.emoji_emotions, color: Colors.black),
                    onPressed: () {
                      // Send message logic here
                    },
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.file_copy, color: Colors.black),
                    onPressed: () {
                      // Send message logic here
                    },
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.image_search, color: Colors.black),
                    onPressed: () {
                      // Send message logic here
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildMessage({
    required bool isMe,
    required String senderName,
    required String message,
    required String time,
    required String avatarUrl,
    List<String>? attachedImages,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isMe)
            CircleAvatar(
              radius: 25,
              child: ClipOval(
                child: SvgPicture.asset(
                  avatarUrl, // Load SVG from assets
                  height: 50, // Adjust height as needed
                  width: 50, // Adjust width as needed
                  fit: BoxFit.cover, // Ensure the SVG fits within the circle
                ),
              ),
            ),
          SizedBox(width: 10),
          Flexible(
            child: Column(
              crossAxisAlignment:
                  isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
              children: [
                // Row to display senderName and time together
                Row(
                  mainAxisAlignment:
                      isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
                  children: [
                    Text(
                      senderName,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(width: 7), // Space between name and time
                    Text(
                      time,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    color: isMe ? Colors.blue : Colors.grey[200],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: isMe
                        ? CrossAxisAlignment.end
                        : CrossAxisAlignment.start,
                    children: [
                      Text(
                        message,
                        style: TextStyle(
                          color: isMe ? Colors.white : Colors.black,
                        ),
                      ),
                      if (attachedImages != null) ...[
                        SizedBox(height: 10),
                        Wrap(
                          spacing: 8,
                          children: attachedImages
                              .map((imageUrl) => Image.network(
                                    imageUrl,
                                    height: 50,
                                    width: 50,
                                  ))
                              .toList(),
                        ),
                      ]
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          if (isMe)
            CircleAvatar(
              child: SvgPicture.asset(avatarUrl), // Load SVG from assets
            ),
        ],
      ),
    );
  }

  Widget _buildFileMessage({
    required String senderName,
    required String time,
    required String fileName,
    required String fileSize,
    required String avatarUrl,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            child: SvgPicture.asset(avatarUrl), // Load SVG from assets
          ),
          SizedBox(width: 10),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      senderName,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(width: 7),
                    Text(
                      time,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 5),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        fileName,
                        style: TextStyle(color: Colors.black),
                      ),
                      Text(
                        fileSize,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessageInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              offset: Offset(0, -1),
              blurRadius: 6,
            ),
          ],
        ),
        child: Row(
          children: [
            // SVG image inside the Container
            SvgPicture.asset(
              'assets/images/avatar1.svg', // Update the path to your SVG file
              width: 40, // Set the desired width
              height: 40, // Set the desired height
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Type a message...",
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              child: IconButton(
                icon: Icon(Icons.send, color: Colors.black),
                onPressed: () {
                  // Send message logic here
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
