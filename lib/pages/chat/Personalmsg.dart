import 'package:flutter/material.dart';

class CallMessageDestinationPage extends StatelessWidget {
  final String sender;

  const CallMessageDestinationPage({Key? key, required this.sender})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          color: const Color.fromARGB(255, 0, 0, 0), // Grey background color
          child: AppBar(
            title: Text(sender),
            actions: [
              IconButton(
                icon: Icon(Icons.call),
                onPressed: () {
                  // Handle call
                },
              ),
              IconButton(
                icon: Icon(Icons.videocam),
                onPressed: () {
                  // Handle video call
                },
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ListView(
                children: [
                  // Your message items here
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(
                          bottom: 8.0), // Adjust bottom padding as needed
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: TextField(
                        maxLines: null, // Allow multiple lines
                        decoration: InputDecoration(
                          hintText: 'Type a message...',
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 12.0),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  IconButton(
                    icon: Icon(Icons.send),
                    iconSize: 27,
                    onPressed: () {
                      // Handle sending message
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
     ),
);
}
}