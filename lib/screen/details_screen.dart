import 'package:flutter/material.dart';
import 'package:flutterbloc/model/user_model.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.e});
  final UserModel e;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Center(
            child: CircleAvatar(
              maxRadius: 70,
              backgroundImage: NetworkImage(e.avatar),
            ),
          ),
          Text(e.firstname + "" + e.lastname),
          Text(e.email)
        ],
      ),
    ));
  }
}
