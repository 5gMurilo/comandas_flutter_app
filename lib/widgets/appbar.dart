import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.iconButton, required this.title})
      : super(key: key);

  final IconButton? iconButton;
  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 33, 33, 33),
      leading: iconButton,
      title: Text(title),
      centerTitle: true,
      toolbarHeight: 120,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(15.0)),
      ),
    );
  }
}
