import 'package:flutter/material.dart';


class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0.0,
      ),
      body: Center(
          child: Text("User Info")),
    );
  }
}
