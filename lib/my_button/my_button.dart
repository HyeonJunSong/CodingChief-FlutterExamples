import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {


  final Widget image;
  final Widget text;
  final Color color;
  final double radius;
  final VoidCallback onPressed;

  const MyButton({Key? key, 
    required this.image,
    required this.text,
    required this.color,
    required this.radius,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      height: 50.0,
      child: ElevatedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            image,
            text,
            Opacity(
              opacity: 0.0,
              child: image,
            ),
    
          ],
        ),
        style: ElevatedButton.styleFrom(
          primary: color,
        ),
        onPressed: (){},
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(radius),
        )
      ),
    );
  }
}