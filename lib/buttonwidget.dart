import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    this.buttonText,
    this.onpressed,
    Key key,
  }) : super(key: key);

  final String buttonText;
  final onpressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      color: Colors.blue,
      onPressed: onpressed,
    );
  }
}
