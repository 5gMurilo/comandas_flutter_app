import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.title,
    this.navigatorUrl,
    this.arguments,
    this.function,
  }) : super(key: key);
  final String title;
  final String? navigatorUrl;
  final dynamic arguments;
  final Function? function;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (navigatorUrl != null) {
          if (function != null) {
            function!();
          } else {
            arguments == null
                ? Modular.to.navigate(navigatorUrl!)
                : Modular.to.navigate(navigatorUrl!, arguments: arguments);
          }
        } else {
          function!();
        }
      },
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        height: 60,
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Color(0xFF393939),
          boxShadow: const [
            BoxShadow(
                color: Colors.black45,
                spreadRadius: 5,
                blurRadius: 5,
                offset: Offset.zero)
          ],
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style:
              TextStyle(fontSize: 24, letterSpacing: 1.02, color: Colors.white),
        ),
      ),
    );
  }
}
