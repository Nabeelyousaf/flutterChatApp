import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashscreen/Model/Button.dart';
import 'package:flashscreen/constants.dart';
import 'package:flashscreen/screens/UserModel.dart';
import 'package:flashscreen/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import 'UserProfile.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'LoginScreen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final auth = FirebaseAuth.instance;
  bool spinnerShow = false;
  String name;
  String reference;
  String password;
  // create new collection in User with the name of new clinet
  creatUser(String name) {
    DocumentReference documentReference =
        FirebaseFirestore.instance.collection('User').doc(name);

    // set th name of the client in field
    Map<String, dynamic> users = {
      "Name": name,
    };
    documentReference.set(users).whenComplete(
          () => print('$users  New User'),
        );
  }

  DataBaseClass dataBaseClass = DataBaseClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 48.0,
              ),
              TextField(
                style: TextStyle(
                  color: Colors.pinkAccent,
                ),
                onChanged: (value) {
                  name = value;

                  //Do something with the user input.
                },
                decoration: ktextFormField.copyWith(hintText: 'Enter Yor Name'),
              ),
              SizedBox(
                height: 8.0,
              ),
              SizedBox(
                height: 24.0,
              ),
              Button(
                text: 'Login',
                onPressd: () async {
                  setState(() {
                    spinnerShow = true;
                  });
                  try {
                    // final user = await auth.signInWithEmailAndPassword(
                    //     email: email, password: password);
                    //

                    // create new account in client side
                    // and page route next screen with Name
                    final user = await auth.signInAnonymously();

                    print('uid=' + auth.currentUser.uid);

                    if (user != null) {
                      creatUser(name);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ChatScreen(name),
                        ),
                      );
                    }
                    setState(() {
                      spinnerShow = false;
                    });
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
