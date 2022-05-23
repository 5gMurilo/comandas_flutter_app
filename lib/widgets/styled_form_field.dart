import 'package:flutter/material.dart';

class StyledFormField extends StatefulWidget {
  const StyledFormField({Key? key, required this.labelTitle, this.width})
      : super(key: key);

  final String labelTitle;
  final double? width;

  @override
  State<StyledFormField> createState() => _StyledFormFieldState();
}

class _StyledFormFieldState extends State<StyledFormField> {
  bool isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        cursorColor: Theme.of(context).colorScheme.onPrimary,
        decoration: InputDecoration(
          label: Text(
            widget.labelTitle,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Theme.of(context).colorScheme.onPrimary),
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
        ),
      ),
    );
  }
}
