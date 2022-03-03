import 'package:flutter/material.dart';

class PersonalizedButton extends StatefulWidget {
  const PersonalizedButton({
    Key? key,
    required this.buttonIcon,
    required this.onPress,
    required this.buttonColorPressed,
    required this.buttonColorHovered,
    required this.buttonColorActive,
  }) : super(key: key);
  final VoidCallback onPress;
  final IconData buttonIcon;

  final Color buttonColorPressed;
  final Color buttonColorHovered;
  final Color buttonColorActive;

  @override
  _PersonalizedButtonState createState() => _PersonalizedButtonState();
}

class _PersonalizedButtonState extends State<PersonalizedButton> {
  @override
  Widget build(BuildContext context) {
    var currnetMediaQueryContext = MediaQuery.of(context);

    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      curve: Curves.bounceIn,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: currnetMediaQueryContext.size.width / 3,
      child: ElevatedButton(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Icon(widget.buttonIcon)),
        onPressed: widget.onPress,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.hovered)) {
              return (widget.buttonColorHovered);
            }

            if (states.contains(MaterialState.focused) ||
                states.contains(MaterialState.pressed)) {
              return widget.buttonColorPressed;
            }
            return widget.buttonColorActive;
          }),
        ),
      ),
    );
  }
}
