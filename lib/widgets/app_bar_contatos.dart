import 'package:flutter/material.dart';

class AppBarContatos extends StatelessWidget {
  final String title;
  final IconData? icon;

  const AppBarContatos({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, right: 1, left: 1),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          title,
          style: const TextStyle(color: Colors.black, fontSize: 22),
        ),
        actions: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: Icon(
                icon,
                color: Colors.black,
                size: 25,
              ),
            ),
        ],
      ),
    );
  }
}
