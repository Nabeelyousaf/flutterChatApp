import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String id;
  String name;
  UserModel({this.name, this.id});
  UserModel.fromDocumentSnapShot(DocumentSnapshot doc) {
    id = doc.id;
  }
}

class DataBaseClass {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  createUser(UserModel _userModel) async {
    try {
      await _firestore.collection("users").doc(_userModel.id).set({
        "name": _userModel.name,
      });
      return true;
    } catch (e) {
      print(e.messege);
      return false;
    }
  }
}
