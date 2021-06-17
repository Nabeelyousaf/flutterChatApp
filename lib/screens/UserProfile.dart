import 'package:flutter/material.dart';

class UsersInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.pink,
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  children: [
                    Text('Name'),
                    Text('Email'),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
