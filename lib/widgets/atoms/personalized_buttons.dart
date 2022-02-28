import 'package:flutter/material.dart';

class PersonalizedButton extends StatefulWidget {
  const PersonalizedButton(
      {Key? key,
      required this.buttonText,
      required this.onPress,
      required this.buttonColor})
      : super(key: key);
  final VoidCallback onPress;
  final String buttonText;
  final Color buttonColor;
  @override
  _PersonalizedButtonState createState() => _PersonalizedButtonState();
}

class _PersonalizedButtonState extends State<PersonalizedButton> {
  @override
  Widget build(BuildContext context) {
    var currnetMediaQueryContext = MediaQuery.of(context);

    return SizedBox(
      width: currnetMediaQueryContext.size.width / 3,
      child: ElevatedButton(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(widget.buttonText),
        ),
        onPressed: widget.onPress,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(widget.buttonColor),
        ),
      ),
    );
  }
}
