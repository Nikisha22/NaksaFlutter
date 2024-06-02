import 'package:NAKSA/pages/profile/userPhoto.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final user = FirebaseAuth.instance.currentUser!;
  final ImagePicker _picker = ImagePicker();
  XFile? _imageFile;

  Future<void> _getImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = image;
    });
  }

  Future<void> _uploadAndSetPhoto() async {
    if (_imageFile != null) {
      String? downloadURL =
          await PhotoHandler.uploadPhoto(File(_imageFile!.path), user.uid);
      if (downloadURL != null) {
        await PhotoHandler.updatePhoto(user.uid, downloadURL);
        setState(() {
          // Update UI or show a message indicating success
        });
      } else {
        // Handle error uploading photo
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          GestureDetector(
            onTap: _getImageFromGallery,
            child: CircleAvatar(
              radius: 90,
              backgroundColor: Color.fromARGB(
                  255, 41, 103, 125), // Set alpha value to 255 for full opacity
              backgroundImage: _imageFile != null
                  ? FileImage(File(_imageFile!.path)) as ImageProvider<Object>?
                  : user.photoURL != null && user.photoURL!.isNotEmpty
                      ? NetworkImage(user.photoURL!)
                      : AssetImage('assets/person_icon.png')
                          as ImageProvider<Object>,
            ),
          ),

          // GestureDetector(
          //   onTap: _getImageFromGallery,
          //   child: CircleAvatar(
          //     radius: 90,
          //     backgroundImage: _imageFile != null
          //         ? FileImage(File(_imageFile!.path)) as ImageProvider<Object>?
          //         : NetworkImage(user.photoURL ?? '') as ImageProvider<Object>?,

          //   ),
          // ),
          SizedBox(height: 20),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('Email'),
            subtitle: Text(user.email ?? 'Unknown'),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.delete),
            title: Text('Delete Account'),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Confirm Delete'),
                    content:
                        Text('Are you sure you want to delete your account?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop(); // Close the dialog
                        },
                        child: Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () async {
                          try {
                            // Delete the user's account from Firebase
                            await FirebaseAuth.instance.currentUser!.delete();
                            // Navigate to the signup page
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              '/signup', // Replace '/signup' with the route name of your signup page
                              (route) => false,
                            );
                          } catch (e) {
                            // Handle any errors that occur during account deletion
                            print("Failed to delete account: $e");
                            // Optionally, you can show a snackbar or alert dialog to inform the user about the failure
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    "Failed to delete account. Please try again later."),
                              ),
                            );
                          }
                        },
                        child: Text('Yes'),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          Divider(),
          MaterialButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
              //Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
            },
            color: Color.fromARGB(244, 19, 109, 150),
            child: Text('Sign out'),
          ),
        ],
      ),
    );
  }
}
