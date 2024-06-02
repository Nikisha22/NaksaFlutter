import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PhotoHandler {
  static Future<String?> uploadPhoto(File file, String userId) async {
    try {
      // Get a reference to the location where the photo will be saved
      Reference storageReference = FirebaseStorage.instance
          .ref()
          .child('profile_photos')
          .child('$userId.jpg');

      // Upload the file to Firebase Storage
      await storageReference.putFile(file);

      // Get the download URL for the uploaded photo
      String downloadURL = await storageReference.getDownloadURL();

      return downloadURL;
    } catch (e) {
      print('Error uploading photo: $e');
      return null;
    }
  }

  static Future<void> updatePhoto(String userId, String photoURL) async {
    try {
      // Update the user's photoURL in Firebase Authentication
      await FirebaseAuth.instance.currentUser!.updatePhotoURL(photoURL);

      // Update the user's photoURL in Firestore or wherever you store user data
      // Example:
      // await FirebaseFirestore.instance.collection('users').doc(userId).update({'photoURL': photoURL});
    } catch (e) {
      print('Error updating photo: $e');
}
}
}